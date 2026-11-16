Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846875;
	b=OVTk/woWRjvtPzUm7W7XSfbqQRInUIwUDcOHVYfN5l0Z2mfMVIJE2Z7/Qyjm3wmh/oQg
	 r3o4gjsLxqtauxSKS2LfdN2ebC3Uv1D0V4dq2xWXTOP6pE6v2uNPnF3br4G4PnTtyi1+f
	 Pyn9QkPXyBX7fBHtfK/HXnzhj6miFSw+eu1hV7QgdkYtEK7nSzgnwYutYjLGj9HG6cTWQ
	 Rv/IGtUUNIWX6ItocTOHV0gWxG5Amr0QbHEtvgAn9zXeDiMne1ddwH4D2vKJEcbPx70mj
	 Jl3z4Jacq33VdqX0mKdcmQ8DydQennacxhKafi/r95UonXMIG2omPLHChvqL2MI1NNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=;
	b=vDcUvlW1ESR/O1ICk1MjQVDBO9h4qjNEQCYifOpVFhsoCgezu3sWwqobsGu7DKcrI0Su
	 jY0tyaDZ441NLiI44K1R/vqj9Mz8WtNCmn3hSRPQdaqCpcm8+351hY87DeYBdsW443V5U
	 rsDdE6PCWYKs1AjfEKgXZmSgh6RLDJbtVET5HK5dDGdavaskedoMdokP4hyoZUuC4Fp4B
	 EKA7WbizRySevUPr95OxIpEs341VJDQMOlwmWPTkJj3eBnFSJ82WAIsJRp9Khur50M9Ly
	 QMXraEr1I7LWKeAyezfQfR7xHW1A7xUJZZsI4DK5SOrJWelunv0k1vTFniiW9zPa3cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7biAPCD;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E87A60A260E
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E87A60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7biAPCD
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491846221ffso3365438f8f.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 08:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846874; x=1795451674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=;
        b=H7biAPCDY9L32ihQYrkIfOr1iMLloxr4qeJL8TbViX9CYfudq9Wn3RxvstdDY0nX8T
         PiBN3I4F7wuEYbA0ZWrVk161idwBOsmY0F6MrQlSmqyRIUEQjAbahupGVGzJjh2x09sl
         pkczs0b4biDFfQ24941fqfNhFl2z6k9PHmNuNAWtYoKwkPsM18aIYqGs/QSPhVZsboCj
         AagRtb1gTVJIimIcqsjGB5EP9PUjyL7KJafD65Fj72b1wNaXCeOUa2ya/lWSbknEwoXU
         4iSGUt16JzCcrzf9FJgZfjMT/n4YuV3mMhI2huA3cgIpaeLdcNqxkhfpiyN0PJs6UDFH
         A2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846874; x=1795451674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=;
        b=oCudUMHRH3r9extcoSOo8lwprIRtGuCPO4gAdT43H0M6G7adYs34QOp9Hvndu5VpJ+
         CcCJZC+DOh9KprHy+spOaHdBI1GPcXnQJg1gqRla+WqfVg9VG9LmjqPcG4H7unPxYsVZ
         fMvdTEb0zj0vdqz6MplNIvcFEzTyIRRMR0ePufbq/fAfTgR/L7EYZDqH58tMc6c3+JrV
         uwWu/UlbN8elqGUbg7i1AJBvTplCZ3Y5cZD+LANn7wsTxD42xERGXvNhnKgKm+zIQcRK
         ioeuCCMuTJNHd86LqpetI7l2W3wCzZvXdNFqhDrYXqbNqpVHoIpYrezu6l/VfDkBXhht
         +kqA==
X-Forwarded-Encrypted: i=1; AL+hErEaABpKapKimrxSRzrAdvM3iQmDpM3eGKnfrDRzn1p60Vq0LWTlcNbpeXQNvextKpkn0gS2@lists.linux.dev
X-Gm-Message-State: APuU4Z86Eo4jC71Q/AA5lIOwxkmaZVBgL500uqA8qLyEebyv+p3v73EJ
	Z/d6r8uRQX3hUTZO7OrejdoHce0cUal15KtsZtKoLLM6z9B9U0tNDJvw0Djt/w==
