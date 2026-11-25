Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644937;
	b=Hzaw4YPjMsM/pHuT7RGglbhZ5mw6M6YkAyHxwKS2uuZUo912k8V+YaFGX4+koBpDHX/Y
	 zAVIVNRBQWiJCAAe7aVzYyTBIuXvI7o3+pVjUkbQ9ImiKzSIHpC2+HDrSPAydE3bEkBt/
	 MYIU2Ph8Nuoao7mnpULlHgQJmBFfMTEkrZqiOKeX8lUggGa2kWKwmeBVgWKj3byP3QXkm
	 Bql9232jo61LhdO8AtXOJal7+5x0JWuHGSQk/pxS+4ss36r4S9L8f8IVkjbqQd2TWY2lC
	 36MPm2nSgHHDdK++qIvX+AQhKZFRrP81Izvzc5cB7JEA7pkIMfuU11SEl6QO+o+GSLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HoLpNZUPpAV0s/IN4AE3BuQqpTSM/yM+54mb7fzDFTw=;
	b=a7fj91GFevyl+tlPEZ/ijozYkgaxfwsAySI7xm94RIPKNPphgycGOO3eAIR6YlU9PSdh
	 D9wxdPLK8yvrpnJBxITseYJ+5a0bV8I8Wp9kYBzGb3amNgzQGQYrBRSKUX5ZJVdOuVGIl
	 tqHayIv6ZOz4iDKbjNCLE1KCR1LycvS/ErrK3xZRSVPAxvgRHjdpW3K38wrcOgTo8pqOe
	 CCUJFMf0S/rzbTpcWxI47BF8NZuybsPSRSvUD5caKBqZRxarqXoPgzq83RcMTImzIUTJ2
	 saHWac4N18GoNgR9uLZm9bPs3aHC+/cwgOXjEqnEhrjSi5PnnZupZj1hCUq0rRjWIAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="p4/qAR6N";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D29606A329
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D29606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p4/qAR6N
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso10341126eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795644936; x=1796249736; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HoLpNZUPpAV0s/IN4AE3BuQqpTSM/yM+54mb7fzDFTw=;
        b=p4/qAR6NDCs6hnmH9Atu/YBQ6C46kdj0TUP4WqzucDFodYnrU3aPouGrEUhAIIDV7o
         XwH9jG/M3K3bEB9qIbA3Ls/rxGFwATGUJ4JcfA5osHiK71SoUqAaMIu/3Li9tzQWgGW/
         +WNQD9CyOBvdpyCgDa7JedE2tagVuORaZkpx+vhHtNHXJuyyH79cYrWy5WPUeMkiFMVW
         XBjKwxP0auzym45sDUh1x3lPJ/N4h3gikBsZCXcdndK9lqMDAInbAzobDLIYjXeHxJf8
         X81KsRQcVi9AciNNfD4QVyorcDTZUTmNU35RaSbnGVDWPRa11FWk72/jcdFUTuW7Rvjp
         hW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644936; x=1796249736;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoLpNZUPpAV0s/IN4AE3BuQqpTSM/yM+54mb7fzDFTw=;
        b=fZ+f2iap1T0fEm61AxciVC9qLaCy8pBpct4CqurFL/0UQZy1PB8S9BgBfvKzqYLYuz
         STwAsIovwFc+jbQzHjcWPXUwSfUr1cNy2SdDbY2t39XIxchmQg4s3afgpAgaqKWdq0FP
         k28kFDFBhF0FL8aOGZSShkqvrpYQClfI5ZLvw3BYYbvtMK8udH1m88LpyrO6uSmfY8Zt
         1L0VYAIFZnxqvuSZ8w3RKRJEK578ZIwYVxM4m0+BhiMK0B9JNm9HmwKlZCahAV/NUHa+
         R247qq4nOBmi+0Ob2Z7RA/GkhEAzoVkZTBAXye5jwPtIIUU/8r5bk2efXepu/Ckk+RhR
         3yuQ==
X-Forwarded-Encrypted: i=1; AL+hErG3ISSxWTzVGcoF/CcujmNndblhyGZLQlrz8b8BdrjhfiVbuqO1M8hCuI/0h7TZNedJUGnQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8A0Vhq3BMkdZp7Z+bAl13aC9+ZnYygNTMxro9W+gNYk4Wj2Wgu
	DB9zdZBb9hJ4UlFIA5uF49zdGpFdTH69zphrp3pDBma/fimNLWb5JhpkcD2Cn2Za0UXSTx66HNg
	wFA==
X-Received: from dybqf1.prod.google.com ([2002:a05:7301:6481:b0:386:a9a2:8031])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4143:10b0:36a:1f4f:3e9
 with SMTP id 5a478bee46e88-386b1067bf5mr12106547eec.20.1795644935493; Wed, 25
 Nov 2026 14:15:35 -0800 (PST)
Date: Wed, 25 Nov 2026 22:13:22 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221322.1412935-1-elkin@google.com>
Subject: [PATCH wireless] wifi: mt76: mt7925: fix UAF and skb leak in mt7925_mcu_rx_event()
From: Elkin Cruz <elkin@google.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

mt7925_mcu_rx_event() caches rxd = (struct mt7925_mcu_rxd *)skb->data
before calling skb_linearize(skb). When skb is non-linear,
skb_linearize() reallocates skb->head via pskb_expand_head() and frees
the old packet buffer, leaving rxd dangling into freed memory when
rxd->option is subsequently dereferenced.

In addition, mt7925_queue_rx_skb() transfers full ownership of skb to
mt7925_mcu_rx_event(), so returning directly when skb_linearize() fails
leaks skb.

Free skb on skb_linearize() failure and assign rxd from skb->data only
after skb_linearize() succeeds, matching sibling mt7921_mcu_rx_event()
after commit 4361f1660101 ("wifi: mt76: mt7921: fix memory leak when
skb_linearize fails in mcu rx event").

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index bfc1660d1c6f..42af38941aed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -715,10 +715,14 @@ mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 
 void mt7925_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
-	struct mt7925_mcu_rxd *rxd = (struct mt7925_mcu_rxd *)skb->data;
+	struct mt7925_mcu_rxd *rxd;
 
-	if (skb_linearize(skb))
+	if (skb_linearize(skb)) {
+		dev_kfree_skb(skb);
 		return;
+	}
+
+	rxd = (struct mt7925_mcu_rxd *)skb->data;
 
 	if (rxd->option & MCU_UNI_CMD_UNSOLICITED_EVENT) {
 		mt7925_mcu_uni_rx_unsolicited_event(dev, skb);
-- 
2.56.1.839.g22a8290db9-goog

