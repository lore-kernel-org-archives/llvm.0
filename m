Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B6495536
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018023; cv=none; b=HkOCEZ6dzGr9q1NnLXXrKxofiPGx490vyrGirRvHmpF0EpNhR9lctY2aUUazjgbw8HUqQ5Lok3CyFnPkF6nUejYr2lZrousG5ui1/+EqT4cchr+8ZBSdRHJNtig7QkJX8aEsd4MeQcog618wUKP5o7QYZIEYitBosQI8xzQ+kx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018023; c=relaxed/simple;
	bh=tpAXJdZq6BjF0DfbpXDCqiFqjsTUCSKFfSE16ogKceQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5Bx2fp+x7D41MzKXGTzMfsTOoDdrx5YjZi5mweJJRRQSS4W0my36+X6hxm15xghBe/3ex1vxZWN8g+iyT8LgPA6rYN7mNbRJDKHZtmt8MR8yYKwho+WWtvnqBXYUUKiUdi9HRXGFjnqmM8GZGvEzN+TeBcZbBdaBAB7a2sLDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KM3zvnhx; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KM3zvnhx"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso916299266b.2
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018009; x=1781622809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCE+R9wA56VqH4pDqL6DakPzOTQgXi/PURE5D91YIjM=;
        b=KM3zvnhxTMmfWChVUn31BKnw0Eg2G749/GI+sgBR6oWrl/iBLoHz+CHELylCMMHKZk
         au5ViOP/MKmUDpZpKzxbJQKYZBhhEBQUqEZSFy5UqR2BJqda1z4WoQF7hX4e/X/52RFP
         tfxdHnIulTwJWgEKYKd2PGbSDJIRQ5FqlnvyeU7TC2RBXs2oXhNuHYOEpvQP/BnEgSPo
         Mn0rSiY3aF16py0QnPaqw2pTLOT0PMkGNu6KVsQno7d788HLQXo6RoW3kP9t+erj4Zae
         oWrsp8WO2ESAtvddfkC1hcbh0j7x83l9sriSI1yfTNE05Y9er1OpfkJlU+Eve/FHkm83
         g0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018009; x=1781622809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCE+R9wA56VqH4pDqL6DakPzOTQgXi/PURE5D91YIjM=;
        b=qSBKnrtJHPPUxHzLsFK4/Q6QWvFcqdej5Tz92SLkQNAPCaXGSZUsawwNyW69+FYjdt
         9aUr4qlWQNBNRCGR0bkrjamthg3RNjBAoViCg5FzHE0VrgqBvSlDgWa7Cc40dg5uDuaI
         KK5X60RhliodLuLovMAeZLoiH9dYAtgj9rlDdX51jle2UCLLBFDRQ/bSGl7SsdpcP5vq
         2ThcmDPJ8K1Oany/5lah4hxjebyZDnn4l6CRJ0Dad0y1STpZIO41bo4CTUXrNJMTLCmE
         yUyZV+sKuqEeHK/6/UdtCJgawESTMQkOJ98XIf6MJUotbqXk+EhZrmka3VK+Ba09zutw
         oqpw==
X-Forwarded-Encrypted: i=1; AFNElJ994gkDYk4vZ5xTFcVyHc8XJ9WvvwJH6zIbxYIscxKXktKyuyI3M+7YmymrFx8NmKAiWHn3@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz3uPHdt79RAiH+u2c2qOFMz4gyy0I/G7U0ijRz9lEwoc4FP6V
	Rds7OxOLaIuQaOuI0lyu7mI3TM/9fhOyplcDfj1WHc7Te2r9RAp17WpI
X-Gm-Gg: Acq92OEUMhHlWYKStGv8CcfoW3gTa/7osAvvmsV9N4KOwXPQh2y44DFBcmWC01qqM8v
	LdgwGVedxM9e+4MsXTVmPm3fVnp7n9hbUjAmfXTDr3VmAf1Sq4ZebdC7Gg9j8sUE22LCGqHWvC4
	pIoRLvthR9Y2ab83eY1YohtY74ywBuqn2L8kJKDoSKdk/kJXzJh0aYatZQIZtM+Kl67K7tXdP5Q
	4kD5KZDiN9ftKNWWpQ3Qaw935KkrU4LrpEPqP5Tmr2DbYxkrl6KVaM3u2IjxBVbjYSDo5wmiInN
	FlDp2sndldIuPvNeoZ3ZneoHt7UYekBXWRJ1WpmKX0jyzzxd8ZeC4hLdnGi2nfi+a+kvRtbSWBf
	YGdrdy5JIrqz0FptKs6r95I6Hc+QN4YZRD+OcdmfRva/3QcpPrK1vX9jTWXXh0HwOW6M7EtdPBV
	wI4TIpS0cf0xi+e+8Mtd2aJ9+8Om57N9fY
X-Received: by 2002:a17:906:cc55:b0:baa:1d9:66ff with SMTP id a640c23a62f3a-bf9373dad65mr128724266b.20.1781018009295;
        Tue, 09 Jun 2026 08:13:29 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:28 -0700 (PDT)
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
Subject: [PATCH net-next v6 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  9 Jun 2026 17:12:05 +0200
Message-ID: <20260609151212.29469-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Permit for PCS driver to define specific operation to torn down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called before .mac_link_down to torn down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 65b67c33e12f..38428b375eca 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1036,6 +1036,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1735,6 +1741,8 @@ static void phylink_link_down(struct phylink *pl)
 
 	phylink_deactivate_lpi(pl);
 
+	phylink_pcs_link_down(pl->pcs);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index b65f91c78d8c..79a1496fa519 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: torn down link between MAC and PCS.
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
-- 
2.53.0

