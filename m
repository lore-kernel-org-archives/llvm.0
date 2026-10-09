Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4FF4F4D1A
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570536; cv=none; b=SqF8zRPp+RGOQXHNLD+M+CUaUEi1hLmdO2PXezwHCrC31yo3NXlx0FEP22azrvQsvKC9Juv+M9L8XrbrrNSoFDP7GtFoYrmvaevTr6Ds0LWd2zMgxpRNf1IUnq0/ehjQUHT92JoLSv0eGrorQhpZn3uyr4+ad45h47aomCb1D6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570536; c=relaxed/simple;
	bh=Qk4gUjoSQ+NjYnI3ptfu96ovUTocgK6Wl7UebfYEMJQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dumBSD5Dbcl39Di+2JqYmVvB6046uHeB8zKFY5U0ZD1r5oHbvpsndaFSmVNLlSbxnvBR1qb0VNqG8sTHwyOWVpdikF5SRttrA/t0wicCtQ3M6yj1IclxTxyrO9tSunCJ1ghQayVIMlpu+gnV7JghbKugQSk8GsABgKQCph91JDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POMQTUP3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POMQTUP3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1923f15afso1275125e9.3
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 11:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570532; x=1792175332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=POMQTUP3MOuA/euww++B+P+qV+ylXJoRWGXqnYwE6QiD706YkHfWMhPxQn7e+iTPrU
         xYQBgKtwLK4jmUjXbYDRtb3xzTHD9hRvO7in21bCqD6RZsfbgmvOjJHtUUambQaoxG/B
         jGiyv/4hLxAs9uC3JoPOy71M3XBMN4rzogXWuV30P2TQHIKnC1sGa4a4vF/vqPlrDWHO
         n4fPOcX6RBBd0a9115iYfpSoZRAIEnSa0GGzAQXX/5D66CC7ZvdDAwoFPZQm0jtdvd45
         BjhW4u0MVX8aK3eum+PZj5/u0YwFnVW8/QPkKr7iygvzW9D5sLPb3uhfBEkdqvMRdFfq
         dCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570532; x=1792175332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=CoH0PTwxitzNWZ8bWTuehtQbOO6/Cecj4rZuV9qepQI+3q3+kNVMOX3jCni9xFB3F6
         iIBHF1o7c8eMtbbOKvdKG+XskSjP5N+xhEl36PoEcbM6vrbDkiTFGwzvxIQctU4PAuRc
         lRJczFDRs+FBCjX8EdlVI3iAti2H7CS/7Xu9IdKd55ETmDqU7OGltNOX8NejGC4iRKHE
         J3XValRL24XPQGiAs4L80uwk1yCPau1tARhLf8dFAAd1qExirtGwOdblMpH1UMFCA/I4
         9aIBiAXwmlS6mMOsGpEpcq57VmmDFfhWZYb3JJoOgdDmSkk12gZCPnK0oE3Qeoqz8BK1
         g24Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTEqqjDLpCtHCe16kcMGOEnkbPUYGgx3oZ25nvpmFy1QyT8DpDUSlPHfoCHc5w3DLuUdyp@lists.linux.dev
X-Gm-Message-State: AFuF++nMvlyYQx+hXluFpjsIHdnN2AZQOPTI46KuifdDCGma4Y6bP7sG
	1UqAQRe0qPCbdGCXq59lbVqsjIqbaO/P5b6N78/FiTxdmUR+K4OOn4iZ
X-Gm-Gg: AYBFou2A9RI4JjptDMxw10tw5gKkBKD0/W72Ry561BekHGhL+YYtfUURzh7BTvVOHLB
	lIWvHJoo7PU9iHBAJpqG5/gUlCxJpGoWEsqFRQ7mpW0sHFiZJwr/pnodZkUORckyv6WDbbUhEZ6
	NWYeJLAutecJrsqdZFaUCcjFtWQv+vcZTPn0HPFA7S22CyhZob5KwTUg1lQmRXyyiSpy9HSSsx/
	YIaCPjX9P76a17ajC8fpQT6L2gC6iGOiOtTFD3nIY6LGvIdsWzDMxhdCFe/ABgkIfM2f7njYEUa
	vvYX++0/HiHVsHUPk4Q+RDKYzZIjhzaq8Q6YLYwXb1t0DACp2OLX4dxxRT99d7fzD2/wnQ8R6An
	xemQjBSsQINedZo+1GmHSYS1/iHaR7Lk4pnU+vJLu89pr8BPvfT4GDdgqW9izigvPYfYBOcrSKk
	n6l7q6I4IgNtBkdSHdXhwHHYzkAM2Jzxr2XK8/T3ZncvmF5/i+GXvLG6XjntEDwJLIjl+WKYbIB
	C4ZNcEpA8OAhrvZNZSIU7KsCtOg8MONej2zxF777Iu0x3zmOMC8eOn1OxcKV0Vb9DI5SKEpk2gP
	eb98R/1vGlw4X1G1Sg==
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a18e4f2221mr40285605e9.32.1791570531906;
        Fri, 09 Oct 2026 11:28:51 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:28:50 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri,  9 Oct 2026 20:27:57 +0200
Message-ID: <20261009182836.50631-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
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
index a7d086cdc9b2..a98e62fa4bd2 100644
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
@@ -2961,12 +2969,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3845,14 +3853,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4023,7 +4031,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.55.0

