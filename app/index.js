// In-memory data store
const appointments = [
  { id: '1', patientId: '1', date: '2023-06-15', time: '10:00', doctor: 'Dr. Smith' },
  { id: '2', patientId: '2', date: '2023-06-16', time: '14:30', doctor: 'Dr. Johnson' }
];

// Health check route handler
const healthCheck = async () => ({
  statusCode: 200,
  body: JSON.stringify({ status: 'OK', service: 'Appointment Service' }),
});

// Get all appointments handler
const getAppointments = async () => ({
  statusCode: 200,
  body: JSON.stringify({ message: 'Appointments retrieved successfully', count: appointments.length, appointments }),
});

// Get appointment by ID handler
const getAppointmentById = async (id) => {
  const appointment = appointments.find(a => a.id === id);
  if (appointment) {
    return {
      statusCode: 200,
      body: JSON.stringify({ message: 'Appointment found', appointment }),
    };
  } else {
    return { statusCode: 404, body: JSON.stringify({ error: 'Appointment not found' }) };
  }
};

// Create a new appointment handler
const createAppointment = async (body) => {
  const { patientId, date, time, doctor } = JSON.parse(body);
  if (!patientId || !date || !time || !doctor) {
    return { statusCode: 400, body: JSON.stringify({ error: 'Patient ID, date, time, and doctor are required' }) };
  }
  const newAppointment = { id: (appointments.length + 1).toString(), patientId, date, time, doctor };
  appointments.push(newAppointment);
  return { statusCode: 201, body: JSON.stringify({ message: 'Appointment scheduled successfully', appointment: newAppointment }) };
};

// Get appointments by patient ID handler
const getAppointmentsByPatientId = async (patientId) => {
  const patientAppointments = appointments.filter(appt => appt.patientId === patientId);
  if (patientAppointments.length > 0) {
    return {
      statusCode: 200,
      body: JSON.stringify({ message: `Found ${patientAppointments.length} appointment(s) for patient ${patientId}`, appointments: patientAppointments }),
    };
  } else {
    return { statusCode: 404, body: JSON.stringify({ message: `No appointments found for patient ${patientId}` }) };
  }
};

// Main Lambda handler function
exports.handler = async (event) => {
  const { path, httpMethod, body } = event;

  // Health check endpoint
  if (path === '/health' && httpMethod === 'GET') {
    return await healthCheck();
  } 
  // Get all appointments endpoint
  else if (path === '/appointments' && httpMethod === 'GET') {
    return await getAppointments();
  } 
  // Get specific appointment by ID
  else if (path.startsWith('/appointments/') && httpMethod === 'GET') {
    const id = path.split('/')[2];
    return await getAppointmentById(id);
  } 
  // Create a new appointment
  else if (path === '/appointments' && httpMethod === 'POST') {
    return await createAppointment(body);
  } 
  // Get appointments by patient ID
  else if (path.startsWith('/appointments/patient/') && httpMethod === 'GET') {
    const patientId = path.split('/')[3];
    return await getAppointmentsByPatientId(patientId);
  } 
  // Return 404 for undefined routes
  else {
    return { statusCode: 404, body: JSON.stringify({ error: 'Not Found' }) };
  }
};
