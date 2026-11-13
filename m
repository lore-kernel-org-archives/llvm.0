Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529965;
	b=VUA94Cqt0i7hB1Likd/pguOdnm7o2Z/5/zqJJvu8EbLStaPI4cQkRPDaVbc01vVjZEuc
	 m9Ij2+kJxCLwbvmgUCXSeYrTzD1hTNoljgPW8MuR1ZvxIpwXJUZbwiqZPMWQ54uUwNfrr
	 keDarAG49RFZjaK5MTGswmRTtO4bJKEDDzyVB+rS2sk5dUJnMae4xGqbkilrw7dcyoKKV
	 WPCsmwL8ldIyNJo3rm3gHqDfC/E7HgA+O0kzB+D0n39TWMlPDqg9T7CPaPFMG2dYQsbIh
	 EWjt/Hswnh9URlEdSD4KTdwly9aUgotsim2uYZioXELs/2PhQcZuQeLeozJnmFQT20A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i5OFynf0yQ74EmgbLuwy7WCyI+wmTmFQ0TT8iw9nuIc=;
	b=RgDkFq5uegdkpWGCxpoLSygGAopkd1mGu/P2aziV+HX4BbKa2pOzKdUAb7Yjt3qezjbG
	 pkkrbvy2rFeKDeuibHt1A41W4Kjc7jFvVUzu3t3rYETL1eybYO1N2u0yuAQOwhSRTvfeS
	 5A+IGA7/b0QzR4oOcf/pYRjK2nNb6Od4bNuUnz0uDgeiocs3sxZVu/p8zKNBNWe7n/obc
	 ZhGHd8ijyAy4ZnaeFeLB3sDycVm+Qf+3aRhzJdP9bfeARzYsVS9ItOqWUP6GU8cYJTTty
	 je3JUIZb1FMXnRJA7vlHG3x9rSbaNfJgkUo0u1H+MNkH/6OxvdDLrG3fzRnXZ+YI9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czjwEOvT;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ECF60A3808
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1ECF60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czjwEOvT
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49134c8509fso339296f8f.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 16:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529963; x=1795134763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i5OFynf0yQ74EmgbLuwy7WCyI+wmTmFQ0TT8iw9nuIc=;
        b=czjwEOvTDF/CsvCMozHPZ/Az6E6fRBbr9+FjXJsUKYq98sjlMdXET2Jdpb7pMPF4Hi
         RLlZphjun0h6ai+4YMV3KyfMC6w3aaX6eLyIGSYYaLwBQtrlezWN6t0fPKG0gpuP/CKF
         82XJIApupbjHY0tif7BufQTPtG8oBb2OLEyI7td91XGJESd8v7ufPqaujuS2kRNyIEkU
         vuRyJFMSTiDYnYdtMFH3Sr/Dwa1NBcKkOGJkq46o7yCjIQSNcedtMpCp7tKr26vqwzqw
         UTSRMHjb0pn0qJM/utMzr/SXgcXtX6TSCr+cDVHLTASAnNYZ2JhWZhbnhwv44cRCkerI
         aUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529963; x=1795134763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i5OFynf0yQ74EmgbLuwy7WCyI+wmTmFQ0TT8iw9nuIc=;
        b=hw9qqlx4PuT+qZZ5hEZ0VXsX8AOYjuukfl5fGDPDsIYc/hbTrAEax9rDd7VFPapBl+
         nU6/bu+3gVv3UQDzOEXILrw44RZg9wJSQSPUXnNFQSUlBXuzJ4lObQ+gfFTa/rEt4wW9
         mSnTt7OVdKLgotQoy94bnRKelsUKaZBmDeblYvFLgxHkKos03ENMkiHl51NNwzwCOtuR
         h9auIY/fqjrr+tope7eMbfc5zr0/HwZ2l31f20l6Efb4mfZr7nAWa2m+OVAS410WIYZ+
         8il98rHEJimMPLJPsegjOBh0q2S8vB3ybLP8JXMUVl9E5kZ53pxuNpgr9IQkWMgzV6q+
         iFXQ==
X-Forwarded-Encrypted: i=1; AL+hErG1kVR3MB5RdgaCdqMVCrN2Q1rHBcen64mWAAGv/KLSTbT+6B5EmXAjeszz3laLzcjXnNp6@lists.linux.dev
X-Gm-Message-State: APuU4Z/gQyjYG2EJIKAZnTnyjaJ+2zIh05NOVAjDbxAEaTAfm1DkvAoW
	eGSoWsel7oBa/+WslL5SBuR7zPXatnk97y3hAS7uT4Y+DE94rcNa3U0j
X-Gm-Gg: AYBFou1pC2VwTmMlnonF52Y6uxiRdHZDkvtu9oZyNVexQgMPZ/vQKNm4wu1VCPdo5PC
	BVeTs09ACmSJ0LcyrD1MSqGIhTD9onBrU8Abzia3tcZXvH9xdLn00fX+LOlYhgD9Oh892mMN7+L
	y03ALnDDkpA8VRDuTsbKXB+Yk9FvZEbS5oRsPd306evjxoKQ+nQVsaKKEDtbnWgtGg/FLZLfjnv
	OfysEiM6Rc3PtKVMxqBMVrzeO9+DecfYlLUaBYIFpwyHTWphQ5ajYFft1OZA59Jd7Kc7ioR9Ln4
	Jyl8eg0M09yaoP/xYTWta6eqyonl7EGaRrf1kfJV4zvyWbgtI9LobflSsXIY3Q3kE12l9RCCGpG
	ZAbLTu06oT+zvbr6osRY8Ec7FV98A2EdIzauM70XzuTXSOprdzrijhQmpFKnArDEZkWjSqV0hqT
	bjZwDIhA0cV9Oez8Af2bHKbBXUv7Xc8O8ldgWnMh5ZvXXBArZZH594+uTyjh0U/cIPvcdvBqoCx
	f5GWmduHfjtnl0cDcnGDc0wwjc2r8WWyytwgeMkHEvy19NZe/KZWPkCxMAPlMUYMCAbZABKrOJ9
	idnblMuSAhrODZuNghu2rEjPvVDWJuo1kToTsKJ1kbgpzwJZ916fZCar6evWG6NQBUmY/+tlOGi
	PtZ2mlgv49ec6IDgGR+LXP30gsCQEm5FIDrFtgi3l9LKc0TMcc4sdVsbttUR3l9YOq/jKuOUKn4
	Q=
X-Received: by 2002:a05:6000:2085:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-49c73a050e5mr2244067f8f.54.1794529963290;
        Thu, 12 Nov 2026 16:32:43 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:42 -0800 (PST)
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
Subject: [PATCH net-next v19 06/15] net: phylink: make phylink_validate state locked
Date: Fri, 13 Nov 2026 01:31:56 +0100
Message-ID: <20261113003217.197757-7-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 47 +++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e2e0b313fd61..918aa95e5a64 100644
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
@@ -667,8 +674,22 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
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
 
@@ -682,6 +703,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
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
@@ -2117,7 +2150,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0

