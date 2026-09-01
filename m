Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279E64749C8
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251441; cv=none; b=NPn6sULn+zIjPqRVTZ0tRouHzP4M6ASniUxKEJUBrsRaog7l4ZJ+3as/HApf78ZbaxQxGXC7xm73Gst7tZ6OKT8uBfPtlJh33+FAOGSO1WG1ecV9bFtnbDMMiBLZjKvNqxmCW5OuPO++XOQDcnnPxLWMAEIhjnOdz1bPsgezkhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251441; c=relaxed/simple;
	bh=A+KcmemH3pMaAVs3lMVfxapvO9ST6yn6NewQtddz0kY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N73u0Sy6WrjxzXnw09UXd1QaPaDWor8zR1pLIAPea/AEDBZ/Xxw5OZ0yhDQKRk5btM5OIrgSGWBiophIArpMzHgccXDDkrIzi4CQfD55w4+5eyQenC1ALZ8ESbNHpIZFoYCT53k+E8ATo2CypxK/PkVd92X4ealzp+46EpI6GyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gw10QWIr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gw10QWIr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so658820f8f.2
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251437; x=1788856237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1bFwMN34t/laBcuJvUM/XSHQIvcTBfIZ9zeEVi8dxW8=;
        b=Gw10QWIrjjSwhpwZ0xCZ9p+40fkvvUb/eZs5ls9rO6ceRrUZkeLTMg5OG0RbADRcZ1
         f9tXCNfnHLiUx94DkClk+AM/6WLvTIdeGAaV9ljumeusD3oIWJrnX2u0tIFmIS6Ph+TD
         RKEWsZD63Zsyf3r94WrMF/SZ8kogi5tPfAoxAtuEnfCm1JzK7v+XQHipjN9kVaXgXQFt
         Gi1U7KwA3tfaFyjewwql8xDm+qbxueVC8rc542XpMnnV8GssgK+sKVSCxC+DYEEk9AjA
         FxGzyA8rlG5CiBR/0f6mk3z8JrmAuy4hiysy9EWS4caiFyLBbYYteuxTyHV7K8Ncywt1
         +gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251437; x=1788856237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1bFwMN34t/laBcuJvUM/XSHQIvcTBfIZ9zeEVi8dxW8=;
        b=B4Kzzz2RksTqTXLitRN3P5ygEuyBKzC2t/QNj2+5mTrNvJMLDhGzKYW4OzfgaEmucZ
         7nCQtqeGV6zYwXPI6/bPOv/Jf1aM6L50BhZkQ9ynwHZNmAeS/l/ucvCIXG4YMD+uso37
         mil0QULgu8y/Jyp0IWQfAeemNgKfMJp18cxuYLzRpk26zSulNZhhcfI4OnG99GzYmsjw
         kn0iv+h43zPAm7aMumjDZST+2vP1jz1xVWv+XVCJIxQKciwCmpQKMH86RpESvVJejquR
         VB5SftiZKu6OIVBrYhzwfAB/2M318P/aafZVe8ODAx4DedyG0AAbpv8+Molk5TbGG5nn
         TzDg==
X-Forwarded-Encrypted: i=1; AHgh+RrWqoNF1DQ7OAJwZUchd6ZnKOaN5PlVKyVGFLSfH4furCZOTC2d7ZVU6NR+V+IO5KUMOlri@lists.linux.dev
X-Gm-Message-State: AFuF++lYEiTAxYtsqw0iEBBMHxTr9iaDH7lvMSkomyp90TNnUQ+4thIW
	PXut6N2pEAlLd1h5W7CmOiED4zpCXnzuKqUqclr/sfo7wbMA51tuSN1l
X-Gm-Gg: AR+sD11j+Eb5pYuoQoNdjMToVfjk4WcJJr3iYo7p4jy7yO7DHen7Mjf9PQetc3QXFEh
	lXp6pYVLX3T3HC8VtqeDYKEGVLLWw2f8jKtQ6gNfFV3q614J3kHkv3xtenh+afROq8BFZSMnsS6
	ZmDVewHk1JRf652lKPnMuqULGmuXWdKu0A60pIR+i20jJpiwCFEuajx4JEJ91tsh7f4ELHgdKFy
	ZQ+2e2Fvczur9SddECWn5jop9OWqr0HUYojrO7utIxleRJraAsewOA0q2f+z3Wls4Yz57v8FuxY
	16sol6BjwvqazZfmRwl75uFwCLDbFLimNeVUnTYpNTlZwJT9tLXKnmjjR5JJGf7GiBOFWeyt0BH
	sT3Borp7lF4VH0FC1wU+rPlu5wQBt88oIJ/YjvWwc4PgmwhmB1lqlKm1bHCbI5YaYYNidd4H9Jv
	cayTKiFtfxkJu621uubKafl/UwyzGF2iysLbDJqWDxT/qWpff40UVjsbb4529sc28fu+qjxTOhS
	6gDr39gUlFxIUo1/PSmsNtUVnBhw88GSbBKTdBFDBTIcffGk9x6
X-Received: by 2002:a05:600c:529a:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49ccedc3cafmr333314475e9.16.1788251437016;
        Tue, 01 Sep 2026 01:30:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:36 -0700 (PDT)
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
Subject: [PATCH net-next v15 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  1 Sep 2026 10:29:24 +0200
Message-ID: <20260901083001.8044-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
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
index a68d77ba5728..e5706b008b39 100644
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
index 2c647238c7ce..87dc0f27dfc0 100644
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
2.53.0

