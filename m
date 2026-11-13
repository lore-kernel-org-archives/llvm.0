Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529982;
	b=Adf8k/QU2dCg7Z0EahNOFGx0scr9y/uJFrSMvHe0QbrI+8VEEtQW6dEQe5DA02CfL+VQ
	 KfuEdA5nlPITge0zl/E4ITWyEuBw4oEoHz91/xfzmbx388fmgBQY0V6TELuA4lAUvBLZ6
	 G9vF7/x35wanw2d9vERqzPZV/rfU+/vTS1Nh1L9TzJRtdN9DNzWnYAu2FhvbVaFbShXkA
	 Os7LaMp2kOrWk7txDpC2Fj3oQ+KQcQsYpSlb8V4o07tIRTJPO+Be3RoSlEHpMT0D5Tshl
	 e5M3sm1Pn3xi/HUWD6h8RdZ3YgrzApKaSBDDX0LsFyeSBDKmyW0ZdDxqv50q9kX4Svg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
	b=UFETI4cHR3qtRp/kil7uN+C4svVsYmnUKE1bTVlnbxMVRQ6Jod+uwu4v6wTuXZ0ClhJX
	 VOa9zvZbBgi6oom1dhurFXRrQWRTG6ZrHQR59UvfCewbQnHqce8fHprgND4C2KRQrdaGx
	 B2+yBEqtGXRXBqJbcj5Ve+66FG626caOVJ/T1FWX06BW6qt9r06Bkz7UJaqCkzcFUh1A/
	 CMxVFlHFNO+qmezRmhr8RW2rW15mFndy5aXSQ6VFNY4a8lsEU03J6iamJ3JBem5ikzqm/
	 oUsE2VN5y3OE/hoRgNPpi5Nhudsq9qHt1bFKdsmf82E3kgVGEhoExWGOmBjeupGwiTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQW4DCYn;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB30606D1A3
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB30606D1A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQW4DCYn
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3edaso190518f8f.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 16:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529980; x=1795134780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=HQW4DCYnoxt5gEdNBV5jdrZ0DYWx+WSDd4Iof6ZuhvYzqyNdkkKo2f+ZiDGjKErbkU
         A2MSQBStmIVmcKkgSiw4JA1tcOcf3nhZIxVoKHVqo9/3rzFtM1GitFfEaRVQrAuWRYde
         aP7pQkZJXk4xyFRFq8wlWZsDAj+O8XZEwu/f6Ko+LQWHMKD+6fCWTdBFHHh9RBqci9oV
         vDGD6ieZui9psujzhV4aAtXaIoYzd8KF8lRw2OswJ3abEws29THUvLjLTb6QLFv4s9mE
         CcejMxzKcgSkEDwnrO8OD+nu8j/e66rBw5Hx7VJNfjyN9jcQbwcUMnEZ9gYX/WhQWDdn
         LR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529980; x=1795134780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=BJejTashx93lDW+8FS85+TU0XsRveu9mVwUuqCo6RVLlxL6G0mBGNNI4xtegq03x0P
         JJl49wwJYIQ9Apy6QRGxzLo0WO9LPqgz/VXvweUktc8s9Bpj+HMlwicYF+NLsHGejqM4
         wjX/Bw2W/4/y0zK2/xXV2Jlw10mOq8Np1klhJW91CQ2i4H2BsHKdrJi9f0VNWhtcwmqe
         wx5w4wi6MmroVXFBRD+Z0fP7wwLSMJf/KjSy6JvwgrqpdwDEpZhAXRI6MAkh6zvOw/2I
         lLIDppvxqHcNlofYMXgGtaSrF53D+keQbKpLLClZMP+/OG4PUEuOnbhPng8WNCXK3AEu
         IA7A==
X-Forwarded-Encrypted: i=1; AL+hErHTFXF73LXc4a4YtAaF2acgSQtJNZZlm1kZiVYQRoszCPLN4wX8T+xlQLaeTSTyDO0Ci2KP@lists.linux.dev
X-Gm-Message-State: APuU4Z8Hwachk5sfhZwWR5B6ElD01qkhFIhDi+xdqG1a57o90PxvXTcC
	UiKxNkck9pOKvUFjzXyWyd9hb0cyn9HQ1kL8hA3++vJp8r2lTVQYY5j4
X-Gm-Gg: AYBFou3avVC3llgkoe1bzYYh4yErvOMEKSB1eK/pqOQVf3267GAS/ssgYbLqXTkY+iD
	9tosNt9X3ljTE4jYqEaYOdrC6HP4eCbLiM9ME+wqkMD4RGt4i6NBbJB8OEZzffJhOgMVC2uFWwc
	PWYMkZ+Rpely/515HFuHSNzgAwGMw4wbrTM2GR9aUzw6td1BP3slFYcPF2zdKWYnhU6WyHBBCE/
	uhi8Edv64rIg2ujSq9/77wog6Nc8K4/qbhOA740T/OHAc+t6Hsbwyyz/8X3eOY1hE7L0xuhuqPd
	Q2Y8Q50ADCs043NP0im3N77QQMHs+Eshs9X6lV76HGGKOrQ2Nbubf+4oLKFpuRAjkJPefsQ4y9G
	WV904zA1QGSfCGIIgpiuVOXZFmgqCUIbsAbFxmFYeIwqFWky/3N8hiwvge3Fffj/LExfjoks0Vp
	6VShs7GnVDhXvUkQIDEwTkR3G8unbsHUzeJ7QtX/tFbjEzbaomdcbzkRgIjDWFaZdIZ1NroGL9i
	uDexoLSQx6Y8cM2+l8I3FdG3+8cTdLGTOzdTXiQI797D716WSGd05AHqWDvk4/AmrrbPl1XSoDt
	q+yCASO+Ejh/eAGgDyjdKmJF0Alzi7e1mhf38bVYeFDDHbiGetHr4xFTrZFhbmtYC18V3gTdXX0
	G+0Y3LdoCqGkQXv8beT+mSK9LQXM8I/RpNX2S04ixz6xeMiV5TXSMog==
X-Received: by 2002:a5d:4531:0:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-49c6fc9db4emr1471691f8f.11.1794529980179;
        Thu, 12 Nov 2026 16:33:00 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:59 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 13 Nov 2026 01:32:02 +0100
Message-ID: <20261113003217.197757-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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
index 7f91cf3eb951..4f1e494beb8d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1050,6 +1050,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1762,6 +1768,9 @@ static void phylink_link_down(struct phylink *pl)
 
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

