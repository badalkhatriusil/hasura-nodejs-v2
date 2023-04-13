# Hasura + Nodejs

**Steps for Nodejs**

 1. `npm i`
 2. Run `mutation{login(username: "admin",  password: "admin"){ token }}`
 3. Copy Token

**Steps for Hasura**

 1. Go to Hasura folder
 2. Run `docker-compose up -d`
 3. Run `hasura metadata apply`
 4. Run `hasura migrate apply`
 5. Run `hasura metadata apply`
 6. Open hasura console on `localhost:8080`
 7. Add `Authorization` header and put `Bearer <token copied from nodejs login response>`
 8. Run `Near by Location` specified below and DONE :)

# Login mutation to run on Nodejs server
  `mutation{
    login(username: "admin", password: "admin"){
        token
    }
  }`

# User Query with Pagination & Near by Location

     `
     
     query findNearbyUsers(
        $latitude: Float!, 
        $longitude: Float!, 
        $distance: Float!, 
        $limit: Int, 
        $offset: Int
      ) 
      {
        findNearbyUsers
          (
            latitude: $latitude, 
            longitude: $longitude, 
            distance: $distance, 
            limit: $limit, 
            offset: $offset
          )
}

    --- Variables ---
    {
      "latitude": 23.0225,
      "longitude": 72.5714,
      "distance": 100000,
      "limit": 10,
      "offset": 0
    }

    
    `