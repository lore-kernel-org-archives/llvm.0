Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968E3EF658
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526655; cv=none; b=Aa+kjk2sY1B6Zi7dmeGm0msU2speIBT3IGmHoxqaye1x0FfwbOnKvHOSEDbisMrupx363fO9S+KJnTpcrwFVxHJnO22krfTUYH2QVAvUrkrkzCpDxkT7oI1xUsGF7Y7JUw49/XDtW5SU0XQXndk2NZPzaAo9s2ahl6FUJyko8q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526655; c=relaxed/simple;
	bh=t3ALl6kM5PB5VIrlij+xKf1pj94KMP+Yikc9qj/8DD0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDIR689sJOV3ELm8/ohkagFbk6HntedwMh7NAY5P2XOSgmx8cxKBrE6SFTeDYv1HC+Ts1qX5PGuiFRdf+ZUE8kYbipN3ev9DVqQf5K6mEDmQnKAvaWMr4RcJvPuxnV9NxEaafBfNXT/Q9McWbxQcDp28tHmIJW5UAJAdhnPQDs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsEHN9Eq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsEHN9Eq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b3637b90so24830575e9.3
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526643; x=1782131443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tjTiOW8L5XMvZNg9p3Y/5l4xg/YCEGSjiRSop5LAtE=;
        b=PsEHN9Eqaop9mzOMBltzYXAzhiad9XhcGg+QsAROiJnDX1poNaKfV+IioqGFwKrnqc
         DWenbkLNZJaEjms7Tc32/gK+vaMShQUWMjiVk7lNV0Yq1IKVqg5GRgFo6tYNywIkNl/B
         H4PtLCm83GoUYIhShe+x7KXHGZyglYxraHAnMy31xrAITtxDuhhCpCOlTXgDD6Oxyl0t
         h20JdvoOUPfwqLa5vkFBYUypuoomzGU56gatO2TjpI40vvKnuZy25lqJ/TNP6FvoQbgp
         Zz6HHEzs8STCY88r4N/Au0STY+fp94ksT2NuAKwWffzr9YB5x/6hOcCEYfAdAnZ74t4r
         NUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526643; x=1782131443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tjTiOW8L5XMvZNg9p3Y/5l4xg/YCEGSjiRSop5LAtE=;
        b=iOJhPCaZVXsrX3r6xQe03WgjgP1OBKiQUIk2IuiAeUjjnsV+lnOdHznG7yJxe3eq/y
         aSVnN5sceKb6NC0DZs9GFEmgxiqI7K2BQEvPkQHVWRinVhPAOKek0Mpn3JCBYwKcgb7e
         dE9M6X6F+yfcWzOLImQjUBwUEDouxcoQD0N0IN97qTiyO96SCqmg+Vatjf1tqOLj85/A
         ZyZ4JCpQqDvLy+x+tUo/ARMqrK8M+jFOiIlmrUzL9W3Ir+6yBfV21hDyFH5xPMUP9QsU
         4BUAFht2R0kecE+SvzAebwt28yrursyq1JIG8qDkc5qJIFExfsRM39vaiBSDm3Ey5Gbu
         hBcg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ci1B7TYk2PT/V3k5Alv1uDOuREDM9syU56KN9ngE1kAdZZEKLlW4vZsNJJaB/02VDM8Vf@lists.linux.dev
X-Gm-Message-State: AOJu0YytuHa2BtDFqBHCB088Ec+pARM6Z0Fu8S6WwBZYLQJueM6GpZAs
	/bADZqfChhbvoAPKWfs05M0BmXJaa3dnP1r8vaRs/nAmQL86TPzCcdi5
X-Gm-Gg: Acq92OEExpfLH1s1cVRSLDX4HB/5kB6FjcCxSQCIaV7GYkVeux2wph/WMkF7WbxEwu1
	z30uI2PnkqfXeOkJLGNO7SmTfYXyJIjuun/5iHGAoIr5PzfPafqsou5MwA9TmIM+wgGs5INvf6k
	cT3SGeq8HX/+szJbEH/PIffsIdcVffn43cc+c5c7vVC1tCC/6s3OBy/bnQdHy17rCzT4mKHED/1
	35n+wJYXwPRzvF+CpSq1qy+6bTDZ219NOK5B/EUpbuJbotkqvT/fYu6j+yFHxDK+LGt/lA4eVb1
	7Xh1jtrbBFAIuOa4fRWJ2iNLorFc0nNQEw5qAi5nRMx0zJgEBJJTnB90M47o+YhDvm4XdFDjl2Q
	Fu8gDbc8klEVLSQA5D4PSQIv/DTGvdv/wc2F6nwTmFWln9+d5vL6svv0VYOl65qGO8vrK/H8y4d
	hsv4Jho3VLUx8W8SqMJ9KLW+mrLI1HoptxOoS0Dhn+3KNlPcyhi2+tfRc=
