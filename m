Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA97F3D7D94
	for <llvm@lists.linux.dev>; Sun,  9 Aug 2026 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307495; cv=none; b=k+91BCTOw0/J7ryIQ/xgZwv1BDdhd4XZckkToRIhO0HbFRXOSG7zZ+2IzMBWqs+bbmyPh3AQLWnz/+PwjO+PZhXQWm1+vqwo6td4N4NBF+nInqZzjTlRwri1F7RFXjhjVqSxWEos14IzbXffixfebqiA7YfgJ+rnRUnfIygvI5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307495; c=relaxed/simple;
	bh=ogxahKTchHVknKx3ojLCPylD6LByJnXx2mmceBQubjM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LI8RAvFCZ5dUrVAJye4jFVspA/bQosdeipSG6RtUWOT1bS/gDzx8phXJF8rY8Dir9Ml4fjsVIDu21gjAcbsH7+dtXoShvOccS7QB2y52MxyiWbQmX4S8i9KU3lGin3PuYET219ozxPgCltsUVBLtk5UDh9ObEaWIbr1/TRyJnyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqiemN+T; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqiemN+T"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495635a85d2so11115815e9.0
        for <llvm@lists.linux.dev>; Sun, 09 Aug 2026 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307491; x=1786912291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ngvosf91hmBVMq6bS0vt84H6U/aRqBZze6sauo8/k/M=;
        b=RqiemN+TeBR5M9XU1SG/EvY8bF2a47BRwQdozpCyPw7GNb5735ufZ5TBSdlClN87G9
         B2WJ8aOluHeN06GF6NtDuhU/gflMBmqzcb3zmS2iR2YYh4/45vm4otFkHd4GYAOWsb+n
         J6tRKpPor8+822M4DhnMxLikI3kMmrLUhanG5Cte6pIriQm5yuVURa8K6MJnfV1p1gWm
         8J4QrHQiZ5AmusUSQxryrHax9wTEa9nQkYIiJc1ggDAVuqX8XuIxjHFdgU5ZT/jUXWwY
         7QvQjZHJdF9buWxYx0h7Hk+0fKkeCp/VmejFEN7zY9HwaTC95rEr7zAzsM0d5AiGJd4X
         S8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307491; x=1786912291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ngvosf91hmBVMq6bS0vt84H6U/aRqBZze6sauo8/k/M=;
        b=Bog/kpoOc+uMq8/khEnr4Nd86WuBKl5/eAXZeRwHPbksLcMsW3SYc3M+AhsCqTdw7W
         73/jKZt6vy38dY70Zhb+VlchV3n0zwly/gyOTmipwAVFVMKh4KBTTt1xsJ+dCgOGGdKw
         VAEx72snbn3exSP5rTMsP+/s+juqV57nGgZZw9oJeyfveqfzWJpFyJZcvtPU4l49onj3
         5UWDD23pYG3H1yrZuFbn/+C0tq8BcfYrUh7CsuGRb5AdvK0chTe+P+Mks9lkBLF72y4l
         Gs4mvji6rClUY/R/4TE9coqwdChjpmWwjrEtTxGlZOw9UyCaN1oi3b0ogiI/q+MzZU8u
         AdmA==
X-Forwarded-Encrypted: i=1; AHgh+RpPQb4jNaDQXTXI/D6sMGz4t0bG4w3VdYaeaIN/d+3zFnw2uiYtaLdn0GR6mrLORKbUNDbA@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/CA1GvtFGemcMU/cWyFCANr3sAEITl2fpiBLUWpdLx+OEGg+2
	voqZjn3vnSClKfBA9c459GUzW9H9AXM7QvuXadhrNEwcKWR4eWr2RDB6
