Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9E84E2F3C
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 23:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602771; cv=none; b=PpYK9BxqPfUOaZHOjOMyzcvb+EVg8DXrjfR+B+8Y+0pWuhzGncP0+eLnFGuvK+4Pz1SB4sYxRdEscCssHC+9NDdhTF8EwtOnmQyaxaKTgriHiNSM4rrLlDxB+hjrN6wvlC05gdB0L+hEXfS6xQyyHsUusvYOUOQkMak7io7STvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602771; c=relaxed/simple;
	bh=b2ZTj/hqac5Bu490z9HWnfJ2mMnQbukUiSmhlGwiJTE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KK/HNgdk/zH45+0tLRvNyZHHHRJ3F721T+1lunl62Xb9xFB6MCabIyspd/3hvNyIQGWqyz0fSTyjMtCiaGwDtteY0DufbHLloWKn8wvIHyjAKq2iF0ndWAcM0QBqmdMjoeQis3UhWUboxHPMiul2wGakOyq1k0Zc8gBUYX75t+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QD5Yptdu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QD5Yptdu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso171445f8f.2
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 16:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602759; x=1790207559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=;
        b=QD5Yptdu22Cg8Tr+sVvjfDkpNw/2b19ArkT9qrHX1wM81avq/PTFetFJ1AV/lolL9s
         9WKfNedHpp6BbHkyFmv01K+BGEXYX5x4FtdYjPulcP/dpMOJtnqGD3k+lxvw3cZnG09w
         6JqLfA4LZpHfvoEKcZHp2zSnR77H/5JHencWeo6/E8cnjabrs3DJEu+dUrNXkEv360I0
         knNxYLHX9xYzBBLfGk/d7b6eSSAeBnbLb7aw2G+W70+fEg4gkc0zsYdQSDC+LAXf7K7o
         xorgbAlNO8WIlOp+LUih+alIX+j2P8X5ArPs7T2fgVpPkpMj2HTCRvKY9NewoFhnNMsZ
         MIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602759; x=1790207559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=;
        b=B7Tlh5rc57Bz/u751xNxBjKsOdgQBoklowvj7fk3tq1VeZ2sv1+qrpkLvWbwSnQgeB
         m21+i792w/pi/ChPQ0fmnPvqL+tUYNFvhIbSupL6ThZkIclbWv42TPH8T7MCJiaoDOlF
         psobwfV3YQ2szlrh7eXp4tAPPLm0NUdtfS1YpFiWklu5QEJ3eFqVezDWLRuWqTHyPzSM
         f1X2+fElFD0lUAznbWddO1Ug+5XhVNCA4tMq9z6NuzkNCM6//fGTqtfuyG7UVYZKkJx/
         6LsuPO/KYtY5uEaAOQFWhhSHlkooc8KrDZ2ZGvh5ME8DL3MmebuzavAk8qk/voZdcknS
         7LMg==
X-Forwarded-Encrypted: i=1; AKwUvBybG4wCzMSm9gisllJd4H3fs7/QCMXzdVL3KNLWKGII/Ww7R/hx0mqlsRpLBO18Ujg0/IAt@lists.linux.dev
X-Gm-Message-State: AFuF++kVtr2hOxQPkB9O1AjOSahV6/Oqooqn9QyL2mFBB+onejRDZLHt
	r6zZK/Jc+eWQo5ATasyO8kPZZwQBExFzLU6T/aACsLLEPZxYlr+KyGI0
X-Gm-Gg: AYBFou3EAeyG5KedF56hSr5bmauKnj/pMxAVwt8YTEVABw8OrCNF3+A8tUyczoJyZU4
	Goc/aUIaAEhqS6jwpg1D1ouuylEAjVTQpKRFu/HrdJ7g/C1Or1sXnru17bUz1ZytSoWW48z8a0+
	CGOJZMCPRi2HEMy829eW2m6XQ8Q8uNMwPPk2iVJxaPWkZEzo61CElpFCLcG7eqmK7XqgW+5XiQJ
	Fgs9Hq4JqqRYGWSy7gQ1GRm3eWREvQbFMqhHjm9VdJezW68fnKnfLG/Qqm/+PacHhfYG31/uWJV
	uvEnMrjnN1DgfQR9940MEGcwfWCQO0w16nxPdysm7NjmVBHurkiKl+D6OV7j5shNq/J7u7c3Tuf
	9Xy/S4lIFHBlk8Ayshzk+3p8qG9DhYacUXClM3HCqf89cCLZ3ZGCKMIrqR00YdLM2cDiRwPf9Sy
	jfF5cEFPs+5Of7VSuv2P7vISnK7C7SDTyTxBLQ0bpeuNtCmEmoBxLHvau4zvc+c/d5I4vumjKOH
	pS6gTIUUSzSstgRg/rBR239JZp0Bk7Trt1BV/hJV0AH9A6R17EYB3rYCJcqH2k8
X-Received: by 2002:a05:6000:186e:b0:487:1413:c644 with SMTP id ffacd0b85a97d-487152180efmr1035266f8f.30.1789602758928;
        Wed, 16 Sep 2026 16:52:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:37 -0700 (PDT)
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
Subject: [PATCH net-next v16 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 17 Sep 2026 01:51:35 +0200
Message-ID: <20260916235200.20712-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
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
index fb3fb522769b..4edad9b3c169 100644
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

