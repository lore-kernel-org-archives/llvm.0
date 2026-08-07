Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134E730E0F2
	for <llvm@lists.linux.dev>; Fri,  7 Aug 2026 13:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108410; cv=none; b=ERIm5O4CA/w8IStPtRORSY1E1BHShDZQgLsIsAlo05q3i9fbvxaKM3EkECyE1xjIXDnePBgb8do9lvllHumPli/JpBppodBnhYcM+kLYs0mF7hkajFeq523wbNFjwt3R2jP8XGlg6OB9hWMt+PD107rZJgNTqG2pYbKoNPamLMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108410; c=relaxed/simple;
	bh=Jf7dpOSRcnrHlN/3saaMWmUi2b3nRHGRDDnO1ZHl650=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETwVh/+ySdbyQMKh3KPji9jvjyST/jjvfEg/NX5pU8zFNzsgp23nsdqnqhYfS2ne2ZR4Z18307UbfZdE2ycgPRWN4qlAi/aeLk1t4Bgbp0qfb1Y1VMXhi9fNB/PH5FLK10+v/1QSFpNMB06xzQd023ZXvvn9NyJt6zkITtl1TV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAYxNE+J; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAYxNE+J"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-496b7622a83so28423195e9.2
        for <llvm@lists.linux.dev>; Fri, 07 Aug 2026 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108400; x=1786713200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7SiPVU+Oezx4aeCyIoOFu+UHMO/l1pUlXRsyexY8XZc=;
        b=gAYxNE+J0bKRLWdYTQeZoyEsin87X2sGIzw2t8Tw2/B/wR2n/9fL9b4eUOeEKLMjjY
         PVkbVKUX/C1IWvE2AOHbMfH7v733nqb57RJHnjZVwX0H/QYrMeDq+p6xBzfmjXuWlLfR
         W1s12AVjnJmu2HttfaJYNoslgAfmcoBAz57FCp1pLsRUsfN+60JH/9Iy265m48AIew9R
         Jikef0G5g2asaRreKfD8UxHJZkdObiM1asdkpZZtagzaxYdhU1UmWVUJBFxzq7Itbp32
         t38/SE7WErlJcg9Y+GOCG5aEtG3pkT4alQuruyjOThV1fDeI/q8Ejw5hpHlY0p/TMIUK
         qb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108400; x=1786713200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7SiPVU+Oezx4aeCyIoOFu+UHMO/l1pUlXRsyexY8XZc=;
        b=brTJsENq/g3cUU7rtJ9IfUL5290CBTi+8O3i4ZOHJ4q6XBF9kBfGTO8jLFu3M1gnuZ
         GZEEV4ObTLZdXZo6TjtRczqFbE2SO6lq9Qt7j9GnLpo72B6QSajSAcsAY+RC1lX7K4lG
         CT7/CEK68O651n3732UA7sgWvyfvfRTcAjkZbCCO4qILv1eW8MTARIu+1hmclQwMvQfN
         wShVAXXCOfi8TDkrNTWENO+gk/te9b1ZOrKCKVglFRgc1qKvZGLKUB64loW3schZlYEP
         PLGPyljhvsdjx3EJx8Im6XkHn/vIVXTe6bXmr3ZnW7IVrHgPvBaCx+aqivLC1fyxgJqV
         DVlw==
X-Forwarded-Encrypted: i=1; AHgh+RrSylirHF/8tnOqY9iauB8G3+c5RItA24PZEAgkWiCg5m6ViGHx6MSTRC8+qWfgUmXBPl2/@lists.linux.dev
X-Gm-Message-State: AOJu0YzlS16e9qve23eJzl29Up0n7ZI3Sa+PMDvqI1EC/hD5OwZsoCqs
	qUfPVA3NHoePXenYanTFtNBr0H+7c3K8dB6sPZlFwzGosGTr2lAro168
X-Gm-Gg: AR+sD13ZJG62YKCmr4e9pJW4m9MiX+5aak8bXWpr1ndtIXBISZnUk5PIWIx2yJTR5UY
	Hykfa4JReY9Ei7DvZkcBmpgT8EIyjbXIVcETwDLoeZyKSiQxQxoEoafIzuNRJdRkYBUoCBc4Kdy
	/imB1WNZoFt1Ns541ZPdNvYE0D9rpVdTKUwSRdAtUkwf/8auxPVJxOFpyU329mVOickOlm2zloz
	F9vkCRb1EHlYYeJeGTEz8dTNpuhBUoHLho9vrr9s4e3RP1IW7pA1ZTVKC+gZTbckgIqyzSIXFmO
	5SzgxoYmRZtZ+avLM5pa5mHjY3GAkTdiIWXxKnLGMscUZoknfZJH2HmR02ZMYcXEK/PDOg0HagM
	SBbds+S0k+zZmga9//08yQleVlbjXlkQMtwF3pWCTAi4Zrx/1NnjSzOTGs6u64M1fC5UJAI2/Xq
	lWPi/3wcxBKp5f8oONxBsBfIyl2FX921C7e3HIb6cSryqXyQqyhZS7X3FxaLF0Fx76nC/i8KKZ1
	N831X74qvZs0d25n0jhtSK6QC6Pqvv3qNRXqybUQIrXpOUXTGeKww==
X-Received: by 2002:a05:600c:4691:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4994e72823emr265837225e9.1.1786108400466;
        Fri, 07 Aug 2026 06:13:20 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:20 -0700 (PDT)
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
Subject: [PATCH net-next v11 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri,  7 Aug 2026 15:12:46 +0200
Message-ID: <20260807131301.192060-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 9decd7333c70..041405ce6bf0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	const struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -1988,6 +1989,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
-- 
2.53.0