X-Gm-Gg: AR+sD101HjdyUrLPlB5P66vi3WjFvAFNyJPY3xtY61f87XyeaXRQNta/NiKr8ruT6UW
	qp7qYQ8NI+dYRIEHcnqL5cbJd0nMDmwalDNxSjM2Q8wHZ4Od57QBUphsEkBAVNyzC118tX24cx6
	+9wkaunqwOSKEGl4CFSkIqNbLkBN8smnUlomXO2UL9h2LncnJO1D4RBOlUMqZP6p3cTbqH5FFLg
	WDc0Dn9w7GbopkwkkItOEh6qcKQkSUgdTENZRVe0YbgqaH5cQKdH/Dg0OpudjUhDqq5OOCFkjUF
	L1nkuHcc9/RMQKQcDC6CUu9X7ZexgW/iuf52lSvbMnaBgpRIARIceXCoPVipp5jNX+pgMEHc9lz
	qZ6xQyZE7nEH95flZOQgq3OTcIBWJ+Z9crjAhEQl4+bR0zqkGN7QnmVH6oAQ54z5pjn0867nQ+Z
	5Sjvpi58HyNfRRK/LUyD38VuJIrxx6ngCaxhzkEuv7C7oqHVDkx4OWo45usv7e5zibC5qjW9Tgy
	+OAVvlxnJMa5kjWMv+i6Yal97ERY9kCGi0fGmDxTudAgqim
X-Received: by 2002:a05:600c:19d2:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-4994e7c10c6mr494006255e9.12.1786307490675;
        Sun, 09 Aug 2026 13:31:30 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:30 -0700 (PDT)
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
Subject: [PATCH net-next v12 02/12] net: phylink: introduce internal phylink PCS handling
Date: Sun,  9 Aug 2026 22:30:59 +0200
Message-ID: <20260809203116.640271-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce internal handling of PCS for phylink. This is an alternative
way to .mac_select_pcs that moves the selection logic of the PCS entirely
to phylink with the usage of the supported_interface value in the PCS
struct.

MAC should now provide a callback to fill the available PCS in
phylink_config in .fill_available_pcs and fill the .num_possible_pcs with
the number of elements in the array. MAC should also define a new bitmap,
pcs_interfaces, in phylink_config to define for what interface mode a
dedicated PCS is required.

On phylink_create(), an array of PCS pointer is allocated of size
.num_possible_pcs from phylink_config and .fill_available_pcs from
phylink_config is called passing as args the just allocated array and
the number of possible element in it.

MAC will fill this passed array with all the available PCS.

This array is then parsed and a linked list of PCS is created based on
the allocated PCS array filled by MAC via .fill_available_pcs().

Every PCS in phylink PCS list gets then linked to the phylink instance
by setting the phylink value in phylink_pcs struct to the phylink instance.
Also the supported_interface value in phylink struct is updated with
the new supported_interface from the provided PCS.

On phylink_destroy(), every PCS in phylink PCS list is unlinked from the
phylink instance by setting the phylink value in phylink_pcs struct to NULL
and removed from the PCS list.

phylink_validate_mac_and_pcs(), phylink_major_config() and
phylink_inband_caps() are updated to support this new implementation
with the PCS list stored in phylink.

They will make use of phylink_validate_pcs_interface() that will loop
for every PCS in the phylink PCS available list and find one that supports
the passed interface.

phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
where if a supported_interface value is not set for the PCS struct, then
it's assumed every interface is supported.

A MAC is required to implement either a .mac_select_pcs or make use of
the PCS list implementation. Implementing both will result in a fail
on phylink_create().

A MAC defining .num_possible_pcs in phylink_config MUST also define a
.fill_available_pcs or phylink_create() will fail with an negative error.

phylink value in phylink_pcs struct with this implementation is used to
track from PCS side when it's attached to a phylink instance. PCS driver
will make use of this information to correctly detach from a phylink
instance if needed.

phylink_pcs_change() is also changed to verify that the PCS that triggered
a link change is the one that is currently used by the phylink instance.

