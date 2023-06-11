var=$(sudo rdmsr -a -d 0x1FC | head -n 1)
one=1

echo "Changing $var to $((var-one))"
sudo wrmsr 0x1FC $((var-one))
