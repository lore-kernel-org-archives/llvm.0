Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A1393DFB
	for <llvm@lists.linux.dev>; Sun,  9 Aug 2026 20:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307493; cv=none; b=KqgmzlH6jqcecr7LxkyFSN/RbeWMpnp3clRjCMfzyaQemvelwMhD6rkI+0R9xfdo2rS8p5+iIrOspluOIEvDXBipkucSUby7sNSrU6lW+IM83MjEKa7sytWOhIIyEdWKd7Lbk9JLAlwaBelExgnWWRaMd0e8YzyQfodR/jCCrlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307493; c=relaxed/simple;
	bh=NH+vbbaxZiG6Y0t+Ae1nwybjPC/wrZUjqEzfT2sfGrs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NiYA+sG4KRSAQp22pc4lkG6ZZwTCfaJaDXAjuwvoa+Wd5IQ6yq1s3jp//FiokmEtSMs3p9hl3r4iunIhOLD68iHFPyITI6prAL2fbTj8YOJo1qInQI8SFEQaiGyDXFhkuvmk8iBUkXJdt52b/vvO39NhJSkXNLPnLYVeOqO0ofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDvkK9P+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDvkK9P+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so7288525e9.3
        for <llvm@lists.linux.dev>; Sun, 09 Aug 2026 13:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307488; x=1786912288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=XDvkK9P+j4PJWAVEYMvNfKTPiXuIXoxrteH4BJACMHgguRK4cVeOzQor3Xm2dMEQTt
         lxZuoiv2mG7XEwulOUSuDNOoAaA+QNg7I2Pi+aqcEM4sLOrJdCjp6LDM1xA6eLXRoFrg
         WgZYEvznfJKRZppx+jx1L1FclNb8mNUsTdSz4GDiidz2vJxT242L0xHDnrRutpfsJ/K/
         SsDPEFCmRwXBAsJ+AC+ynu/nDXuQwH3X7j3c8OhVNtj5Ua+TeLus82uqr/oFTYNQgmLg
         jt/hqJla4FFj6K5mVSxzAjW9q7tAEjqDHxq8vvCSZFjbAl2NjF+atNRXl6uynVaIIXN2
         Hoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307488; x=1786912288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=ci+u08zB4i3iu1drGTzgsuFGr4Gr+FB5efzDpWu7MOtSpsZXwg38C7+tmue91nh/wo
         7TlCuvWiyiOxPX9sMuqDxjTSrWrFl7pJwmxWsMFxnMfnKInEHL38L1CRoOjmDvFMajlU
         y+8KT2t1dBR99NjB2WeItkig5aJ8A641uBouiMPWePU89kJHb6yfHqINmfk8CP+8TONk
         7Bi8ViRDfcHBgGDCg3xDRLiCHEhN6EHyXR1i32zx+/TBmGeg2x8jHXXJG4Bij2cM6WYV
         HbeFVn8KbaE5FkKgvD1QJ02BU3MdHFbBqHTzgSOpDSJPjFynPTewVtR33m2/sEseXeYx
         jWcw==
X-Forwarded-Encrypted: i=1; AHgh+RoNqD/+YY5yN3ozbKwSyDNQgo39f7oUVLF+/xSPVSGNxrOuTkcHnnE6jyvt0C7biCWvQQvz@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcd4CKEbS7jep3JLv4m6rrr6KEytpc/VhUS9SxeJwtYPziD1dE
	e9vx8b5O+umdgGIQysL2RGkLRK0GlZmbrYQzg1YQUJnuMJMibV9f+Vhj
X-Gm-Gg: AR+sD11BiN3I6V+LsjFfVGQDmv3zArLdBXZXSRaNDC6nKGGHM4YoxKXMscmkNxcSLYr
	AhDErRpOgv9Wq2gscs8oMm/qlUEc9/VgXVufSFBTk9H+yBsQ6dTmGhnj9aov98YF/F79B+TAX8M
	VpKvX8EsdxtUDrehJHwzSIZQhjGDWBCjwAX7kBacebw7QIpujmMzeNhz0zwYCVxry1R8MUKhQqV
	l1rH6C5adrtV8A7AKF9fMmt3rgY/Nc/TwhtTmPj9fsohWwdUdXZE6IY+4Se71OsRaxCxvwYpaKm
	K26ZkbBdwZKWjH0vQmkWInJT99XHItmz3GPqCzCtSBGhg3mvt4cwEUZDqd78xV0wSgLhw4dgexa
	iS3DV0T+/rTx/9TT6ptRQWNIuKlou1+ddfKQvQ7nYcpetSuiJu2W8SX/eM0TniBabjDaJGDUYfl
	3b2XgsO7jFHk4CMMrjyjGo4yUdL0YbelV/EHGgKh/uNzRriHbXU9VsxN8nr4Vgtn3faOk0JL4zq
	LtXNygW257H5rrozoOT7FerxadOwwQXxuWWt5xzwUslGUg/
X-Received: by 2002:a05:600c:1d23:b0:499:51b8:d649 with SMTP id 5b1f17b1804b1-49951b8d652mr428256435e9.3.1786307488474;
        Sun, 09 Aug 2026 13:31:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:28 -0700 (PDT)
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
Subject: [PATCH net-next v12 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Sun,  9 Aug 2026 22:30:58 +0200
Message-ID: <20260809203116.640271-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
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
index b241768edbcb..b7180ae76cc8 100644
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
@@ -1878,6 +1883,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 		goto free_pl;
 	}
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
 			       pl->config->lpi_capabilities &&
@@ -2024,7 +2032,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2824,12 +2832,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3757,14 +3765,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3935,7 +3943,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0