The .mac_select_pcs implementation is not changed but it's expected that
every MAC driver migrates to the new implementation to later deprecate
and remove .mac_select_pcs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 200 +++++++++++++++++++++++++++++++++-----
 include/linux/phylink.h   |  16 +++
 2 files changed, 194 insertions(+), 22 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b7180ae76cc8..b69050f22717 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,9 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* List of available PCS */
+	struct list_head pcs_list;
+
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
 	 */
@@ -517,12 +520,29 @@ static void phylink_validate_mask_caps(unsigned long *supported,
 	linkmode_and(state->advertising, state->advertising, mask);
 }
 
+static int phylink_validate_pcs_interface(struct phylink_pcs *pcs,
+					  phy_interface_t interface)
+{
+	/* If PCS define an empty supported_interfaces value, assume
+	 * all interface are supported.
+	 */
+	if (phy_interface_empty(pcs->supported_interfaces))
+		return 0;
+
+	/* Ensure that this PCS supports the interface mode */
+	if (!test_bit(interface, pcs->supported_interfaces))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int phylink_validate_mac_and_pcs(struct phylink *pl,
 					unsigned long *supported,
 					struct phylink_link_state *state)
 {
-	struct phylink_pcs *pcs = NULL;
 	unsigned long capabilities;
+	struct phylink_pcs *pcs;
+	bool pcs_found = false;
 	int ret;
 
 	/* Get the PCS for this interface mode */
@@ -530,9 +550,24 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
 		if (IS_ERR(pcs))
 			return PTR_ERR(pcs);
+
+		pcs_found = !!pcs;
+	/*
+	 * Find a PCS in available PCS list for the requested interface.
+	 *
+	 * Skip searching if the MAC doesn't require a dedicated PCS for
+	 * the requested interface.
+	 */
+	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
+		list_for_each_entry(pcs, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(pcs, state->interface)) {
+				pcs_found = true;
+				break;
+			}
+		}
 	}
 
-	if (pcs) {
+	if (pcs_found) {
 		/* The PCS, if present, must be setup before phylink_create()
 		 * has been called. If the ops is not initialised, print an
 		 * error and backtrace rather than oopsing the kernel.
@@ -544,13 +579,10 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 			return -EINVAL;
 		}
 
-		/* Ensure that this PCS supports the interface which the MAC
-		 * returned it for. It is an error for the MAC to return a PCS
-		 * that does not support the interface mode.
-		 */
-		if (!phy_interface_empty(pcs->supported_interfaces) &&
-		    !test_bit(state->interface, pcs->supported_interfaces)) {
-			phylink_err(pl, "MAC returned PCS which does not support %s\n",
+		/* Recheck PCS to handle legacy way for .mac_select_pcs */
+		ret = phylink_validate_pcs_interface(pcs, state->interface);
+		if (ret) {
+			phylink_err(pl, "selected PCS does not support %s\n",
 				    phy_modes(state->interface));
 			return -EINVAL;
 		}
@@ -964,12 +996,22 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 					 phy_interface_t interface)
 {
 	struct phylink_pcs *pcs;
+	bool pcs_found = false;
 
-	if (!pl->mac_ops->mac_select_pcs)
-		return 0;
+	if (pl->mac_ops->mac_select_pcs) {
+		pcs = pl->mac_ops->mac_select_pcs(pl->config,
+						  interface);
+		pcs_found = !!pcs;
+	} else if (test_bit(interface, pl->config->pcs_interfaces)) {
+		list_for_each_entry(pcs, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(pcs, interface)) {
+				pcs_found = true;
+				break;
+			}
+		}
+	}
 
-	pcs = pl->mac_ops->mac_select_pcs(pl->config, interface);
-	if (!pcs)
+	if (!pcs_found)
 		return 0;
 
 	return phylink_pcs_inband_caps(pcs, interface);
@@ -1264,10 +1306,36 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 			pl->major_config_failed = true;
 			return;
 		}
+	/* Find a PCS in available PCS list for the requested interface.
+	 * This doesn't overwrite the previous .mac_select_pcs as either
+	 * .mac_select_pcs or PCS list implementation are permitted.
+	 *
+	 * Skip searching if the MAC doesn't require a dedicated PCS for
+	 * the requested interface.
+	 */
+	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
+		bool pcs_found = false;
+
+		list_for_each_entry(pcs, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(pcs,
+							    state->interface)) {
+				pcs_found = true;
+				break;
+			}
+		}
 
-		pcs_changed = pl->pcs != pcs;
+		if (!pcs_found) {
+			phylink_err(pl,
+				    "couldn't find a PCS for %s\n",
+				    phy_modes(state->interface));
+
+			pl->major_config_failed = true;
+			return;
+		}
 	}
 
