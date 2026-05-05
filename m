Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50534B8DF2
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005659; cv=none; b=UkyETV425p4YaR2DS5BQ+zwGCdDsn/1DU+qQ/qWCr7xNUN5oGFDuCS2q/EdwMYDceL2XQTKn23ij+ejRYL2NMKFPOH25a8yzo11KLcL9C1G+WaZwLVXVlWzdppNxENfTGg+1bps0pWfv5ULHQKQXab6EwdnUdoytiO1ygBQ3SuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005659; c=relaxed/simple;
	bh=eWqb+hYeuMDNCRC+kSzp+JVKp0mjXiE90tH4W/RAuqc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oKoTL0uWCIQcVEu/yj4WgeFG69UA0lc/dpnDEpJojuQ9oXMYCCR2/EfrperKbttUqrWkm25cfN1FkFplF/dW1Uw92ogMSX7pFb+ih6JqO3OzHdx7kJ0s4vGZ/6j3yCf1IQKAPAPWiYdQFrABVurr3+BxHdRvcD/IV8fRdV+UoEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2wnTP7D; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2wnTP7D"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so988285e9.1
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005655; x=1778610455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+jJ3Ev5z83XCWrTvFk+27nJp1fNAgVtx6YEigYVmiY=;
        b=j2wnTP7Djf/rJd+ZL+lkiIZSv8VXER8wcZfjPmhpAbF3mKyFBdM77eY46VNr9ffoGo
         jlMeONMFjHyOiUK7MHrs9mg/7R7noOY1UPoX6V6wM0EhvQe9ZMGpbKigCAqsffMQharz
         RWe7e0BckJGUzSiCHnqbAIt3oOJkBr6XJngZUq0N0mUa83MWlsE9Xo+bj7BWKKxUN7ua
         +VWcrYxWf42kcSkep1YaSckUxu7ZeKjaL5NnVmC24Fkg63W0EPmj/WDJyrcs27Bg8Xim
         TCTJdY/ebVMALl2LiDkkud03XOfjWa1ysd/WsKF3dmBzJKzLsO/1rEF9mP77LCdapJZS
         TuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005655; x=1778610455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+jJ3Ev5z83XCWrTvFk+27nJp1fNAgVtx6YEigYVmiY=;
        b=YdEEqiSd51WQ7yts8okCgpcpgo52JW4HuyudjzBHP6t2drJab6lGToP1awnJYKP3BK
         1LIF450sCFxAgWTl9gqo3LgPwFfeU+6tRUBxNDTNDtJ+Ym4BdNu02lHXKl9RfvqnW35A
         5GX8ivYguIhsUGi50Xp2W54gWUOGjk8ZgOysLnW5MbwZZ7HGLkSO9DJqwC6vK8plX8JA
         pLxuBTXyX+zekf9lc332YgXIUJrG81yAwpIDPiHpD8OIxmso9HI9dm8j4tnpUGOT+jRV
         GipMCLkS00HxctnPJZz4NwlMtFXQzERCE4UL3Y64WYpO1xmT3iHo7hjH3+25vf3W3XPz
         waHA==
X-Forwarded-Encrypted: i=1; AFNElJ+eUvR1DbhuPn8W4yWB+A7/IeyUBM0oIxqEtUBt7HNmontH3lbD1C6BZW2Hr0lDsgZJDat1@lists.linux.dev
X-Gm-Message-State: AOJu0YwxMpF778urMHV64PVpoxtc11BrTscWP80V/vlLzNUUAVPLdN0+
	9hGzWXmICJgHclygMZKEEOpt4XyNj81x863cHv4I7ykP6yz08p3LZIaw
X-Gm-Gg: AeBDiev3wDMlDJT858RDs4xrhdqGCumOwlw6Gsl3pu8fZBbjQ7Gk8/8c3iIZ343Pa7r
	jByw8o04tKlRwJgJ/ws1ZxCq61JDW1tk0EWEv+Du4ZGlDM9dsdbpw6LEDBc/vkT5XmLCYEFVY2l
	yj/vGklxkc+6jbNUxqAEDOaEQ4whBTXmcilBAjPybEgErgzlumXNJNz7/fU72F5B71GOM3E9VDU
	b4FJq2aD/J6e8yBsHq8sNto2uMUUT+5x7YkTUQQJyIvUGYIFj4wee90t0kC7cGstqiL9wRcP+sW
	Sn9j5PwG2jIXCNaRcKv01TUH4SZ8IczphO1RK6ajXpIOxbMky5eHBYRkuOLO1pcVn3ffcKpbF8D
	rpX15eiaMsNcd+1URA/WlM+fEDDCULKiGBEhZnQsPMh8RD5qeo59LyVxft/Tspv/qhNMqHuq/Yg
	fyRBoDB3JDM2YO6A3G814WLcGnNj1sjGLDErp3Rsb0zXuy0gX9q/Y/+WhPdzhpMHsUFdDdk4YXu
	fOgYOg=
X-Received: by 2002:a05:600c:821a:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48e52286b5dmr1720455e9.7.1778005655002;
        Tue, 05 May 2026 11:27:35 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 05/10] net: phylink: support late PCS provider attach
Date: Tue,  5 May 2026 20:27:06 +0200
Message-ID: <20260505182713.27644-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
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
provided by the event is present in the phy-handle property of the
phylink instance.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Then we link the PCS to the phylink instance if it's not disable and we
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
index ca4f4f655a31..4ef31bb4eb05 100644
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
@@ -1960,6 +1962,51 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static int pcs_provider_notify(struct notifier_block *self,
+			       unsigned long val, void *data)
+{
+	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
+	struct fwnode_handle *pcs_fwnode = data;
+	struct phylink_pcs *pcs;
+
+	/* Check if the just added PCS provider is
+	 * in the phylink instance phy-handle property
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
@@ -2015,6 +2062,11 @@ struct phylink *phylink_create(struct phylink_config *config,
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

