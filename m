Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653086;
	b=CBXX0RfCoP8lnIMdExfHKuQHjLwO42MFbkMMp3RjjzXbxWXax6nhgIrbmcsUb0livM8v
	 MEVeaTR7c3cnEqVpKy3EY9a6DGQ+g7R7D734Ndk/DC2TqsUqdMPaYBh+DhdhqRnlgqfTb
	 aCLXcqfnLSTqBCakv5RElYJAgmXvOMUjm16HM2PQ//hwnKbgBWWp+KzBOBjlW/yTocNpE
	 dhgrcU2cT7Zx7KNSFcQf3eA8dAOn3DuwyY8Zt16CWbJgACo39WhJTk6Fv1QMXPOd4aMzO
	 RgcTxNEYLjVkwb4HIlj+imVxp7JsASB7cJ8swNNxvmM80JZZ0QZaTzp9q1YBZpIYYAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
	b=06L7i0f+3dKFoxHA1T1K2tRicGozhWI5puM3wroMKUiPfE2MZURzlamsk7YQrp6NVnvO
	 bzJRKBOxX1SMG2gvS/B2PF8JVCwoE7HAm37+/MQpdppAxCftpmJFtzBoabKu82cEdUQ5R
	 L97hmSLWjECvRP9cmsPqzvEmFThQalsvXC8aSIm/EfGYZfK4B2nnvmq8Ar4iYEC3rS/xF
	 HjR/72GwY+lPfTNza1Vneq+ROMwBIAUAX9jq7u7N4SLRNxYQTOIGJdtgelAKr9gpgnR5T
	 83Efr0Ci9gIgrVVcxcwOvQlM/KBO0L7kEoNcadj3NI90Eaz1kPBwPNC9+5cuZhLHxdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9fQr5qg;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849F60A3827
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 10:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3849F60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9fQr5qg
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so8652465e9.1
        for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653085; x=1795257885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=b9fQr5qgBpA+gFAZkeeJr3pqaOA5ZxTnRlOyxsI7wmuNAmzyx6bD60yconSmTAcud6
         kxIKQpSYkSCvJS35m+rdmBhj4hjrgHytGznzaT1q9WN8lrhg60b4HLg9yJdmc/r94J8m
         Qp2EFYlhZHY0f2y738T5g8eSeUe8+lquvulWCaEhPOM2cRbgH3Oh4Cg1wWPVIl26Bx+i
         47jey/zcsVkqhBFJMCg8ot0rDDHfjiwk5cb6WZCeJav7KgxnBtYPku1BKv1Iayalq6oM
         Ex9B9NO5RGVoYu/xlGStezShwIielnN/VIxt8N4Z7xoFhK/e8uqmGSQJwtDcdX74bVO2
         JTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653085; x=1795257885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=N+0VGZ5gwA8I01chdgiyfqDXw7Bc5jynevKcyNoTLL7SDnTQVkpfrubrcFHc9Ongt2
         nO76G1OUSNnquagHOS1wExbwW32tenCe+ycHm45Z5RaH4WExscZz5IxNnN8X3E3GBkm4
         9pVEHMa1Q93nuZUP4+FBbA2RLxhM/TYBHq3Z9HnPuEd3nn/ioPXzP1Utx9HqhF6y/Fnq
         p8b6MTLA4K3y6qeKO5hWd5IHsQmyr9df7MX7aO+GkPVPypiHcRE+TRpZRXQyI9SEGFaq
         a6/RYUDZgGdm1qUrN229MbLtQ9AZOGAih7BfIvnwBOJrg+wbxDau0rnGA1eFSQm2tJnG
         Py8g==
X-Forwarded-Encrypted: i=1; AL+hErFx1mdPnZEtW8eXkhxzNSGer5e0kkjhmWX5K6HOzaAbTJ1Bc3OmPNT48JJNDBeH/jGCl9jf@lists.linux.dev
X-Gm-Message-State: APuU4Z92613rB69KOlJRd6pCgBBRHTV3W9K8vqJHezkx4LC3NGfjAsix
	+mvr2VMpqhgX91TY/DwrydekfTlrggl+7LsinTSsmFZLE0xE0uhqHUaT
