Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AE548AE2E
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017989; cv=none; b=BM43/9F8U8zDwEmntXfXT0+0XpUpVmzLAfMbvyHaPU522QK63cCxyCZenub4/zaqOGQUmz7mFxh6Dlm+KzFZU4FSgsJFbX2cCuyVikRPjwBd4L+PchhQRUfvxSi0C/WO50OtIVBbLu3mKxNBrF9t2tBhsn4nZw7J0kR8E+fx0oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017989; c=relaxed/simple;
	bh=ZcRVlQJeNRXK2M0MgaksgKzLa1cJRySbcnQ11oZN5aQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kclOwYBkZ0KU3IXjSmwRCVhF/yWcyCjWjzl4eNE2Ba1ap2wEwXSHwA0QTPuHBEO+/pTb5kPGJVbecPrH/wBdSjKtIvsYzG4WQM/ooloK55EYVXfLbwnNBbYlZ1JJKMib4l9SaKzBkiRmqNR1tjfTjA1iHbXCkPQU10z76OvvhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWxLQ8Pq; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWxLQ8Pq"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so8018024a12.1
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017984; x=1781622784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=aWxLQ8PqfqLpBpRzqkaDczXcyMLLGAXcam6fa3YwYAgXQxInSVxDL+2z/bATIkdRRU
         MAV8cfGcUzw9KotVAR2V1HIKk1jwJU7tTboqP9hkOhDdlsboCLryAxhej9LinX7t3raE
         9mkNvddn01Q//b5QuFxLhNpHgFsnViMSeemZzoAQd/qfshJ6ccPRXIV9opmUAnkT74qX
         0dRiZXdarF4j05zMV6Rl2AQrfcT7tSJZoj40diZU0dA9VRy63UXQEnmxQLZ2iJ7A3a5g
         mmJ/ODGLSZK+1cTijqIhcrJPjdg3tC99eXCkr7JgKVO2JA2pjwIk2wEyf6AJi8rgOA6b
         O57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017984; x=1781622784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=VBHf4q/+5B1hWgkA3yy4eOQPq2q5XoXDmS3C9pOZHEoaW+G//H4lSgcdfBxuU4nSuH
         P7oAiWsua5ZnoOgOOAG/Iy9sx8500zp+J9oyXwrObqhEqfHwz4tV/U6ga9+vfENjvMz+
         E/xqcYmdbcyVFu8tJ6aMR8aTE0fRrCAf1G1EEGk3xw8a7KCGew2pXaKK3uGPQALRs+1N
         mNjt0BldhssssCeUtxebCvpv3WSAO8wcDUh0TbXAA5xr/fjI03SfRhijYuSxH0Ozxiqo
         jroLJsiWC0yBlHxGfJ2aiencVKTyb89s7mktQURVzUhXB4cAqnIx+tTo32JngUw17fXG
         jwPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gxJ/pvSGeUNZoaTUINwzJR0qplW6t4VJLvopT2ifpnb56o+gUafnpbPaFwgvwDgckF/mO@lists.linux.dev
X-Gm-Message-State: AOJu0YxB6bCzIRQH5o270pP7j8yyWQyLZAE+REqeb5NnNvYp8fTO25wN
	PXzYjCGvcCZcbmrDAK7Dl17d3+DTfvnOcHKXCrA+nc6UDavObNW+E35P
X-Gm-Gg: Acq92OG4yNiaZ5l1V5sh1fzY4nBsiOn9TJ0q/E07SK7j/iXwICasxzAtXAmmvf3ClEw
	ofUZFdG1+wkO7nzkYQz6tslXg0c5NJgtuD9bI1vaMhjzXntRTopVieflpe/qdtYkImIz7ARAgvg
	rgDK3gjCH06LlkcFFrWr4p8zH8lcd//RpXVajlpbYPcdGajabvyFASqtgewB/zKLrDmMfLQXNPj
	uoDZBhYnYx5FSz+oqTSOP+tpMqO/JSpMqt7mv/ILEi1tjDBzfhb2jfpao8PQUNHm8lWGMidOYSY
	OXwsg3JiA8gi7JbSmqitoLE+XPfR0u/zI4v3uPDlSIfQ4jZo7+RpLOgN9haYHS1P9e7i+UvRbmL
	8xeslK2Aut9flG9C8U8adHCn1e7dH7GUXjr8WF4XyStX7Fm6L4WbVvjDcw66070h1jsGVFxtYUT
	ghtCdzKW9b4kJcSnyYNgiC+7N2URAEdrle06JCmIZPuPg=
X-Received: by 2002:a17:907:78e:b0:bf0:701e:b148 with SMTP id a640c23a62f3a-bf3721590cfmr1063340066b.27.1781017983934;
        Tue, 09 Jun 2026 08:13:03 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:03 -0700 (PDT)
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  9 Jun 2026 17:11:57 +0200
Message-ID: <20260609151212.29469-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
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

