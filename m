Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED0742DA44
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440571; cv=none; b=YDSGoTkb5B0PE4yjFA1ilCEjMqVZzzz/SNT3TfMvaabMtZNmfOcKZn+gR0oIXjjwxAyJmAfmCMVpOsq8Uqn9+s8VdB/5MpPOazPKhnn7ktsAR3KWxWrgPMPPz1CIAlC99cNw4x8HTlEAJ52s8YOpK3/IdfSGMpKy7ZeCjLhRxLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440571; c=relaxed/simple;
	bh=LbEGillG3O+kjyj0YMNED85u22Je+WjmMyS6VfSjF38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvRePYIWGi1p2wjtIAo8GMs+sFRk4IGKEoQTyfi9Bsz9epq0v2BmLn2ishOygSHi3YhHRPAXcW8Stmk8LLArTZeaM7YUgWrMnw2Ndoo7MtV9FDQFjqQ0nGomoJl27oE+hhUo45LOSl4jtBCgP8BDmoWf3PJpC+k1+Wd1KfDyOb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7wz8WJp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7wz8WJp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so31423545e9.2
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440562; x=1787045362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=;
        b=J7wz8WJpHdIwF2rxDi0yTB4rplT2Yxwe9xW8HjPVwzB5Q6CkUuXhoqX5PXQwuXYujZ
         LvjEnCtBaKH/mwRRTr96w682JRpuazhEIRTJ+2DhoP3eLO4LUyxEDJiZAoe7fHxggsBm
         eZ4DPKxHfuJXyFkrvQd9bOr3cZRJO+v8lDOZGgsJvm50guXva/HgGHhi1ZUxKzWdIkXL
         8g1dVytw7vYufdH6cuyg5/nqlKeYwf2d6hDXqpdkUhAQQYy/MNtW+wU02HpiPnHHdnK1
         IDEs0dl5Mc2sU0pgpez0rat+PqC8lAYE6b85a88WJOSmG3I6Pft46W1d+EY8sHkGmQXH
         e7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440562; x=1787045362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=;
        b=iqOiw2sKNPmdkOY6qTwToRwfgyX8XHbzyPNo9GQlEespas+0OpQOCECrkvNXc5dRD9
         +G98UC55clyAz29c9eCSClncBK6ugp2pFk065XOXcpic5mq6pCg7raoImqoln8dLZWk7
         hgnN4HJuupBZkqVL2/+Z2BAl1mU+qE8g7CWWN6zgQZ/i9VoyiZdN+C6VMpxs/X/Q3Es/
         blmYeFriuf/6cqHf2j+e76f4cFO1BmBn56aGtukpb/1OyC0p7aA1/sY7GOZd9sRSG9uw
         uSp6chzsUP2nzX6FnQ5bnXblx4+gSXnKvhr2pPPyymGRXP+t2qc45yTPOjB3CkbTB/g3
         jT5g==
X-Forwarded-Encrypted: i=1; AHgh+RpAxLwD4tK2PDj7XvZ8+qU5i0hnDxRQSYkHvJXginLoM+Omft3KhWtSn69h+K6yAVSuf6of@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+7qYXX+AeyxG7mDxnRBNPoWhecmnkZbDh18CidRaa+WzB00ac
	+VewBa3hrF6/0VlVvzrPiCrfSCthCjkYc7Dv1oW0y/t3iZlSPk4UIh1R
X-Gm-Gg: AR+sD13uFcvl2Kbyn5HqOhyHZr3rt9OEetn7gJ/y0OmjAFep0tXx3piO6rgA2fIdeP6
	KYovlX83yAcx8ST2A1uZ7tY+2DP90JU/KgZ+1Yv94qYeOXjI4W/W6EVxbkqYKoMAngXj/nLbZCh
	l03Z9RI2gkxuu98Q4iuiJ6r0pgZvRDXpRCgZpiJRO6el0p7iPWtUFkXMhCZ3mVqrdomLkh4MZrm
	qEGCSVTgDlkJ2cKSOfpnEXABfomhcrsk4VVRQE8nBLz+oNUT87Z+9ax8dg4KrMAL1AJNNhcRel0
	5Rk6R57WOPktYAfHhvBKY5bb2eILJmGLTf3OEzV+coD0ietv8z7OHMJMjAmOlSW5ZbfyuZ9dIPW
	S4+GFRYkdQbTBVzPgh/r320wMFDfK5McH9UASioVmYybbmccvKgLAWL3xV4m+IC66k6BpC2ewJe
	mM5nkFw8aU7vDxjukWuwMHBjxYoRdk+SXJIcvFpoTXEIK6ZZNLWO31/rbrh5HC0D5jqQIFAJ/Gm
	tZapYsunT6zHUiLUK2WM3LxBKgtw3rCOs8KA02b+SoNhG+7o34VMZ2zAVKf
X-Received: by 2002:a05:600c:4fcf:b0:499:7219:122f with SMTP id 5b1f17b1804b1-4997843073emr24510875e9.4.1786440561565;
        Tue, 11 Aug 2026 02:29:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:20 -0700 (PDT)
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
Subject: [PATCH net-next v13 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue, 11 Aug 2026 11:28:34 +0200
Message-ID: <20260811092843.673837-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
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
index 39d742c90db7..ef9ccec0cd81 100644
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

