Ever had a tech say "I Reimaged this PC and it STILL doesn't work?"

Inconsistent BIOS settings across your org can make for all kind of trouble when it comes time to reimage a PC.
Resetting to defaults may not be optimal either, and maintaining separate lists of "good" BIOS settings for each
model is a pain too.

This leverages one homogeneous set of settings for every model I've encountered.
If a setting doesn't exist for the targetted model, it skips it. One set of BIOS settings to rule them all.
Place this in your imaging task sequence, or better, train your techs to run this on a PC before they reimage.
Or both.

Requires HP's BiosConfigUtility, available here: http://ftp.hp.com/pub/caps-softpaq/cmit/HP_BCU.html

DO NOT deploy this to machines that are already in the field. They probably won't boot into windows without a reimage afterwards.

I'm not liable for whatever this breaks. Audit it on test machines.
