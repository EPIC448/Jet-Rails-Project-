class FlightRidesController < ApplicationController

        skip_before_action :verify_authenticity_token
      
        def index
          @flight_ride = FlightRide.new
          @flight_rides= FlightRide.all
        end
      
        def new
         @flight_ride = FlightRide.create(flight_ride_params)

         flash[:notice] = @flight_ride.take_flight

         redirect_to user_path(@flight_ride.user) # this should feed into user id with an updated ticekts and stuff.
        end
      
         def create
            @user = User.find(params[:user_id]) 
            @flight_ride = @user.flight_rides.build(flight_ride_params)
           if @flight_ride.save
             redirect_to user_flight_rides_path(@user)
              # make sure we seeing nested routes Url.
              # user Id when changes to affect what we see.
           else
           render "users/show"
           end
         end

          def edit
               # if logged_in?
                  @flight_ride = FlightRide.find(params[:id])
                  # redirect_to user_flight_ride_path(current_user)
               # else
               #   render 'flights/new'
               # end
            
          end
      
      
         def update
            @flight_ride = FlightRide.find(params[:id])
            @flight_ride.update(flight_ride_params)
    
            redirect_to user_path(@flight_ride.user)
         end
        
         def show
            @flight_ride = FlightRide.find(params[:id])
            redirect_to 'flight_rides/show'

         end

         def destroy
            @flight_ride = FlightRide.find(params[:id])
            session[:user_id] = nil
             reset_session
            @flight_ride.delete
            redirect_to user_flight_ride_path

         end

      

         private

      def flight_ride_params
         params.require(:flight_ride).permit(:user_id, :flight_id, :flight_class)
      end 

      
      
end
