Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529967;
	b=FoCVfq7XLn3gTSpfgz4rJXnkkhkyHJ6eXcsi1vCAWSmvg8DAG7NS1sb7jOYGKtBkLGp9
	 xooUFO9j6TRhn1ooQ0rKHVcT3W/sKAlKw41upAq7nx4Rj5YO9E45dqiBQsJjlrbBlFVoT
	 AfpOElkBKE52C9Mrfcrb9pmEHx/0fbNw+lZKxexXj8VU+B0VR57BmIlcFSRrj8LjwM1uy
	 UvEkb7NSTdOoakDLv73wzt4jwPyuj/53VoYolqlKvzxkcrJ0oKy66mC0cPeLCtx5lTdia
	 hHNvc9gsktS6koWqKyENIS3/8DrrJrtRmTbCgTZDc4IS86iH5Gl/h4iKNvaEeSHlElA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
	b=WHtVaj4M5TFMfnGPGlDBA7nLl0UGrlukbPG+dwCVRQHG4W1FcPcxL5rdkZ92mIg+93LL
	 OPJYm6s8o7tAkKGbvelS/enFC1KaQHNN+tVOLSVG56f4LDc0t04pXaIoU2WFL+OCwTVZQ
	 IaVC2xh7JMWNVivbfJelaj4WaG+d+BDKdHMtYxPKD6WX4LcMxZSOjYPlqZ46t4LTL84hO
	 Sbl3zHtEkBel+eEkVNYSLRHoSyJIBY5tnVmOQ8olG+wqfK4bdx3Kgf0w794Dn97iWOR5u
	 GdS/M+qduVmcUcDGmmWb3XInnLwfiAqMrkiSYs6+k4F8QjHWa+uJ/4QpRjurq5osVsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGDzumeB;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BF160A3822
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BF160A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGDzumeB
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49465892f7bso363733f8f.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 16:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529966; x=1795134766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
        b=MGDzumeBCL97f2zqbiyVya3JLNV9sXlb3bCZDKIEFsfjxD5Vocq8Z4aUcUO33AgmSo
         Sf8+wrTT0P34WH8gBHBH+yT7xI4WxLwlQK9ukglOivXySsKFw+Z7KUxqvONGh5LZkQY5
         h4FumGr5qUYLWJTLQxKVPNGKXjAwADP8fCHgLvjcrBBjGLCzwbl45RZZDsa39+8+Sn7o
         jcUdcWplmIFt4sbTmzAw3LBJ6Z/sjzMP+/0fsqhquAmzVtJtgHUVZPv0mCNjUD8djZrj
         lCNABAmv41AYddGIAiWMWnP7LjH205x9Xc24zOXDejfLlaAC8YP4Wg8Wb0aOUXnYVsm1
         qyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529966; x=1795134766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
        b=TsZ+JgZTh1AoAw3ujxQpjkRZNUcynhNqNJ+HOUNdwCllmErI8F/gAK2cEpOg6tEX+7
         xmAKTb3jyACqtnvZEg9C0G1d8kuHSRp0dT8TQTtkQPeAmVzuoys9GikfRajt9oVysZ/z
         2Fs50HjI/YlSFdmHiBOQFaNKGcWUMwdwJLinYuuVrMByn9tDob0U+DHCzXTJTgXQyJBf
         /MrpX5M6fF9a1XpNsi4f/bWwa+EGUK2lTfnbvFyDE+u5d9ZJPla8wwFtDbWgohYAlVBF
         PiLDqzExtl3GCnR7Oiq1E7c4Q/JqIr4GmC7Tdx1EmIRDv8zx1mv3wWQLqx9QABQ5d/Hi
         tAZg==
X-Forwarded-Encrypted: i=1; AL+hErHEyGUBs5X4/LY2jcM+8Ukz1TUJG4D3n1vCBqIWa7Nq1Z6NXrJSp1qYbnveWcOnr/Nm+Mp2@lists.linux.dev
X-Gm-Message-State: APuU4Z81AFaf459w3H5ZMIg29RqPi5YNzgufyOHrlVcE4S7CL1Pz/kRl
	S9K9NC0Dyvr4id3kXh7VRDsIhWn04BwNsBHL7y4J4xcWSMSWg5c2zVjZ
