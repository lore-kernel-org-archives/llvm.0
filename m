Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39693F6C25
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787494; cv=none; b=Lcglzaaxp2X7ujTHYsEhndjM4g3+U5mMQMnKgWw+Z3MOUGC26P0JtY5nTFoDJiR8CXP+FNTZOcgtrZXu2Sre3Z87NwX3qRmEUDJ4EGi42mNJlmitSJok+zxZLUt6/ZQewV6Qau9KroFXyTMiec1n0Lo76bHFQ+jHZS80B3AkKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787494; c=relaxed/simple;
	bh=ZcRVlQJeNRXK2M0MgaksgKzLa1cJRySbcnQ11oZN5aQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9xkxboEIgM8/lcRQWwqSMlyszvWQ5XXegW24xBbHbRWu+h8rcgGV5gdyWhi0MGIPHxS6y12x2MK54Sewj3xfOx1zDdKgAy6q7uBzUg6MYUXPBi+r7MyMlMPGFazDwJAOs7J6BBt+qClSU3KV6VB/DD+HhQhnhbEpML1hnw1m0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCZjtl0/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCZjtl0/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b9318997so6025125e9.2
        for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787491; x=1782392291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=mCZjtl0/uY/dfSp21sAIJCJDFdduew3Br4E3iDBfF43p8Szg/7tXg5YGpL2xBvuupM
         z92A2ogq5YocITTFpg2SQRIW1KI2wQwsWUUinssDN5Rim5/TacV4sDYYglddwyYbWxd1
         AY/VlYx7rwy3cQGh60kRsO78ncVExBBY1qz45hN4o92pvr9kwogzu1L8h+uEZ/r5VsRQ
         99IiSVHfllfk6V/Qu3WrFP+90Vo/qsFlqL6OSAeU5isrhIRWDu3pk6lESr3Qe6GOCLwB
         N8yZaXmnr+mMvjCH2e4gDCJb8eQUPFWi9IlC9ixw2VCLb0Blmy2dHrfQRSKt8h+ar89o
         1x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787491; x=1782392291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=nkXXBjLFSSM3I0gT/Toh7XXeB3qz9g9UgM9CJL2Ozn0Le0RXSJMIkxOmEQANfMgGZ8
         SrwVUX8KP+LelpZRYP/VdKu6TibYGdR7W7zdZEmPaOyDx8cK7VPyvs7ejkDzzIS/Kilf
         y2XmSCc8vulrT+JkkQ2HQU7cJmggdLqrXVs3yywmrX2EszeCZi6WiZXDLncVk4O173ik
         baDEBa/TWj9sJzzzOZgv4zdEfOVTWL+E7cdmgCP9PFoHxP5sWea6VXKGGyCQsmyQG4q3
         6wHBCCblf53E+aFoy/O6XRRHukVjY2cD8z38yGG0XnDoCK3S6rr1ILDrpipY+rXubhMo
         /4Nw==
X-Forwarded-Encrypted: i=1; AFNElJ8EK4FcO0jDIRpAJ6ZphJXrKYVhy2dbW8wKb1BeorraKNhjALKa3owre0evxryY+6zVJOVI@lists.linux.dev
X-Gm-Message-State: AOJu0YwmU0oy6ZUmB+ElvQq4F2MXwXnO6PJIUEwWW+Wy0JDZJOtNNW0p
	0FqUjWt1l2Ggyse6WWWNPUsRB/ays99f+mjGrRJ3J6SIpCdNJkjsuzCa
X-Gm-Gg: AfdE7clB7Ilw439FAH1nYSXjBfSUd+bjzjAJMaEFHnU4txS5ZvQlq+JKIReAPbaOYxw
	ZifZehR2GWdB+UssX0XL0SPw1ggBJI2kOawvPq/R2gwhlPvwEreZSk2G3RzEVV124vJYj+vmO5n
	0TlVhArEGQ/tZjAx8d8jNzLIKX2n1r8WEbuloG96zAq35VJAMk5sW9O+HZ4tsU8cmw/ULK0P2Sl
	Jyx2L3+1kshT7e/u2SEbsZGtXqTLVb/DRkwRGI6iVZyUSETFleMso3OsWtnDnedbeCZ9JCm7kH8
	fx7nOpy44V/t0JFWCPJdn0yANdJ1gHMi9VQhex2YalhpPqGM9sKGQMwOrYPriEbGeVI3kMGfkhC
	P2T54K2564BHIf8YakQc2mII1hAJHEiCKbtllAN7P+Qntjh8Kx9VAUqg0bjg18IKFSX9qlneKt2
	D14OCzuQvYOsH8665JWDp5T9BiveenogsJofiNlZWGVPzPfvyD9RpIBq5nwcc6uw==
X-Received: by 2002:a05:600c:5297:b0:492:3c7e:57aa with SMTP id 5b1f17b1804b1-4923c7e57c1mr12852015e9.0.1781787491038;
        Thu, 18 Jun 2026 05:58:11 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Thu, 18 Jun 2026 14:57:09 +0200
Message-ID: <20260618125752.1223-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
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
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 087ac63f9193..4d59c0dd78db 100644
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
 
@@ -629,7 +634,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1868,6 +1873,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2026,7 +2034,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2828,12 +2836,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3761,14 +3769,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3939,7 +3947,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0

