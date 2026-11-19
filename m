Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108062;
	b=QtO/KPZZE7ypBHzUIPqNt5vBfUjY2S2wPN7K8lGLjpNXgsusQWqdtKobiaixWer0mVJp
	 Jn5T0ITpDLxio7mrFEa4phGOxfCffZq0a6ZnKs41g3ZVxQULs8AqfDMOoy4az6WV1GTAN
	 Xr5vvpXyFH0Jvav55bTl93OA8H6gz49MqGfUSqr8ki+VOPpKRtDnNYN8YVJF0moJbeK5S
	 zJIeLktnavbFLYM5KwjrqOxZHPFv2Urucm2kP7UuEBR1R+zEeN2uol/1H8cG/F0sg/TZJ
	 kKAkmLJFLKhqy1ZPsMkYnlc1KQhUuAtfuX7br6hpP1SDK1OdVXZUZT2+TyfrI6bVH2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=40uF70Y8a7Zl+4wCt7nPsMMR0NTjvrY903p4D0/j04w=;
	b=RjojhcJrfD3U3S6capT7I+K0vL2T30Y5sDE/bd5s3MIc9cXgqLd4CHljlERZ4ir3paGB
	 qQUOapv2m1MOX4yg9qfmH/ShqRG9WNszNmGtzDrvM9eky3KSKisOz7QWdsLn3xokOcTBr
	 rsYNbkveD9or78fjWmAyZEHxdBROXGimrBuPdTGwe72E+WGtu94IdZHKCWcOC0BNFwN6z
	 i9u7Q+lopHZ+eKu0Yrar7Zcy19mmpfjEZjBVMJ9TifIK1uUlUNoTpUx0nGM7OoBFlQAge
	 Tlp0GPWchtE1Ev0csNTY88APiX+o+7/l1mbdVHs6cc1VCchOm8cYHCxBtWHapEfBExg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cVEZKd98;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CEB60A260D
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28CEB60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cVEZKd98
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so3660831eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108059; x=1795712859; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=40uF70Y8a7Zl+4wCt7nPsMMR0NTjvrY903p4D0/j04w=;
        b=cVEZKd98GBwtvT6hzgYIYbU+xz6itatjUDIG5fQxFIKg6z9rKJ1wHHh1NrjCrAr0T+
         aU7eSTePhsmF0UYuapT+USMNz3GElpWcdpywTry7STrHU0Yij24iTQGImhSce1Chwg8a
         yBFOeWIOuyeMv9glhBwIpSSh+8ov3yLH4O+My0oV+BBp8/UK3rM3t1czotfaFPgD45Hm
         szXD7IWCJL1ati1EkBfWNSz8U9nOmtwwfWDVmCfdcrJ+lLgU6EOz4x/h6a5qnzrLiwKL
         KOkwb2qdxYVqUxOEFYpnWkXXGYILiADKFHFxhQbaV4QN3zIcp3j/n99q8SHKOqtUZ91Y
         1pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108059; x=1795712859;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40uF70Y8a7Zl+4wCt7nPsMMR0NTjvrY903p4D0/j04w=;
        b=chuVLxmosp1RGaxm4hKc04XeQczDlSYf+vS+Lt7SWt8177/ZhhJTDThtn8nFJN02He
         Gfz3cxah2oH/iCwP7ZT/4hoYVfO8TAw2mcGIViUOpZNQbtQS6I4fdARRB2hnKqszeb4L
         kltDI8uupBqEkbpeNwvhFAIcRuarrqULn5ZE/sENDsLFwLMTVsvsHWz67JnrIz+hPbSl
         xIhfFUpAQPXW80gzKXY0CNiDPBVdkigxi0kxlsItXxZrlHCireO29U9HSRGRcsVwAodl
         zlEC5uaFfpqtxZGk7GIrxYICw7y8F8KvDu+aI/wzCVJJ8A7Pu/8fy2ytQTptKawA2qZm
         /pyA==
X-Forwarded-Encrypted: i=1; AL+hErFZk7CRZ2hXfaHnRJj/ZFoYttZjlTIOF4b1tQYL0yACtn4l6O81WXlnojnf3n7bLXCs+BAU@lists.linux.dev
X-Gm-Message-State: APuU4Z/M9ckVdKOJKnn5wtA62uO4pcP+LtOLjZw6taeCAqaKTCCevquv
	GLD6boIljMkMB9/VJyHF7uO2xiAwPk3u6RU+Ve+RE+8d3KxxdEHLv1DkKYhX4ReUBCgbfNTBGpS
	htO5FHsOYbA==
