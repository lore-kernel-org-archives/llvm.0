Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653093;
	b=Dqa33o61UYAVElPENrst8Lvxd+NJDWJHZz7fyyTMDQWLLT4Aon4vLi6kGf7F6Wwl0yqg
	 54IG3XVebEnYBrixGdtMzUGiXhBQhWevzWpzFT5iBuKq8fD+swusEFdjvmbUqSr8/Klry
	 8kC6Lat9DirdBPgASqwfaB4Ue0xGiJQGq2e4e+EGIttFr6Bp1R40bJg1PFUdJmu72manN
	 7zuZk2oerBhOf0phdKpYeeV17GbcSucUGJ8LZAwna515vVzH7fe4wDM1VCfDNoTQQUOSk
	 Y3aTiF6a2300sUvfDjqHEmHjL2IcUhS75ahNT5f4vZOVeU7gFbu70Bf77eSf1tnAQ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ob2EIo0m2AuP+fLPWE6b5DDf72VtjDVDoAlCmtfRBv4=;
	b=TdsvcqgsU4e+hjLMyv/qFNKDIyrErJ7s3fehO1bpCH9qfmay19zWhNgiPJ8QaxmzmJqG
	 NRpc/5VQgUAZYMnTdtvZ0Yw7Hw1W6gYrMYH1zEDXxMprc7wFLsI4ONl2GNuRF34qv5IXd
	 Ciawoukxnni+A352o1XYVTJu+pOxQoZFLdBOyVo9WHrMbtfxNBbM0g92N24Cky4g+9DlB
	 3+Od8Kvq0M4WgJY1rCStjeCBhJO2zdORLT5cgVIkj1b9V4X1qXUyrpjT94Jyt/DyuR1DY
	 d1SHqh8hFI4BoxE7yFFoYhw37mkXWG/uXFAiTe6r4/jKbxLHEvgoF3o61f6o3sc+24A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0UDTCet;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8045F606A8A8
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 10:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8045F606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0UDTCet
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214af2076so11388475e9.0
        for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 02:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653092; x=1795257892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ob2EIo0m2AuP+fLPWE6b5DDf72VtjDVDoAlCmtfRBv4=;
        b=f0UDTCetF7wF5YXuALDzJwGQ486lb7rhqv1M9Wiq9BGiJVPotwyjP862j2JVwrPQh0
         urOj+wrO1oBUubhHN5dWDEi6l6bt/xkTtRarXKBNNxXLJ5jX7rPkO4IWfwqkZF8CSNHy
         0uEMYidDEeHWwkK638BdqpfASpyFzQNi5MNnrNYDndXm3XryT6ifX6Ut412qWGPKr552
         g2R3BO4yCFAvKFNI16F7nOBjN2KF3u3FmdzTOc5m16NEqM8+9v9mNycqiJfGXkpgAJj1
         5LgmRnn0TcgrT75qA8TAW6aP/RLHkkhga2qx6anv9n6mPH/UXeDe4yq5vyCpsqS+QieE
         Fhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653092; x=1795257892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ob2EIo0m2AuP+fLPWE6b5DDf72VtjDVDoAlCmtfRBv4=;
        b=AxFKTnVGv/ofUMSM96ZJEay+thAUKjLkHigcKVK3kuN6jLl+xMdZ83p1+J63Xe5NOE
         1sXIYIgAAQaga2Eon/PjvDMBZBaseAwtkaRijF2c1HJH2aVdbKKEAualYOXOe1LjfY3T
         TsGyLPAHZuplkLFdnjeyqv6jOb8REWkDMPilTfRvcjDqHHenyTL9EcXI/SZGKrub1P+r
         NbOHQedMN+jg0wirrARiY+Bckei89KG3PzzEwKMUL//voIDXz7MqtXC8jDiX/ouF0yct
         UumApRgBKCF/03Boggt/cDDCOdc5CC6cSCjw+oH62SrXTLO6Se9HHd8ozWXubM4+c+EB
         FSmA==
X-Forwarded-Encrypted: i=1; AL+hErHXhQbp2MeM/Gt5FYSJCgAQpAFEKVzVI+GtAWhcDw19qTFKbkzhp7dRWq6Xidt0dO/hF8la@lists.linux.dev
X-Gm-Message-State: APuU4Z8ld5hEWTSa1sVKIDwpiouE8uvWRXcNTCrqyJ7ZFqLC4/NXOKOh
	moGtD3S/OTQm+4uPxZndPryuLIv5P/44Y2rZ+MjP1NJQEvGDTKEq//he
X-Gm-Gg: AYBFou1oDAxV5mi7znjRqt8F9mKljW12HmhwucHfLzY55DnXvyoomM03alDeJhUw0lE
	wM8R3NUvHUjvWnIBxzjErJMLh6CgzN9nq9ODatovVp//bT/Hv9NDHr48fI+lGqBFnJYJ7UNaK/Y
	z7MG6+UMl09n/p+D+Zm1C1DNEpFnvI+Z0J8Et/qRZ5lsJ0LXoNKM2L/CQn5iNx71eaothnY8lR6
	bzopoU2GOnqgxqelt6zQDcs3JwoJldYKkEgjnoYvz0QVQgDi6dnEnz3mwXbkRFBQLSvZ0QrCa/J
	k6LB6v4QSTDcFBELH32vFtOAm5CWatFjwCXfzakb5e31e8rjhODBSNBimfCukPNIImZkYSOSZQP
	WGOTln7ZF5kqkgweOO4G4crjmyfto+EqVx5/uZZe5dXLcmnWkN0MSgcDA+8Gmz6e+0Ls3yG41JP
	mEd4syKEKrLzoGiyLgvxrebUwg3SehAEZBdDJjFbVFAQmkeGW9Y4fPOQUxmlY+wPGXuTQeE/oLQ
	Yu3Q4H54XNHo754JjA9g4vQJXqESxWYhUazu3QrMALSu+H2iFPJ0nmLOR6f0LRI5lXXEXtnDAj/
	PiAn/+qwj48egbQKj5oZWZ7xVmxLoAG5o+7WtznAQDhqZyqsVW6o/BVrmEiXiFXb8XTRxp+6MRP
	Iz4wjREgfNmpd7D/1xW8p+KhpQkkkvYSb/w==
X-Received: by 2002:a05:600c:548e:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb5c92cedemr72677785e9.17.1794653091746;
        Sat, 14 Nov 2026 02:44:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:51 -0800 (PST)
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
Subject: [PATCH net-next v20 09/15] net: phylink: support late PCS provider attach
Date: Sat, 14 Nov 2026 11:43:48 +0100
Message-ID: <20261114104426.235620-10-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 80 +++++++++++++++++++++++++++++----------
 include/linux/pcs/pcs.h   | 31 +++++++++++++++
 3 files changed, 114 insertions(+), 19 deletions(-)

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
index f8fc52c73646..2bf7a1ecebd6 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2043,6 +2043,35 @@ int phylink_set_fixed_link(struct phylink *pl,
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
@@ -2075,12 +2104,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
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
@@ -2127,20 +2151,42 @@ static int pcs_provider_notify(struct notifier_block *self,
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
@@ -2392,10 +2438,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
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

