Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846883;
	b=G2qsukDvg+udPYF7u+fH7FpN9gWPnLmqfNWdz4xFufcllhpCfKdg0RO/KnKOFjlml3Jk
	 gv+t2NT9War6/rZkjjHpRtcvXRpceggMOtWWQVPQhABPZalBX6743MqayjGNJsfcJW7tL
	 y8LUyZMF9i/KgPBiwbuvZko4xfachDLWv5fXlJCAFaV4e+UkjpQYPDqikpljNRAetIxSL
	 Th0TIc+8UU/xhZYgPdM3uwobiNy+8TGgK9SE4aj7iZtYXl3d/EFtqzWFW14A4+0IkXgYh
	 Ae2YYLP1ItkpW8g84VhL+KQN85/AieEzRhCxVtegkqUJmHIkKPvIIS/WvYZkN925BUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=;
	b=D2HcBlc/B4Z2AzQN33Z7tzOiefzjSsrT4lJk5y22fgNLIh3EIRjvCGLjKRwiwBqv3h2P
	 O+zjncJpidq8SYkzBEVc+3YoPA+89Cv4d9hxJKqp6Hjueei70mm/lPYPhfccbXYxbze45
	 204bH6wFOwXLfdYE2CRb40FxITUlZv4metR6lAdXy1jKTYAoJW5PbFym4MnKqOUMuEQs+
	 OBUYUTWgemP4f2YdCIOlabpZCQkDM7FWNV9WKXwwA1o03FIka2G0Pphq3Fzw+PH/3XQZv
	 4Q76rAgkjhU/m4Wg117S2/fWCbNWgLMsvDh9d4pZ3knVFtTi5k3Uve2FkYV9eBc5u7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Gzc/1efm";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DC960A260A
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DC960A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gzc/1efm
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49a92144733so1463881f8f.0
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 08:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846881; x=1795451681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=;
        b=Gzc/1efmZ8Bxxb72B/cEYvgDpTwqHjIz088GN28uS3xNut6hakfEExumGL06pYXqwE
         w+tPEY0MJDvjatGHYJTFAs9wTSzExo696mJunec3QzPiMLD+uFaEz8DmitT77BcrtV7G
         A1mipcmrQGaqcL6ewb/f7P0mBGQTQGfEDb6DwOGW+wZwlDLFgWKyoEhAuSh+CerIFjTx
         y8p3zJapHLmqPI8mjU68rbDesvupW4jUui+iCKgeFAriqys+uXy097Dp+HnEq+vq2M8D
         LE8z4ShpU6N2ObkFBKhecR5AM7RqUFdq6FSQeT/5WkONeHrh5mr3406pDruiktNTMBbM
         N1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846881; x=1795451681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=;
        b=PjCfiBuFdBlFDcg4iH2Yvjk1/stnxktd4QA9dXGiczXbryPC/mZ0iEFOaJop9lLgKc
         qNX+0XO7h7Mnx/SQl3aH53k5Qtpc9CDrLQMYSLa9C+Snf4hE3I3pnCJ0JXB3dtMAWwxv
         B8dKxHCMMVuwBMNDzWcP3vkJxIZ1Kl+2w0yoPwViYR/HUjCJ5jQHaCVzmLrz5YXnC38f
         zhVQ4tMyO92FIA5MGi7+Utg12QWscSNv1GNUJTF3FW4kVyZI5LiVf1PzrTnfvubx0giI
         Pg8OhwMhZOVrmwdgeW8olZADg5NJSP5q/sIeg63v3ihPLTlW/rH9MfwL2XeR7T0EKY6S
         A9bw==
X-Forwarded-Encrypted: i=1; AL+hErF9dOQZXAG7w00fyXblHHYKyZDa3lbFv8Cd021WYZ0pr43dZxLHDkqYfOaBGbg4FKTgIHUb@lists.linux.dev
X-Gm-Message-State: APuU4Z+wfmHjdH0pLnqZ/V8kslCQD8viu6eBtGIQVuBEe5WAnshG2f85
	0gZ2Siot1cShUyjGfMlAkPzRK51ERwm3ZHXjyKgnS7wflTo8znGIujLC
