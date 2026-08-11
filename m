Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1AD422E35
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440558; cv=none; b=c/1Sq8q1Af9xD3Agb9laM9o8sTRTolWnZWq6Rl0UfOJwo85FwG5eTvaInGnFNBvxrskh5lnIB+moSyi1IhWn4Heuhcw5++ydIX90kQ/A0BxQeh57pMCg/T//8xd0nNW7VmKxAGsf9PA9aALJWtM60DjoANd60ebKKnFM0XZuhII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440558; c=relaxed/simple;
	bh=81BSCrc7sqM57BMgFxDNqyl9FZHKAtrJNaXJuy2Jp+E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwxbyMWTf0aS2yujvdVoFMq5gOvGzPz1BSKPP9tUUTl4A3/IWbfXDeQQ+K+Ae0qXHoJET22Q0YZm0iGYfRDZtBMi5Oed5s4vvkStButeil8EQKg6dRZ6XXvVH4WJasH/qDDpf7GfrrNzdHQEaxiduHkvC631Tj7CgN1hteVC5ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuHUGN3d; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuHUGN3d"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so21163365e9.1
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 02:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440553; x=1787045353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uCqD/hwZ3cEkZZlublaIkkz2ZnQr9uiH3L75ZZvKAzo=;
        b=QuHUGN3diFIMmSnVGqGg+HCgxHF429dLw4YxlDXrY1Mq8OP92xK9udlTE+fCktDsTg
         eFTbges66vgAju4Giob6QiiY9tQczgE5p4TCk9d3TGKmBm8f8e9X9uwIwLAF/QN312CM
         jBM4UOHMiwwTEoc3isSSanq6XC4CGXf3oE1NPwYhpBxiNMoCOAVgCTfQ8r0u9BVA9rwQ
         WUs8IOhevaINhC055X/qgWV+zkqmp8/ub7JtzMu9sfZFnb+6cGl7fHFoZiAmpDchWhAB
         L1xu5dDpI5EcU4xNIXlWmlh3zGURaHN8Z+E9diViTaNd3KKT4CmrjStVsu/hR/Ch7caz
         Ikog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440553; x=1787045353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uCqD/hwZ3cEkZZlublaIkkz2ZnQr9uiH3L75ZZvKAzo=;
        b=K/TUBryiW0mCfWKeFOsSQ5xE3C/C/ZU3GnrwO0WrhwKJj1VYadaUM6ZP0aJzcEwZSp
         sbygg4PXo8oooVet7NBZOnULPo/8a3r16fk596NEXGye+L5KGPcj7J+P3LS4Fh39Mxab
         6C1pHXkImo/meHcGUujMAtjlPM4XeVxEmUY3eb65/L5kSQMXKkitUEkGdgWcC1FkfKST
         e6iL135hR01E8Mm+vwaKvo/nImlr3gT7mNcDnaaGBQLNg3jl7ggPTv/ZNSYqWf2M+ag1
         ekZVo8OVotlYqI89jAQAYAOPPKCprm06bDf7E1k+D7MffXU7Xln1cjPT5WqBXnE1KMK0
         mPdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp+ZjLIPP25Q2F5uyZrQWfhD4+6kQeSoMLv8h1C+iO98IXv/Vlxig+vBWHLpBgpyMNWkfb@lists.linux.dev
X-Gm-Message-State: AOJu0YwxnbrpXdAMcSYlZtej/jQgkp7dBCViSqbNFYDp8lYhz9S3/oDP
	8dI4zsQeadw3dUawdJs+BPBfwM51nhVl8VcnEpBxCtrNgW5e2mRclBlA
X-Gm-Gg: AR+sD10/SDgY3DYGZUqmKslb2Z3+mhaqPiu8eyIOs7zv0g82nUWX4ww8CoNwyg94uev
	287MjGBK6IYvXs5/kPfpQfhnBg5tWeli+oNjr1JwfMttnfwxrX71X2iE/lcBDVD42Wr/B6oC1Ty
	BRoq+xZvf0R/zRizBEnM5SmMetp8n42Mf7dart60/GTqBnDiPmbZr640oe95ymDznHqDmA2RAFU
	av+CNdn+pGuwy6PkYoHEmZ31iib3EUrYsZlnUTPhZgP3Y/g72ffWxhjCoIGMyHmLq+dUeMxd5HC
	2Iioggv6Pu5seAiYL+uKuRiIueCmWLT9Wwo4ja0kzmadI4iYgz5BhRCnhD0oiwO9esMDDxYhAia
	BVzj0exHCMol/D/MKuHBX1rVEHDDULjzDwgxYZRj8DlzbRLUEPdI/swVbll0vYzNgUuFTJAsd9F
	D1jB9mX6mdsZUiuGO4mqY4smxS1IwpAotYNzFNKBdff909S3lfRSCORyys0etM4+JWxb5tebQ+W
	r2SNkxYwFrKRdXonqX6stLiBQbm+6bT1hMvxzKDEXH9Iu+gFsVIa+AFNmM=
