include("Calendar.jl")
using Calendar

@assert isleapyear(2012)
@assert !isleapyear(2011)
@assert !isleapyear(2013)
@assert isleapyear(2020)
@assert !isleapyear(1900)
@assert !isleapyear(1901)
@assert isleapyear(1904)
@assert isleapyear(2000)

# daylight savings time
t = ymd_hms(2013, 3, 10, 1, 59, 59)
t2 = t + seconds(1)
@assert !isdst(t)
@assert isdst(t2)
@assert hour(t2) == 3
@assert minute(t2) == 0
@assert second(t2) == 0

@assert years(4) - hours(1) == CalendarDuration(4,0,0,-3600e3)
@assert hours(1) - years(4) == CalendarDuration(-4,0,0,3600e3)

t1 = ymd_hms(2013, 7, 30, 14, 22, 11)
t2 = ymd_hms(2013, 7, 30, 14, 22, 11.5)
d = t2 - t1
@assert d == seconds(0.5)
@assert d === FixedCalendarDuration(500.)
@assert repr(d) == "0.5 seconds"

@assert repr(years(1) + months(1)) == "1 year + 1 month"
@assert repr(years(2) + months(1)) == "2 years + 1 month"
@assert repr(years(1) + months(2)) == "1 year + 2 months"
@assert repr(years(2) + months(2)) == "2 years + 2 months"
@assert repr(days(3) + seconds(4)) == "3 days + 4 seconds"
