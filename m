Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529973;
	b=sbNpAohsdSgjBTruhnhdGwawvaOQT7yc31Di2IT2Lg7p5bBWqcbu/GftY0Bdy80JDqun
	 PHv6Kdg6YJ1ig5hBtX9nJdRPlLWWzzIL8g42lhdlFpazRH6o+3r3icNcm1VTiacMdfkIq
	 fH3na3UTm0efYrNlP5K4qjwzzZBKbfJa7JnveVnrQbO2Rk5uo7UXXObO5RV2zb8CXn1+E
	 Jffs8flYq6sRPkQsuKFVWjrDwhdu+uaWdaSYqYXHb5Xk2ys4LBGpbeb/24SNdy/X0f9Vv
	 YV6sQF99YAXEN01Nn+bUhPjcMsWG0SiPx6xfAEISGnkMb34s3F9x2zNI1xokLB3j9PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gzJwJGqA9QMdUQ3iiH69qz7c5FpfkTATIbRSyZyT2vY=;
	b=Ob3CDqlNJpkDd9FruaVKSN0Eb252GzCi6oBTbGqjctndenW2tldjPUvjEHMF+wiQxlFw
	 JYtT5T8Fyztn2sPSX6XvahJ1YeVLUr7SYQFIX3fftweMEIMugFUCCFQ9+cRGWKjwso/3j
	 v77v1djvYVf/TYlHU5Q3PzK6GGEELo8pU9QWlC5BGC6h2OtcR+PcUZtqX5TRkS9CHrFjf
	 BewScSdWBCv+f5cx2H1R7rb1h9Uv7WVErf1GlkDAXEmXfE3Gk3jDw01BbjPL/7bnPYMLR
	 yP6QvjkLLeRmUbEjVbnkEmpjs4lbad4EieEXXLR0tHb3NeJ4X848jSFeqIGGF+8YPSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FjfI0LuT;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22E960A6F52
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22E960A6F52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FjfI0LuT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e09aa5264so132748f8f.2
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 16:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529971; x=1795134771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gzJwJGqA9QMdUQ3iiH69qz7c5FpfkTATIbRSyZyT2vY=;
        b=FjfI0LuTorS8XRI6SuWIovGSyw2jqCxU1tujIUH8zYL9jz6m+H3hZ4DqhYtVcoMu48
         7ocaB5DLnylYB2TqabvrzGGJJA/KF0p/QpisNkrpjWjqK1MbEzbzlp33eGAWkVhHmIon
         SLpbRV8jsMpF/HN9lsBzQnOlXhKtdTxbN7mOnB9HZ4H+VLZZBEbpnw71dE4DY21XkZmC
         Zcu0U4c9dIRBnZSxOpiMUkid8/zWNtdXJev1QeOI4pLqDivhM4Gk1JclLDyT9xP7r7AP
         G7PJevPT2bK1EK4TEXxZHDKLgide3xyO1ZrKLIy8GCqnF8qSb/3eroVJEYsM5HL85Div
         5R7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529971; x=1795134771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gzJwJGqA9QMdUQ3iiH69qz7c5FpfkTATIbRSyZyT2vY=;
        b=M0F6AhUi6MJYlSExyG0wmebGWRcimabw8m+AIgRGEnnbSBB/eqg4jqlINkwN/5PXDi
         uhcR92eLIM8iWkT95S1RowO3+i8kwtlEjR//zdf22XQpxMCvVy+RyukWGIiCgFsQCBam
         Jy76EFiotRt5eG6ZiIkCN6GUCSzlklrBSjsjWh9LMiTU9nyeuhUD2YYvTUFYkWqcyrOY
         jAohOdZovB64ivmzLUo3Dz6uAzNBbJMNkaCL4PBnNO9mU2DkkkINEyffFKQhW84Ubfbr
         IEmmqg2zG78fqWjyyqp33ppd/w6PDPawt0Y8T/EPVjsbBa42PVVIjPx37tV206pQQEdU
         2V/A==
X-Forwarded-Encrypted: i=1; AL+hErGaOrZuwkfnXQ3W+I9nZUOB2a6ACCLx3Hnio4mYPO22MAV+69Me7WDz+C65g9ic/6PaBYVP@lists.linux.dev
X-Gm-Message-State: APuU4Z8AaSTiypSJAFmqa4LW7dJrKidljB3O1PGP/genk2RlsnLGh9+F
	tdH+kVxzYFLfPSQ5OMLh2oxJHybpXeoCByN+HUyRhk2tAAKJQP2B1p2g