X-Received: by 2002:a05:600c:83c5:b0:499:4b5e:4077 with SMTP id 5b1f17b1804b1-4997847d7b6mr34822395e9.19.1786440552984;
        Tue, 11 Aug 2026 02:29:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:12 -0700 (PDT)
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
Subject: [PATCH net-next v13 06/12] net: phylink: support late PCS provider attach
Date: Tue, 11 Aug 2026 11:28:31 +0200
Message-ID: <20260811092843.673837-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
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

Such PCS is then linked to the phylink instance and the supported
interfaces of the phylink instance get refreshed.

If we are in a major_config_failed scenario an interface reconfiguration
is triggered in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 22 +++++++++++
 drivers/net/phy/phylink.c | 82 +++++++++++++++++++++++++++++++--------
 include/linux/pcs/pcs.h   | 31 +++++++++++++++
 3 files changed, 118 insertions(+), 17 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 25b3248e8b93..fef560eddf2a 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     pp);
+
 	pr_debug("Added pcs provider from %pfwf\n", fwnode);
 
 	return pp;
@@ -201,6 +205,24 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+	fwnode_handle_put(pcsspec.fwnode);
+	return pcs;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get_from_provider);
+
 bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 				 const struct fwnode_handle *fwnode,
 				 struct phylink_pcs *pl_pcs)
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index dbf0e8292f7b..39d742c90db7 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1926,6 +1926,27 @@ int phylink_set_fixed_link(struct phylink *pl,
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
@@ -1958,7 +1979,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 	mutex_unlock(&pl->state_mutex);
@@ -2004,27 +2025,57 @@ static int pcs_provider_notify(struct notifier_block *self,
 	struct fwnode_pcs_provider *pp = data;
 	struct phylink_pcs *pcs, *tmp;
 	bool resolve = false;
+	int count, i;
 
-	rtnl_lock();
+	/*
+	 * On PCS provider deletion hold rtnl lock as one of
+	 * PCS can be currently in use by the phylink instance
+	 * and ethtool OPs can reference it.
+	 */
+	if (val == FWNODE_PCS_PROVIDER_DEL)
+		rtnl_lock();
 
 	mutex_lock(&pl->state_mutex);
 
-	/*
-	 * Loop all the PCS for phylink instance and check if
-	 * this notification is relevant for some of them.
-	 */
-	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
-		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
-			continue;
+	switch (val) {
+	case FWNODE_PCS_PROVIDER_ADD:
+		count = fwnode_phylink_pcs_count(pl->fwnode);
+		for (i = 0; i < count; i++) {
+			pcs = fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
+			if (IS_ERR(pcs))
+				continue;
+
+			phylink_add_pcs(pl, pcs);
+			resolve = true;
+		}
+
+		/* Force an interface reconfig if major config fail */
+		if (resolve && pl->major_config_failed)
+			pl->force_major_config = true;
 
-		phylink_del_pcs(pl, pcs);
-		resolve = true;
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		/*
+		 * Loop all the PCS for phylink instance and check if
+		 * this notification is relevant for some of them.
+		 */
+		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+				continue;
+
+			phylink_del_pcs(pl, pcs);
+			resolve = true;
+		}
+		break;
 	}
 
 	/* Exit early if nothing has changed */
 	if (!resolve) {
 		mutex_unlock(&pl->state_mutex);
-		rtnl_unlock();
+
+		if (val == FWNODE_PCS_PROVIDER_DEL)
+			rtnl_unlock();
+
 		return NOTIFY_DONE;
 	}
 
@@ -2038,7 +2089,8 @@ static int pcs_provider_notify(struct notifier_block *self,
 
 	mutex_unlock(&pl->state_mutex);
 
-	rtnl_unlock();
+	if (val == FWNODE_PCS_PROVIDER_DEL)
+		rtnl_unlock();
 
 	phylink_run_resolve(pl);
 
@@ -2121,10 +2173,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		pcs->phylink = pl;
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index 83e0a2ad4b09..00a636c82c65 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -5,6 +5,7 @@
 #include <linux/phylink.h>
 
 enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
 	FWNODE_PCS_PROVIDER_DEL,
 };
 
@@ -50,6 +51,28 @@ int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_get_from_provider() - Retrieve a PCS from a specific provider
+ * @provider: PCS provider to use
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index specifically provided by
+ * passed PCS provider.
+ *
+ * Unlike fwnode_pcs_get(), this function does not search the global list of
+ * PCS providers. The caller must provide the provider responsible for the
+ * referenced PCS.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative error pointer. Can
+ * return -ENODEV if the PCS is not present in global providers list (either
+ * due to driver still needs to be probed or it failed to probe/removed) or
+ * can return -EINVAL if the PCS provider doesn't expose any PCS for the fwnode.
+ */
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index);
+
 /**
  * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
  * @provider: PCS provider to check
@@ -120,6 +143,14 @@ static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwn
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+			     const struct fwnode_handle *fwnode,
+			     int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 					       const struct fwnode_handle *fwnode,
 					       struct phylink_pcs *pl_pcs)
-- 
2.53.0

