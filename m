Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441E64457AF
	for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610174; cv=none; b=doE10kfpbx71nY0zEVKOEtaogVDTMqTbrATil2JhNRknwQne1Nrb3zqGXyUpQGFSdW05HOyrYPXSeTy0I/oP798g7wHhOKGzxGay4hi3Ixhkl/SEGxDcmmIA42idMnYWHfIRL97i5qc9DVnoMztl6aPN+xJZhdVKDT+NVAP8dlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610174; c=relaxed/simple;
	bh=f8kJ27Dkx0TxjXOX+bXZ7Ym1uaIiczOOVH2pKLOBE3w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkY+e3NgXFMI9cjK7vMUkP8bBq9OBpekUzx7I9CwksczVkW6B5DqKNEpQZZJitNDJZyqSdztf8RQ+jdEqBUDNmCsQsLSsIyDt5urbr/kQBdhS15c4nJgjQXVdbyNiM4EerAG5HwDlCYis+zTTMpWo37oJ5tfvfPHPBkgRR20iXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSDKVCGw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSDKVCGw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495437bb891so5968715e9.1
        for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610168; x=1787214968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2Ryhc7tn9LqwHTaax5YZtF5C+ZMbKW52Z/rvi3GeNM=;
        b=cSDKVCGwp7PR6UJ5XLGjxbaU+/GMf2HfZfcP7XDTONXrm8VLgG4MBbF0N3+1WIhsAy
         AvPoCP57KQkkb03rybC6E8Ht/nUG15Jr0gsG9Z3V5/HxkaNzFBEUWIWv9tF5F1nQPnpU
         ErkcQ0LXeHQ9PAeb2nm9wpxBsjNdDK7a4FJy4LRQLrlfTOfy4Rnu3ld2fwYd4kXxEW6J
         CKk8xAY/6+bEpL8HN0pgnaXmiXyOsrOKz9a4aBFrFpzMJJIdvIiK+o4bLGoxKWDGby0x
         surY4BC9Zvov+0CyLary25Kz2u/VJp31k082xBKUBvneI5ugx4atd2WY2HQhvDC2Urml
         eVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610168; x=1787214968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e2Ryhc7tn9LqwHTaax5YZtF5C+ZMbKW52Z/rvi3GeNM=;
        b=Tc2JqthVWdH0zswNi6eIXBANCNsdnBdt8FuAt7/5v45CpizkWQ8qDuBhK7drdMfrHM
         yetAnVGQbBx8myC+k5BRsPrW43SkI2kd5VyMD4PMU5w9E02azQwrLU2x9Ww+uOp2iwaq
         Qabv12DUK3dCHjfWngWl62xfSag7Y+B2YH5BkiT5NV1JZspP34P1kFJnuEXQ6tiqDfpX
         +zR5i/xUs+Rg1OKrHKDhPwhq8dzuj9Y9ZbqwKszO42DsoTZh+o2Bb88NaClN2eXAZbst
         rFN61AeHXEEbV5bqm2mRfZ9AbMQqB04Znejn2Mn4As5+JFoy57L4VRJMzGDrrH3bqaFI
         GEYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSq6drlNhYrDL/QYlD1ZTeBoowhuT2R0mNgvcYMDT+7l4niFjNavp1kdGs3idFlXkFN+bA@lists.linux.dev
X-Gm-Message-State: AOJu0YxrEnU3BuuWw1UH5RX5PPhkl6eiaq/vZVSAA8JI4BRoaZKAixlf
	F0v8mXUSx4JhkeMKt/9HjBWi0XcxVYiFmuBHVf2QY+oT7eK1r/c6C/AD
X-Gm-Gg: AR+sD12f8mx5J2xg+Bw4dXEyVG6XvGB/qH4BGTr8P77wbfzC6aWuA8weBG9szNucNmF
	iKiyNtp4aj/sC79k+2WuWQbHaQUcZx3QYCOUiLk9upazIAElhKdrUEa3SuIICojQHHqgeb2j7tI
	3kyOyOrT05wTxeYL7P4KkFVx/PcycOYrTqU5gW7rPTpMfV4kDmqDC6cOcLkIolsy2RK/KOo+G6S
	hv55I0MsNvkjsDs+/jobcsqgGntYBxL/BQg7Mwjebo7qPQF8FyHZKubarn271Gn9rSYI4eDlDa7
	SISSnUDdCm7qT0xPXwtdralTlPM/fhsOpXsGtwZnfsEViU6q1BVQUUpWLt/EgxueSxJvu9VrdW3
	j78LWdVl41Su0pN6KY/yidWGLjCzecUZqqDaaVBXf5P/LTGd0BWdSLNan3PeNhHE61AyyBHbDaF
	RlnYd8TnO68PCvzJhieM+H6if9Z5tTAIUUVFFOu/8ISgPDk9/KpJDpUQVM+RXqXgod3H31HKfD2
	OYBjRdKyhvFhIpU4YNWNnD0+JwoiH3oI5Y/JPRv0Hnre4jM
X-Received: by 2002:a05:600c:4584:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-499821baebamr37440205e9.0.1786610167928;
        Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
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
Subject: [PATCH v14 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 13 Aug 2026 10:35:14 +0200
Message-ID: <20260813083536.970196-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
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
index ba3efdb0a194..34dbe89328b1 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -990,6 +990,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
index ca9dfc142388..ea554c0d41f8 100644
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

