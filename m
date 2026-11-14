Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653077;
	b=4yM3bd/jNX1Mzbt3IAUJdet2Nt2BQlEFqVHAUjFbbfjrr+yvLY0utQVOVZk9i8a93kjp
	 SY4c9Hj7+HHeLk0qP5GwiT7R+YpA96lebT5na2AS1qdIG3qKgF7NeBh0PmqUW2ykgskBx
	 7NjZwRfYcBFQH4NOUcEoa1CfxYBf3kT4JkB1TeHLDf+Ll+P0rnVxecTncRCuEp8ROh8Q0
	 mqbCG3TrCf5rseDUmn4vx4Qq0SOpNnSiJy+/Wm6Lq4xT1aiFAi4+Y6t0EGJfoGiRayEOk
	 LF7Are58A/mRrb+hOE9BNZLuJ9HLaY0j9kGzu/mWZJFRPqy232nSoVawK3uocvAGYGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
	b=xtyDjy95O5MULiJuZV2BIH1M2iljmgOQV9IU47715aUHeo5lAq83NrHjbMchWyPSi+TF
	 6Dyrj9l7qVXHeyfp1y5J1oxOuiTX4hNCB1Kyt2Q9oR8zh27xCzelg5bJxR7QuxomioY3r
	 kJj5yFVk0pXAn61DsXGpmeZdvYx4qCe0G1Wuza6qh8HFSBgNIu5oQrR5j/bpmJRn6p5Gp
	 mHeoObi/itDcw2IJrJ39CgICy77rTW48IHUu/RY+40N7kZxe20mRwovVbNqpieNjbihSm
	 zoWkjBS8GG1Qig/5vIN9f8elmI4hkwDmhyoUQ81IQ/CcKZEOWmAoHk4gDfchhivwCFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExQNpi6H;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB2606A88B
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 10:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AB2606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExQNpi6H
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso318785e9.3
        for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 02:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653075; x=1795257875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=ExQNpi6HBAVopivFB+9+RRxDr8t3tw6A93b51yUEYUdlMctXndzaJ99F6gFOtHKs8f
         5e1WUbxu8p+xyyQTJv7S5TfbWxLCxv+aQEIB9dTzKlq8DpTJzksx/KqFTDjGhpcwoVYc
         c/Izb3gTQlPCUKv+BGuRxF3oCkI+Wjp8RvYj/1OmxZ3irDfm1obO5w9gZUZctPjqwPxY
         KZxAj2/xwM+tQSj0LugmF66d2vVwgCZFm6Xi0cLB4Vf2RKSEg5e2G0MjqYiMV0gEbCmT
         4DrZ3A/3sRP7rsY5xkS6G3wxGTARoQ9zWOsotqFCVkIBpUFSWMM7ByYv+byxX/LMH4Et
         irxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653075; x=1795257875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=XAawGR1iQvTNN9Mo2FDaDBEgepOcOyXkxKMvImexys1+Lta7gHh0zVPFH598AIdsGE
         sKn29g9sOyfybwgO4pACoPV7NLNDmxLKthgFVJPceXbm6k4yf2WAiC1DEtvV+ZsbMhFM
         MJwk8WzRuORFZSO6Yn2esk9HzmqWu3FZyzL/iKQOX9Vlyvm/uzMlo8GtOYl4MCDPaSnU
         ro+GHk7x/9n6nx8s9MlsZCdXfG79aIMbHzELpwrLzQqo+M1ICaoOhSF+HDs0hGw6z8I/
         MV1M4uQDyrjc2FtGm9tT98LbDz9ezULXSmp9jnkM0uRiGRihOUIstiUHMjeeOZ7rRHkU
         FUbA==
X-Forwarded-Encrypted: i=1; AL+hErEGiw5WFPjite0Y5FSvQMA39+QITZFMi7a0AxLPVpzSNIGnk5YyQ9lGtvCwfR+gm4XlH5qX@lists.linux.dev
X-Gm-Message-State: APuU4Z/hXoaKnVujT++1EqV+TqhZUxgMmAqpJIqbJNx36fGZ3qQnw2PF
	dwjZQ3rnspI3VP6DpNBqbpMYSi2pYdV12piaO30GJ0pbVdQYKk7uMxWj
X-Gm-Gg: AYBFou1xGBeZF1ubwfTwzb+9hJLsfYGKda5Fb+T4KHxrlYWzVxMhx3qXEn1bZuLI/Jn
	0dzWIGKeFZDZCuj2uf4KBqz8ddjyfw2ylUq1UPIMDGu4+10R3gkduP6Fi9XsW5FB6eo4oEjo1yQ
	w2GAIOcnX0LO1B6QKod7U0uIuOOk4SZ2/Mc+d9jnSE2m+PY+xDgYDh7PHw1KBRFIHT337Ux9dth
	Ps+3Sm96ayr9eya9O0zGAtKFNdqodahJ+sONZej1pRErW2SBdDj2EYBhOf2itK3U0LJ02twVef2
	HJ71K5WbD6g/JVHaL8Facxec0jpfhGeUJDcMZq/RMrTxrEKPZ0qz0JPSBuUfCRh2Q8WoTEtuKsy
	aTBNHEOxDc1qOKnksZKCwmYngfm5APHK+ycmcz2LtHHCnXPzgj8eeSZOiIBXOAEXTnaQZady+B9
	C2V1W+KeH1hTI21JFDIwUadHxBY31BCuya3DPRTvYVx4Kjf5hQxbMteAxm4QHTdGLkGXOsYHObt
	PAmWvMMWkyguF6Bi4Fkwcs4OVAxV3EX7PY25Wacfc0ZEQkvWKdPKAOa6erf72Fxc9JEjZjS19bF
	QjQ/gf+LgzjSra6UNs8ZL+BH6ow+fMaLKeBYX0MpRsU+1R8Pd0GYA/VGNpHTZ2p70KGFDV1slB9
	bEx8Id/T4z5Z2RqjQJ8k2Zq95VnxynBAGA3c=
X-Received: by 2002:a05:600c:3495:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb68477c73mr8647025e9.26.1794653074802;
        Sat, 14 Nov 2026 02:44:34 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:34 -0800 (PST)
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
Subject: [PATCH net-next v20 01/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Sat, 14 Nov 2026 11:43:40 +0100
Message-ID: <20261114104426.235620-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

