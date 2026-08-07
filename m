Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801CD47CA62
	for <llvm@lists.linux.dev>; Fri,  7 Aug 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108416; cv=none; b=bkSIqsqmQtMMHB72f1JLwZqheJFEpIDUJCYpDYGIVO3vd3LGCSntxGjsqe5UfSbXnE5+QCx/B4ykkNAQ2UZ80yX723KwFWRiolXmagGvkHDRCZDS/VijULnow65bpnYWyjI7tdAIlL63P+lMW1iPjJhRnOi4/lKiC5F5m5jf9VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108416; c=relaxed/simple;
	bh=tgAvOh9XZA6ncvHGoLkjkptxgQuOoqAFalDphSpN408=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOslVBvkcYomz8tfns6vI4HIbCk8JmfWFKCrJya3t0/AoyyQYowGsHbqncymUQHlMuJbziWlqhKRKfLxTFq3/DHOWxdqr75A88OSsc0SfBtosDKEdpHDpf9zrjtLCHDhzhsdFRVOzs/dexlMVTdTTzuAFL/uHF4oBh9CzNLAsWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kN0fgbhd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kN0fgbhd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso33469445e9.1
        for <llvm@lists.linux.dev>; Fri, 07 Aug 2026 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108405; x=1786713205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyxmK7kPg+0nT2A2qnq5HgZVK8RCoiaE84ocn/veGKI=;
        b=kN0fgbhd+MqhUafQ1iAOTJmIJ3F34dbhFTFmqKu0ghRn1g845530cYvs7b6E8uUK18
         FuSJ/YrkranhbpRMDGmScvfFLsrXXxduMTLbjXw4EHJRIAuNA0qWkDsatAof+EsgKchI
         6aoYDqeJ08wdpAAODj7uKr0lMuIfRIuS5l5HzrrjcigTg5B3GKcdagZV5UZnVrZeMaDZ
         QJMr5M65Bq8YmkW+/X+bZRMw15yFdYW++eAjvaks1/NIIaPk9yMq5l6EqgXqQsDzPDnO
         u1KrDzsERUB64TpnDP9uHnsMYgLIE2JPngEmkXu27+OZuNSNLr6iOX/UYXm7vTMsA43A
         C8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108405; x=1786713205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cyxmK7kPg+0nT2A2qnq5HgZVK8RCoiaE84ocn/veGKI=;
        b=W/ZiaCJjmxCywbNU9ObMAlS9w+nXK2tkhjqDCMAG5p5GNWmJryCkoJp3iVEnYKCccP
         wf7+J9/vAAHhqXlIFPn0KPcDBby8dO+B04IBa2iStjfDs4knwKcb3o2nkrHWvfQFlV1r
         6+1bEQwmQj6uCpa8De6oM9I9RCvMwb911KFY32GI39SgZIKHq4HWFGRh3f8JKgS08h/6
         8DFou6Io3O7e6NwpkWNBHG7aN+2P0a+/kTPqCT2vJfE8TwdHWBSIHlEAlMpDF7Xby9z2
         8q1MzL5pLHxHwYbuYYuNb5wdv/wSsZZwj4i+NG7hmBPaOylkUedw/1YHFu5ZHZwuZZSk
         97Mg==
X-Forwarded-Encrypted: i=1; AHgh+Rpkwd5KZuvS2hjKyBmpueUXfmIpI5ZuqsGA3RgMstP+pFjkcT0RANrmZw44R0J67MEDwe+H@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9vLdgIkwXhOta+Juy3SGjnQyYnurKwZBpMZXywk5PAX/uP9Ar
	nN/YILmC9Z6r8jnu/mtM1uYY/Mmfz+eo/SPkUDr88Qvj4O+2sQCX0q8+
