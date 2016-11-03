class Api::V1::ApplicationResource < JSONAPI::Resource
  def meta()
    { copyright: "© #{Time.now.year} Alco.dk"  }
  end
end
