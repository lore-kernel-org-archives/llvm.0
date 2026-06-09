Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD53148C402
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 15:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018005; cv=none; b=if9dd+cNqmH8hWSZQqIcfCdLqr4OkXf7WO4x1jeI6EXS2rRI6b8jGJkzqA5wUUg/T3ttyWzc/XQK44eOJ0SxgIuwVtHEBG6x9/Ys8m5OBngIaywWxRxrov79BNVyWkdpSWTcEq9AnCn3DljDz+N4p6CwY+/4/fjmCIhcYkelslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018005; c=relaxed/simple;
	bh=Voe/pefI1KFM2x+c4luWiQDx2dS7vAkitqmSq+A9chw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6UkJdbHFH7fFDIQ5ewmBDgVS5Hl2P12/H8ScBaOB+FR2uOiz1Z1WGm+HypMHSFqruaIVTprC9PKve37NrM48m54mqg+52kLCtzhFnrEps02bXvwzaTQKgpGSvmroQrjSZ4rGie8V6L6XPxEbOzDjhuXmBUOwVdrqfDKyZ+gatA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQ4BfZZ/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQ4BfZZ/"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec3f69d343so845083466b.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017996; x=1781622796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0LE7NoxIbAtNkQIfgRXFPiPvGYIbbXScFz3Ib6pKBI=;
        b=jQ4BfZZ/aux1QvgCrydSRDQ0V9pfvwHv6wDtZJlm+OU+cAhogmdKCW1ZCw3uYQZRMN
         egB7+VzxY4HCuX92aOT6gvSxv+sn4L1zhzvHb29s2vIWfUr6Lw688regfnkDVnHUUfHe
         QmwX6WQTUdJu7XD4O46EXV/PXG7r/3woQmUsJMtvHpHPMF90gHLi69XgPlQNw/TyFZVE
         cGKN95z3txPYhaXqtEFQesLHD0wXb8u/6aGbKVokVnR3bxg/d5gPwdZbOWXCiUGeM8J+
         y3pxd/HLH7EcR9lY/bec79FU9XwH9vJKNAwCpQGa5Ncw3nrmCarU577gwdkUCxrxOCye
         jtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017996; x=1781622796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0LE7NoxIbAtNkQIfgRXFPiPvGYIbbXScFz3Ib6pKBI=;
        b=WvGLnod/hvOI0H0H7yqGS+3lba1oKanRFYm6HhhZ0Q7XtBynnxK2K1QXFlvLpkE8iH
         vshspeeOb6hVYRn3Y4nx/25SbEdiAhg6Ga4Kco/sWaGNg2iKAVDCUTb8MGUDOK5jNmwO
         MLhHqp8z82XpcQJ1mXjjIElB8agNtdldnJfNq61hbgb88zV5KX6mP/ue/5rOzxCqWIJ+
         JqRVs+bhNPQOu0SNBR95fg2EgPW8ma4MY/prL/dQk+lLFr7gL16cWUf4K6sApSsR5Wj0
         SO875wQu8ndBEox9GfyltpCmwphqplWHxm2Y2wLQk4ATsWLUTDoHJbcnoCf3tBgFX3vX
         Ux+g==
X-Forwarded-Encrypted: i=1; AFNElJ8LFw9wKRSduBSDifN+k/5IGQYGFZLkWzidfpcY8t78M/nVBfP//ESXwPj6IFTxlZXXe+F3@lists.linux.dev
X-Gm-Message-State: AOJu0YyCVfa1g3cTBuaby6tVXo3726xZ5oR9VcSYECg9vB2imB8TyFdH
	VItmdnQf9gFR+/ZAhpROpF1PGbz6m4nJA3QQrm1feyi1eW94wdO2+se4
X-Gm-Gg: Acq92OFQhhkCPtPKpi2nTcN5y5ttmUoe1MHIRJ4MFB0oMPr7L5WciNV7kHC5muboW/u
	naeW+NwMngCxIJNjO40ilodGxzYjtv3ng6+ibHDrOl+vsnlsLM0/qazA2i8qykQLANs/JROBvuF
	IDswtZzZAuXEadOMFi4tZaBAv4x0KYwH6NuKMINCyNALTyvfes8oolqmoSQ6VZqmNmHCGIi/8vT
	WwDzNMrUYrc6mHTbm8Wy46zKws/TzJgwYYDly82kKurAk3YsiteKNxHevjXw9sfmRJ3ZZfcM4tz
	bEeiy7ybjhWQf497yZoHsWZRyDuhG9eTQ+X0feldwHuMGnhNBgDLQCvT5S1QJD2+eyXjUKo/Mdv
	9FJ+DqFJrfsZ2dKIYjC8k0yuTJHehtUXSoY+kNpRGn5l3NbN8bGhv+lvlYGpFGQqUbguNXQNQTs
	Y0Izho7tR5KHKinVEqXcUazK5WEHqAtWF7
X-Received: by 2002:a17:907:2d0d:b0:bce:a1fc:6877 with SMTP id a640c23a62f3a-bf37234ac00mr1075024666b.24.1781017995639;
        Tue, 09 Jun 2026 08:13:15 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 05/12] net: phylink: support late PCS provider attach
Date: Tue,  9 Jun 2026 17:12:01 +0200
Message-ID: <20260609151212.29469-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for late PCS provider attachment to a phylink instance.
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