X-Gm-Gg: AZFdTZe2jOt+xVBQ/jHnT2ViEJbjnjLOUsFtRoZVSWiubxfT7qOtz80++EOKjJCfSsQ
	nWbdsRdxwSu1aNqDg3TESnNsTnOTHJQQTtICgdCYAg5sRVrKTyhSwXnuGTeaLkrb/CKMcUKYBSS
	xssIHFWXOffbid8/YWzJ4KVTeTmE6ZRV5MhZNZQX2fhDKbZ7t7NpdW+Cri5/1Ehhm5qOh0wldUe
	O1TMY5shwhmj9WBNEqffGlukCY7juX9W5xk0jan+ckJu2uFej82iBzJ4QehL0YKrVHRdq9fyf+5
	BTC8D5qP8D1W7MJEWMhhIVboq3MHDE4j2KKmo1xuB++mBNTKxIyF6Vz5z5+0NqVwxVPP2NzYHps
	mQPecUKOQzhoOptGu+6PhMXSRhxe0HIywKoqPAYM1ncko/aEl/Zu26UGvwhjoALFEsASsQZSDXB
	pCfdyCm3Vdx0C2n1N4WsnWY30lUPgFG4f1OLblf+LkjxaaYqhol4UmnSBw+MdQKvPnwtM5gDLSA
	qyxgnJrB94Q9WFnMKoBXF8lIJR/SWeiTzubaoCttV8W53jzOieR9IBvWF8j4Vt5n3hioMTD2803
	Fm8gxx5tdJT+pkjX4daXnaAGsLiDylmu4BvzFgMOQeCtsKDHJngCi7WRh3cPP8eAs8+f410iPjq
	LYPD1NEpKkOVvziWGj8KIECK9idq95Fyirw==
