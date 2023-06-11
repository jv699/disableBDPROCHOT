# disableBDPROCHOT
Steps and Scripts for disabling BDPROCHOT under Linux

## What is BD PROCHOT?
BD PROCHOT (bi-directional hot) allows for senors in your computer to tell the CPU to throttle to the slowest possible speed. Ususally this happens when some component is overheating. However, it can also occur when a thermal sensor is broken on your motherboard or some other component is malfunctioning.

For me, BD PROCHOT triggered on boot when I replaced one of the batteries in my Thinkpad T470s with an aftermarket battery. This made the computer unusable when on battery power. 

Please keep in mind BD PROCHOT <b><i>is</i></b> a safety measure designed to prevent damage to your computer. While modern computers are typically very safe from this kind of overheating, I take no responsibility for possible damage caused to your computer. I reccomend installing a monitoring tool to keep an eye on your thermals. I use the [Vitals](https://extensions.gnome.org/extension/1460/vitals/) GNOME Extension, and have had no issues with my thermals.

## Steps
You need to have [msr tools](https://github.com/intel/msr-tools) installed. This allows you to read and write to your computers registers.

> This project is no longer maintained. This does not prevent it from working, but it is worth noting.

You can check if you have msr tools installed by running the 'rmdsr' command. If it installed, you hsould see somehting like this.

'''shell
rdmsr
Usage: rdmsr [options] regno
  --help         -h  Print this help
  --version      -V  Print current version
  --hexadecimal  -x  Hexadecimal output (lower case)
  --capital-hex  -X  Hexadecimal output (upper case)
  --decimal      -d  Signed decimal output
  --unsigned     -u  Unsigned decimal output
  --octal        -o  Octal output
  --c-language   -c  Format output as a C language constant
  --zero-pad     -0  Output leading zeroes
  --raw          -r  Raw binary output
  --all          -a  all processors
  --processor #  -p  Select processor number (default 0)
  --bitfield h:l -f  Output bits [h:l] only
'''

Once you have msr tools installed
