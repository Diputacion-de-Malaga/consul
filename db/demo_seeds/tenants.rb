section "Creating DEMO Tenants" do
  Tenant.create!(name: "Mega CONSUL", schema: "megacity")
  Tenant.create!(name: "Micro CONSUL", schema: "microvillage")
  Tenant.create!(name: "Middle CONSUL", schema: "middletown")

  Tenant.switch("megacity") do
    Setting["locales.available"] = "en,es,sv,tr,zh-TW"
  end

  Tenant.switch("microvillage") do
    Setting["locales.available"] = "en,ar,bg,cs"
  end

  Tenant.switch("middletown") do
    Setting["locales.available"] = "en,de,he,ro"
  end
end
