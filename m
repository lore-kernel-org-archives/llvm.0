Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C032BF52
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526647; cv=none; b=Cawzur2lmGY+uCqSvF0iV6hJcZ81JGHYhDnpVcbHk7pa1jPNMtaVRS+u4dkDuzMNM8GWxVYYcw17bbdYDz2kqhFJ0HZKkCHOkJvrHn5buPpKjyera8YFB7XVrcA4C8IVBVxAr5D7NNukfRKw9keYdVgWbG/uylVvAVcvYln7fYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526647; c=relaxed/simple;
	bh=LiGJAO0/VUutQ0zWhOKOU6ESlza0YssOsxbuxpLi/68=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMVZ7i+JrI2SRajw32405dsH3b+k0SdLpjYmmNNxvW6KFOXXPqbba4G/KPEPnC6lgYs+paWPLd5rtZzEVYvtN2opioWUMxXSb18rda/uVCyQu7yY9gIgS+B7Q0a4+IFx2E28ICEe0MSWH3FT4pJYrgloD33Sdm40eNRlW0HoiTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYwtE57a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYwtE57a"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so16530575e9.0
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526639; x=1782131439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeREqKwyBL2tZifBDIM4b8FY1VqpNjyArTkAWxSLkSU=;
        b=rYwtE57aZhm0xh67K/x6i6HCjvPUBETWKQ8lqzcCAZr5IpdP8kSVj5VlvA5mPtDFV/
         n16wgH1nFOZ4B0SMWGT72uPOtRx6CBEaR58t70Dez4uKhtWilu/Y+s1CNb3mF4vf4GfU
         M5dAmJK9Dq5m6y2I2DrdRBI+j0ux9HsTvi2s5yDGR8TWAnGU4ATbh8BFPAkmU6HWHXtg
         RE5AGAXlrQu0uS0U3YP5kf3/QugNBvtWWtTXnOQUi2LGFXL+AuWJNMgJa8RkfTeK8l05
         pQgTAguqqMZiBQ52P77WNgbEytGREjZhEBDjVZNjesJKWVkP5nyoXeO7Xz9PIr7qKCS5
         HCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526639; x=1782131439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LeREqKwyBL2tZifBDIM4b8FY1VqpNjyArTkAWxSLkSU=;
        b=KAYVIVJdypcr5JA02dTd/UsFRYd5BA6janr4apwY6GjYnr/gc3giE7VHb37kxA5JiW
         n0jaw17KueEKFKOI2Gv3eH4A2QDwF0zwv+m84Z+PFhJgKx9aYmcKS9X2Bv/idZThUlJH
         JOVInazxYxcVPB+eeJ00sJZsWU2eVBTYBn7gM3GSGB26SJteSCCilTC7KaZN7kQ17WxA
         1fl75aJw9cCy75l7ceoagCnc229ycuzrzdf8NJ1LTKIaryPlavMbHneKjfSoVLQ/cXmP
         sLzdH1HeoxLnxF04RtXrIJcn8e55xasDt2nWSsi3Jboh8/QOo8D1iPfzn02xu5F4p2MK
         ++QA==
X-Forwarded-Encrypted: i=1; AFNElJ/iLIiXDNzOBc8+H9XajHZGh0NsfVcpEaiNbgK0DUiOqzOWIpQvLNH9/XCBE0zAlrjYzd7z@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0zJETpKfF70xOkyrUbM/GLNCRVPm0linMvlG8Lw7K7SxPe+9r
	Wh5JYYg2Q04eP58INHkVeCBTlu71BaTWimURS30XsrfrqkkTDSZv6ljN
X-Gm-Gg: Acq92OEr7XLYvojd+VRjk7eNJ13QwN4IPmth/79W1H7Xu966lG0lkEg3RrHA1IWLCSf
	Bxba6SnDvatkosKWGF2KxAeeeKoYn9rsTRWlRYQHdnoAUaRmSvV4hzCE911U+MKSwaLzJsZpn4j
	eud5dZyEwujHZ8IJsNzwTWvxjWPwhaRRbjlXLIHfgmyNkF5yRqJcJy9KBlK/GFtqUHugLWaaSun
	kWUT5dMBfgP/MdOgV6J3wItsMY0ae+bxJ6sTcAbqGUoylRd/mkIt50PhNw5jNtsA2l8cDtu1NTm
	i5SmlIPe1TFnoiZ7i+Gd/BeS6gG8RtYdxmYnvJtYP88e/YGID1fExCi4iGaJBpp1KeNxtPDUbme
	pwkLI0AEuCNxX8p3w0vt/IDW2GgWL+0jStzPfKRwCHNUBh6O9AP18bgpwbjgZHBGTCMkWB05m5Z
	EcPhWjg94ZcNAAD2nWxQ9XWsmYxRruu4kaqfd5bojCrLtyaVDRzx9RJ+NzUdk3e29jFg==
X-Received: by 2002:a05:600c:3512:b0:491:9969:739d with SMTP id 5b1f17b1804b1-4922011393fmr139236575e9.29.1781526638312;
        Mon, 15 Jun 2026 05:30:38 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:36 -0700 (PDT)
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
Subject: [PATCH net-next v7 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Mon, 15 Jun 2026 14:29:39 +0200
Message-ID: <20260615122950.22281-4-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 53 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index cb07184ce82f..ca4dad4b140a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,7 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -918,6 +919,58 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	mutex_lock(&pl->state_mutex);
+
+	/* Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case,
+	 * force phylink resolve to reconfigure the interface
+	 * mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
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
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
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

