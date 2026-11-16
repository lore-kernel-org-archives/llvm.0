Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846866;
	b=t57fbka34Rug5vNuQ9qqHwRzKAaDcT0gOkoHi4jXWZF95Ni16WzIcA5e3Y+SVgc4P1FF
	 xWUQk2tfVmwrtMjtdoyppHMYkwt8Vcu5JpS/lVekXBBLdWkcJavZ5yzddrXPHK7QKfBXu
	 oTjaS9+aX7Vc/ekB9W05YC0YfD/E2JFugDzpnEK49XyhINt5PMcCeJ5M55ocrHMGNSROw
	 sgWV0x31F/heXu/lPKwvg+NYlfPpND7RMhqmOS0c3U3sPrL7oa3l/JQkxWA1SQ0O5W2K+
	 pkMYducyfdpata5WZb/CvJKum+yC43wVUy5stXzRnzT9Phqp4jj5anCwc3yUoDaVuLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
	b=J65KJGRDmHD8Kvb4GeC798JK6oJpiRBSpaL9LBr9zYL1d6xEYmNhkw4ad+1ljWqBGuot
	 ZIyUmXKxk8hHhXybfeYcLRHX2bgrYc/JWS8G7+rD996bAzo9nJMTzzl5A3F/15dUExLfn
	 i+pirfOIPz8yc4hVR8T2WPD3I+LfJT2qHTnCztOMSVIZ8sULGMdhL757/w7yDo7ucT7/E
	 m1CsovsGOrFHtbu43a/YUsl7qj6wB3TBLcN3TSy+5OI2C6N11uediZY7gOItmTcKzbuYY
	 bNwkpgKAHzL7+jZAXlo6xDgi2abyLG1wDhwFuSptFiGNQbX8Se9CMEIv3u2BMTI5ljw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsaBCXww;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEDE606A880
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEDE606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsaBCXww
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1621438f8f.2
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846864; x=1795451664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=PsaBCXwwhz6S94gGjyg6Yci8uXg1HaxEvkxJ6b0iBHYNCVhj4aFA/vVt+Kg9xsigP6
         Zu0H+P5bYsWo2h4Tjb37R3+n5GViZ7xNQoymxT++tk48rymjtjnV5UrcvBaMvMxQUb6N
         nUx4wCmkSTcCtJErpBiN1P/4cew/XLwIAX4Z3Fi9Z6KaghfwSdA+5Bij7l4Us6I586rG
         AQ+yOLYQ8qDzmmmQThgzGCO45fMaNqXbjpEAWdF6jjljFnXTMiqdPg3tS3Z/Y70eWjx3
         yit/Ze4QR8T83TMv0dDNEGGKePx7EY4RYjOJJw52XCLdWoYzV7U5aFBNfBYnIXdN2KOr
         hEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846864; x=1795451664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=BTJQi6UdUJgTZX4rHu6R08JeO/Qq6cV/evvMPky59aaEjdZX/UFcPXBRxNPFOKzCSC
         qPm816XPmWAdC5j/5e2KjFOI5dXL//NsPguT/NZ2p1++R+DfVBENNhEgVeC9SQed1zA2
         XYcvCfeqkguLrv2uL+X+bb0dsplPpRUU4W3tvpnOWhSV3A2W7E93v/jj3yZwDtBVTGyS
         UqG1D8vkwec2SgyGeWP214p92n8Yaz3MbDmB5CTlyQspIIBmO01MDgd04kCJ1vgx4l8D
         BsddqVIlYaCrNOqUrP7Fo2US90nA4r/uMxOv9mJmHzIpn2E5Bv62fMHSi7koplvzxuzz
         heOg==
X-Forwarded-Encrypted: i=1; AL+hErH1gGwr49WSWH1elR5qolVfMZtjQEODimErsq8+uW+QhEV/6JYgMCVn+xS2VzhXxL/Onlu3@lists.linux.dev
X-Gm-Message-State: APuU4Z8jlcB+/5v8umVuRpjdFoPoPEp2NpGmxjNiC7kYoDO0tE/gR3kw
	SgglycKKFQFaD9jprPAnEXB+zpZ7d7TVrJzCJ+pBj9OO7+SDsaR7hlCx
X-Gm-Gg: AZFdTZfOIFHC/jF6wFHlMoO6T5MIi2u75KDqmYj/uzyDfbooXhGyNaX0eSHlBsNyICv
	/27ADHpCPukw1XwAScmNOoT2Hh6CybaisjpgEaXbEOmLe9+sHCWU6nPYlAMu7SxBsOOHVLWj+M4
	sKsAr/g9CyF1uCVXyGnkCMIRjitaicSAstUBRXh9CRAg87hZ9ok341EHsW/UrrtPmLazTSuRkpB
	hLX466Ri8txmTUmeP1kLxYpil4dzs2O2V+C7vkTznIJAchvKUCfye6J/SCfnEqYrv8TGviy3Dhj
	yM3oI0norz3e9viN0dN5w2zk6AIXBVEsVLLcld034byQ6TGtP6l/681P7zR9f5AHfR64exHBWM6
	kO3ftAksI0/cDSs7DpyXdIelZ9PtvL1Di21ybtwQLZFXqh8kV2dy687wE8T6fxBLfVSHZOUDsih
	AinAyJQJkLVg63axLt9eRV6+1Jcv8h6rlqnIN709bF6iOOcPikEWgUKckA6xOGPw8ftgJTbIc/f
	ve0ayr9cC2jEQjmSrpAiYhQSuBPRHWvw2SZFQ5haXGDcY5PLCqYVZZnRWpC9IvjP0TpvC1ZRyRc
	gCVs+djR5KSSNcm1X/VsEiQ44sKOkz7pS2GO1KflKjxc6Us4F3ZexVEz3O6G1Za48zYQAx8VjCW
	TLaeJcEt+Oh+oPRDZ1w5I+CzqtRcJioi5NvOSDE/0FbrNEJtGeDp500c=
X-Received: by 2002:a5d:59ca:0:b0:487:13f:f612 with SMTP id ffacd0b85a97d-49c723fb77dmr22962598f8f.37.1794846863544;
        Mon, 16 Nov 2026 08:34:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:22 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Mon, 16 Nov 2026 17:33:44 +0100
Message-ID: <20261116163412.551438-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0