X-Received: from dybhc28.prod.google.com ([2002:a05:7301:29c:b0:36a:de0:d28a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3f16:b0:36e:a321:5353
 with SMTP id 5a478bee46e88-3856c5b5615mr22305eec.2.1795108058821; Thu, 19 Nov
 2026 09:07:38 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:35 -0800
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
Message-ID: <20261119170735.1524873-1-irogers@google.com>
Subject: [PATCH] wifi: wilc1000: Fix skb leaks and return types in wilc_wfi_mon_xmit()
From: Ian Rogers <irogers@google.com>
To: Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

wilc_wfi_mon_xmit() is an .ndo_start_xmit handler returning netdev_tx_t,
where negative return codes (< NET_XMIT_MASK) are treated by
dev_xmit_complete() as packets already consumed by the driver:

1. On the broadcast deauthentication path, if dev_alloc_skb() fails it
   returns -ENOMEM without freeing skb; if dev_alloc_skb() succeeds, it
   copies skb->data into skb2, passes skb2 to netif_rx(), and returns 0
   without ever freeing the original skb.
2. On the management frame path, mon_mgmt_tx() returns a negative errno on
   allocation failure, which was stored in u32 'ret' and returned as
   netdev_tx_t after freeing skb.

Free skb via 'goto drop' on skb2 allocation failure, consume skb with
dev_consume_skb_any() after cloning into skb2, remove the impossible
!netdev_priv(dev) check, and return explicit netdev_tx_t values across all
paths.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wassign-enum enabled; fix and changelog drafted with an AI coding
assistant. Build-tested under LLVM=1 W=1 (-Werror), -Wassign-enum, and
-Wimplicit-int-enum-cast; not tested on Microchip WILC1000 hardware.

Fixes: 5625f965d764 ("wilc1000: move wilc driver out of staging")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/microchip/wilc1000/mon.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/mon.c b/drivers/net/wireless/microchip/wilc1000/mon.c
index 9b8c083b403d..8bee46651c61 100644
--- a/drivers/net/wireless/microchip/wilc1000/mon.c
+++ b/drivers/net/wireless/microchip/wilc1000/mon.c
@@ -145,16 +145,15 @@ static netdev_tx_t wilc_wfi_mon_xmit(struct sk_buff *skb,
 	struct ieee80211_radiotap_header_fixed *rtap_hdr;
 	struct ieee80211_hdr_3addr *hdr;
 	unsigned int hdr_len;
-	u32 rtap_len, ret = 0;
+	u32 rtap_len;
 	struct wilc_wfi_mon_priv  *mon_priv;
 	struct sk_buff *skb2;
 	struct wilc_wfi_radiotap_cb_hdr *cb_hdr;
 	u8 srcadd[ETH_ALEN];
 	u8 bssid[ETH_ALEN];
+	int err;
 
 	mon_priv = netdev_priv(dev);
-	if (!mon_priv)
-		return -EFAULT;
 
 	if (skb->len < sizeof(*rtap_hdr))
 		goto drop;
@@ -178,7 +177,7 @@ static netdev_tx_t wilc_wfi_mon_xmit(struct sk_buff *skb,
 	    is_broadcast_ether_addr(hdr->addr1)) {
 		skb2 = dev_alloc_skb(skb->len + sizeof(*cb_hdr));
 		if (!skb2)
-			return -ENOMEM;
+			goto drop;
 
 		skb_put_data(skb2, skb->data, skb->len);
 
@@ -202,8 +201,9 @@ static netdev_tx_t wilc_wfi_mon_xmit(struct sk_buff *skb,
 		memset(skb2->cb, 0, sizeof(skb2->cb));
 
 		netif_rx(skb2);
+		dev_consume_skb_any(skb);
 
-		return 0;
+		return NETDEV_TX_OK;
 	}
 	skb->dev = mon_priv->real_ndev;
 
@@ -214,15 +214,14 @@ static netdev_tx_t wilc_wfi_mon_xmit(struct sk_buff *skb,
 	 * fields are equal send it to mgmt frames handler
 	 */
 	if (!(memcmp(srcadd, bssid, 6))) {
-		ret = mon_mgmt_tx(mon_priv->real_ndev, skb->data, skb->len);
-		if (ret)
+		err = mon_mgmt_tx(mon_priv->real_ndev, skb->data, skb->len);
+		if (err)
 			netdev_err(dev, "fail to mgmt tx\n");
 		dev_kfree_skb(skb);
-	} else {
-		ret = wilc_mac_xmit(skb, mon_priv->real_ndev);
+		return NETDEV_TX_OK;
 	}
 
-	return ret;
+	return wilc_mac_xmit(skb, mon_priv->real_ndev);
 
 drop:
 	dev_kfree_skb(skb);
-- 
2.56.1.708.g77570a6a1d-goog

