Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108054;
	b=vX5HNPFuzLrCzoqjGp7gPKAxoyBDWJ6x8cN6GyNs7yTiZGi3dyFCu2AsWAq63xHU4CAg
	 6HhXo9Osvi7PfXnPeMtu1phYvNY0uoCO6IHe6YiDObaYG9pvbGnKZREzLrJWw6Y+ukfKJ
	 R2f26/0hlCXDPUEu5gG03w9lM/tWPMKiA5J4ozKUC9KX6VJFUXgNuegsOug7PodeqtvAF
	 kABK4QkZdgXNCGjIH8+ygIaLMiSfTEjI+HJxTcvY9I83C7v6ytCl4f8qj1gaEvvtKG3rq
	 JW19OvmwJCK+P5v8AzPmqulGeU/ef6buepCCQUUsDtNAh0lPpQ/n+zGkrm7YydCpnzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9+uLL4ZhO+yAS7HHcBHeUoXpu6CmB8jc9UKkI8rB82w=;
	b=v3c+cUTtmnKPIC/PKi1IaMVjA9EV+ZE4NxY63TyRQjedYLD/mACeoUhjLpxfnradpawo
	 OuZ0ip6jjdO2yL+ZJJCQMjNxEoOKP3Rlu7/ITiISrxiSUffL9QZUuzm1N3cQIPu4nCzOS
	 Zkl70VIfKZXYO7sgAVji6Ed8G8iFBFpKVF+cC0Eq3Nvj0dXZ7Kh6fOUrhzx+frG+I8Lkl
	 reyeJce0xDraRzY4pw3EFhS7ABx3dXQ+yekofeIekqCY+5lqwGMR3qLvYmV4bZE89KFfu
	 CZDTE8aHOl/STm2evANBVQK+7+9LGjGG/wwwUXjBs/sab++9O1bJkh0I4duB3ZQ0Fcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ShYdipjC;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF560A2601
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68AF560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ShYdipjC
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so4492921c88.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108054; x=1795712854; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+uLL4ZhO+yAS7HHcBHeUoXpu6CmB8jc9UKkI8rB82w=;
        b=ShYdipjCllKZDMAq0vSBQ4UgJAewFlLZyoa75EKzbfX27nPZsACBaZgG8YNm7m9xjw
         SyFa1lzxqD2Wk0E6IhxdFAC1hkdC++6gadkj8mDkHcUuSs/jFavuOrE9SRbkCO5txABT
         9wdP0ijhvDGx2sk5dbE4MVMJ12pA2pBYx5tDx8tJD+83AJhr2HlQ+Xrl8hOGtOQn4vpr
         +AaTEKOS6QxoRFO33hEYOtdIFejAt06tdWlhrCXCy192hnm/tszmnrrxQ8aYM0KqZcts
         W0GHXezoSNuVf8BA+u+6UYCsQa+XnZzpg2sZ2+BkSgcze7mYrXaQDOQ5ZQsbqRv8JdjR
         U+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108054; x=1795712854;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+uLL4ZhO+yAS7HHcBHeUoXpu6CmB8jc9UKkI8rB82w=;
        b=W5KPtyHg8ahE9xFZO3umHjyBPwvigYSQJAApbk6hkO/28U7mp0ZpuSagbqYIuSev+U
         MA+KFyU5iyyMCZav4Slk/5WC7bOnmQDImYnXizCldRiDwlITGsB2kuFcezmkU7l/FC49
         ajZAZWyWo4JqOvpa/SD5h4cNf5jG7/h0I181Vt940fzv6q3v1KOLjTUYnuQRvMgUt8xd
         SILMBZyIFDlaFzJY1Z8wXHjcxJStv0nK2bIwtJqgAIfkVPH6QDrU2yioW3E5A2UEiGlw
         Cf57vemjzLr5JEDGX7O+FD6JAbT94z5GYN0qGy9kKBn69aw4X8CfkfB+wRshoIlEkuB2
         U0aA==
X-Forwarded-Encrypted: i=1; AL+hErHiTd8Nyo+4t4jSImmJNALsWSSuOCd6UQDivEw0DY0O6rLkdsWzWjZbW7NJktXLqBksnsR0@lists.linux.dev
X-Gm-Message-State: APuU4Z8GzWUVoMa+1PzXwM1zvouvEBIMyzU18r6kWp+Gwl5Tv5uEvxAg
	q+qFUSjjXIIFyQMBwFAdag30ZP79b+hL3BUgO8Khpt11uIdWVYbZsan2dWIhg/KoeoVtg+s/As9
	9wIRJGznzsQ==
X-Received: from dlaj28.prod.google.com ([2002:a05:701b:281c:b0:1b5:345d:ed30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b0c8:b0:1b2:6855:998a
 with SMTP id a92af1059eb24-1b556911007mr233836c88.34.1795108053230; Thu, 19
 Nov 2026 09:07:33 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:29 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170729.1524516-1-irogers@google.com>
Subject: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
From: Ian Rogers <irogers@google.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When all LAN966X_MAX_PTP_ID timestamp slots are in flight,
lan966x_ptp_txtstamp_request() returns -EBUSY without queuing or freeing
skb, and lan966x_port_xmit() returns that negative errno directly from
.ndo_start_xmit. Because dev_xmit_complete() treats negative return codes
(< NET_XMIT_MASK) as packets already consumed by the driver, skb is never
freed or requeued, permanently leaking the sk_buff and its socket
sk_wmem_alloc accounting.

Free skb with dev_kfree_skb_any(), increment tx_dropped, and return
NETDEV_TX_OK when lan966x_ptp_txtstamp_request() fails.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wimplicit-int-enum-cast; not tested on Microchip LAN966x hardware.

Fixes: 77eecf25bd9d ("net: lan966x: Update extraction/injection for timestamping")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../net/ethernet/microchip/lan966x/lan966x_main.c  | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index b8696fc7e9b9..9c722d23e0bb 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -392,6 +392,7 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
 	struct lan966x_port *port = netdev_priv(dev);
 	struct lan966x *lan966x = port->lan966x;
 	__be32 ifh[IFH_LEN];
+	netdev_tx_t ret;
 	int err;
 
 	memset(ifh, 0x0, sizeof(__be32) * IFH_LEN);
@@ -404,8 +405,11 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
 
 	if (port->lan966x->ptp && skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
 		err = lan966x_ptp_txtstamp_request(port, skb);
-		if (err)
-			return err;
+		if (err) {
+			dev_kfree_skb_any(skb);
+			dev->stats.tx_dropped++;
+			return NETDEV_TX_OK;
+		}
 
 		lan966x_ifh_set_rew_op(ifh, LAN966X_SKB_CB(skb)->rew_op);
 		lan966x_ifh_set_oam_type(ifh, LAN966X_SKB_CB(skb)->pdu_type);
@@ -414,12 +418,12 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
 
 	spin_lock(&lan966x->tx_lock);
 	if (port->lan966x->fdma)
-		err = lan966x->ops->fdma_xmit(skb, ifh, dev);
+		ret = lan966x->ops->fdma_xmit(skb, ifh, dev);
 	else
-		err = lan966x_port_ifh_xmit(skb, ifh, dev);
+		ret = lan966x_port_ifh_xmit(skb, ifh, dev);
 	spin_unlock(&lan966x->tx_lock);
 
-	return err;
+	return ret;
 }
 
 static int lan966x_port_change_mtu(struct net_device *dev, int new_mtu)
-- 
2.56.1.708.g77570a6a1d-goog

