Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B833046F4A4
	for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 23:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290960; cv=none; b=M5/lKAod++FiOvxLdkRGFByuAtAndUSTihG6YpUAlgua/NulF8EXxlZ/QY+EQksPvWsCO60wJLwX3hRmVaYKJ+vXbCYShsf59xDKUKOHRAkdNYFLq2A4/QIHu0M1EZ8NSYzeNwo7QvRs/6vdc1OxVZPdlrBI9Js3oEe89SZcHkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290960; c=relaxed/simple;
	bh=m5HqqAwvf714jhn9AtFujlH/Cfft9cIXbM/MO6suoWc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpXH0UnSOtQMp/RS4dz0wDrsFaNlFxcClt+5Od/SlTj1O717IfDK8f0v2sMGs2OgvV0rhEddYLynnY4qW3K8gHYaoplalvZdU5TaFPTMHIwmPb1Je9Yg8KKYffG5ITb64prUW9CU9kd6EdLmrlU/jAI1RrGBHlXP8pt/KKm4zRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJAOOIQw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJAOOIQw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so1932115e9.1
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 16:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290956; x=1790895756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=GJAOOIQw9GuCzF2pak6Y0dcDgcBuwZFCEDiZy41owoZqPcT5Ckq/8gRwQZJEnL9CZJ
         4ARIKvpJUoqBkuQfgWUDB04CtKyif4jI6H71McapPCpyRXV81bN4h6/lm2PcYnGsvJn8
         iAEShCQcyisuTGmzu0iapPeaexttfia4b56kzf8RqWDraDGZAvyg3Y+qaLd5NTWpjxM/
         rAP2FyfCOMffAR/gnStU07A/Ns5xqDtX7uOReUgpr+N7TkvWMhcef0CPdePuP/eWus0H
         ql47pF9EjfcmJmGdlgJ8yz24yFsS9heJqjINym1B8ssQl8yp1vz98CBdQ4a8LLj3Ccfc
         /T9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290956; x=1790895756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=XaAHoEErQQObgLP9IcrGw4iPU1THpTvW/pcClkvxvsAGBotIVxNKQsEAVF7XH5xEmk
         kXWQuJIyGqJEI9GcLMoMstJ1mgAWniyDxBjLFrE2KJuFItaI9zyd1o3u9LuXGB/PMaut
         YwmaNdn9z5DF4oMnz+gIYmQNgOuaNuj0kxEk6zHkcI6/btTmy/xzqSFhGbj4QT2uXml+
         C2olqmYuGPcSZ6mux5MDCWOUQ1CMzr8gbWnb1d9Pa0q1kMA1nvJxO35DMD2DW+gRM6+X
         wifvNxwIeCNkXXeEHGrVO/Eaz/fbF21KEXqNaSwJTDfVN+Z5qalpi5eJ3E/lzcscvCIm
         BRAw==
X-Forwarded-Encrypted: i=1; AKwUvBwJieCXLHbkX64MawzbjSHbwpHrxOs5a9WmdD87Mt/6n+pIGSvRojE6lLrcEEWeo1HgFZZ/@lists.linux.dev
X-Gm-Message-State: AFuF++mrZ2Tv+hXnlED4AYOlLVD4GQ54rqV0XbCneVt9MPOVh2VEOze2
	USdFXjhP7Lx0TYEVJLv7aIMiz3K9d1w6wQZ4O8R2Xm6DIYM1pM9oC3/Q
X-Gm-Gg: AYBFou05wX66Za0CMmStuWl0IwcCl9zJFtAbdFYkkJ7/498Rxym3c+czOqAyqNGVdBQ
	A5pcUFvM2MVTUiDAZRP8JId0dwYW4wLSEoz369FispaQmnoEO3apkll6RgopTClbyK3qhgk0/YG
	RVKxZMcDPXtmZZDEih5jDuDFWR8U1YBlTP/k/t03yHqViJ/ARa08OWdTf02qdD9bIclNYGSXOmj
	ZH2+QJCa2RShphKX8Uwa9umYwPt3SCfREhbQUHyP5EJ/BAH+QrL5U5CM61ZsONqCUFYq+6g+Is7
	8VcbG4te18QSIGGj4sgHgMi4toh5CpC0tJKDGP7H+gfq4avF6IGBvVoaS8s2sK/oLzbiL350kDK
	8Ehy68qU1KUj40smooXJ8Hps8Y8gaXaL7mnh8YdL2cm+2qXREL0sA5FfIl/tfNza7eklD9IJW64
	7Ki267xnK530js1QgKzAtw06kTn2gbJ9usGAJ+FK1MsB0sXDghfTfwZPujo+kG/gJyeN2yM/fP2
	SjD3dd8KMF+vgrZCn9oin59V64hbpYRfvah8Bgq/SGqyCP8Pj5igPmFM7kBnceT
X-Received: by 2002:a05:600d:486:20b0:49f:e8bf:221a with SMTP id 5b1f17b1804b1-49fe8bf24fbmr42002985e9.22.1790290955933;
        Thu, 24 Sep 2026 16:02:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v17 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri, 25 Sep 2026 01:01:45 +0200
Message-ID: <20260924230211.11519-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1156e6c61a08..9441afe372c3 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2115,6 +2116,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2199,6 +2201,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2229,6 +2232,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

