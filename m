Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529950;
	b=e+U6XmrgKLlAEmsGKQhOB5xWA18e3GBMU9yHTMIT+trI+0hzRQ/QXr1mIv4p03CnUGHl
	 XwzaZtJIpjTG5mddboYaA4iSGG+fYgaWo/SnPllQ4PAxJRxVzQ6oJLODzfHtetnt2A8yH
	 +S2WGWSZ64W1BeP1F64OLjTNoPZ+4FCWsL/YzlgQogxCL0baYr3cp4T/EmNM97PMVBQHd
	 qQSTS8+Q0P8E+AXuYGVsXT0Ge9DWvoqL5EX1nyWWRr4L7AdxClXCtdmrC0IewnMb1udcX
	 /HgkEt4yrpp5IILiKKFZQ1tRBf9jx+gcXQC3ylbFVoQc0IZVfwwYx3pfevBX74Hy5Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
	b=ay7KAiiWKoSWKWWjA/uKlG9baAFH8GTiAvTBqZztl0J88iJrCLEn/9XbLtYpfYbVfW92
	 yMmQzo0LFGD5vSvytr2Q1Ns1vE4BPSehCjPHQUry29E14iNFSMkcYa5dhvrrWZEF1ZXjH
	 pdmEFtGsnYx5D4BdZrZdTMqF2atnrp76Q8JqZ8InBDG9C6VFl3imQA83mw67nU/CV8Cfk
	 d5gEUuvrMZ3YJpsym91mCOayeiiI9cCAL1z0wwW9ufKZgBU5L0m1ir/4pHQrqNPp2m91C
	 zbsZjy+IJuH2JXiBKrLfvEUH70Ll4nwzI+p3D1Qz0d1zvg1a5xs010RFFD/LBIa1jbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFpVKB78;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EB6606A88C
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3EB6606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFpVKB78
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4919a880834so157368f8f.0
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 16:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529948; x=1795134748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=tFpVKB78W6f0/orMQC25AGNqOQR+RGwjeu4JeXCLHjFVJjFtYieLkatghAYNHawMhn
         upHFrsPLojb9HLscINImo789KsLkv+0+Y2alf0bbpZEdEQconW8VYvoqqnNbvHaxdhU9
         rhikeiW6jNnMZLT3OlGzy+jiY3HNfUQ3X8E4uxx3NutSMZSoMLje+GlGrgr/V6YqScz/
         PQnqll9OTGiO4sP6u8dJsiVREJXMuPfwzm0hFUA1+3EJ+8q4GEG6tl8GDX5BXMKpA32T
         vmS/UsKjuqlDiZzm663aqc6m7MIPQfTbLVOSEWakE5D82FYYRSYvFA5dQgu7BCISpaXy
         ltNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529948; x=1795134748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=YR3WEd7S0cNiJdDXwxEI/DCpoUnvhgFtG4kjmATrf3v62mWIUVW6b+1Sz2j1Tx63wh
         KkOxIzL60OllH5DRz6x34jHaEARo69Mv6Cx5JhYA0dxHEwn6HuavTkdSOc8isKu9MeJt
         8aGlaFwZnSoOigQKGPy7F/sDGIgP5mICcCE7HpUXU4LWyZXuyAXqzEOXfhT/dtdDbGlW
         97NeZPeTlzgQL9PPg3x4UuIIK+LGsuvR0Idw2RCvntz0aN5euxLUnaOI3Zp2ziLUcg7X
         bgesljkzDMDthmu6U+X0DF31VWMqE9ezmnkAOjHLpUhD0HuNTaNMFjNG9jOHcksWfAx3
         EL8A==
X-Forwarded-Encrypted: i=1; AL+hErHe4sV0WTom6lcBtU03btY+8Mp2KEdga3AqtNPHH4DwaQjJuQDzdMzssil/OiybPz0OwgVP@lists.linux.dev
X-Gm-Message-State: APuU4Z9zMH1OXubUaGDet1Dy8AQJdBLl62HwY21fzWb0o45ZGLLn/TaR
	KozrzNAo7aNmjHjfi5f3CY1udfwYu6TxkfKytPXoL5LUpnN4rjh3xtlN
X-Gm-Gg: AYBFou0yI5FWP9fNJJRXf1WzdKdXN/jt/Tqp/kOimsfsCK0+JhjtHlVZhtBJNEe2qkq
	QyRDIRdTZxtOk4ksZDjZJMyKItwz+UEp83ubwiYnnpygURhO8Z94zC3bpCBVe+UKQWHqlWquQdd
	lXX0AwJMS0fcrTHFMRuyABc5Wznk5G/chxyJDl5DCoTrenDIBs27ZM995YJRYFW8dCR/C7eQg60
	LoSYIzcccajbGVblUkGpG89/196tCbopLEiQJVSLpVXXdtDYBK40SUjjk2Eao41LIWzrqZ9gIOH
	0E+KWb5SYFxG93Q6BhPJJ9zluWKF9uKMuqawwDY5s4y8goSca4h08ILnkyvInDn0AKBAro133KZ
	TAicbeNIhF6F8ZBp3VLyZKQKivmq5htaGI6nkwgaq4Piq1Zjt21BOIP9YahMFY34Iwdif7fpvax
	qmd9cVwQtQGJrxONcG36QgJH0Fyh0Besgy5ozyd2jgIVcLsA/MVmYH2VMmgiPK+JTMY17xPH6eG
	8YqGgfkSJ+LgA+Lh4mvB7kGWKkE5ihfLhQ0aRcuGi/VuIcgHIif5gs0LEAPuj2IwEE7GFBgNBkO
	K90kn+SXJ1Cv68KqIQgry+P58D9lw7EzZts78eR9GaUeIR93I1brLX/xwXonJhq0BzQSM0WxoOH
	5IrUXooa1wULxn5z8iPKuZxl7d5FyvE75jyiYLv6GcrkRQ2IniOdTSA==
X-Received: by 2002:a05:6000:46ca:b0:493:bd29:a6e3 with SMTP id ffacd0b85a97d-49c70ed913cmr1444486f8f.15.1794529948033;
        Thu, 12 Nov 2026 16:32:28 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:27 -0800 (PST)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 01/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri, 13 Nov 2026 01:31:51 +0100
Message-ID: <20261113003217.197757-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..5d649903be9e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -62,6 +62,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -632,7 +637,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -2090,6 +2095,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2212,7 +2220,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3026,12 +3034,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3910,14 +3918,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4155,7 +4163,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0