X-Gm-Gg: AYBFou3qZeNm7Wzai/dVAS43gYyUWGK3Nu3WvvRyVJ4b23p0giqMIEyf9t2vCMwn2mk
	dGDXWL232VsunNYUJVcfCb6z20npgQC4tlkXdqPFpHXFDFG8lpPIC9FEps7ZcNuAnJlZJGa2HMt
	rtR2tOJ5Rs8Po7yeYQGd36TLuKLR4Q8KvcKqpkXlvv9GBfF4fLrlRnSL8NfnEN9JtZ0ogREbrth
	ByHAiAMF9e+Txxdq0z9noiPuwEuMRhqU8vZzgGW41IgnHNadvS3L6RR49/jRBn/pBb9X4UK9aQr
	SCojKzm8H7Pm4JqQYi35l6Ki3vN1jQ2uK5OSOWsXnXu4mnr6eN0LVyNO66cWr5/ho0NGyJAZy2a
	E7zepihkcDVtDZxAFJFieiYJ5re6cDAHNTxqEoHTS7Xige+K7CvfZg14WKR8u7SOFHnsJq8MtDV
	9DxaezHzppXP2QBX1/526PwCa7IlF2K/YhgaAeBojjLmcIkKvWJw+pyTTMSYJcYenltWlkbgyO2
	OZ8Ww+NQgA6ruAxPBbnzFSFpJCaDeA1qs7gCH4SmoWQyEHSGw3qIrHWJyAf4mjrHw3m7gBFgqLQ
	uk+Xkacp3TE0Hbj0LVsXdu6mDmJoQIU0ouxZSSEynp6r0C/8iFoE0jw7QDH7eF4CBNNKsZfxmKC
	bu0g5tsThxM6HDgMZY/wrCcBKy7tezVp6NUqoyV5JHpvCZzxVGnGKBEw=
X-Received: by 2002:a05:6000:4917:b0:48e:2114:8ab9 with SMTP id ffacd0b85a97d-49c71d47601mr2274012f8f.31.1794529965915;
        Thu, 12 Nov 2026 16:32:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:45 -0800 (PST)
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
Subject: [PATCH net-next v19 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Fri, 13 Nov 2026 01:31:57 +0100
Message-ID: <20261113003217.197757-8-ansuelsmth@gmail.com>
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

In preparation for PCS release/late attach, it's needed to introduce an
helper to calculate the capabilities after a PCS is removed/added and it's
needed to track the advertising in link_config changed by the user compared
to the originally one calculated in phylink_create().

To archieve this, introduce a dedicated advertising in phylink struct and
update it when the new phylink_calculate_capabilities() is called.

phylink_calculate_capabilities() will then compare the advertising saved in
phylink instance with the one in link_config (that can be modified by the
user to disable modes), compose the modes that are user-disabled, calculate
the new supported modes and the new capabilities, update the full
advertising in phylink and restore the user-disabled modes.

phylink_create() is also updated to init the phylink advertising and
link_config advertising.

linkmode_xor() is added in addition to other logic operation to parse the
user-disabled advertised modes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 28 +++++++++++++++++++++++++---
 include/linux/linkmode.h  |  6 ++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 918aa95e5a64..9f9715403215 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,7 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -715,6 +716,27 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return ret;
 }
 
+static void phylink_calculate_capabilities(struct phylink *pl)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
+
+	/* Get user-disabled advertising modes */
+	linkmode_xor(disabled_advertising, pl->advertising,
+		     pl->link_config.advertising);
+
+	/* Calculate the full supported advertisement */
+	linkmode_fill(pl->supported);
+	linkmode_copy(pl->link_config.advertising, pl->supported);
+	phylink_validate(pl, pl->supported, &pl->link_config);
+
+	/* Save the newly calculated full advertisement */
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
+
+	/* Keep user-disabled modes out of the active advertisement. */
+	linkmode_andnot(pl->link_config.advertising,
+			pl->link_config.advertising, disabled_advertising);
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2250,6 +2272,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2273,9 +2297,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	linkmode_fill(pl->supported);
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	phylink_calculate_capabilities(pl);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index 3b9de09871f6..a8290d021994 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -32,6 +32,12 @@ static inline void linkmode_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
+static inline void linkmode_xor(unsigned long *dst, const unsigned long *a,
+				const unsigned long *b)
+{
+	bitmap_xor(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
+}
+
 static inline bool linkmode_empty(const unsigned long *src)
 {
 	return bitmap_empty(src, __ETHTOOL_LINK_MODE_MASK_NBITS);
-- 
2.55.0

