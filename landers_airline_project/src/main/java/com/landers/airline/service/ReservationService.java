package com.landers.airline.service;

import java.util.List;

import com.landers.airline.dto.FlightinfoDto;
import com.landers.airline.dto.ScheduleDto;
import com.landers.airline.dto.SeatDto;
import com.landers.airline.dto.TicketDto;
import com.landers.airline.dto.flightParam;

public interface ReservationService {

	boolean schedule(ScheduleDto dto);
	
	List<FlightinfoDto> flightlist(FlightinfoDto dto);
	
	List<SeatDto> seatlist(int flight_id);
	
	int seatselect(List<String> selectedSeats, int flight_id);
	
	FlightinfoDto flightInfo(int flight_id);
	
	int ticket(TicketDto dto);
	
	TicketDto ticketinfo(int flight_id);
	
	int emptynumcount(flightParam param);
	
	String departure(int flight_id);
	
	int reservationCal(String reservationCalendar, String user_id);
}
