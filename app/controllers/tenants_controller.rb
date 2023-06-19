class TenantsController < ApplicationController
  before_action :set_tenant, only: %i[show edit update destroy]

  def index
    @tenants = Tenant.all
  end

  def my
    @tenants = current_user.tenants
    render :index
  end

  def show; end

  def new
    @tenant = Tenant.new
  end

  def edit; end

  def create
    @tenant = Tenant.new(tenant_params)

    return render :new, status: :unprocessable_entity unless @tenant.save

    redirect_to tenant_url(@tenant), notice: 'Tenant was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @tenant.update(tenant_params)

    redirect_to tenant_url(@tenant), notice: 'Tenant was successfully updated.'
  end

  def destroy
    @tenant.destroy

    redirect_to tenants_url, notice: 'Tenant was successfully destroyed.'
  end

  private

  def set_tenant
    @tenant = Tenant.find(params[:id])
  end

  def tenant_params
    params.require(:tenant).permit(:name)
  end
end
