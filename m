Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072343FAE00
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787513; cv=none; b=jvrheVNVLycOLNFpbMqFXUNnS0qfKi/tzz/ZHeY4jDl+0vguzbvaZOY2fPVfBQNFPHuv+kK/hmBmFYTm2N3M2m3tKr6qqOOEQjhWb3Fzu2hvSqRWy0DI0QIFcEQHTv8zAt/UH4AYabsMoj6dtXo7d3du31ZOKmvyhhi6TEJ8rxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787513; c=relaxed/simple;
	bh=PvW6l55YU7y+D1r30THykltDeSG0Og5W68W5V8wdrbs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DYVvUb4kbFA4/T2+z+KUKjdi0urXGdnmmsPbLjbEs9MARScTL46PL+eKqcP2e7tgi3t3fhSxi6Cg7rz7g6croiBZon/iSxZUekbbpso6KOvbYRUO5XjEfP0ToNGOEozkj9ztnlU/+G4jhAdL5oe1o+IrM5rITVLsHi7fc+Besx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhhjxQai; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhhjxQai"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b12270b3so4773185e9.1
        for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787509; x=1782392309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBpoQAlaT8nFCgwnSUFeme66HFsPGdI0rDUBeKbrcl8=;
        b=jhhjxQaiOc2hwbe95BinNF+jI9d+WIc1rquSvWCx3fTUTMWfIArggn/NZ18emHTAEJ
         F9HTnbZLuJl8HgUFHgzJ94e5ceGhm/V+dbT8GxExJtowTy/QVwT+QoeI1w3Bvofz3xlZ
         U38WIBZ66DUVBVxsRpVtzgBkZjA/MlwYVYRAAZWUO/vvkxVTlzwsThe194s+95dhlq+T
         VTfoktQPYTz/AWvpnon57KW8OPfGiE9yEauy7miROGnasRqx4YbN8vKhii/WGWdK8Asz
         dqISonFLVk9Jkzhc8MT0NHFzeOjAkoZhGZ0lmUv2n/C2m1SjNuq7VtBmORJNH3i+eTpc
         +mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787509; x=1782392309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBpoQAlaT8nFCgwnSUFeme66HFsPGdI0rDUBeKbrcl8=;
        b=hlHCI28ZRFEErDIwGem7kG2Eu9g9l6Bq6aMEpIyhhkx/zRfPd2o9K6cJkLMYDPivTW
         Fx20cFqnCOj9kT9dX0VEPvS5mrIL8xj9bovH2ZYY1LdBrj+6Bc/MX19lWWQd7k9dEi5X
         X1UQCwQMY+epZ7TJvHDRDKcpzY2F+LDM6wUi9zLB3v3YjfCieoh+RaZUlwwIPmjnsWsd
         mguai1hluHRZV/DGgK+INwwfAKwuAxMcfUgCjOCjp4Llthia7PvLxcmGQEjQjK47HrCm
         TMl9o8nFPqAMqmew2Mep1lrO4I5M4LaBLNWBv+lJGL/xVcRonj7O9U0HX/Chg19/SMb9
         bqSw==
X-Forwarded-Encrypted: i=1; AFNElJ91KsYJ4BB9A2RqpzDd0pr0M+SRSOnHVYD7Gqr1gBpQ8DRvuF8Jy8CywEwCAyB5kSupsLGm@lists.linux.dev
X-Gm-Message-State: AOJu0YyfHdnZqqbzQV67XZcQPq9hA5FWZucUw3xmKyTuuaSaxivbZ+JC
	zegkdhcmVdWoto8Eg6VNgufN/OjMywzH4zqW7V6phVdQCMuU97xUMy2K
X-Gm-Gg: AfdE7clNNxxm4fO0/An5PCY5pIIIqoJ4TAiVmukBcIjw2VHJLXX9Jv50GfBXVqJ4adS
	YrPrpO6m0xXxEDZk7VHlR+inO1uCdB67t3ZIotxZe3h08whPA16T1OmPlhE2NwRZx2qStRqjRsY
	GfjWxJrkYxVsZ3aaOgVFO9LCOzt1Tm7txy20iHyPhYiYHqPsmPlGj2I7s3gJb7B5bZBVO9Cn4f9
	6NlsKZAL6IkzwIkAW78sMYgqwX416a9/jQQWo0j5vNcJhWkdRerklNIyKZvljn0hJoaObEHfR08
	5/Artu6HkUfhmUD2EuXCY2R35GmLSc5rqq8ITTCiP6vMUmD6G82f9gHUt3UPP0k11wzC4BltTi7
	IQelsu9vvnSd62ek+kMS4bEC6C6nGKswVC+PPyRvsR7jqkh9jJTUfoMHEAO150TjtjypqvCuSDR
	jhnSohVgo1KfY5YjYsamHYvnoBQVdTodbt7/P9WvEA9h21k45KRdL1vI8ezo3MJQ==
X-Received: by 2002:a05:600c:3148:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-4923412f0e7mr127508315e9.21.1781787509280;
        Thu, 18 Jun 2026 05:58:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:28 -0700 (PDT)
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
Subject: [RFC PATCH net-next v8 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 18 Jun 2026 14:57:17 +0200
Message-ID: <20260618125752.1223-10-ansuelsmth@gmail.com>
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b9a212bd1206..b2b1d57dacd2 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1038,6 +1038,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1739,6 +1745,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..ecf4c384fd31 100644
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
+ * pcs_link_up() - tear down link between MAC and PCS
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