X-Gm-Gg: AYBFou3XVwvMVJlKJ6pbC+iCzemB4s/tm2cDXmOxYSkrZhpp4jipV/hFfW8bpe0vRXA
	cGL7RJkXwzKGnoE38zN57E3jGzRdjMaAU7E2FRwYZX+jX7A8nf4n3IuUVUaxHcDGPLo5hdXw3Ib
	waoM/XOZxibeW1AtihOt+mmA85uXIVTgItdfIsns3BBAIBPEv86AkdP7ta/xWmZfW+Dc2wp+0Xt
	WmjrdNvTOcsr2EaoKx/hwGHEEdCF0HhQUaljV3l3n0xQMP2Qnn4zPJhzGXrWkfImlEPHrR0c8KB
	gJEtcBNZ7whPWGEaWtNj4Bs0iOo4+dIv0kgNtFTuxMQ/wdn9mOdsmOJVCovpEM6GFFcILh7yrY7
	+hPYQsnYU8Lg15Qi9i5+C+azyaK7m49dC3iv93vss6KiWHkdfTfJs/JnjRKCv1hRRfLXmPRQaF8
	7EG/RfARZlbRA/T3vFISSYSeE25prsu8ykC95+Yza6NTx/7wEFc5HIU1yWW7718uD/VIcNRLlWA
	HAs32lhUr5IyoKliyM2DBzU7DfKq5oA6JwKBjEWUW4mhW3yMDQW1LROmH0GHjTeWxEseIzs2VNR
	npqCg5p19Opl2aPS8K0wFrtYVBJpek7AZjEJIG8p8+qKQmsY2mX1+hlq7SIGuim2R9gs1vIdNX1
	n8jg9z0mpKw7xf8GJ5TJuFN0+LzrAYZv3tgRbQJnH8Zf4oEGOLfe/7+JfMphAyDHvcRiXXgPUfN
	I=
X-Received: by 2002:adf:e003:0:20b0:48e:679a:4b03 with SMTP id ffacd0b85a97d-49c7467a911mr1512554f8f.45.1794529971402;
        Thu, 12 Nov 2026 16:32:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:50 -0800 (PST)
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
Subject: [PATCH net-next v19 09/15] net: phylink: support late PCS provider attach
Date: Fri, 13 Nov 2026 01:31:59 +0100
Message-ID: <20261113003217.197757-10-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 82 ++++++++++++++++++++++++++++++---------
 include/linux/pcs/pcs.h   | 31 +++++++++++++++
 3 files changed, 116 insertions(+), 19 deletions(-)

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
index 243110e21e4b..7f91cf3eb951 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2049,6 +2049,35 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static bool phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
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
+	/* Make sure PCS is not already in the list */
+	list_for_each_entry(tmp, &pl->pcs_list, list)
+		if (tmp == pcs)
+			return false;
+
+	if (WARN(rcu_access_pointer(pcs->phylink),
+		 "%s: PCS already attached to a phylink instance\n",
+		 __func__))
+		return false;
+
+	list_add_tail(&pcs->list, &pl->pcs_list);
+
+	/* Link PCS to phylink */
+	rcu_assign_pointer(pcs->phylink, pl);
+
+	return true;
+}
+
 static int phylink_fill_available_pcs(struct phylink *pl,
 				      struct phylink_config *config)
 {
@@ -2081,12 +2110,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		if (WARN(rcu_access_pointer(pcs->phylink),
-			 "%s: PCS already attached to a phylink instance\n",
-			 __func__))
-			continue;
-
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 out:
@@ -2133,26 +2157,50 @@ static int pcs_provider_notify(struct notifier_block *self,
 	struct fwnode_pcs_provider *pp = data;
 	struct phylink_pcs *pcs, *tmp;
 	bool resolve = false;
+	int count, i;
 
 	rtnl_lock();
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
+			if (IS_ERR_OR_NULL(pcs))
+				continue;
+
+			/* Trigger a resolve only if a PCS is actually added */
+			if (phylink_add_pcs(pl, pcs))
+				resolve = true;
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
+
 		rtnl_unlock();
+
 		return NOTIFY_DONE;
 	}
 
@@ -2398,10 +2446,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		rcu_assign_pointer(pcs->phylink, pl);
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
2.55.0

