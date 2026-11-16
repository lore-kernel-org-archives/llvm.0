Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846868;
	b=OtUQQLYCJtNJ+67RydpSQbXTDTdCVt0r0qDagylurVcmgH2/TWNriZcLxdg7x7e0I4Gh
	 6f53bzyLoFsPEsAdmYm2GNSaAbkTKYTC23iJskZ7Bp05X4yXRirQmOl0Auf8HnE6x0gA+
	 OfWDz47qMpejeYPLGqESAnYWFJCElfak/qe+1Io67uIuy3C4GoAKe46cICqX2+d5Bz3i4
	 1twzmIPMEt/5HZHaUxWTdeWvkS/Q1vdkzoAAOFZI3xw32f+MO4rjIvl/N7TMLTVdgQyF0
	 2nYWIM0qH7p3WTphcB/E6Kxwpm03rDHNZR09q1p71kUZAmqAYsX4vWhnYhdF9oBr62Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
	b=rVBsHsk7qjibke9EJisEY1JFtGRcugbnR3TXHsJHuQqKeSAU+/WSbchzw6XCpxgD5KFV
	 mrvbjYSlp9nIMzDVxIMdMyyvZlxRpoSHxjvQW9QLgiHBP+lZ+/ZUg2cYjC8Kuol9xy6m6
	 U2fgkezrA5781c+HH1ruK2mAG9bmSsLaoh+a6/HewqhmPdPEjvVgZ6yY0dCWsaIleOypK
	 aEDLB+FFj7TS8ESaehdhULcUWB5Dmz0Ax5S7uZNyIWvvRS5bv9h9j8l1VumxIMs9+3aLg
	 +OU5BYnFY9Nj/MZv1U0YGefSHiGh9Q30PH8giKn5mqAIrkd1VVVeGyjUu+iuuiy9/nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4jjmzhU;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB1606A332
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93EB1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4jjmzhU
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491846221ffso3365346f8f.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 08:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846866; x=1795451666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=H4jjmzhUAfdMy00ff+MA3MSW9qrsJT7o7MakSm6svcGP173g/nQhj1+vaJNaqK0EI1
         KM0o2JQ5yylCSuvUlyseNiBmEADg/mCXSOCeeEArdyB3yT8hlzs+NXGdwyVRo5bNmLgq
         32L1AqnVUuPT+9c54mOFyul+lOp7FPD2Ixp+Rif1zX5+YMYwQvhCv3WdXgbmxhPXu25z
         tHmnUDlqN1MLazLex6O89OUf/wEBDPV0EbiQoesDHBW9lRfRliw4pwsCEos7bxLIpBs2
         ABt/7HWYzL2DwkfS2L6+Z77Z8mTGoPw1kGM53Y6gdFmvCSmKqY+azYi0L4wwB0Yf0e7+
         56WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846866; x=1795451666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=Dfq3gAJ2jXQrJlKM1Z0jI0MdqyUsd5Q9Xw3Yjvlj1ppkPrC7RBBj67NC9BxmFUMBSu
         2dwKNm+MhK7xdFpEIZzlrHmmy8X1RS6tNba4otXnND/zmytYx4hhN2FHcXCqFalw+Eop
         lkGN6HHlpIe/Iegs4ahvFNpgFZDvhGhQeR5V91SvzA6imTWxjn2sbyRhOBnUCqznJqFL
         Y6zYSmIH4an1NdgWHDkFKHRjPjDU8ODl8A/DQogFDHHpifJKZx0i+8/oepycxX0m7bwy
         XyJ6i7JbOSkyopcRhXsQfGMTfLyeTQgXZbYbUcZ//EVzcKiIkaMwogapDGFBT5GmVtrG
         8CSg==
X-Forwarded-Encrypted: i=1; AL+hErFec8YHAZpvKaSLgWoBmlqW/itNRHUlzHQ88VW8zH8kuLrVx3SSXWHCTQZnN+aDnN9yWdQu@lists.linux.dev
X-Gm-Message-State: APuU4Z+eKhfW+rCWFJ6S2nvGsLodFd2YIApyx/SGA9QJFsFoU/KlGDT1
	RMrShkEbhUvA9JOE2vdLte8TIYZlqonnwmKBQMLLcp/naoJ8mI8xlFSq
X-Gm-Gg: AZFdTZc66TzOaqunDJM0gRFIwCxwZAF/FDUlKipF0TUz+CtG5KlQAIX82EqOfcmFzpc
	MaSnJDxljTYx1t6SRtG8JUWW7Fji87K0wRaRHrHiZhEyXo1RJx9b52q95YggSbNoCR5P7E/Fxpu
	fAMN9zZAn4BCt5CvC96uo7St23GDAq/T2zLeHFu6gtqbZKo7rUtZLJjLoOliOoe5rm8GC3N2vg+
	p2Jhv/dUytyUa0k51Jkj1+B/L6M8rLFQX8a0bBJGqBcD4v7Au1tEOOoAwSVNOcgNs+KKBBPNhQU
	sqgGCnzo5Se4QT3ikk/UPHwyo4WsnTGaAPLISnqVfFHtJhrp2P2R36pVF2fdjMDU80W0WUyQMbn
	mgtm8BMi2TXmjitHzz1ZMnA2rvnohZsn/UF5TLOLAHaJYXgfXwqRimHMCvoC8lW/p4ZNx8F21zf
	uAnGeR2W8uQlGjQuNS6584Tm4qS0NO6ZX5OfgYhulu7bznaQKmZR2Is8NX3jCYpdaMsXHTvlOYS
	D1W/FSYl8jjb5QUuWSQ81KjJaE0n8CEmA8eAKKxWnMm5/eCgHk9NdTsJHaFMOaEmrOJpJJXatzA
	74WJ2skTNtdCzLuUi2bW2t7rmhxiKSMUq0KSRRbLcRyj3eayapHl3aZRCBjudXv5JAqd25p+zi8
	ym/soJaGpOMv0X+L2+b+J3Lh4+h+zzDO3+w==
X-Received: by 2002:a05:6000:46db:b0:492:9630:6a7f with SMTP id ffacd0b85a97d-49c73350ba7mr14457094f8f.55.1794846865873;
        Mon, 16 Nov 2026 08:34:25 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:24 -0800 (PST)
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
Subject: [PATCH net-next v21 02/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Mon, 16 Nov 2026 17:33:45 +0100
Message-ID: <20261116163412.551438-3-ansuelsmth@gmail.com>
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

