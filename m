Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB404AD4D2
	for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 23:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290972; cv=none; b=Jx0laPfHz1aVOWhN4XXE2buFgNJ3VZTuvn5gLCwY4wk8wN8PXNFQvZLFQVPMMzMk/IVUHAr6AyLyTy7TgCITa+BcTBm9qgMT5tAT1zH2pVNVCDMuL0x5e5ZWFOyu91jAY9VjvAqqggVC68sFwA7iPG0u/MagPDVCPBPoVvFOYpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290972; c=relaxed/simple;
	bh=1iRj8n7qRYALgg7IVGBWtWv8CIf75ownoHVgp7tITjk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAOitKcZr0wy3RE6OCZ8hIP4C4JDR/+FfQ+QbWiow9Bmb1kPkJ4VqqikqR/SgvGbGKJcdOqvxUduereYys2RDyiZfBS4ARJ1Vh9E+vYD+B5IDAe+jlylwer3Dr3VbHWqEoPcAYi8FiGtzrIXbzVolQF+twjjgTfkNYxj2sbLEKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYWD/Thj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYWD/Thj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso2189385e9.2
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290969; x=1790895769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRQDcfp704v7y9W9giZQnIbIP3wKdXktBztj3wl4XLo=;
        b=gYWD/ThjEOLqsaEy2f+Ir7xa049M9cpVBvIprdPb8eonRYNgTx54j26miN6j4Vg2VA
         AdmcW+n7sqkTAzE9s2vq5jTCooYk4V1rd9NB+igRJPE3jDGjitJm2dJsvFjTTSpBYo/s
         tQwqUlw2z+itbZg8P1wQeZvTjRaBdgyP4ZrHjZZAc2KlWP37SXJf0+3B+myVfm156sSl
         +41+rmiVuVCNio97n1w9A/tKY1dbchrHXTTB2Ze+5x/AhgZjUiSpdVmw/XxKD/0jCrlN
         tCTK04C2u/gasBPkGuVHLhLGllz6DHgcQxf1xvWH3X3MBWN5637E1XIgnek99IlKW6C7
         DhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290969; x=1790895769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TRQDcfp704v7y9W9giZQnIbIP3wKdXktBztj3wl4XLo=;
        b=JIwDHuNaGWGH2L1DNdODbO1PFUMHKfHJVt5sO4/WaWEVrUut0fgGEmZCiOktkhEOGx
         +51Jw8/5PTw2MUlw1RaDUzU853L65MKDp/lzexU28cMqBy8N0eznUKObtEp3XA9rbY3J
         GuV9CpD3WgD7Swbypnw6hEviJgUfTK+sRjrWYuocSqrJB9SBgTg7Ej/xaI1HCd7yRCif
         Eo6G3lGp5fBPtNFNnSPa49y4zpQiMmfntZu8YGYLcpJXjyLgnuwWhDvjhpNHpRxrYNAE
         8Vuu9koBg9JTCPbJdcogGWoz5ccKjPxpC1Tx+WRovV9TKllNzJ25FINZotOYbss89KMT
         /kgg==
X-Forwarded-Encrypted: i=1; AKwUvByU0Y/9DxEpE0vpFZs6VRODhHRGVblNaoWHjkjTL6esJIc4BiIqssLu2jYjE4hKNgYc0SOg@lists.linux.dev
X-Gm-Message-State: AFuF++m0JxxeQjkDqwp8nf9rA796+gvRdukTTzjgz7/1UErg6e2YWuTj
	A6QqoeZO5WjcxSrhuiXeXlJzPNYmjUqbCe52fGeFSOzRIBNWfct2emop
X-Gm-Gg: AYBFou05BS4DESWvAZs7Z6qq2Oa/C1AHZdNyqu5L1LwgxWceTmEIUZWpVG//ktyZ8CP
	T7jQVXTFYx/2lqzRB+tMSxChhiHQMp131JXeORzNvkcY5YDB9LAiZTXu7IFZbQDJDgly3/0u7uf
	MrMGX2gBom8+DnTWpjwnnX43GpR1pkIOfFzSu08zNU1bCguvNJRRx8fXFM4Ll95aN45UxU7301p
	mXbE1xng7DTDRoMud39SoHeVN5ROKlCYEj7tEOX1by7mHgTToxbIH5jdGEraE2G9LKhd+22gVsy
	ZuA3YZqNXQ4XMRV/yFoQndoWPwgLsWj9mtPaX0wfEMfjRJw9jZSBUlxHYMRLywicNCYazjWsAG8
	orqwxJthsweFz6aUMWdBKKtwBBBXpRFE1JDESR4RO90DeALqcj3PxnYrx5mwFcTgV6dnYeTDqb/
	YVUP3Y0H78JjPPTTs+W8lOcataeGG59T/l5xRzISakKouBW75SRucw3YnBdmvg8+FBXpZbFUfID
	6/jaz/eXWzM45i4NknTwPbA31TJeYbtuELw6eQR5QRIR5gOh5gQnnCUNSpUo8jU
X-Received: by 2002:a05:600c:4f4f:b0:49e:69f8:e846 with SMTP id 5b1f17b1804b1-49fe66cbb70mr75087625e9.9.1790290968884;
        Thu, 24 Sep 2026 16:02:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:48 -0700 (PDT)
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
Subject: [PATCH net-next v17 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 25 Sep 2026 01:01:50 +0200
Message-ID: <20260924230211.11519-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b87655a09df8..fab55e6ed507 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -989,6 +989,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1701,6 +1707,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index f06eb8b6f94a..f03c1dc0a4a1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.55.0