X-Received: by 2002:a05:6000:4022:b0:491:971a:c568 with SMTP id ffacd0b85a97d-49c712ac9b2mr28115259f8f.10.1794846881237;
        Mon, 16 Nov 2026 08:34:41 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:40 -0800 (PST)
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
Subject: [PATCH net-next v21 09/15] net: phylink: support late PCS provider attach
Date: Mon, 16 Nov 2026 17:33:53 +0100
Message-ID: <20261116163412.551438-11-ansuelsmth@gmail.com>
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
is triggered in the next phylink resolve with a new phylink resolve right
after with the new AN mode reevaluated if a new PCS is selected.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  22 ++++++++
 drivers/net/phy/phylink.c | 110 ++++++++++++++++++++++++++++++--------
 include/linux/pcs/pcs.h   |  31 +++++++++++
 3 files changed, 141 insertions(+), 22 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index f234a4635417..0a4853b756fb 100644
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
index 094a15f3dbcd..8768d8220a13 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -112,6 +112,7 @@ struct phylink {
 
 	struct sfp_bus *sfp_bus;
 	bool sfp_may_have_phy;
+	DECLARE_PHY_INTERFACE_MASK(sfp_module_interfaces);
 	DECLARE_PHY_INTERFACE_MASK(sfp_interfaces);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
 	u8 sfp_port;
@@ -2140,6 +2141,35 @@ int phylink_set_fixed_link(struct phylink *pl,
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
@@ -2172,12 +2202,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
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
@@ -2358,11 +2383,24 @@ static void phylink_update_capabilities(struct phylink *pl,
 		goto exit;
 	}
 
-	/* Revalidate the SFP module modes against every available interface. */
+	/* Revalidate SFP modes against interfaces currently supported by the
+	 * MAC and PCS. Keep the module's interface list intact so a later PCS
+	 * addition can make an interface usable again.
+	 */
 	if (pl->sfp_bus && !pl->phydev && config->interface &&
-	    !phy_interface_empty(pl->sfp_interfaces)) {
+	    !phy_interface_empty(pl->sfp_module_interfaces)) {
 		__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 
+		phy_interface_and(pl->sfp_interfaces,
+				  pl->sfp_module_interfaces,
+				  pl->supported_interfaces);
+		if (phy_interface_empty(pl->sfp_interfaces)) {
+			linkmode_zero(pl->supported);
+			linkmode_zero(pl->advertising);
+			linkmode_zero(config->advertising);
+			goto exit;
+		}
+
 		linkmode_copy(supported, pl->sfp_support);
 		linkmode_copy(config->advertising, pl->sfp_support);
 		if (!__phylink_validate_mask(pl, NULL, supported, config,
@@ -2494,6 +2532,7 @@ static int pcs_provider_notify(struct notifier_block *self,
 	struct phylink_pcs *pcs, *tmp;
 	struct phy_device *phydev;
 	bool resolve = false;
+	int count, i;
 
 	rtnl_lock();
 	mutex_lock(&pl->phydev_mutex);
@@ -2506,16 +2545,44 @@ static int pcs_provider_notify(struct notifier_block *self,
 	if (pl->pcs_state == PCS_STATE_DETACHING)
 		goto exit;
 
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
+		/*
+		 * Force an interface reconfig if major config failed.
+		 * Configure link_failed to retrigger a resolve a
+		 * second time to reevaluate AN mode with the new
+		 * PCS if selected.
+		 */
+		if (resolve && pl->major_config_failed) {
+			pl->force_major_config = true;
+			pl->link_failed = true;
+		}
+
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		/*
+		 * Loop all the PCS for phylink instance and check if
+		 * this notification is relevant for some of them.
+		 */
+		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+				continue;
 
-		phylink_del_pcs(pl, pcs);
-		resolve = true;
+			phylink_del_pcs(pl, pcs);
+			resolve = true;
+		}
+		break;
 	}
 
 	/* Exit early if nothing has changed */
@@ -2681,10 +2748,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		rcu_assign_pointer(pcs->phylink, pl);
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
@@ -4424,6 +4487,7 @@ static int phylink_sfp_config_phy(struct phylink *pl, struct phy_device *phy)
 
 	/* We're not using pl->sfp_interfaces, so clear it. */
 	phy_interface_zero(pl->sfp_interfaces);
+	phy_interface_zero(pl->sfp_module_interfaces);
 	linkmode_copy(support, phy->supported);
 
 	memset(&config, 0, sizeof(config));
@@ -4485,7 +4549,7 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 	 * the SFP module.
 	 */
 	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
-			  pl->sfp_interfaces);
+			  pl->sfp_module_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
 		return -EINVAL;
@@ -4556,6 +4620,7 @@ static int phylink_sfp_module_insert(void *upstream,
 	ASSERT_RTNL();
 
 	caps = sfp_get_module_caps(pl->sfp_bus);
+	phy_interface_copy(pl->sfp_module_interfaces, caps->interfaces);
 	phy_interface_copy(pl->sfp_interfaces, caps->interfaces);
 	linkmode_copy(pl->sfp_support, caps->link_modes);
 	pl->sfp_may_have_phy = caps->may_have_phy;
@@ -4573,6 +4638,7 @@ static void phylink_sfp_module_remove(void *upstream)
 	struct phylink *pl = upstream;
 
 	phy_interface_zero(pl->sfp_interfaces);
+	phy_interface_zero(pl->sfp_module_interfaces);
 }
 
 static int phylink_add_sfp_mod_port(struct phylink *pl)
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index 83e0a2ad4b09..a6fe9f71174a 100644
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
+ * Returns: a pointer to the phylink_pcs, NULL or a negative error pointer. Can
+ * return -EINVAL if the PCS provider firmware node doesn't match the referenced
+ * firmware node or a negative error pointer (or NULL) from the PCS provider
+ * xlate function for the relevant firmware node and PCS handle index.
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

