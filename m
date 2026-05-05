Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7594ADDB4
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005654; cv=none; b=gU9Ahm6P1h3nSKQLCMp260dn0yZmPurhWm1WaK4r8XC01M6i8KyFfbbR1Q8vUQVkI1BnNzjSuqXhGWPhQnvhtvmoOALxCo94H+zRzj+ZF96lUbd+4We9Wrgo6kCXgs3bttChGDpVHkrL1n2my2/g6LQyy1ad3qcp/2J3t7NLnRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005654; c=relaxed/simple;
	bh=PkLb8wZz3LN/U9OfvMiROxZgNCLmAY4Q33Wx8Bh9oLc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yf9bevDFcL0cwKfv2QIxB1S6yBGVJoHLxp0hz4xCur+wrDMPjUottWUjje1+vv7AHTtJzUjjHZgux9q/vNHMgjJP9F3RFl+Ojm4w4x8iip8pXdfEo9AN4YdINNyNdtlwroJX/XkKdmC3Ueq9oUXBrMA+dnDyY4G3Hg7P/ysXuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8Ktle+Y; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8Ktle+Y"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso47464615e9.2
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005651; x=1778610451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWs5na6Cu2X9woRa7xyM3F4TzvlhNiNJPEUsaW9Eszc=;
        b=B8Ktle+Y+fuaaNLw3Hy8UPmgLIY/c7iGWEWDBbQQi+07kcv/jEKjS7h71psBciUG/M
         Ft8OpYtx3ShA07b+2A3RzUZh/t5Q9Z4YZlGxadJC8jq1QAyR9MezJSnNB0ikbaAPTKEy
         9skH7MLnd3i2+ipFwqMD0BRmOn89XAuOB0CNEAur0ffqnbgxuLbAce3dAdHb9IMFnsaZ
         kACKjvS0dddLjNiPoWXf2gNI+u0EWYbhIcxNtBjJ/494v7TE8AohW/SVU/ji9hDWrVCL
         +/hm710tyHJSjPT8xS1207Prse6X5jayXLtm8LtXaeWtB/KKB7hKXV/gfuOQzBkNq8qT
         bIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005651; x=1778610451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qWs5na6Cu2X9woRa7xyM3F4TzvlhNiNJPEUsaW9Eszc=;
        b=a1uBLqOgEd4ZU7VoyIu+GffC2ssB6GLh12GzJ6OO1zG9CwnP9UfNBn65grZo/9taRi
         gaUA2Oua+qLvZ9piuBFgURyy08vSlDlW/hQF5+UTeicJoH+V8DosqwrPYGoLAKss5Q8u
         IKirksB/CXX3KxnB/FvDcHTvMSJ13lRsw5nOOOJD2FNVlnOrEBU1zMbBng72Dn27Cucr
         436/9V/FO/ztBLcTdWZfBdzq4yygaNbnLPXDa5QqvZJFA078XnD2gat60UfeicvSSe8n
         oaMO//yuQoX9PuJUwjs/M0TRNogW5+mNzNtGoxXKGoOU6ZI/7O8xij7mof7vFonb5aBO
         KHTw==
X-Forwarded-Encrypted: i=1; AFNElJ9RONWgDjFBg68ihFgHZOpbre8MeLn43/sNLYNqpQ/mcd/2pF0dRV7KnQNyatKuaHMw02RC@lists.linux.dev
X-Gm-Message-State: AOJu0YxpYLA+B4Y3zRGnoH0mG76+zi8XgTdpMX9iuQkva9oGdWVGkuv6
	nIbg9K9yGBK5LgbyQDcd7M01LlCS6uDdJ8RtK0kSnjpTJhSlh0ACCTUU
X-Gm-Gg: AeBDievP341bUYomubPAL78xqu0q4pgrVE0+cHhf20EMZckk48CGO29xpMYvwM8A0KR
	UsZm/DVA/XJfuGRn3WtBwpm5Q4+Oms4cmseW2rlhOsfoYC1VvLPXWVQXeB18aKPi2Z5bd0yfmbY
	GsNt6kzt7+/nBogGIy8TRF3HifUfmDyXToHtWt8Dpi8yl/Grrq3BrtbsqOBbl3hvjhZSY2nKSDX
	tl9Qdln97f7c/CxeUqtjwM2pHDoiE8KIBcNnNzhuOSRLhEU4uerqzKhb8mJHW4Z5Wh/gJRcai4+
	gBmnO+jMhz+06VwnLQQfrVRb5fkkPpLW0mGop46HgsWoGDkI5A0o0bSNg3UBkCud75M0j9wrT5S
	PNHjrTQWhw/fzmuGbX9oj7CEfqLpSdmLp97nlHY78ZyRHwsEoTQ+dkufEozeNRHSUytoEXkZdw8
	Tt8kOLo+eD5VIjbtAKSYL2QxpEFRNDR06+exVmsyYmzayc5A3xG9phuXZ1wBf72nsWF+CSXDcUx
	cxcj8s=
X-Received: by 2002:a05:600c:a110:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48e51e17746mr5220405e9.10.1778005650787;
        Tue, 05 May 2026 11:27:30 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:30 -0700 (PDT)
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
Subject: [net-next RFC PATCH v5 03/10] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Tue,  5 May 2026 20:27:04 +0200
Message-ID: <20260505182713.27644-4-ansuelsmth@gmail.com>
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

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change) is also added.
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 49 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1a261060d78e..ca4f4f655a31 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -923,6 +923,55 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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
+	/* Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case,
+	 * force phylink resolve to reconfigure the interface
+	 * mode and set the phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		mutex_lock(&pl->state_mutex);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+
+		mutex_unlock(&pl->state_mutex);
+	}
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
index 9c5a43febde1..aef4a4fcf6e5 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -746,6 +746,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0

