Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ED83F44D3
	for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407100; cv=none; b=LH50FgxMW7pBxhXGuH6OAS0n3mns4lG8ccxbAx7LDbqktKgPoGuNjjfEi2zYbgQkOcW4jdRlQBIA0O/Es8V70UOkN6JfRT7eTjOigxpzenbDJy3ZP3WLki9BuYZR7zvuL2xwZdz4m09+Nk/re6xoK6B16rg6Z0ybCTHWKnL5+mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407100; c=relaxed/simple;
	bh=Tm0ks2ZDBUMx/7SgUJfcoeK8CYDsKMgrwe2H5z2O8Gs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2+hUHcHufUJPqTn/EC8ZPby1sHBDM40wQV1LwShdZTt1VHv13hFwQvZdcouc5EFsANiimey2Xu4tRWyRdD5+gLe+wm2F3CdLMTZv6tM5xunDhzn3T8qZoUl+1U5jP0aHRqdOpRCwN1TX1g5CrkAJX7DHAPNfkpa8NrMVvPeUsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6dwER+N; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6dwER+N"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954aff6088so17961405e9.3
        for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407097; x=1786011897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gzxG+LmD3OJBziXxFrZNUzc+hlymbEKWiIuouLUjQy0=;
        b=G6dwER+Nn8DQ/6ivHJx8t9xB+CuhR+e6Lml37t7KH5W14hGPMNmzP/t1oitXgV7wWZ
         F7aqrctDNH+k7msz7Y3NHRO6fCbc144/90SBaIdgOr4f3/ehQCsZDlD6ZVtSRpwDzj4R
         U9GTbM9k7clySY7I9scUHtSiFRprm2kbQLZdqGIr5oQ58Bz9oCq7AtWz6usPt6A3A/XR
         x8kINFSVgWGMEaVZiuvPKxawbhl7k5P5Kos/RaaPNSkY5++HymXmXO64XDzwSRcCDaCJ
         9CksPTJl/9or477Ng5ODYoFHcbZjjWZzpYiQ66WiYeMMaPU4+DA21On9dQaEJLV2gOgY
         DJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407097; x=1786011897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gzxG+LmD3OJBziXxFrZNUzc+hlymbEKWiIuouLUjQy0=;
        b=hSKRbp0GJkZQQb7G4L/yDU4YxAO+T67sH4Fooz+Cpd6xfomaXXsNfhR/7Yq2dLnWZf
         06tBiwPpqFuLZaTstGfqbahmSjFWpSM7urAKUIrWpb6SKLewvbBPc5xudIYIvCZZ3RXZ
         HiSrfBz0ffd+h/TCp3ZnO2vvLFoJ9FOffxIe66aUhOZ7+Q3s+T8ORIxEt16TMFU0cKcj
         X/Sa72hjb2KsImmWS7IluV9r2f2gOqJ3MEtTjuyeO0gvQTcQkkbX6NVP7abrqW39Co2Q
         ctorNFbu2RzuM51ITkaLirK2my4ISo0LdCbdVlaf123xL+3/BDhaoLLpCJugutVfV7rh
         6JnQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1aHQAtmCBc/JDS9wDDiJQ3WYmQtJ7YvoF+50euRlVhnRh9rI8gPyIOENHNg0UF4XdcrXJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzXmSZc+gYDPfGHSsShDZ5DgQfKa27OSNtTe5vbVJy/6zMUZ2Jf
	M765QGZPBbg4AoERpuhR8d6aNjlnS51ksJznfVjPOH2+OMJXiUD8ZUIX
X-Gm-Gg: AR+sD13BppF+SpKGm1jGBYlItNkF/3Oewmxuae10PQ2A6nbQtumTGM+WAtO7RFZlmI+
	aULgASuiyddSEk7W0cffJg6UZiYDKEKZL83lFFwuL9A/Tffe6x3DYBVLwfsQ2K8C+xn12IhMCwN
	piZZwVNy2HjiLLIwvhdMBL7Qeq+3Oq1UX+vlPAc3kwFaplu9LvW5j8HnZK/PvOl3JkEe/7mRx3a
	9cK+bBzoCrpcqrVG9fsMptUG970Z5d8VHFU18FVYR9Dfz/MRY26F4OlN5K8DEhIgMbVquL4fEkI
	n1iw30VQL3vmVrb19RIpaSGY5YR+NMxYrJEt+3US/4n6uZWK7kBxJL4lMVgv5WAJAT7M6D5MLXd
	FrATxG4wx4uG8X1ac5wSoiJXjXPL47ENRY/iofJ8DNejNwf84iy7RplizwdlM8g0v1Nf+6LyaBS
	1mz/JoXwhbrs9MfLBWLRvcwg0kEPEIYV65dPLjjGL7k115GeShdyvRlWAs2fL/+Y4yHW+UkUs/L
	Of7JDu3uRKhuq9bMPFEeTSxsH2YkG+8iU2cEz1IuGScvqQQ7lg2Y80=
X-Received: by 2002:a05:600c:6298:b0:495:64c7:804f with SMTP id 5b1f17b1804b1-49800ea1ea9mr27095295e9.23.1785407096531;
        Thu, 30 Jul 2026 03:24:56 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:24:56 -0700 (PDT)
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
Subject: [PATCH net-next v10 01/11] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Thu, 30 Jul 2026 12:24:12 +0200
Message-ID: <20260730102444.1967900-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 59dfe35afa54..3464e3ec5699 100644
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
@@ -1867,6 +1872,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2025,7 +2033,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2827,12 +2835,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3760,14 +3768,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3938,7 +3946,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0