X-Gm-Gg: AZFdTZf8v0bDDvAzscP7T+AEpkD1cD5z5ObWqauqVrZ5lR9d1r9h8fOiRAxzB5kEI7p
	kWny2ExtI/CxwMocuznseOQzPE59peZzc3jkkKlziIn1embggqefy85qaxyDaxFruFQOAxeeXIQ
	1OnUL9LMIQ6PW0gY7sXFWILf3q/dwbEyOrgYD07UmmE4b5Y4rf24wfx1KmY4MGMtTFqYuyCCHhA
	sQEEug8uRDc7M01X3OvHrG/N9EDHEC87XeqtDKEXwrmOmjYkiGuqcU0jMZnVcXpwqP2ZA0ADNAb
	jEwblgcQZo7fzHr9APz9E++zJsRXzZjN48FoDd0+aHUNGE3QX82WUX5nzGeXa8VCstNslxP1gdd
	Yxa0aB5LhcFiAODJkz3xu2JEsDlOR53uUD7SXyZTKAvM7U+fBxI/EcDEMfg/fU+LMAzardNow2k
	zjcXY4Ib6zJUrzdhqIrSsn9VlpKMZOX9n93jC70uecIWURsJoWb+RxQPxKFUGd5yAWDlFIerTiF
	Affkh25zt0fTVoAGrg2KDCpEMR9zrWY0TXjLGwVq4QZ5zyxWNeK47E2k+VqgTqpdKPJw1DUkNGI
	FP0FAJkcIBCFUBvTsMCHlV606LTpBN6Sk7tbmt/uqq9HF6r2H4YS07M2Z9OK/3EyPIaNif53eJ1
	EZlnnUlP9fvZjQvuSGg4iUfNQgo+K/A7GCg==
X-Received: by 2002:a05:6000:4204:b0:4a3:522:244b with SMTP id ffacd0b85a97d-4a305222665mr1439000f8f.11.1794846873561;
        Mon, 16 Nov 2026 08:34:33 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:33 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 06/15] net: phylink: make phylink_validate state locked
Date: Mon, 16 Nov 2026 17:33:49 +0100
Message-ID: <20261116163412.551438-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

Special care was needed for phy_get_rate_matching that required a lockless
variant. This is introduced by adding an internal phy header.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy-internal.h | 22 ++++++++++++
 drivers/net/phy/phy.c          | 11 +++---
 drivers/net/phy/phylink.c      | 62 ++++++++++++++++++++++++++++------
 3 files changed, 79 insertions(+), 16 deletions(-)
 create mode 100644 drivers/net/phy/phy-internal.h

diff --git a/drivers/net/phy/phy-internal.h b/drivers/net/phy/phy-internal.h
new file mode 100644
index 000000000000..56d87495e1f0
--- /dev/null
+++ b/drivers/net/phy/phy-internal.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __PHY_INTERNAL_H
+#define __PHY_INTERNAL_H
+
+#include <linux/lockdep.h>
+#include <linux/phy.h>
+
+static inline int __phy_get_rate_matching(struct phy_device *phydev,
+					  phy_interface_t iface)
+{
+	int ret = RATE_MATCH_NONE;
+
+	lockdep_assert_held(&phydev->lock);
+
+	if (phydev->drv->get_rate_matching)
+		return phydev->drv->get_rate_matching(phydev, iface);
+
+	return ret;
+}
+
+#endif /* __PHY_INTERNAL_H */
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be330..e305bbff16ad 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -38,6 +38,7 @@
 
 #include "phylib-internal.h"
 #include "phy-caps.h"
+#include "phy-internal.h"
 
 #define PHY_STATE_TIME	HZ
 
@@ -146,13 +147,11 @@ EXPORT_SYMBOL(phy_print_status);
 int phy_get_rate_matching(struct phy_device *phydev,
 			  phy_interface_t iface)
 {
-	int ret = RATE_MATCH_NONE;
+	int ret;
 
-	if (phydev->drv->get_rate_matching) {
-		mutex_lock(&phydev->lock);
-		ret = phydev->drv->get_rate_matching(phydev, iface);
-		mutex_unlock(&phydev->lock);
-	}
+	mutex_lock(&phydev->lock);
+	ret = __phy_get_rate_matching(phydev, iface);
+	mutex_unlock(&phydev->lock);
 
 	return ret;
 }
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 091c3a79c120..88280866c19a 100644
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
@@ -24,6 +25,7 @@
 #include <linux/workqueue.h>
 
 #include "phy-caps.h"
+#include "phy-internal.h"
 #include "sfp.h"
 #include "swphy.h"
 
@@ -550,6 +552,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	unsigned long capabilities;
 	int ret;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -628,13 +632,15 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
 	struct phylink_link_state tmp_state;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	linkmode_copy(tmp_supported, supported);
 
 	tmp_state = *state;
 	tmp_state.interface = interface;
 
 	if (phy)
-		tmp_state.rate_matching = phy_get_rate_matching(phy, interface);
+		tmp_state.rate_matching = __phy_get_rate_matching(phy, interface);
 
 	if (!phylink_validate_mac_and_pcs(pl, tmp_supported, &tmp_state)) {
 		phylink_dbg(pl, " interface %u (%s) rate match %s supports %*pbl\n",
@@ -648,15 +654,17 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
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
@@ -667,14 +675,36 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
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
+	if (phy)
+		mutex_lock(&phy->lock);
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate_mask(pl, phy, supported, state, interfaces);
+	mutex_unlock(&pl->state_mutex);
+
+	if (phy)
+		mutex_unlock(&phy->lock);
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
@@ -682,6 +712,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
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
@@ -2117,7 +2159,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0

