Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527B5172F3
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570565; cv=none; b=uGYoPIltJ8qrxVUYaO7DBNEdmnoPaAUkehwaqs9cxgxv/RtmmZBz3w2HdA7pUKopynEbT6PCe1eTdB0r/TEOE237aIghvxHndRwkCMlWEgqve+2rwRHIGWh7e84a5NJiY4kGQDQF9MF5gri5LRGjxswLGqbuRDNG0poLQymNKWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570565; c=relaxed/simple;
	bh=h8hPiufn9fKTuoW6KyGHAeDHTeJhlBLm8O3wGAxSH68=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZhdRoC0crddnN4lClIngRpG3tUDYEH3HKEtYxs4E6G9LNbBgZ1VgNp/0uG+Jaafa/eN+gt/LorXnaV4tuOnnje6mp6L2c1O/+2Dn3LviFOC9H2HYuxdT0+2g0MhwCEWmX3Ojq+vvk8MPwFnvzsjb6MZ1O+ElnIQJ3yK5LsUcKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XioF9UEn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XioF9UEn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c14a06c95so85392f8f.1
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570559; x=1792175359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=;
        b=XioF9UEn3ry4VmxgG7/xbSVsqmw+OYxY31i3tR2rS3+CNZLFuKISO/QIaeO0fKWNg8
         Xnk19nXbDqywU1ojn36aQ6Q9AL6NDOMIHWSdQKEHBqNZ9ufKnIpuN+U9Np8juF5T8LAh
         HgoOX5qVFBW6bqc6qqu0/CFECFEFkOiCkYk2KEVjbQGymv1EUV1OKdCIMGJsGIAw+IA/
         M1qIhdJBliqjvY8iUHmsHq4u6dtFMbiAW5riU9+bXTCBTHgV5ItVvzXmX3m6KXQAD318
         5IrFy+Do2PRcyd3qcmHZOxFo9sv4W3lMhi2Rgm4ZLfGejH9qe1eNldpwJdY30MVfHzYb
         AcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570559; x=1792175359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=;
        b=BaipA0FXWZUUlCqSB1ze3vm0ymDlzvR48FsRg7B4WJugzuOD0NwpeNMOkJKFWwj0tr
         g/aP06Y8g9UPiGE043NpdZ3vWOFK+8c/dnX3HmBUXhpXCQS5vA495e7EkjaIyeiZrrlx
         NUzFGVUVTkA1Ln9q+vRZTRm7RZRTvJX2QKxQSi92GXVLaKl68KEmBwwN5xnT3iaFQms4
         wJya4Qx750srYVdzc6CxIRGX8s8sqycgQwAOlhsHc+Ffb8GB7mRnIBy2QcYGvnf/pRsU
         3FkPgMW9BoE7zJz6i6y2sH+zwqOvmUXsKw8VC5UesI+JJF7PuVH4SxHec2u3aKxzpAvx
         +vOA==
X-Forwarded-Encrypted: i=1; AKwUvBymxOF8RMVcIGRFFSJ70tXx4Bia/CwMh15kOZ+Z0llD/GcJfKAqx9V4Pwqzfu4gCJT35KbJ@lists.linux.dev
X-Gm-Message-State: AFq9FYIYtCvQIk+iyfiizwoZANDy+lvWIlP1N0clxSGmvJaFlTk/d5WA
	qeKgQYu9Ey8gIPrWbz2S9ZUR0ZaRwS3aNn+XqZ30aEbQBeDHP4us98XC
X-Gm-Gg: AYBFou0ORVuh9qWIJQ7E258rlLtb6IUVNzeIqu8780yQvs+Nv5b8ovjXBv2rxPPvZvq
	xsNXGUciKkpZFFaFgd1lcB3ylEe9OQXsfIDCfR7FcCpLVvpQuQFjoUDGnibbdoEQYe1f9G/572p
	qBiuiOruAMJ4iMDaaN8KZGtNFlyrWwgiuo4Ww67A8Qx8CYfyDNNKHwzvgi17m825v5LJaG0sitG
	WFOc/YJHauDOmpY7D1CJXHxPCsv/bmXx7DD3cjPZcXhkO45CIkV952zS2kZTIMneFl8iY3zVtFK
	PdJnM3HHjRnaLSbpIn9adHlfa/hRkO8A23Ukclr7lDfTN6e5XCxw0yZUOwrI76OIicerivZhCqA
	CMRq1jzmq9H5jT8aG9ODD6gXOHDw7fSLcs3oeSdpGUZz8z5Li4oJ7iOt47zEpf3jmtb3ZnsSGu1
	KEcvAghKwerQ8EZFgXZwNyRkZYBYDnDEF8sXCalBQR42hpl/AQeCHw6OsgLQI9AUQuQCAPONe1e
	1m58i+rzylcnScHWgG/n3vr/tYQ1KJEUmZc+39TW/AxGhl3MZXlf3IghyHChGF9lDl8SESDEdVp
	vkWAiSKaG8CYyycLkNwdVjfNA80u
X-Received: by 2002:a05:6000:4112:b0:48c:7ac7:e59d with SMTP id ffacd0b85a97d-48dbaaefaf5mr4958397f8f.34.1791570559085;
        Fri, 09 Oct 2026 11:29:19 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:17 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri,  9 Oct 2026 20:28:05 +0200
Message-ID: <20261009182836.50631-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
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
index 59283564f72e..28dad1393b69 100644
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

