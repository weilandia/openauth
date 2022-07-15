["OpenAuth", "TestOrg"].each do |name|
  org = Organization.create(name: name)

  ["development", "production"].each do |roster_name|
    roster = Roster.create(name: roster_name, organization_id: org.id)

    3.times do |i|
      User.create(email: "seed-#{i}@#{org.name.downcase}.com", roster_id: roster.id)
    end
  end
end