X-Gm-Gg: AR+sD10oAR3ANd4Yaom6Qm88VUSchcs+qdkY/EBKKvKMwbUDBbuy/Lr16+cvfkxQbhw
	5sRBaYp1Hr3RX0XRz+YOegb5Xd9ow4p9eeCRJWi67GAXtbbok4KxWkDbBqs5nscpxf0YUpMlxJy
	D0D78rGtwxfRu/Xhyudyzf3LbtYzX2EXyJIiogECDtb/9WJyAxOH4HFAIHt+rxziqTSjwBrxKS8
	zak9PkNFJ4iJEHSPQJUuztS4SjbfPlX0aZAaW3tWYLUqMisCFzV5IHAMJwxN0Am2z3o3GvtJcKe
	avT6Zr6ZNeD+ZBVbQMklMcABFT5FemDcgf8i5AakKJnFfXn9SN1TTwIzo9Bfi+TjxJm8UKJfyIF
	1B/vZ8Z9HNRzqx3h6QPhpwFl1Pnkx2apQ/A6LyowBcdz+oRwndgKIFzzJQrcuqZImI7GrODwFVI
	stNcsfmnWB8gnX/UtNmLJbd3pVthquW3JAWoLkvsR1APvT7Fc8yT60u58BY2TWSdg9DJQHYVw/P
	fMC6AH1GiVBFd4H/oGm01lFMNa1ndR8oPtI9osg5qDFXSdm9JU3UWLWYRpNNWu/
X-Received: by 2002:a05:600c:4e94:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-4994e6c5eafmr288598705e9.0.1786108404621;
        Fri, 07 Aug 2026 06:13:24 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:24 -0700 (PDT)
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
Subject: [PATCH net-next v11 06/12] net: phylink: support late PCS provider attach
Date: Fri,  7 Aug 2026 15:12:48 +0200
Message-ID: <20260807131301.192060-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for late PCS provider attachment to a phylink instance.
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Then we link the PCS to the phylink instance and we refresh the supported
interfaces of the phylink instance.

Finally we check if we are in a major_config_failed scenario and trigger
an interface reconfiguration in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  4 ++++
 drivers/net/phy/phylink.c | 41 +++++++++++++++++++++++++++++++++------
 include/linux/pcs/pcs.h   |  1 +
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index f575fbed896d..79fa596c2900 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	fwnode_dev_initialized(fwnode, true);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     fwnode);
+
 	return pp;
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 548e783ae2aa..69d4f6675db0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1908,6 +1908,27 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static void phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	struct phylink_pcs *tmp;
+
+	/*
+	 * Make sure state mutex is locked to protect concurrent
+	 * access to phylink instance PCS list from
+	 * initial fill_available_pcs and late PCS attach
+	 */
+	lockdep_assert_held(&pl->state_mutex);
+
+	list_for_each_entry(tmp, &pl->pcs_list, list)
+		if (tmp == pcs)
+			return;
+
+	list_add_tail(&pcs->list, &pl->pcs_list);
+
+	/* Link PCS to phylink */
+	pcs->phylink = pl;
+}
+
 static int phylink_fill_available_pcs(struct phylink *pl,
 				      struct phylink_config *config)
 {
@@ -1939,7 +1960,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 	mutex_unlock(&pl->state_mutex);
@@ -1991,7 +2012,19 @@ static int pcs_provider_notify(struct notifier_block *self,
 
 	mutex_lock(&pl->state_mutex);
 
-	phylink_del_pcs(pl, pcs);
+	switch (val) {
+	case FWNODE_PCS_PROVIDER_ADD:
+		phylink_add_pcs(pl, pcs);
+
+		/* Force an interface reconfig if major config fail */
+		if (pl->major_config_failed)
+			pl->force_major_config = true;
+
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		phylink_del_pcs(pl, pcs);
+		break;
+	}
 
 	/* Refresh supported interfaces */
 	phy_interface_copy(pl->supported_interfaces,
@@ -2077,10 +2110,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		pcs->phylink = pl;
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index f9dcbf58d053..5cdd121b12f7 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -5,6 +5,7 @@
 #include <linux/phylink.h>
 
 enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
 	FWNODE_PCS_PROVIDER_DEL,
 };
 
-- 
2.53.0

