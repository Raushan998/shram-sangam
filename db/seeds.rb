# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Ruby code to create 10 dummy workers for India

workers = [
  {
    name: "Rajesh Kumar",
    phone_number: "9876543210",
    country_code: "+91",
    addr1: "42 Mahatma Gandhi Road",
    addr2: "Near City Center Mall",
    city: "Mumbai",
    pincode: "400001",
    state: "Maharashtra",
    country: "India",
    email: "rajesh.kumar@example.com",
    description: "Experienced electrician specializing in residential wiring and installation.",
    work_type: 1  # Assuming 1 represents electrician
  },
  {
    name: "Priya Sharma",
    phone_number: "8765432109",
    country_code: "+91",
    addr1: "78 Nehru Street",
    addr2: "Koramangala Layout",
    city: "Bangalore",
    pincode: "560034",
    state: "Karnataka",
    country: "India",
    email: "priya.sharma@example.com",
    description: "Professional plumber with 8 years of experience in fixing leaks and installing bathroom fixtures.",
    work_type: 2  # Assuming 2 represents plumber
  },
  {
    name: "Amit Patel",
    phone_number: "7654321098",
    country_code: "+91",
    addr1: "23 Subhash Chandra Bose Avenue",
    addr2: "Sector 12",
    city: "Delhi",
    pincode: "110001",
    state: "Delhi",
    country: "India",
    email: "amit.patel@example.com",
    description: "Certified carpenter with expertise in custom furniture making and woodworking.",
    work_type: 3  # Assuming 3 represents carpenter
  },
  {
    name: "Sunita Verma",
    phone_number: "6543210987",
    country_code: "+91",
    addr1: "56 Tagore Lane",
    addr2: "Salt Lake City",
    city: "Kolkata",
    pincode: "700064",
    state: "West Bengal",
    country: "India",
    email: "sunita.verma@example.com",
    description: "Professional painter specializing in interior and exterior house painting.",
    work_type: 4  # Assuming 4 represents painter
  },
  {
    name: "Vikram Singh",
    phone_number: "5432109876",
    country_code: "+91",
    addr1: "89 Rajiv Gandhi Nagar",
    addr2: "Phase 2",
    city: "Chennai",
    pincode: "600001",
    state: "Tamil Nadu",
    country: "India",
    email: "vikram.singh@example.com",
    description: "HVAC technician with certification in air conditioning and heating systems installation and repair.",
    work_type: 4  # Assuming 4 represents HVAC technician
  },
  {
    name: "Ananya Reddy",
    phone_number: "4321098765",
    country_code: "+91",
    addr1: "17 Indira Nagar",
    addr2: "Near Apollo Hospital",
    city: "Hyderabad",
    pincode: "500001",
    state: "Telangana",
    country: "India",
    email: "ananya.reddy@example.com",
    description: "Gardener and landscaper with experience in garden design and maintenance.",
    work_type: 3  # Assuming 3 represents gardener
  },
  {
    name: "Deepak Joshi",
    phone_number: "3210987654",
    country_code: "+91",
    addr1: "45 Patel Road",
    addr2: "Shivaji Nagar",
    city: "Pune",
    pincode: "411005",
    state: "Maharashtra",
    country: "India",
    email: "deepak.joshi@example.com",
    description: "Mason with skills in brick laying, concrete work, and stone installation.",
    work_type: 2  # Assuming 2 represents mason
  },
  {
    name: "Meena Gupta",
    phone_number: "2109876543",
    country_code: "+91",
    addr1: "34 Lajpat Nagar",
    addr2: "Sector 18",
    city: "Chandigarh",
    pincode: "160018",
    state: "Punjab",
    country: "India",
    email: "meena.gupta@example.com",
    description: "House cleaner offering deep cleaning services for residential and commercial spaces.",
    work_type: 4  # Assuming 4 represents cleaner
  },
  {
    name: "Ramesh Iyer",
    phone_number: "1098765432",
    country_code: "+91",
    addr1: "27 MG Colony",
    addr2: "Near Railway Station",
    city: "Kochi",
    pincode: "682001",
    state: "Kerala",
    country: "India",
    email: "ramesh.iyer@example.com",
    description: "Electrician specializing in commercial electrical systems and maintenance.",
    work_type: 1  # Assuming 1 represents electrician
  },
  {
    name: "Kavita Desai",
    phone_number: "9087654321",
    country_code: "+91",
    addr1: "63 Sardar Patel Road",
    addr2: "Civil Lines",
    city: "Jaipur",
    pincode: "302001",
    state: "Rajasthan",
    country: "India",
    email: "kavita.desai@example.com",
    description: "Interior decorator with an eye for design and space optimization.",
    work_type: 1  # Assuming 1 represents interior decorator
  }
]

workers.each do |worker|
    Worker.create!(
        name: worker[:name],
        phone_number: worker[:phone_number],
        addr1: worker[:phone_number],
        addr2: worker[:addr2],
        city: worker[:city],
        pincode: worker[:pincode],
        state: worker[:state],
        country: worker[:country],
        email: worker[:email],
        description: worker[:description],
        work_type: worker[:work_type]
    )
end