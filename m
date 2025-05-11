Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE42609F8
	for <llvm@lists.linux.dev>; Sun, 11 May 2025 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746994407; cv=none; b=Gt6H/VRN4wp9Dm0AlFWvNAHBIy1smHH6/VWqKqYFTKglbhxiruUrWMrR9CwTN45EhSnmfWaTmf5n8JJPmFDPDkUyDWZu2EglG2Ong+eEKKJYxyfcdTPmW3CVHbtHBxSi7zBe41AN+ulUlxNHZjuRsZ5suG1BGV617Hm6PLF/RYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746994407; c=relaxed/simple;
	bh=wrmp2LSwPgwNKJnArG8IijGvZzsMq5cRrMXTvwCX/X8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjYkP5+ouL2fzCBj+dzim2o4L8m37iv1MuBzvfaLwEstW4C+TNqZmMH6G4Mkyt2xczSZatibFiwhTM3qHO7BFHhzFq5YgyrtW/yJ+Bpr1/SYlG1+GcVnHFhx/NY6uXp8w8ATjgDbSJVDz1g6CW8KsA6np4Er8hvrUae5GcLs4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vue3ZCJh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vue3ZCJh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440685d6afcso42814325e9.0
        for <llvm@lists.linux.dev>; Sun, 11 May 2025 13:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994404; x=1747599204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orWgUHmQriyeNcYTKTqzfO4CbKpuvQ3L/489i8p8bBQ=;
        b=Vue3ZCJh7wMOtdi0C5ZmP5lHP04xK3UPsiKjTyw6A7v1wNludG7WZSFX30BQQG6Wpv
         woFEzEIGujNi+wjca57UP7c6zgyuX17nk+BlZgN4031230PanIVbH56TRZaKkwYVRQIb
         jAKqBsfEoAvGYI6wPrvyjjZoGy0+Hu0VLAKWSpQwBTRJAyDKqgZeDklKTidoUiD/yzQi
         JvVFBY9UVbRis+V87hW9pEQ1Fp0g7Ofab80GGsBffQY+MSbIwzQSCXe5yx7Ozcs28mtA
         7B/5lA6QnOQXR6VM7nkPyEKQy/PTN0VoepFLG7NJOalDsIDtrj+ujKbdbW4Zuosx7gLY
         VCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994404; x=1747599204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orWgUHmQriyeNcYTKTqzfO4CbKpuvQ3L/489i8p8bBQ=;
        b=tU90MA2HvgbLOdMphRZwH5piKK61qQu9d4EMSwBLUnATJA3JwtvVPfsdfiS9lewIk/
         RCyEXESfIyYujbwFq5ZuvoAPtG0/qz+xHempX1GmUr3/5ON0uMRym4Kp+Ez9QaflTWg6
         U4HTAFZdKQDLmLTL6sUY6jAuzmydTR8IsiIE4YtV7jc6VpDSD/fGMMiZNnNIqTB3aUkm
         me8UCJvdAFw79HGnZyYXx8vs70tD2RugpAbniAmwctiV+dQY3PTv3duRW8YV3xPpEje+
         KSYmM7/u2MlgrxsAz0KA22KrqZg9dCgxBTbKiL+WXbA5n6E0qtZO8fBJIbMab16WqgL7
         YZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCUaKSxKz85Nanw46yX3aO9BqSPF5HYY1pAtc1X5Fswj7XQcBVV/T3M/huBo6IijXgHKXitq@lists.linux.dev
X-Gm-Message-State: AOJu0YzmhSp29ndINOxoHTtTcy6ouh4sJyfmqr3pkR0RVPU2QIVXWvij
	ZrL/SvdxIxHs9lvL4kCISyLXQkGJRdzkQuSmT2XcvFRM6YfU4mNm
X-Gm-Gg: ASbGnctPxMP+ICwMm7WS76QJ1fgEGt+1pig48nPFZlxXkMTfbH4UFAWFiCJUcuXFl5J
	BXBqREAWNn91mfy7iLsLoVU0ht1ANjieMmBN6BfP5BCpi3TjHjzVZzMD5zBHljyQLGP2M/Ucc5O
	ZzAiWoSVLV7T9H/G+WhhCrSrihz8RXDA6bwdN4sMVWcE335PhJ65wCY4E0iC6QQ25JmIIacHyeL
	ePRENxez/xNYNiaTKvUyzNpEYDnAgGHcJGuUDwixIWnVrEySDnx54RIEcy/513VsgawUFsHEWrM
	RjJQnYPsGdMXq5h19AmivcAB92nB9It8/AM1dwA0RwzMvhNVY4GcExsG+sWrCR8BcSD89ZjtdTA
	hJdLnuy5eOfpN7QuyW4EU
X-Google-Smtp-Source: AGHT+IHWxj+KdF4Fuo3sU2eTz3DS6XFpP3uC5wf0mdEBBT1l4DVSLSioRRGfxBvH8wk86+wmiuanpA==
X-Received: by 2002:a05:600c:384a:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-442d6dd24a4mr90298855e9.22.1746994403445;
        Sun, 11 May 2025 13:13:23 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next PATCH v4 02/11] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Sun, 11 May 2025 22:12:28 +0200
Message-ID: <20250511201250.3789083-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250511201250.3789083-1-ansuelsmth@gmail.com>
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
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
index 0faa3d97e06b..ec42fd278604 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -59,6 +59,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -610,7 +615,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1809,6 +1814,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -1967,7 +1975,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2684,12 +2692,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3576,14 +3584,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(interfaces, pl->config->supported_interfaces,
+	phy_interface_and(interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -3729,7 +3737,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.48.1

