module ApiJson
  extend ActiveSupport::Concern

  def project_index
    {
     except: [:created_at, :updated_at],
     include: {
      users: { only: [:id, :name] },
      client: { only: [:id, :name] }
     }
    }
  end

  def project_show
    {
     except: [:created_at, :updated_at],
     include: {
      users: { only: [:id, :name] },
      client: { only: [:id, :name] }
     }
    }
  end

  def task_index
    {
     except: [:created_at, :updated_at],
     include: {
      project: { only: [:id, :title]},
     }
    }
  end

  def task_show
    {
     except: [:created_at, :updated_at],
     include: {
      project: { only: [:id, :title]}
     }
    }
  end
end