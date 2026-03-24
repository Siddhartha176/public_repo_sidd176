import time
import random

def stream_orders():
    while True:
        order = {
            "order_id": random.randint(1000, 9999),
            "amount": round(random.uniform(10, 500), 2),
            "timestamp": time.time()
        }
        print(order)
        time.sleep(2)

stream_orders()