phylink will then react to this event and will call the new function
fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
provided by the event is present in the pcs-handle property of the
phylink instance.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Then we link the PCS to the phylink instance if it's not disabled and we
refresh the supported interfaces of the phylink instance.

Finally we check if we are in a major_config_failed scenario and trigger
an interface reconfiguration in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 40 ++++++++++++++++++++++++++++++
 drivers/net/phy/phylink.c | 52 +++++++++++++++++++++++++++++++++++++++
 include/linux/pcs/pcs.h   | 48 ++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 72f56f55d198..911d95cf1b09 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -22,6 +22,13 @@ struct fwnode_pcs_provider {
 
 static LIST_HEAD(fwnode_pcs_providers);
 static DEFINE_MUTEX(fwnode_pcs_mutex);
+static BLOCKING_NOTIFIER_HEAD(fwnode_pcs_notify_list);
+
+int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(register_fwnode_pcs_notifier);
 
 struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
 					  void *data)
@@ -55,6 +62,10 @@ int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	fwnode_dev_initialized(fwnode, true);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     fwnode);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
@@ -147,6 +158,35 @@ struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode, int index)
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode)
+{
+	struct fwnode_reference_args pcsspec;
+	int index = 0;
+	int ret;
+
+	/* Loop until we find a matching PCS node or
+	 * fwnode_parse_pcsspec() returns error
+	 * if we don't have any other PCS reference to check.
+	 */
+	while (true) {
+		ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+		if (ret)
+			return ERR_PTR(ret);
+
+		/* Exit loop if we found the matching PCS node */
+		if (pcsspec.fwnode == pcs_fwnode)
+			break;
+
+		/* Check the next PCS reference */
+		index++;
+	}
+
+	return fwnode_pcs_get(fwnode, index);
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_get_from_fwnode);
+
 static int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode,
 				    unsigned int *num_pcs)
 {
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b45bee927300..65b67c33e12f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -12,6 +12,7 @@
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/pcs/pcs.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
 #include <linux/phylink.h>
@@ -62,6 +63,7 @@ struct phylink {
 
 	/* List of available PCS */
 	struct list_head pcs_list;
+	struct notifier_block fwnode_pcs_nb;
 
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
@@ -1998,6 +2000,51 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	return ret;
 }
 
+static int pcs_provider_notify(struct notifier_block *self,
+			       unsigned long val, void *data)
+{
+	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
+	struct fwnode_handle *pcs_fwnode = data;
+	struct phylink_pcs *pcs;
+
+	/* Check if the just added PCS provider is
+	 * in the phylink instance pcs-handle property.
+	 */
+	pcs = fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
+						 pcs_fwnode);
+	if (IS_ERR(pcs))
+		return NOTIFY_DONE;
+
+	/* Add the PCS */
+	rtnl_lock();
+
+	list_add(&pcs->list, &pl->pcs_list);
+
+	/* Link phylink if we are started */
+	if (!pl->phylink_disable_state)
+		pcs->phylink = pl;
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	mutex_lock(&pl->state_mutex);
+	/* Force an interface reconfig if major config fail */
+	if (pl->major_config_failed)
+		pl->force_major_config = true;
+	mutex_unlock(&pl->state_mutex);
+
+	rtnl_unlock();
+
+	phylink_run_resolve(pl);
+
+	return NOTIFY_OK;
+}
+
 /**
  * phylink_create() - create a phylink instance
  * @config: a pointer to the target &struct phylink_config
@@ -2053,6 +2100,11 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
+	if (!phy_interface_empty(config->pcs_interfaces)) {
+		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
+		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	}
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index 33244e3a442b..dfd3dc0f86f6 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,24 @@
 
 #include <linux/phylink.h>
 
+enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
+};
+
 #if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * register_fwnode_pcs_notifier - Register a notifier block for fwnode
+ *				  PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Registers a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain. This allows phylink instance to subscribe for
+ * PCS provider events.
+ *
+ * Returns: 0 or a negative error.
+ */
+int register_fwnode_pcs_notifier(struct notifier_block *nb);
+
 /**
  * fwnode_pcs_get - Retrieves a PCS from a firmware node
  * @fwnode: firmware node
@@ -20,6 +37,25 @@
 struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
 				   int index);
 
+/**
+ * fwnode_phylink_pcs_get_from_fwnode - Retrieves the PCS provided
+ *					by the firmware node from a
+ *					firmware node
+ * @fwnode: firmware node
+ * @pcs_fwnode: PCS firmware node
+ *
+ * Parse 'pcs-handle' in 'fwnode' and get the PCS that match
+ * 'pcs_fwnode' firmware node.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative
+ * error pointer. Can return -EPROBE_DEFER if the PCS is not
+ * present in global providers list (either due to driver
+ * still needs to be probed or it failed to probe/removed)
+ */
+struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode);
+
 /**
  * fwnode_phylink_pcs_parse - generic PCS parse for fwnode PCS provider
  * @fwnode: firmware node
@@ -39,12 +75,24 @@ int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 			     struct phylink_pcs **available_pcs,
 			     unsigned int *num_pcs);
 #else
+static inline int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
 						 int index)
 {
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 					   struct phylink_pcs **available_pcs,
 					   unsigned int *num_pcs)
-- 
2.53.0

