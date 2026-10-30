#!/usr/bin/env python3

print("\nThe average human takes 15 minutes to fall asleep.")
print("A good night of sleep is 5 to 6 full sleep cycles (90 minutes each).")
print("If you go to sleep now you should try to wake up at one of these times:\n")

from datetime import datetime
now = datetime.now()
curr_mins = now.hour * 60 + now.minute

for i in range(1,7):

    target_mins = curr_mins + 15 + i * 90
    hours = target_mins // 60
    minutes = target_mins - hours * 60
    if (hours > 24): hours -= 24

    # Final print
    suffix = "AM" if hours <= 12 else "PM"
    recom = "" if i < 5 else "(Suggested)"
    if (hours > 12): hours -= 12
    print(f"{hours}:{minutes} {suffix} {recom}")

