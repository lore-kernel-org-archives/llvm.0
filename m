Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919234;
	b=NN9jbIvyY2X1ks3Cfqv2MCzzLyjK9kapdzOG1dAJwkH33tar1Ow8oSD3q3jyvi4KTI26
	 rTdloM/xgY+vdBAQ9/ADTD+6W53IwlCbcWmuJzrrnJsMCNzyF3RM4DUvGZUKZMIeDP4Mc
	 bDMj2t/jVbckWyo+P2VcnRyuKjO7wzPxjno0xoVtaLc82j1yhXg2eA5gwzAVaDA3bRk8I
	 6FsQ9AnyEapSLzUy4cPthRX89c5gMxRtc8TDwj+SL/eRJwX0Blm0gV3VOGQkGQ73UfLt2
	 GDYfhMOO02W6TxYwKS484/ND/SOIShmXFOqwgrdODMF4zfUCU4lK6cayvhdt+zqfLRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
	b=0+EaJCKAnsDAkEHaIAZCsemOD7/3wRMMai1g39c1LBGHQFbuslKDffi+jQPtPAv0wNHc
	 J2WLlXpGvrtOhAcm+kXBPNZ517jvwOb2BqzAUl87ynxCIlsjxKXL8hFsZRLLyW4BTttlz
	 H/KJOpOQYd0oWz9Ci19pXKfoZGztSHpFepN80WiYnsLaykdI5R+aohcK+ffvJpwdrI82/
	 YOJ+VIJdHAeZxLEjAy0+2tbtVj19D0zlRErhbPx+Qsm6FuYB3QmMoZRuAIrVQJJwOYqrX
	 FojGQE3hjD5hpSaZeCrLZHm/9HV6OD3D3MVYWb4PSZ9J4eYEjSae1ds0m0Jam/se7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wruCnaXF;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5C606F898
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 12:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB5C606F898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wruCnaXF
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so14610305e9.3
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919233; x=1795524033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=wruCnaXF9nUx3SMFCjco77C2p3Trll5aCMqN+pMorl28bAu/5ggUfNCY+JTHf1xeVb
         fetFv/ZgihTkpOouACVqI3QLwHQKOJUmpO5BkWAtEMvZHbHGXuWEdhXoAG7ICyEvUyjT
         Oibx/AXPMVPCST3VhUnMW2aiiQvNzIp6C4vNPKj6/Z8akN8eEkWtsP3rbc8Tc2pbFjpQ
         MUpkIwlmJmSgHJUceeUU+h7fZLepvx44hGE1+K+lz4yhOAMsVUGDfxb4mlN3KGnuYP55
         yvH4Y5/rhCnNOFspyH9GJ178Hf/inV91aXATiJHChA5Lhfk71pKAGzzsikVrznj4StZa
         3O0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919233; x=1795524033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=YXODvc+xUWQQHli4WRDAwFh6qCSMA4wr+m5pMlaA3k1wjePQ3wEUzAfYixoOVFHEpS
         w2Dpnu0wW5afFsQp24t5TNDJlyXXvoOP+sMzuzNHSXfKND8qyxjOVmCzg29qxHRrtCB1
         9SWu8gvJRMEKSQbpLt6Cm/mqjSsk6GvmNrEvrbjHUSHfMmBvl/pUTrcb3YurU8AvZHs6
         DnIJwrs5QXzkRO5yeXyAxwiWt+Fa+r+KMmBIHG2+u9YKMxHfxtnhhO6F+KiZjaZWcP4X
         goRO3afprd48QWD9J07WykODdw/YGeb5JCb92tLFs5k1xT/GVgyK87euqyPRzt/EMwWg
         6Lpw==
X-Forwarded-Encrypted: i=1; AL+hErH1IiwsyzAMDhV2I7BpB83WKrg7mcgNo7xck6OHIztqHIc4AB9mjgFOMTF9MKy4ZS4pzRBJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+AqYRtqyceH9ya2/05glW1c56Jh8JTCQI9MaoIdMrUREeMtVF0
	iHU1p9M3ynENirwZFqjSx4op+TkjTV8/J7nNaAIkCLbkqF4GY2NmhhQd7Pd+vg==
X-Gm-Gg: AYBFou3h8ithfzt7vY0ZLfxE1Ysmyyjx6se7OKayZ2wrJVvo4wRyzs+ZaWF/xnSiv6P
	iZpIZey7umJPeS2BfNiBOU+XywW9Pr18pPGM0TC/2VbgFEY4h/JbP+YFMgq8ATyzptiFE9t/oSb
	soBZun3fDeqMhra5c4cPRRoRkaHKrulig7YBWeMkxUFOVZQFo3TMrt/ka9yC+HvhYnLh5Y8bceE
	ot/lDLDX6C1bNKiCRZxmNZwRXNXjA9oCzieEnXHMsCfggmGS0y7enooI7EXz2L52QN7ijXO7dMV
	nL7PhwOni2SIhnhqJHRCuj2eT99IOz94ipabs/JPu9n/a2FmBVneXXn+l0PIPP0LtPo5GJ2AjYX
	wQz6QmNUIfd4gCzerE12Ez04QK7mZXX3eJ/DJCXtL6jR2mE38uPxL3ju9bEc769Qqu1LhJKPbi6
	5xEQqiO+kGuHJa1fJ+YJhfeBlkSOGMDNYZA7r6aPT3iQmNql5E55SqMw/39+9vYyRLhgxw8Cczk
	4BqOq/gpw8Q32GGIraXNicrP0aLgXri7mMvsBF5RmFNAQZiUuldmuiB8IZlrPqcT6ByYl8QQH6c
	symKcoQ5Wk2xSOACCbGbD1jhgpO8ycRENOUSLMiIt2qlJFXmmUIZcRYwb+V9pAxzOJ9ajktcsB6
	Ekv3CO89LzPu5tQbTO7pNoGmUiYPdNRLCmw==
X-Received: by 2002:a05:600c:3b2a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4bb735ad6dbmr119130585e9.23.1794919232533;
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v22 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Tue, 17 Nov 2026 13:39:52 +0100
Message-ID: <20261117123956.11981-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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
index 8768d8220a13..bf1c5188131f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1142,6 +1142,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1854,6 +1860,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 418e8bec311d..e8c3f693336a 100644
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

