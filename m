Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D83F58FB
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787502; cv=none; b=Z4LlGcxM7YrwsZ3uNMasKilv2NA7BhDgHq7B37FYAd9M0ITOuBBOKCpAe0WThghEmCzOSWDCyKadrLUz8AM1MuwOcfypRNdtNphz9bYRsYEbDzLyIf4GvkuBmYWFYX2876tL5BPqi7ciCZwOc8uCPbbAhZYGXXxPg84vSRIroZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787502; c=relaxed/simple;
	bh=4eefkNAfstnaWyC3I23kUkVKigZEIWwvbR5gE2d2aQo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCmSIGxq8YG+sm0DIOgJgXcJIsQrgdduNStCApRT+XyCmGKtBsNRjmm05QqEvjVFuVIeW+OQkJCvw6gaLsNHY/2lSN6+XLxwfUaD5koI4wuoUMGVelPAlSPDpczh1K3+c9kKsUbc6VE2HOOIlXhsz2gSMZcAFyG9GU7tz9YcjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqK33erO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqK33erO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so6775425e9.0
        for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 05:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787496; x=1782392296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puwAHt6DIGuC1Wf1TrT+M8/3nufhWyiZt6erLHCVM5o=;
        b=jqK33erOLmFBZvqP3reyrh+wD2ahwQPleN3YsXLS2v3rAr42aEMml/aVDTu35J1bM2
         e+fcE2Y02/FxZwJYxc8RC9hXvzQ5vvL3KbS/9HsL+4h/UlPCoZvWfm/mAIACGbFdvOgc
         P5BVyGylWSC9Q0sLnbNCfbjXQhJ9H/PJhWayOtOYtAmOizNcgIn6XvPXzsWX2JqfX242
         XwQYFs+oupJ0/JufrkzJaP3/zhxO5uQZ1Z7aNxh87GCu/wVfjcYMDdZYEAzoYIG8zxzZ
         wb5FxfaAMRM9EoVzBbALp7vWF6lq3e5ohIyW+Fk/5ymtAksJZRr1flYcuPpJkbb31I+U
         z1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787496; x=1782392296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puwAHt6DIGuC1Wf1TrT+M8/3nufhWyiZt6erLHCVM5o=;
        b=oMvcef4/+ChEV0prKRFHbPHelEgZUqCteQvmG3sWlkYhnGS4xOqiRW6D2r6i7v9oUM
         DeQiwcamwpEWhGWzaNDSpItDTCdL9VJQsiC2uTxQTkXO2ra/0iZNAYVlXDCEJuKFKUn6
         H0VpomAmC9jIGTxscIYv/0U1asexSyWzD511CR3SmsaJyzY/HSyqLO7VKdUY5DmQCu0s
         rk6ivCv3Ry6/wd7pB3Xk3efPgg15rktONNlz7eYlt4ajqTmXaNn2jPkO44z60VmG0qQq
         LsNrQpfsVpL+lhUF0Ov0yYIODnaEdlH+eMxSo26S65CksHbVlG2rfyZEs1mfFRKCNf1U
         IpWg==
X-Forwarded-Encrypted: i=1; AFNElJ97IjG/XM13iMpFILMSnmypGtsrCCDcXzSS2uPI9OpgYDu8UCWaUgome0CvGWHZITBl5LMS@lists.linux.dev
X-Gm-Message-State: AOJu0YxTHz+p9rxvbt9dYBhQ+08Y765dQ8gHOZEuVeuWIF3ZNv81ZsJs
	jOU6jy/Cey7UruDneIjZaXB65JX2BQQUCsX7L9O5WjEM+fY7QcNeXIJO
X-Gm-Gg: AfdE7cmvX0M8oDqK9A0jtcSKWi3bstR4a64P+V+9vpqCakE6PkIAeEB1Xu4Ck1rvH/S
	vF1uw2gXnmVajKin89h5FjTHYf2xRVrz4xtHzqd7BeKwl53bBY9p+AjqAt2FeDv5UwtYXUpi+HD
	1VDvnYyjXQa2ej6oYsiNqbcfmaPe+Pu+pHlE3dGpsym5ljeHshs1y/bROLA968XAsF8zBQnlbUL
	XWxXchEnIzqR+YCMfheP4bxDDN2VoJizPLZV3VG3M6FtssZvvJkQOmAuaVFqCw/W/GmwuGIlhC+
	VMcbk48QwilK0o3FE+nQc2YBCRFh6Wr7fAdu+tF/fGNJHrULVXoEzOibMusTvrS0b2aqXyKe8rH
	hRZOMycqkzrdnfWv/5lHGCt0Q4wVPusbneK0hKaBaxhk4VUyOczMIoXR7iQJY+JUcEeRA+wrI4k
	nAwP7C2xaLMMYCILQHj0jZuJ4/YDhvRxHeVcWq3V/jpTyAgSnIk1bMoSFSDdRmJA==
X-Received: by 2002:a05:600c:5644:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-49234141d98mr89030975e9.33.1781787495577;
        Thu, 18 Jun 2026 05:58:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:15 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Thu, 18 Jun 2026 14:57:11 +0200
Message-ID: <20260618125752.1223-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index c38bcd43b8c8..064d6f5a06da 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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