X-Gm-Gg: AYBFou3H9KFqjcwUo6vA6HBXJFh+1ZZ3LBrtw1QAh+wlHaFiePIxJBLZFYoaSJ4Z6lm
	NsUudBud0UtMGzOLPztp2q+ri9TuXTXH/LbSs4TpNCiTdhlLEGTKy6fSB5bJh0HliIXQaMguF80
	cXBgzBC+gQejN8UXqfdF42WbLL3kjdDN91ZqgBaMsq2pWT9AdNJdBJy8jWU/znbZrMpZQPEHC1e
	BuoUfGnMWboDzeXE+VS2KAJwdIyq/Y+BN1C7pqWwPxRpSgXZjL1PhZ90/dQ7H19Md4c3oZl/ha2
	b4TKrvPyWt8I4BypNu2L2Os2B2X1MNUIVdUE0XfipQilOuVwoAA8Su1NEfEBACIFCepMqAiTmsm
	T596zz/1XPW1Og/FqcYPsMz0H68zWBseAnFGo9Eh7chnCLulSoGricq88fb17PjsuxyU2TyzZ7P
	qklcgwtVBYVpI3S4/25Rsvr6XcDT9BtH+XfH8fkNkfRzQb60JQD65t/yv8q3ScFxsYNXT9YdpxV
	BlAiFa3vdJKJkotsD/mVRMFZ1YgUMpRfFCI0/Pi5+MZmznNINOn4wQdVMolV7L/TYplU9vm7aCs
	HoO7q5v03gDe9K9DrT70g9G93ZzLpUCWWVnhUvsnZaUzeARi4OCNilwtrKtGq4OhwBvMLNMVAha
	s4XVXZMaDJ9m2wHE1VWGBKoDNxlbNDeAIcA==
X-Received: by 2002:a05:600c:544:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb55a662f9mr75106665e9.10.1794653084661;
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
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
Subject: [PATCH net-next v20 06/15] net: phylink: make phylink_validate state locked
Date: Sat, 14 Nov 2026 11:43:45 +0100
Message-ID: <20261114104426.235620-7-ansuelsmth@gmail.com>
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

In preparation for support for PCS release/late attach, rework the
phylink_validate functions to be locked under the state mutex.

With the introduction of a notifier that can be called concurrently while a
phylink_create is called or an interface mode validation is being run, on
recalculating the supported interface and capabilities, an inconsistency
can be introduced with 2 validation run at the same time.

To handle this, make the phylink_validate lock under the phylink state
mutex, add lockless variant for phylink_validate_mask and phylink_validate
and add lockdep check to make sure the mutex is held in the inner
validate functions.

Function that already run phylink_validate under state mutex, are updated
to use the lockless variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 53 ++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e2e0b313fd61..a7ec4feb950a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -9,6 +9,7 @@
 #include <linux/ethtool.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/lockdep.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -550,6 +551,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	unsigned long capabilities;
 	int ret;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -628,6 +631,8 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
 	struct phylink_link_state tmp_state;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	linkmode_copy(tmp_supported, supported);
 
 	tmp_state = *state;
@@ -648,15 +653,17 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	}
 }
 
-static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
-				 unsigned long *supported,
-				 struct phylink_link_state *state,
-				 const unsigned long *interfaces)
+static int __phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				   unsigned long *supported,
+				   struct phylink_link_state *state,
+				   const unsigned long *interfaces)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_adv) = { 0, };
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_s) = { 0, };
 	int interface;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
 		phylink_validate_one(pl, phy, supported, state, interface,
 				     all_s, all_adv);
@@ -667,14 +674,30 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 	return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
 }
 
-static int phylink_validate(struct phylink *pl, unsigned long *supported,
-			    struct phylink_link_state *state)
+static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				 unsigned long *supported,
+				 struct phylink_link_state *state,
+				 const unsigned long *interfaces)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate_mask(pl, phy, supported, state, interfaces);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
+static int __phylink_validate(struct phylink *pl, unsigned long *supported,
+			      struct phylink_link_state *state)
 {
 	const unsigned long *interfaces = pl->supported_interfaces;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	if (state->interface == PHY_INTERFACE_MODE_NA)
-		return phylink_validate_mask(pl, NULL, supported, state,
-					     interfaces);
+		return __phylink_validate_mask(pl, NULL, supported, state,
+					       interfaces);
 
 	if (!test_bit(state->interface, interfaces))
 		return -EINVAL;
@@ -682,6 +705,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return phylink_validate_mac_and_pcs(pl, supported, state);
 }
 
+static int phylink_validate(struct phylink *pl, unsigned long *supported,
+			    struct phylink_link_state *state)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate(pl, supported, state);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2117,7 +2152,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0