+	pcs_changed = pl->pcs != pcs;
+
 	phylink_pcs_neg_mode(pl, pcs, state->interface, state->advertising);
 
 	phylink_dbg(pl, "major config, active %s/%s/%s\n",
@@ -1294,13 +1362,15 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 	if (pcs_changed) {
 		phylink_pcs_disable(pl->pcs);
 
-		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+		if (pl->mac_ops->mac_select_pcs) {
+			if (pl->pcs)
+				pl->pcs->phylink = NULL;
 
-		if (pcs)
-			pcs->phylink = pl;
+			if (pcs)
+				pcs->phylink = pl;
+		}
 
-		pl->pcs = pcs;
+		WRITE_ONCE(pl->pcs, pcs);
 	}
 
 	if (pl->pcs)
@@ -1833,6 +1903,44 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static int phylink_fill_available_pcs(struct phylink *pl,
+				      struct phylink_config *config)
+{
+	struct phylink_pcs **pcss;
+	int i, ret;
+
+	if (!config->num_possible_pcs)
+		return 0;
+
+	if (!config->fill_available_pcs) {
+		dev_err(config->dev,
+			"phylink: error: num_possible_pcs defined but no fill_available_pcs\n");
+		return -EINVAL;
+	}
+
+	pcss = kzalloc_objs(*pcss, config->num_possible_pcs);
+	if (!pcss)
+		return -ENOMEM;
+
+	ret = config->fill_available_pcs(config, pcss, config->num_possible_pcs);
+	if (ret < 0)
+		goto out;
+
+	for (i = 0; i < config->num_possible_pcs; i++) {
+		struct phylink_pcs *pcs = pcss[i];
+
+		if (!pcs)
+			continue;
+
+		list_add_tail(&pcs->list, &pl->pcs_list);
+	}
+
+out:
+	kfree(pcss);
+
+	return ret;
+}
+
 /**
  * phylink_create() - create a phylink instance
  * @config: a pointer to the target &struct phylink_config
@@ -1854,9 +1962,20 @@ struct phylink *phylink_create(struct phylink_config *config,
 			       phy_interface_t iface,
 			       const struct phylink_mac_ops *mac_ops)
 {
+	struct phylink_pcs *tmp, *pcs;
 	struct phylink *pl;
 	int ret;
 
+	/*
+	 * Make sure either PCS internal validation or .mac_select_pcs
+	 * is used. Return error if both are defined.
+	 */
+	if (config->num_possible_pcs && mac_ops->mac_select_pcs) {
+		dev_err(config->dev,
+			"phylink: error: either phylink_config .num_possible_pcs or .mac_select_pcs must be used\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	/* Validate the supplied configuration */
 	if (phy_interface_empty(config->supported_interfaces)) {
 		dev_err(config->dev,
@@ -1871,6 +1990,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->phydev_mutex);
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
+	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
@@ -1883,9 +2003,24 @@ struct phylink *phylink_create(struct phylink_config *config,
 		goto free_pl;
 	}
 
+	/* Fill the PCS list with available PCS from phylink config */
+	ret = phylink_fill_available_pcs(pl, config);
+	if (ret < 0)
+		goto free_pl;
+
+	/* Link available PCS to phylink */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		pcs->phylink = pl;
+
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
+	/* Update supported interfaces */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
 			       pl->config->lpi_capabilities &&
@@ -1917,7 +2052,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
-		goto free_pl;
+		goto unlink_pcs_list;
 
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
 		ret = phylink_parse_fixedlink(pl, fwnode);
@@ -1936,6 +2071,11 @@ struct phylink *phylink_create(struct phylink_config *config,
 release_link_gpio:
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
+unlink_pcs_list:
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+		list_del(&pcs->list);
+		pcs->phylink = NULL;
+	}
 free_pl:
 	kfree(pl);
 	return ERR_PTR(ret);
@@ -1953,11 +2093,20 @@ EXPORT_SYMBOL_GPL(phylink_create);
  */
 void phylink_destroy(struct phylink *pl)
 {
+	struct phylink_pcs *pcs, *tmp;
+
 	sfp_bus_del_upstream(pl->sfp_bus);
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
 	cancel_work_sync(&pl->resolve);
+
+	/* Remove every PCS from phylink PCS list */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+		pcs->phylink = NULL;
+		list_del(&pcs->list);
+	}
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
@@ -2409,8 +2558,15 @@ void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
 	struct phylink *pl = pcs->phylink;
 
-	if (pl)
-		phylink_link_changed(pl, up, "pcs");
+	/*
+	 * Ignore PCS link state change if the PCS is not
+	 * attached to a phylink instance or the phylink
+	 * instance is not currently using this PCS.
+	 */
+	if (!pl || READ_ONCE(pl->pcs) != pcs)
+		return;
+
+	phylink_link_changed(pl, up, "pcs");
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 2bc0db3d52ac..ca9dfc142388 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -12,6 +12,7 @@ struct ethtool_cmd;
 struct fwnode_handle;
 struct net_device;
 struct phylink;
+struct phylink_pcs;
 
 enum {
 	MLO_PAUSE_NONE,
@@ -151,6 +152,8 @@ enum phylink_op_type {
  *		     if MAC link is at %MLO_AN_FIXED mode.
  * @supported_interfaces: bitmap describing which PHY_INTERFACE_MODE_xxx
  *                        are supported by the MAC/PCS.
+ * @pcs_interfaces: bitmap describing for which PHY_INTERFACE_MODE_xxx a
+ *		    dedicated PCS is required.
  * @lpi_interfaces: bitmap describing which PHY interface modes can support
  *		    LPI signalling.
  * @mac_capabilities: MAC pause/speed/duplex capabilities.
@@ -160,6 +163,10 @@ enum phylink_op_type {
  * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
  * @wol_phy_speed_ctrl: Use phy speed control on suspend/resume
  * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
+ * @num_possible_pcs: num of possible phylink_pcs PCS
+ * @fill_available_pcs: callback to fill the available PCS in the passed
+ *			array struct of phylink_pcs PCS available_pcs up to
+ *			num_possible_pcs.
  */
 struct phylink_config {
 	struct device *dev;
@@ -172,6 +179,7 @@ struct phylink_config {
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+	DECLARE_PHY_INTERFACE_MASK(pcs_interfaces);
 	DECLARE_PHY_INTERFACE_MASK(lpi_interfaces);
 	unsigned long mac_capabilities;
 	unsigned long lpi_capabilities;
@@ -182,6 +190,11 @@ struct phylink_config {
 	bool wol_phy_legacy;
 	bool wol_phy_speed_ctrl;
 	u32 wol_mac_support;
+
+	unsigned int num_possible_pcs;
+	int (*fill_available_pcs)(struct phylink_config *config,
+				  struct phylink_pcs **available_pcs,
+				  unsigned int num_possible_pcs);
 };
 
 void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
@@ -497,6 +510,9 @@ struct phylink_pcs {
 	struct phylink *phylink;
 	bool poll;
 	bool rxc_always_on;
+
+	/* private: */
+	struct list_head list;
 };
 
 /**
-- 
2.53.0

