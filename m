Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E823B40961B
	for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407116; cv=none; b=KLhXMymXx5vLkPP2lUx3QG6O1BmZo4gX7QTD9mGUn9fkATKElv2ntgF/I9H/lS7eqL7pjOzJUo9AN4UIO1J2U7t6Yw5CArDm7rmw3ykjvXSo3To4Y9vCHqiek7oPU+5LYrLcB4vNit1hGqpi8dKxBb3kvDw4mPqDidm7EGe3CTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407116; c=relaxed/simple;
	bh=WmLmaj/+135XQeOqxQ4nLKeY20lGfUqmJfpxUJfBxfw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDALprYAoZn3ZrZarRWpT9VdHQ5HC9DFrIWry2VVdiUWKqdD2XRlY9P+FtsOdzp+0hfPUqSxP1rt0BWyFQnuAoRYR8ELJ/gl/pPHFUybHBGc2i02vvSS5gUSuZ/MV8ubECmTzLOKZo7Hei2MF7gi0K7d1G52shjrlUFfvPfsKlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMC/J7va; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMC/J7va"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so3247705e9.1
        for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407113; x=1786011913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lXt/uOqbphj4V91HISks6B4J5Xr/iPtpqYGyXndRE6o=;
        b=lMC/J7va9dkpb+w64z1UhzMJqHgcatUwPoX5RXicovg2YCWfAddGyeU/uw7QdTKevA
         OLPnYI18IpWUyeqOXrD4g4xEwNAQwsllG2213Rrpq6V6oqGcKYiWx7tDxUwCwUTzer13
         4lHv/4IAPYUHCPSsY80gWouAJ8OSzBSH5aNQ+QjL2+9+9bApWx0n94x7SorySyCcMpSq
         k0QVQFS//wyLGzhx3a4xooBNnyCTXzuc+RVGKjjQ/5OrA//RnP+aIxXw8eWHChRMJugJ
         32q2RvQggAXqE/tG3mF0VVKpT1UZVFeSWupDE/XJo9ss923dl/VwyN5Fy7Ty9JOvBEg3
         zBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407113; x=1786011913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lXt/uOqbphj4V91HISks6B4J5Xr/iPtpqYGyXndRE6o=;
        b=WrnTIEQ4nltKar8TRyvzFOZUIFD2QDFC0wUeXXEy/S5n35ewqNr+5tEGG3hJI6L9bv
         P89AyhbNjnr54IW8VfojjRKZ7sC40joxhDJp4RaJdKnkvPwPyaaNLkpnm4YqCzVlYkUm
         Qm9VlzZTHGuXweqrM/5ZC+blWU9o+6K00sCjmaGRQ4aewlKNr/Hj72iD987RTYK/1qyo
         h8ENbq5bBDHfLU/YaG8WsBArLrzgbKwwqHh2+CWpDYqQzRacIv17tq9JVE3KLAlKKm0x
         aUURJaVKYGQIXp69EvA0zLpZSVp6p9oc2yuVIyxx7/iDO2tNSJxw+8dfAMG7sC5ObBZw
         gWzA==
X-Forwarded-Encrypted: i=1; AHgh+RrJm2C1VN48FjOyCg3RF9ubj5TwFdc0qKelzwE2moKf30leptNrFf9jrYuaN0SeD0Nq+jhj@lists.linux.dev
X-Gm-Message-State: AOJu0YzyUckSoUkSdzFtohFr79qonCmHbNDU6c7MNYHc+TVhI3Osyog+
	tFQzt6GIIWCleTybqhhjdGhXDy0Du5tswm9TZLtgLKpMt+GMufgpo7IN
X-Gm-Gg: AR+sD10DIiXa/GtCFAKIfMlEfc7p4IMFQkcDSVEg9QBT3sspRoqvbN+UyEx7iRyX4pr
	f5jQEkqRs5feQhbeNOQTb1MnzHX9rqqQhyOU1uAJ/euF/vriZxIUWOdsO+jw5gEpOd+NlrO4tpo
	CfVMauHvggGcyQoGJesMxFJpoI2pFt2F4f8ViKZlHawE0fQrPm+6DTeHyPbfxYWkfjhL+JNBixv
	YbJr0x1gvNXetFE6gtf9Wl3k2AYHkGKLdrTVzKMYzgXHY1IBS9vs8K/TJD8cprGBOL9kiZL4XU4
	xXOjy4VjjGwYIt/Ll7ryUSQeggiOEIOjklnZ+XfUcOu9t3WGnHnqWZVXE4Aa+g40l57d5agSjqb
	3zpezmjPp3sYdmQnRTI3VGSNP8Dh7aGMSg3TrWDrXk5/cl2dvRq/AiDTOS7M5OvYWfUFlvl02uU
	UKcadGKzWq/Zg+cG282rLiiPKXoSt7CFl6qXWHQfl/agkOSEz/dwkSeKDacAoa3JeRgmVO7aAwF
	QLkQ2C+xU5uwcObqCwPDCxQGxqGztxfbsXEOtfAxEmLHgJ/5Q3oCw==
X-Received: by 2002:a05:600c:45d5:b0:495:6022:5a23 with SMTP id 5b1f17b1804b1-49801f2b8c2mr20936175e9.19.1785407112977;
        Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
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
Subject: [PATCH net-next v10 08/11] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 30 Jul 2026 12:24:19 +0200
Message-ID: <20260730102444.1967900-9-ansuelsmth@gmail.com>
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
index d38820543ae4..f45bdb8c3647 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1041,6 +1041,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1742,6 +1748,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..4af8598b819a 100644
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

