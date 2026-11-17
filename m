Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919214;
	b=IzclIUbhStcrFAD7w61cc8bbrhLG69RzZjMBm0MYs5COkYhG6A9zRdYS5g8cnNZtDIhK
	 HcIzqEVFZLRs0iIHYZi7V5KW3SVcFcz30oWk8vj/CI2XznefwftWk9HpWdI+GfdXppR6X
	 rtqV9qEocP22cbw4DOLTTO0td+eAgLkY7g77gteP1Y7vYSgDmbI5vKyCiIW9n4+yN6JUO
	 k5IZeO+nc57pG2tyVGW/lyC9k72mXS8sOH6/rE8m//70RhvHI8t6adxrXQg/vslmzxOJn
	 NKpq7EkYyJJpF+ousH5hbs4hCvdsUvPWzknxlWhDjgM7ttQ/QnIOYt2fsMtrykrbBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
	b=2A+jvTn9fNomM/JndAqN0AIYUkFT/AQNwvYomhYJk+izh1S4My/dUUPNx6WVCy0QSzVD
	 SC/Dm2Jde9UF1UBAKta2zxIfLY45o6toW4GS0rDV/+pbIhkKFzGXIUQSmandEUBf0JfZq
	 O6PJC1eDyb+DiqvwIuwvQ70+93mB1SRzXHwjzIQTBcHFnbuE7forjOeG9TILTGXCgNlcP
	 cpk24NF7QrnxT58homvr/rcYHs3E9DtKS/oysu3cuVzvWehLYRND0ZfYFmPY0snUI7RWE
	 hEsXeSqc862RlC9ev+adsWWgFKBHU6bokLli0vU7d1a4qyl/UV6OHbIHL+jOKpb+0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBVtnr4o;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595F606A8B1
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 12:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9595F606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBVtnr4o
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso21195515e9.3
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919212; x=1795524012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=qBVtnr4oIyGnxY4wd+pCePX3ePcub4Ro/mdbc23VoJkjci0V0QbsA54PabCYenYJJO
         okxKvIKW8m0CcyTt0Xd1Pns4Jp7RS7S/2PGNTkO6btEh1MZ/Ugtqjx1SfGQw0MFlGzsJ
         uDeIH//39Xqv3rMgL+FuXOfwu4uu+6C9QfFN/mUREhqJNLjDquwaP9ODDHOolh0fKzvS
         dDP/TAiRirR0R7REASOe+/XLU871GuEFpgE1Hcyal1xyx3I2w98bI35eBNoltLDwquhf
         E2gWQdMSNnNXdnky/8paD3zno3vBqOVDH99jPcWkjpPrPemUKgkmhWYv9DuEkpDJRKjT
         Ua0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919212; x=1795524012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=qeGaLjxtxphCDte9KjrittOF7/tAHsjFJ2eSC5l7nqCzVHx7N7FvI4FgKRXRAyj+Xk
         IJ2uZnlSgmH/DzHRpFLl9HrLuDcVJBvpTcQn2PWE1uF2z7HN6n1uoeAW8EP8NiVnMFtw
         f8JJfVzNlRboQeZTxQRDWENFhXeni/Di8f29pCkdrtHv9qxms8DbOUV9ST8NA7JKFwXP
         xmq/NEdh9UXTlQnkrWoTObcl1wtfs3e3P+CrcxhkckZpD0jzsudsxRQ6ylNY2yO0bYWY
         nNc/VXIYkLR72ToR/jNS9GBhc2uci0a01pJr+xHwTwAubXhjuR+WN4kex1VZZ8uIu3lN
         /iNg==
X-Forwarded-Encrypted: i=1; AL+hErFSCTANZEEvQY+Mu8rrMjF8HQNkCDvP4wm94TyCLtzHaiTD0fes3+UzPkTdVgJZ9bwMX5n4@lists.linux.dev
X-Gm-Message-State: APuU4Z+Nu3HcIYedDNCgmBbe316KvSP5V+ewzsgPnZul5EAUJkYIYqr1
	6LaQqAz/Y+1k0d2ME8sVgGqc+Efq/WHSdSDbhW0kSPelU8fJNpz4wPRF
X-Gm-Gg: AYBFou2cM4Jpfpe1y8TMXbhg/oPgUQVUdm9KV1wv2G3t8kxxQjNRydKFJM7K8JikpF5
	xWj0uTMYQLOasHZPHU7+Um4daE2DFHWkgIflmgYeykimhyMQfM2TBhygESWyH5bpV1XS6ZeVy20
	dZvoNJpNTbBGY3r7O+F8Zz7qSsd+PqjrrHg5NuWByi+aq+6gfdacZi1oFW5BdCLHe0ixaVxPI8R
	HYdKBezF7voZOKo9qWnMBu0nqcstdowHArMT2u3OrV8kCKpcjzz/WJaZx+FWHiL18Bp6RMuljfc
	ttu2jE4QqKIWAAuvuaa8LL79hM6TD88NYhplV0eX5NcWiiAnXqvowysYl61YKJzuFUIgZANFrhe
	BMtYlqP6/MC/FfpjeOOPX14yKxru+AQWAF13J77SEK4lBtdVPk0pPH5/Yff+cAO+6NouQp7Dktg
	Qc4VxYRB31vmBTNIQKL1X/iRQ4ReR6wXBHl9wsBd+zJ1Yk7ZjJSTa9mwXx4swHrppdt1qn5n7J7
	Gw4hwnHhPjTbQd8dYIZal6h69G4p+zArtEKHeMZoFt65T9V/+78vBAPEyHgBicqVe7f2soWW0mx
	nUlTQcZuW6tEz4G/KTzAZEbInXiNi9iTp+cAkofDRXi5VxIgfDITD0PrDH6BsBcsvNEhTJtAiL+
	Ywj3AHiMUccORnAjtgDXaQMAo5n3wqD0Xbh41SLqUVlJr9jYyrfV9QYA=
X-Received: by 2002:a05:600c:4f07:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb6a5a7a48mr183926425e9.20.1794919212027;
        Tue, 17 Nov 2026 04:40:12 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:11 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v22 02/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue, 17 Nov 2026 13:39:42 +0100
Message-ID: <20261117123956.11981-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d9d0ace2042e..f482dc608810 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -63,6 +63,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -633,7 +638,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1788,7 +1793,7 @@ static int phylink_create_sfp_cage_port(struct phylink *pl)
 	port->is_mii = true;
 	port->active = true;
 
-	phy_interface_and(port->interfaces, pl->config->supported_interfaces,
+	phy_interface_and(port->interfaces, pl->supported_interfaces,
 			  phylink_sfp_interfaces);
 	phy_port_update_supported(port);
 
@@ -2091,6 +2096,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2218,7 +2226,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3037,12 +3045,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3921,14 +3929,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4166,7 +4174,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0

