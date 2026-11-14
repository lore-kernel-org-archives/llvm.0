Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653089;
	b=tXm0ukYNRQ9/2OZjlaXXO8lO2lcuGcWIIZ6+AvyOACtt53kMacK/fo4vU9hPf7lLtWlf
	 1ulD+Bk4uHt4fcc9osJNkgQO0PVcjWRkq7RDI7HcrLaiX92ohCznnfjaxc7DZP7iG4aay
	 Hf0KPr2z2lCvcpL7eUpvq/dl39Sjd0NfkUaWhVTdM4haU+vIxwYziNPvm0nNvml2uLBDo
	 e3mLgJdlgFcmXm2Ib4JcrojPtnfZ6f9sQFRIMmVCFCtFMJ619JkqjtWQl5nAMZKsaYCSw
	 CMZarf9YRk54fNAlpvfG4zE5Ai786KWj7OnC66Iv0HtFI/apMQzraFCTQlshfcVSBtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
	b=iocFP2VIE6Mp9TTjHi6rRzK7H6tNQRXefgU/Fa71L7AraJdR42yIjLPvtMf3slm/9rSG
	 t74eS2pmabuxLwO0VSsdBD61SmcPWe4I1WIPsJCv2E61tRCoPzRFTQ4B6ful8EAnd6K8n
	 UJDblWxdnl4EqgAjDPlwwicctJAUYfNIw9jJ+I2HW4ARIzcnSSYdNOcf1LuUnubq9kbBv
	 yPuzXLwoL7kVLaFlBr4ZSc2CYNW+qCwqfDKjOT+6Icj4VChJ1CXWxyb7JusqfHlQlAPg0
	 MTmP5f5lUHFSlRBPPjERKUA8De9qv520hcQafdNp+gV5hQYLbQyzYSv+1eiTns1cgBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nJhh8FH5;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA23960A5BD0
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 10:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA23960A5BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nJhh8FH5
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so832629f8f.2
        for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653087; x=1795257887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
        b=nJhh8FH5IBngpG7sosMBlELU1lX4mjiA6WNCjouC8yOZQwNfExH9OsMe95tw/LDlOq
         Wzt/LOy3Wh7C3eJv8EpBPHnmxQQc+z7AyQg1Vo5YSflduzxrOAB6RUpWlMAcTALVvt5Z
         Nj8ZdKfLuVffMlwCISNBL1JVJpZQtLUfMgVBGlQBPyquuuRmaVC243hC6Dyi5IeZGEHf
         jLKHf4VJAocvwiV4TjY32NE3FbkNkYgDWSmEtB/v7jO863xkAWy76HiZfHYp9jpkBxdV
         M/RzEvAgljKIacjhBq/bpqQdyXo8DQ6z63aGLnVFT5meOCXjywr8WNkvbAMROn7Efjbf
         M3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653087; x=1795257887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
        b=NwbNLpQ2vLvK3a7Q8765W060Nxplw31mxQRIX4+4XUrWvDYibkEV7rP5rbH/YSSF1b
         KMAimh8iKD42zfOte37nlpATJuZGP1mvMbMCsn8l2QaMEHCAMkt/rVcL3TNh5ZI95Y0f
         C/MwRRvzERZYxtd4zwzTdwchYAUGyP+SvZxr7t/hB1XFMeJeB8+LksoVFrbPnBHjqQve
         H4nPNssJEngwm1LA0SoKwVwnQ1tvg1XOr5FDi7AyAIeR5Q2um+9C0q2J4YrrftT6RSqR
         VJ6jAiHuXinYKXqsmvFPvLPFzn1ryltBwpVN75DEr8Hi/t4hOioBACumocYHONky8Jh4
         fE+Q==
X-Forwarded-Encrypted: i=1; AL+hErHmT3BKcPx63/LbglISYcOlVjc/n3F+r3KOwmubQOdyX2c/Q2/gB3VN9/Fjbgje2xEQhPXh@lists.linux.dev
X-Gm-Message-State: APuU4Z/N+f8d+YaQaiv0t/jd0y9XljpqaKpEEV1J/HVEU9Beo689gRDt
	y13xOZq8ChTi2bfdy3spNa1Uvp/1KLf16JKDS6eVQ9sHOYuQOX4JAkTk
X-Gm-Gg: AYBFou0V6uYTqQVg3Z1SyPkKbxnUNUDElcl/Wq1RQTAQOSE0DFbtZdbcHKJrl2y7hgw
	ybPjZE0p+0vAaXhTPz2evLCwvOfKmEZtPNz58kMJ8/fObKDdyXOgQaascuqrPKOHvhZy39i9thp
	odJmrCKAlaLYSeAWEpHulZ+jw0vNOnsxMk5Hz1aEv286z8dRWoWD24WPEn673JbeZr5VVdHZnVk
	cSf6+i0vuOLWE71dt4cbSFYo5j5S/LPv2HJtRklK4/Sf9R6kRGYn33mXAEoIYJGINOAden4RsR6
	Mvgx+6zHIxb8GYZpA4QLQZB+2XTxLxIo4iJqyYvcCVg9vm7BvFxhcU5l+Q04x5s6g4avKfrwfT1
	NprgFpM/0vsjldkUjmy3PMpKDzCJ1JzC8/mTajNfBwbZ6o+4QQMVzOqPpZKyzS7TmL2taWEK5X/
	LOjW7KAjWRemye1ux+BQCl/PC5vKXuPMPYF1m6SWwi+LrWm5nvazM6SIU975PSlEyQNXNjzveqT
	EcdJE4t373l6dyj6KW/hhAX3nQ/gZKRm5VSsIMXO4ige8VU5EK/lmWpTYFeo99LtOUonP47Ch67
	ldTf24vFItWPOqte6tS+r2ywWjOhJVHF96Nu2VZebMDO5fVtBuH5pA/1wYoaRTY8wzC65DmX4uR
	FuxINOarRCENPGZQjzpUcLk5vZ/ePk3Iotg==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr110359075e9.11.1794653087248;
        Sat, 14 Nov 2026 02:44:47 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:46 -0800 (PST)
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
Subject: [PATCH net-next v20 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Sat, 14 Nov 2026 11:43:46 +0100
Message-ID: <20261114104426.235620-8-ansuelsmth@gmail.com>
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
index a7ec4feb950a..957241652525 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,7 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -717,6 +718,27 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
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
@@ -2252,6 +2274,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2275,9 +2299,7 @@ struct phylink *phylink_create(struct phylink_config *config,
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

