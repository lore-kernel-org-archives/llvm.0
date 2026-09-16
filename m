Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057155111AD
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 23:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602737; cv=none; b=XePEqd2yltryVITt57FgwYBV5lkS+rgX3mV1QfJuL+OxcAUuTJdWFVLW4xFMgTN6Fh/RzwmOquJQ2BK4LWKRXed7PVgbqO7yUKV904McK9IE3ErhiVqwHYrLCxSKFrP4V3VpTIYQsefMP946zXt1QvjXzlXcsfjDEzR4mWT/b38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602737; c=relaxed/simple;
	bh=Hx9TIRdPyOWp2JCcph+UWaHhkA7sNcruB3L94/kOINc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/axaslSMbI8+2kUDHbZ2B6rWj1OLycLhAN2vS413RdDHg7jMPGy0Ql1QrhWsphzewlJb/tsxOCubEhG53MYLlCbcKlATNeUpE7IsbaRQtqoU0XwU0RSTAtnGoaAlLEbFASEHyDKiePSCJ7Qpdj/xgJeOGJAGd+RQcI50vjnkPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buT9gdiJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buT9gdiJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so111507f8f.2
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 16:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602734; x=1790207534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4CVtSRo73kcxXzyXjS3Uh97Hci0HJhAxnJFberGLSLg=;
        b=buT9gdiJNPwySG3XUlILHS45tSFrhZroeb7Sn24uCiTqr6DNh8jyKft5lpbeefL1PK
         i5GypqwULA6wlCYh0G+uCPs82ni2JtN/DBQyUiwG88LUSWrGhkQV2+h5QRrnQo8JFxKW
         CGglwMbBCfK3Y35/MPsGZ+I0gUR9+r9GGPSEzYmbECV9SVC3TCeXMVSwE7oI3BYWPUyG
         ClKu9XiqTXOHB5J2+FVJZZbofTilgrbLTiQed+TUig/CL9gI+oOQv+dCmqPKZSqrcDh3
         CIC7gjJNtXgq8rLr8cQuvydrAGx3wxrUNXOO1QkrBupyE8fReka3EwwEbZy0k0qAeyv8
         1Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602734; x=1790207534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4CVtSRo73kcxXzyXjS3Uh97Hci0HJhAxnJFberGLSLg=;
        b=TajEu6OSX53Ww0aEpmlNa8mwYL3FbZQH4ByFMl6ZC9DCuNWScTNNb3J0wJBuyQDml0
         UcIY07taA+uoyw2OEvBTB0++YhaFaOE7p9bjZwa8XoX8uk//xGhP52hy5lUtEASsBPmi
         jDLN075O3ibYyywZ01rd/nYCY+5/VE5syfi5YSzk3B3KSCW/k/1oMdjj3WDoy3hH5/r2
         fwtH2rmfultLbJvfT0e1x9Qa01NXLKxlMWfgjHIiayzSK9kbqCeJtnJZwsJ13/w5kpXd
         zs4De8htuoEOKdwmxj1m81gsTjtZkH0RWaUo0u7LdVK+qtlmhgBR7Hhh0Zh3+hCeE5l/
         sQfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsDmUY+IWZZ2UVquwx8AYqSKas+a5eGYMH6JMXiMJkZhcVcTOTYRlFzCZjiUikbweK6Kbu@lists.linux.dev
X-Gm-Message-State: AFuF++mlHntyOH8qQkxlysHHiZtPGHG7KC9YH1FAx2XsnjGoN50IpGrP
	Gl1zy5Ohyj/hix95odvAzEV32jWMjzq29yjNs7qhqvgzV2/4JugX8ewN
X-Gm-Gg: AYBFou1hC0wzcI3nOridCSlUegq2HVQe3aCzQd2MfxiWEi4/ez3KZqUEqLGu3eJEG0/
	ULMTDfRk+Zlf74lkHnsbAq19whVCDOE4vYCif/hXQ6VS0lUWwhML0gUQKobCBslJu3pMm60FU8i
	cDXkct4qM4ccAglYgiCxdR2MmJSjMvMBMlZg9gqx4MN/CpNuoP9oQmAbs5+mDie+TzuG1otE9lD
	8gk2OvoMb05ZqKiDm8K4B+TZJdtv/Gpe/hTG8xz7YtK3QjLleYVF9YluYTnBUo6SXpIqqwhXQZY
	OB8Hx37WKGy9v6/IF6L1pL/HZFPZXDR2g5LnE1wswIV2umTsPz0o+0lhP5X/p9uBNGxd18g+cSY
	TNkxBYj4gFBNiLlbDTtIoxTFstKdC36bIn4X+2Lh2IZVbjbj8f6Yp929mKxX05ayeGEtc198TqJ
	43/ptVBj2hjj5KiYqI8zHw7NjXg7+uY86ANv0MM1mhNSw9DFRtpJZS3qgrenPY1xyT9dSuaA2Qp
	TJ5JjmVcKYHPDGledph1fANSP0NyT5dXGsVogaeJDJmla6idYSNuTQ6E7qwL2A=
X-Received: by 2002:a05:6000:1868:b0:487:980:b42c with SMTP id ffacd0b85a97d-4870cef14b3mr9005287f8f.11.1789602734011;
        Wed, 16 Sep 2026 16:52:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:13 -0700 (PDT)
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
Subject: [PATCH net-next v16 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Thu, 17 Sep 2026 01:51:27 +0200
Message-ID: <20260916235200.20712-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 390d3eb3e6f7..d67a5184c524 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -628,7 +633,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -2026,6 +2031,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2147,7 +2155,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2947,12 +2955,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 		return interface;
 	}
 
-	if (!test_bit(interface, pl->config->supported_interfaces)) {
+	if (!test_bit(interface, pl->supported_interfaces)) {
 		phylink_err(pl,
 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
 			    phy_modes(interface), interface,
 			    (int)PHY_INTERFACE_MODE_MAX,
-			    pl->config->supported_interfaces);
+			    pl->supported_interfaces);
 		return PHY_INTERFACE_MODE_NA;
 	}
 
@@ -3831,14 +3839,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
+	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -4009,7 +4017,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.55.0

