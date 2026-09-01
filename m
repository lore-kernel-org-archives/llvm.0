Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523A2DEA74
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251420; cv=none; b=eZU4Upmrvweg17+cmu01ilmtBQqpFS37rrYxljssCS+veyUkffaqC0XEsemr7huPkrq0cd/n0XLIsXWQu2bzaWkG5qKcmXUcY7t0CL/X6/EHOZjv2E30zEMHq2SL/jWIWH2iR6VaVNisl/w1kvctG4F+pzhbM5Jj5/laxC+cupQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251420; c=relaxed/simple;
	bh=WmcKxR366QifZfmN82COzbRyA6rgiThjX8rzkh1EBYU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8Mh2PqZZmXOQ6hmUhiAMvPklFi21rbsbq2n9daD3RqVbLOw5w6PzCY5GzwWAaShFub8TSzBxF2FobPtwMJ5sBHxEVHFfY5YSbJGjMTlE1P1p3boYVFLZXNjqbV74iw6e+8IFeZa1V2boz2MAsqxOwH8Y2Y6MfQfNJaq4iNLw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYIgiqyO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYIgiqyO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso4539485e9.2
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251417; x=1788856217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YyxU6GfAU2OYJBof45H0mHXE5/R7CERzacXu0RY4THE=;
        b=OYIgiqyO1E7HSpxthZUBwwS5Z0YOjkW+JOJOQtJp1Du/S/QiCr63Xjou4+OKULNGjX
         9J1tK44Tlgxz/B8A+Shr0aVb0/1QFX4cj+wwZ+QTg6/MKkRW9gfbh/14GBhDHWMdGsLX
         M2x7hnSTq6Zo94Au0eds4cX8DiNuSWex9SNpDVVFL5iBaOiqwIKQ9agKaAmD7zuv09tH
         SnJGANjhnmzI8DzZdD+a3YV5JkRxYGD7NSxZbBdtTDoZZV0ffcAXld6BanzpmrkEOhhe
         Tugw/juB5Tn8Eo7Bb5yo1B4Y7DJGoXS2Kh1xT+hCUBClAuI6BJHqSu218t9dsjT/PmNm
         gj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251417; x=1788856217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YyxU6GfAU2OYJBof45H0mHXE5/R7CERzacXu0RY4THE=;
        b=QJxd1p5QYGD5cQO+1xgjUmdKZ7XHy/XWkkHbDsUKsy3Z5ILkHjOPgJIsfv3G7f06j7
         +LyC0rUJ3O2N9Uq899pZVZBsvpDrHTiBefXYckJbMWrWSeILum6RxEvWjE2kRDbCoGUy
         15jOV83VR4pnHbY7sXfr9wHWVJSRkrSD7Hyr7UI8+HdZY9HEajGJxfGMmC5SJaQ5v8nt
         ZBy3q+DTmIvl9BEtwssjhQed3kRwhBk9gV4cRpoY44f8QByGKcmDgZk2QkfhfdZSJe3S
         gWsPoSZJPXKDKlRcB3MXvkKIWZiHHHJyZuvniEjx7juqYgIqBgZS0wDMuSd4G42kClg9
         3RFA==
X-Forwarded-Encrypted: i=1; AHgh+RqzlONmpazyoz8vDGMcQdNNmaCwfBE0Mvs+ZxZiYsv0QCcZevoLac7OhYuwlig5hzwTMCDm@lists.linux.dev
X-Gm-Message-State: AFuF++l6sbWWTGmhvpALo98lxIp5ZRyFWP6K8Jk8Mwyg8/rOxfyx6kVx
	mX7wEDmkhDVWhcalusiervb7cjE4BeYUx9+R8okhAxfMzHELfinv+2g1
X-Gm-Gg: AR+sD13E5Hf7DGVcU5zhbvEiLKcaMt5xAIseQm2nelrTfJDirt3fWOfR5SClWUeEwXM
	E9+nWOi4lKQxOQf+XH1XAmcZ5GU38VvKKKKxonv18La+Pzzrnf3rWwzgiHz+ye/ydIV5MvrlpJG
	iWEm32CeivFj926uRVxvBFBudr9wx2l/RZYooTIx4MFVetAiRS15AWUO6eBqw2eAJlPjSTQIcnZ
	7gPZ4dYp3xfNvYLdMCVE7Gjv2BfbaNTBcAgSLELP2QIt1F7jgB8yE5pWPq5VcdYKhLbtKBDRu+K
	mPLKEkPf6xPToYa5fX9vCYhp6CGtJT7OFq72qNEEBSxycYnmoIdgDVIa1v/t0gcPJoP9a+htqdZ
	GBJxvpAyZ13DN512AdbMPxK8ZwZySEcBShrcxI16stHeg6G1URvmasqMbOZY1Se2WLptLnz1sSA
	ce98b2us6/n5kEVejwKXBTqzAP/8Ctzds10VfM/fCDPFB1uq25csJ/hf+HqHs0XdhMs7mAIOrj6
	W/pJUA/1ryDuboWmcY9jZiEQ1K39SV/Wu6GWcAseQsphBX5wYxA
X-Received: by 2002:a05:600c:4592:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49b91c290c1mr378787125e9.7.1788251416552;
        Tue, 01 Sep 2026 01:30:16 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:16 -0700 (PDT)
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
Subject: [PATCH net-next v15 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  1 Sep 2026 10:29:16 +0200
Message-ID: <20260901083001.8044-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
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
index 3ec3bb439109..7f7a7328124f 100644
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
@@ -1904,6 +1909,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2025,7 +2033,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2825,12 +2833,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3758,14 +3766,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3936,7 +3944,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0

