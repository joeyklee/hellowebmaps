import pandas as pd
import geocoder
import re


def main():
	# Read in data
	data = pd.read_csv('van_crime_2013.csv', header = 0)

	''' --- Data wrangling --- '''
	# Split the address into a list
	address = [x.split() for x in data.HUNDRED_BLOCK]
	# Replace the X's with 0's
	temp = []
	for i in address:
		i.append(',Vancouver, Canada')
		if 'X' in i[0]:
			i[0] = i[0].replace('X', '0')

		temp.append(' '.join(i))
	# Add the new address to the original data
	data['NEWADDRESS'] = temp

	# print data.head()

	''' --- Geocoder --- '''
	lat = []
	lon = []
	for i in data.NEWADDRESS:
		g = geocoder.mapquest(i)
		lat.append(g.lat)
		lon.append(g.lng)
		print 'featching coordinates for address: ' + str(i)
	data['lat'] = lat
	data['lon'] = lon

	print data.head()
	data.to_csv('van_crime_2013_geo.csv')

if __name__ == '__main__':
	main()