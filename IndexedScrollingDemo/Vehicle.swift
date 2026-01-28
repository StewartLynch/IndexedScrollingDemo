//
//----------------------------------------------
// Original project: IndexedScrollingDemo
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions (Stewart Lynch). All rights reserved.


import Foundation

struct Vehicle: Identifiable {
    var id = UUID()
    let owner: String
    let make: String
    let model: String
    let licencePlate: String
    let state_Prov: String
}

extension Vehicle {
    static let mockData: [Vehicle] = [
        Vehicle(owner: "Adams, John", make: "Toyota", model: "Camry", licencePlate: "ABC1234", state_Prov: "California"),
        Vehicle(owner: "Baker, Emily", make: "Honda", model: "Civic", licencePlate: "7XYZ890", state_Prov: "Texas"),
        Vehicle(owner: "Chen, Michael", make: "Ford", model: "F-150", licencePlate: "KLM5678", state_Prov: "Ontario"),
        Vehicle(owner: "Davis, Sarah", make: "Chevrolet", model: "Silverado", licencePlate: "2DEF456", state_Prov: "Florida"),
        Vehicle(owner: "Evans, Robert", make: "Tesla", model: "Model 3", licencePlate: "GHI7890", state_Prov: "New York"),
        Vehicle(owner: "Foster, Amanda", make: "BMW", model: "X5", licencePlate: "9JKL123", state_Prov: "British Columbia"),
        Vehicle(owner: "Garcia, Carlos", make: "Mercedes", model: "C-Class", licencePlate: "MNO4567", state_Prov: "Arizona"),
        Vehicle(owner: "Harris, Jennifer", make: "Audi", model: "A4", licencePlate: "3PQR890", state_Prov: "Quebec"),
        Vehicle(owner: "Ibrahim, Omar", make: "Lexus", model: "RX350", licencePlate: "STU1234", state_Prov: "Washington"),
        Vehicle(owner: "Johnson, William", make: "Subaru", model: "Outback", licencePlate: "5VWX567", state_Prov: "Colorado"),
        Vehicle(owner: "Kim, Grace", make: "Hyundai", model: "Tucson", licencePlate: "YZA8901", state_Prov: "Alberta"),
        Vehicle(owner: "Lopez, Maria", make: "Kia", model: "Sorento", licencePlate: "8BCD234", state_Prov: "Illinois"),
        Vehicle(owner: "Martinez, David", make: "Mazda", model: "CX-5", licencePlate: "EFG5678", state_Prov: "Georgia"),
        Vehicle(owner: "Nelson, Lisa", make: "Nissan", model: "Altima", licencePlate: "1HIJ901", state_Prov: "Manitoba"),
        Vehicle(owner: "O'Brien, Patrick", make: "Jeep", model: "Wrangler", licencePlate: "KLM2345", state_Prov: "North Carolina"),
        Vehicle(owner: "Patel, Priya", make: "Volkswagen", model: "Jetta", licencePlate: "6NOP678", state_Prov: "Pennsylvania"),
        Vehicle(owner: "Quinn, Thomas", make: "Ram", model: "1500", licencePlate: "QRS9012", state_Prov: "Saskatchewan"),
        Vehicle(owner: "Rodriguez, Ana", make: "GMC", model: "Sierra", licencePlate: "4TUV345", state_Prov: "Ohio"),
        Vehicle(owner: "Smith, James", make: "Dodge", model: "Charger", licencePlate: "WXY6789", state_Prov: "Michigan"),
        Vehicle(owner: "Thompson, Rachel", make: "Buick", model: "Enclave", licencePlate: "2ZAB012", state_Prov: "Nova Scotia"),
        Vehicle(owner: "Ueda, Kenji", make: "Acura", model: "MDX", licencePlate: "CDE3456", state_Prov: "Virginia"),
        Vehicle(owner: "Vargas, Sofia", make: "Infiniti", model: "QX60", licencePlate: "7FGH789", state_Prov: "New Jersey"),
        Vehicle(owner: "Wilson, Daniel", make: "Cadillac", model: "Escalade", licencePlate: "IJK0123", state_Prov: "Nevada"),
        Vehicle(owner: "Xu, Linda", make: "Lincoln", model: "Navigator", licencePlate: "5LMN456", state_Prov: "New Brunswick"),
        Vehicle(owner: "Young, Christopher", make: "Volvo", model: "XC90", licencePlate: "OPQ7890", state_Prov: "Oregon"),
        Vehicle(owner: "Zhang, Wei", make: "Porsche", model: "Cayenne", licencePlate: "1RST123", state_Prov: "Tennessee"),
        Vehicle(owner: "Anderson, Michelle", make: "Land Rover", model: "Range Rover", licencePlate: "UVW4567", state_Prov: "Maryland"),
        Vehicle(owner: "Brown, Kevin", make: "Jaguar", model: "F-Pace", licencePlate: "8XYZ890", state_Prov: "Prince Edward Island"),
        Vehicle(owner: "Clark, Jessica", make: "Mini", model: "Cooper", licencePlate: "ABC2345", state_Prov: "Minnesota"),
        Vehicle(owner: "Diaz, Antonio", make: "Fiat", model: "500", licencePlate: "3DEF678", state_Prov: "Wisconsin"),
        Vehicle(owner: "Edwards, Stephanie", make: "Alfa Romeo", model: "Giulia", licencePlate: "GHI9012", state_Prov: "Newfoundland"),
        Vehicle(owner: "Franklin, Marcus", make: "Genesis", model: "G80", licencePlate: "6JKL345", state_Prov: "Missouri"),
        Vehicle(owner: "Green, Ashley", make: "Maserati", model: "Ghibli", licencePlate: "MNO6789", state_Prov: "Indiana"),
        Vehicle(owner: "Hall, Brandon", make: "Toyota", model: "RAV4", licencePlate: "9PQR012", state_Prov: "Massachusetts"),
        Vehicle(owner: "Ivanov, Natasha", make: "Honda", model: "Accord", licencePlate: "STU3456", state_Prov: "Connecticut"),
        Vehicle(owner: "Jackson, Amber", make: "Ford", model: "Mustang", licencePlate: "4VWX789", state_Prov: "Kentucky"),
        Vehicle(owner: "King, Ronald", make: "Chevrolet", model: "Tahoe", licencePlate: "YZA0123", state_Prov: "Louisiana"),
        Vehicle(owner: "Lee, Susan", make: "Tesla", model: "Model Y", licencePlate: "7BCD456", state_Prov: "Oklahoma"),
        Vehicle(owner: "Moore, Jason", make: "BMW", model: "3 Series", licencePlate: "EFG7890", state_Prov: "South Carolina"),
        Vehicle(owner: "Nguyen, Tina", make: "Mercedes", model: "E-Class", licencePlate: "2HIJ123", state_Prov: "Iowa"),
        Vehicle(owner: "Owens, Gregory", make: "Audi", model: "Q7", licencePlate: "KLM4567", state_Prov: "Kansas"),
        Vehicle(owner: "Perez, Christina", make: "Lexus", model: "ES350", licencePlate: "5NOP890", state_Prov: "Arkansas"),
        Vehicle(owner: "Reed, Steven", make: "Subaru", model: "Forester", licencePlate: "QRS1234", state_Prov: "Utah"),
        Vehicle(owner: "Sanders, Nicole", make: "Hyundai", model: "Santa Fe", licencePlate: "8TUV567", state_Prov: "Mississippi"),
        Vehicle(owner: "Turner, Eric", make: "Kia", model: "Telluride", licencePlate: "WXY8901", state_Prov: "Alabama"),
        Vehicle(owner: "Underwood, Kelly", make: "Mazda", model: "Mazda3", licencePlate: "1ZAB234", state_Prov: "Nebraska"),
        Vehicle(owner: "Valdez, Ricardo", make: "Nissan", model: "Rogue", licencePlate: "CDE5678", state_Prov: "New Mexico"),
        Vehicle(owner: "White, Melissa", make: "Jeep", model: "Grand Cherokee", licencePlate: "4FGH901", state_Prov: "Hawaii"),
        Vehicle(owner: "Xavier, Paul", make: "Volkswagen", model: "Atlas", licencePlate: "IJK2345", state_Prov: "West Virginia"),
        Vehicle(owner: "Yamamoto, Yuki", make: "Ram", model: "2500", licencePlate: "7LMN678", state_Prov: "Idaho"),
        Vehicle(owner: "Zimmerman, Laura", make: "GMC", model: "Yukon", licencePlate: "OPQ9012", state_Prov: "Maine"),
        Vehicle(owner: "Abbott, Charles", make: "Dodge", model: "Durango", licencePlate: "2RST345", state_Prov: "Rhode Island"),
        Vehicle(owner: "Blake, Heather", make: "Buick", model: "Encore", licencePlate: "UVW6789", state_Prov: "Delaware"),
        Vehicle(owner: "Campbell, Derek", make: "Acura", model: "TLX", licencePlate: "5XYZ012", state_Prov: "Montana"),
        Vehicle(owner: "Duncan, Victoria", make: "Infiniti", model: "Q50", licencePlate: "ABC3456", state_Prov: "Wyoming"),
        Vehicle(owner: "Ellis, Frank", make: "Cadillac", model: "XT5", licencePlate: "8DEF789", state_Prov: "Vermont"),
        Vehicle(owner: "Ferguson, Diana", make: "Lincoln", model: "Aviator", licencePlate: "GHI0123", state_Prov: "Alaska"),
        Vehicle(owner: "Grant, Timothy", make: "Volvo", model: "S60", licencePlate: "3JKL456", state_Prov: "North Dakota"),
        Vehicle(owner: "Hayes, Rebecca", make: "Porsche", model: "Macan", licencePlate: "MNO7890", state_Prov: "South Dakota"),
        Vehicle(owner: "Ingram, Scott", make: "Land Rover", model: "Discovery", licencePlate: "6PQR123", state_Prov: "Yukon"),
        Vehicle(owner: "Jennings, Cynthia", make: "Jaguar", model: "XF", licencePlate: "STU4567", state_Prov: "Northwest Territories"),
        Vehicle(owner: "Knight, Andrew", make: "Mini", model: "Countryman", licencePlate: "9VWX890", state_Prov: "Nunavut"),
        Vehicle(owner: "Lambert, Paula", make: "Genesis", model: "GV70", licencePlate: "YZA1234", state_Prov: "California"),
        Vehicle(owner: "Mitchell, Gary", make: "Toyota", model: "Highlander", licencePlate: "4BCD567", state_Prov: "Texas"),
        Vehicle(owner: "Newman, Catherine", make: "Honda", model: "Pilot", licencePlate: "EFG8901", state_Prov: "Ontario"),
        Vehicle(owner: "Oliver, Raymond", make: "Ford", model: "Explorer", licencePlate: "7HIJ234", state_Prov: "Florida"),
        Vehicle(owner: "Palmer, Denise", make: "Chevrolet", model: "Equinox", licencePlate: "KLM5678", state_Prov: "New York"),
        Vehicle(owner: "Quinn, Harold", make: "Tesla", model: "Model S", licencePlate: "2NOP901", state_Prov: "British Columbia"),
        Vehicle(owner: "Reynolds, Janet", make: "BMW", model: "X3", licencePlate: "QRS2345", state_Prov: "Arizona"),
        Vehicle(owner: "Stone, Lawrence", make: "Mercedes", model: "GLE", licencePlate: "5TUV678", state_Prov: "Quebec"),
        Vehicle(owner: "Taylor, Marie", make: "Audi", model: "Q5", licencePlate: "WXY9012", state_Prov: "Washington"),
        Vehicle(owner: "Upton, Gerald", make: "Lexus", model: "NX300", licencePlate: "8ZAB345", state_Prov: "Colorado"),
        Vehicle(owner: "Vincent, Sandra", make: "Subaru", model: "Crosstrek", licencePlate: "CDE6789", state_Prov: "Alberta"),
        Vehicle(owner: "Wallace, Kenneth", make: "Hyundai", model: "Palisade", licencePlate: "1FGH012", state_Prov: "Illinois"),
        Vehicle(owner: "Yates, Elizabeth", make: "Kia", model: "Sportage", licencePlate: "IJK3456", state_Prov: "Georgia"),
        Vehicle(owner: "Adams, Barbara", make: "Mazda", model: "CX-9", licencePlate: "4LMN789", state_Prov: "Manitoba"),
        Vehicle(owner: "Brooks, Donald", make: "Nissan", model: "Pathfinder", licencePlate: "OPQ0123", state_Prov: "North Carolina"),
        Vehicle(owner: "Carter, Joyce", make: "Jeep", model: "Cherokee", licencePlate: "7RST456", state_Prov: "Pennsylvania"),
        Vehicle(owner: "Dixon, Eugene", make: "Volkswagen", model: "Tiguan", licencePlate: "UVW7890", state_Prov: "Saskatchewan"),
        Vehicle(owner: "Freeman, Gloria", make: "Ram", model: "3500", licencePlate: "2XYZ123", state_Prov: "Ohio"),
        Vehicle(owner: "Gibson, Henry", make: "GMC", model: "Acadia", licencePlate: "ABC4567", state_Prov: "Michigan"),
        Vehicle(owner: "Henderson, Rose", make: "Dodge", model: "Challenger", licencePlate: "5DEF890", state_Prov: "Nova Scotia"),
        Vehicle(owner: "Jordan, Philip", make: "Buick", model: "Envision", licencePlate: "GHI1234", state_Prov: "Virginia"),
        Vehicle(owner: "Kennedy, Martha", make: "Acura", model: "RDX", licencePlate: "8JKL567", state_Prov: "New Jersey"),
        Vehicle(owner: "Long, Russell", make: "Infiniti", model: "QX80", licencePlate: "MNO8901", state_Prov: "Nevada"),
        Vehicle(owner: "Morgan, Alice", make: "Cadillac", model: "CT5", licencePlate: "3PQR234", state_Prov: "New Brunswick"),
        Vehicle(owner: "Norton, Wayne", make: "Lincoln", model: "Corsair", licencePlate: "STU5678", state_Prov: "Oregon"),
        Vehicle(owner: "Ortiz, Frances", make: "Volvo", model: "XC60", licencePlate: "6VWX901", state_Prov: "Tennessee"),
        Vehicle(owner: "Porter, Carl", make: "Porsche", model: "Panamera", licencePlate: "YZA2345", state_Prov: "Maryland"),
        Vehicle(owner: "Richards, Evelyn", make: "Land Rover", model: "Defender", licencePlate: "9BCD678", state_Prov: "Prince Edward Island"),
        Vehicle(owner: "Shaw, Louis", make: "Jaguar", model: "E-Pace", licencePlate: "EFG9012", state_Prov: "Minnesota"),
        Vehicle(owner: "Tucker, Irene", make: "Genesis", model: "GV80", licencePlate: "4HIJ345", state_Prov: "Wisconsin"),
        Vehicle(owner: "Underwood, Ralph", make: "Toyota", model: "Tacoma", licencePlate: "KLM6789", state_Prov: "Newfoundland"),
        Vehicle(owner: "Vance, Dorothy", make: "Honda", model: "CR-V", licencePlate: "7NOP012", state_Prov: "Missouri"),
        Vehicle(owner: "Warren, Howard", make: "Ford", model: "Bronco", licencePlate: "QRS3456", state_Prov: "Indiana"),
        Vehicle(owner: "Young, Shirley", make: "Chevrolet", model: "Traverse", licencePlate: "2TUV789", state_Prov: "Massachusetts"),
        Vehicle(owner: "Zimmerman, Roy", make: "Tesla", model: "Model X", licencePlate: "WXY0123", state_Prov: "Connecticut")
    ]
}
