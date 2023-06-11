# disableBDPROCHOT
Steps and script for disabling BD PROCHOT in Linux. This is essentially a script based on [yyearth's guide](https://github.com/yyearth/turnoff-BD-PROCHOT/blob/master/readme.md) with steps to get the script to run on boot.


## What is BD PROCHOT?
BD PROCHOT (bi-directional hot) allows for senors in your computer to tell the CPU to throttle to the slowest possible speed. Ususally this happens when some component is overheating. However, it can also occur when a thermal sensor is broken on your motherboard or some other component is malfunctioning.

For me, BD PROCHOT triggered on boot when I replaced one of the batteries in my Thinkpad T470s with an aftermarket battery. This made the computer unusable when on battery power. 

Please keep in mind BD PROCHOT <b><i>is</i></b> a safety measure designed to prevent damage to your computer. While modern computers are typically very safe from this kind of overheating, I take no responsibility for possible damage caused to your computer. I reccomend installing a monitoring tool to keep an eye on your thermals. I use the [Vitals](https://extensions.gnome.org/extension/1460/vitals/) GNOME Extension, and have had no issues with my thermals.

## Steps
You need to have [msr tools](https://github.com/intel/msr-tools) installed. This allows you to read and write to your computers registers.

> NOTE: msr tools is no longer maintained. This does not prevent it from working, but it is worth noting.

You can check if you have msr tools installed by running the `rdmsr` command. If it installed, you hsould see somehting like this.

```shell
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
```

Once you have msr tools installed, clone this repository and navigate to the folder.
```shell
git clone https://github.com/jv699/disableBDPROCHOT && cd disableBDPROCHOT
```

Next, mark `disableprochot.sh` as executable.
```shell
chmod +x disableprochot.sh
```

Finally, execute `disableprochot.sh`.
```shell
./disableprochot.sh
```

And that's it! Essentially what happens is the `0x1FC` register is read and decremented by one. 

Keep in mind this script needs re-ran every boot. You can also set the script to run on start-up. There are several ways to do this, but I've listed the steps I used personally below.

## Running on Start-up

Navigate to the `/rc.d` directory.
```shell
cd /etc/rc.d
```

Once there, open `rc.local`.
```shell
vi rc.local
```

Add this code, replacing the second line with wherever your `disableprochot.sh` script is located. By default this is `~/disableBDProchot/disableprochot.sh`.
```shell
#!/bin/sh -e
sh ~/disableBDPROCHOT/disableprochot.sh
exit 0
```

Make sure that `rc.local` is executable.
```shell
chmod +x rc.local
```

That's it! Now BD PROCHOT will be disabled on every boot.