X-Received: by 2002:a05:600c:628f:b0:492:1e36:85dc with SMTP id 5b1f17b1804b1-4922017b005mr124400735e9.36.1781526642421;
        Mon, 15 Jun 2026 05:30:42 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:41 -0700 (PDT)
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
Subject: [PATCH net-next v7 05/12] net: phylink: support late PCS provider attach
Date: Mon, 15 Jun 2026 14:29:41 +0200
Message-ID: <20260615122950.22281-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
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

Then we link the PCS to the phylink instance and we refresh the supported
interfaces of the phylink instance.

Finally we check if we are in a major_config_failed scenario and trigger
an interface reconfiguration in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 49 ++++++++++++++++++++++++++++++++
 drivers/net/phy/phylink.c | 57 +++++++++++++++++++++++++++++++++++++
 include/linux/pcs/pcs.h   | 60 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 67f9716f48fd..713b2ec22c97 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -22,6 +22,19 @@ struct fwnode_pcs_provider {
 
 static LIST_HEAD(fwnode_pcs_providers);
 static DEFINE_MUTEX(fwnode_pcs_mutex);
+static BLOCKING_NOTIFIER_HEAD(fwnode_pcs_notify_list);
+
+int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(register_fwnode_pcs_notifier);
+
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(unregister_fwnode_pcs_notifier);
 
 struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
 					  void *data)
@@ -55,6 +68,10 @@ int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	fwnode_dev_initialized(fwnode, true);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     fwnode);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
@@ -150,6 +167,38 @@ struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode, unsigned int in
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
+		if (pcsspec.fwnode == pcs_fwnode) {
+			fwnode_handle_put(pcsspec.fwnode);
+			break;
+		}
+
+		/* Check the next PCS reference */
+		fwnode_handle_put(pcsspec.fwnode);
+		index++;
+	}
+
+	return fwnode_pcs_get(fwnode, index);
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_get_from_fwnode);
+
 unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	struct fwnode_reference_args out_args;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index ca4dad4b140a..0734c98498a9 100644
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
@@ -1997,6 +1999,51 @@ static int phylink_fill_available_pcs(struct phylink *pl,
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
+	mutex_lock(&pl->state_mutex);
+
+	/* Link PCS with phylink */
+	list_add(&pcs->list, &pl->pcs_list);
+	pcs->phylink = pl;
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	/* Force an interface reconfig if major config fail */
+	if (pl->major_config_failed)
+		pl->force_major_config = true;
+
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
@@ -2068,6 +2115,12 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
+	/* Register notifier for late PCS attach */
+	if (!phy_interface_empty(config->pcs_interfaces)) {
+		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
+		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	}
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2151,6 +2204,10 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	/* Unregister notifier for late PCS attach */
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+
 	/* Drop link between PCS and phylink */
 	list_for_each_entry(pcs, &pl->pcs_list, list)
 		pcs->phylink = NULL;
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index df1e6f32cfad..9de3f273428e 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,36 @@
 
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
+/**
+ * unregister_fwnode_pcs_notifier - Unregister a notifier block for fwnode
+ *				    PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Unregisters a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain.
+ *
+ * Returns: 0 or a negative error.
+ */
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
+
 /**
  * fwnode_pcs_get - Retrieves a PCS from a firmware node
  * @fwnode: firmware node
@@ -20,6 +49,25 @@
 struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
 				   unsigned int index);
 
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
  * fwnode_phylink_pcs_count - count PCS entries described in firmware node
  * @fwnode: firmware node
@@ -53,12 +101,24 @@ int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 			     struct phylink_pcs **available_pcs,
 			     unsigned int num_pcs);
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
 static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	return 0;
-- 
2.53.0

