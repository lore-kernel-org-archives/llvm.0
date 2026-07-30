Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CBC400DFA
	for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407104; cv=none; b=GIZh8npLVOOJ/rXz6FgtxoEiftpDOowpsA2q3MHbY838avKD8m5YGrGRS5SLd5GL3giTCA1MVJaIicZTxmjjv2fn63sh2GyIGJrc2Q//bagJ14OP2Hawp4aisrPwvnEa3ze/cyTwuf8EWseKjQg3C7y1kYmRVJFbVHRnlClEyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407104; c=relaxed/simple;
	bh=XUz/ShyoXvuqlw5THYosa3ImAZDVrvlgDzE2uZvQ3kw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMdi4PQNElTNRfb8YnE1epA6hmohmZ+9IjLdS3PZs0tf81ayqkdBMo7jggMkxirNUWF63/ZQDX7peq+BmfpKe98YSWGdATT/gPLNn/DNlFaQYpjNsa3TYM3XnhnkF8lg0XsZfiK6Il1/K95No7i3eawd4ntTb0Ej0How1a8gcp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXzN68K8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXzN68K8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954afac04bso21311475e9.0
        for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407101; x=1786011901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=sXzN68K8COHHUzLHWgSytISPp+bkifnA8O8Y5wF+lxhsDrpBBdIU4SI+nq/8wnToRP
         PGneIJ9SbakziRNuUHezZJ5JtCGDV4amMC25WpUwHCBg/qzMfKtuWTlAl5w55CCwFjts
         AMvWo3UXvhTl0tLfuqKqq8t88OdYaRQahOtHGoFY+oarGBuhBz1mQBVqsNcOsomHlmyS
         YXr2lTLpM0WbVuMI+lqZT0GEAtbsMNQD1RufNoUElUASTBCSbebaaPGHUFNYh9XdVuwE
         P92XD0MywcCnyRDWzBk9+nTTc46npkyxhQpXJdgXHvqKjU9Qzteip4wMzUdCZJjT3geC
         SR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407101; x=1786011901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=g0bT14kfAmrqdiR9dvW7ftAtbKjshrXAPNLibAAPgb4W4CdHt7O1S0PhftJ4H7ae63
         zU9W35zqK6UcYPUNQseLf88WeoiR8p7JeUVbbPnnV0sQDKelS9uZ+hxny/0cP0vkGnga
         6igv2GbBGGbHA0o5aI8ik5YgxyDMTxYn8k2KkOa6gLT1tx/5QHmIvUgUciM40UcPfJfh
         b7uZPQ0pHqQNwBHJhLxcHsr0et4xhpTNj06I5BH2FB2IcWozlNdjGOiZOU6IvPR0BoJw
         GI36rROaHindK4jJqcos9r22ERxWM1j1OorUQ0nmaIzhlKJzZPjiivlZNiBVMCvMk7KR
         Gmbg==
X-Forwarded-Encrypted: i=1; AHgh+RryAhISj8EcN5rb0sYcVbhDPyxqgXA+VZF+my3ZJUtdabAL2yOtUJb90tiVyBrX1aZs8KCR@lists.linux.dev
X-Gm-Message-State: AOJu0YyI5OZL5DJMomNyoZ+cD+sjTNKJeF3w9j+AFKS2TQfJpi4OsZJp
	e5T5/WlsoHCeFKBju5gNzKjouSZrQNVEFJiqKlVG10LqeQ5jKKTNcZYF
X-Gm-Gg: AR+sD13x82XC+SalEycImbow020aDDdO5WLRzVHtzJXCO+8REMoMtZl654ctL4Hy2v6
	i72rnWNAgqVWcmWN7AD4O5TEnDU0Ve9rRQCnMGCiue04B+bhnl91IlCwMMsaIJ2g+5NRy36XMDj
	tK977qIMScyujauyGZvQfGcheeM6qaaFNym4h3DyvpF6xvpwL1FEvf2IQj6Rrz5NE8yU6TxkNu8
	HNvovBInznBSw7gdJxpmgJZypk0cYqWntTU+mAE/paX54BHigLHt6p1KzpgiZgjH0XOUh02/Sqr
	XelwCfOuosBc+FgseRI90NSG9m0ahS1X3WO0eEDpyuFQaGoQbk+MRY+FPdc7kUrN2xCgPPKI4JW
	eRdXhD81zrgoeV/SHKIA+727Jxyu8xHa1cd/uKrjKD/yRdPmYAEoFm4qO5JbztSEPDPlBIwtww+
	lH6ZcIwRqTP00j6TtkX6gP7necrbrS+btybTv0YHbjkG1hCzbZIFZ5i6OJbaIM/uX6uOYj2uX65
	XyMRwt+W0qiHXg740Vf+9T2vd7O+drxsl+3x8JqCHfEtDHk9ko9UA==
X-Received: by 2002:a05:600c:41c3:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-49800e7b178mr13191645e9.15.1785407101144;
        Thu, 30 Jul 2026 03:25:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:00 -0700 (PDT)
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
Subject: [PATCH net-next v10 03/11] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Thu, 30 Jul 2026 12:24:14 +0200
Message-ID: <20260730102444.1967900-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 60 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a5e2d342a92e..562e09d1838b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,9 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_poll_stop(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -917,6 +920,63 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+/**
+ * phylink_release_pcs - Removes a PCS from the phylink PCS available list
+ * @pcs: a pointer to the phylink_pcs struct to be released
+ *
+ * This function release a PCS from the phylink PCS available list if
+ * actually in use. It also refreshes the supported interfaces of the
+ * phylink instance by copying the supported interfaces from the phylink
+ * conf and merging the supported interfaces of the remaining available PCS
+ * in the list and trigger a resolve.
+ */
+void phylink_release_pcs(struct phylink_pcs *pcs)
+{
+	struct phylink_pcs *pl_pcs;
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	mutex_lock(&pl->state_mutex);
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case, tear down
+	 * the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		phylink_link_down(pl);
+		pl->old_link_state = false;
+		phylink_pcs_poll_stop(pl);
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+	}
+
+	mutex_unlock(&pl->state_mutex);
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pl_pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pl_pcs->supported_interfaces);
+
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..15e6b1a39dfe 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -751,6 +751,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0

