Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653100;
	b=qmB+1+vRHT2X9b1/UpaVC4vZEQUGqAbiP/md4Rz5bQu+6Y4gG/gSXmLQALBnI2Lod7a7
	 IE2888br+AUiQYpL8WS+fITc6NMjYZ8ldci8eIqkrSsWzlEbdMSVkZ5B7a/4ekwEFSZv+
	 tGcOUEx0P+QkUgMEIfzJe9fyCBiDHKzm7QHaaZRKCz525V6CnX7WI5YWyN1PlY0xdds+U
	 JS2kQvK2SowK/RC65YIkeyE7TKzZGplIXW3nrgJo63LCQmJU8Ogjaglx9XKXQjEPeO5wC
	 8pKa0bYHG+oH7PQjn3FqyWojF9tS5WXf/C+BYz+SH165A7UzKY66zXQL3jteOuWEruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
	b=oxYaPaQRgVbJ0o9/9hfQ/A57FN4bxZZU5oApQ9KiiXqcmSyMBpKvk9qIuqT7pm3oRriq
	 Q5iYTIbVVC6ad/9KLBBMjEZg72Ow9vaqEKSmXRqlp1DQ7w5BqeuJ3deFtIE6SVyx5dKmv
	 IargQNeLUrsNm8TomrLmpF6W6U5/iky4j1FcxwWswmyyy6Bu4TG6hzhgXGB9ci20mCfRv
	 BjapHv7OyYjSYZcGfY+tXtCvqWR4JM4UcTF/WEvQgdli7PPhBekhRhYkGNRy26317HAo1
	 6GtNyhy2yAvfbwPZdV1In+9gKJph3OW/ddj4kIr3pSt4Jd6uG29hWuvpFWftzcLY8XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnuOctqA;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A1A606B950
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 10:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A1A606B950
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnuOctqA
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so23206435e9.2
        for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653098; x=1795257898; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=ZnuOctqAXM2/3zV9LTjl2He5G4flISpyR7Cjqx0KQdvbfHt6A6FZpd3/mzB21j+ul1
         C8Y0iNUqjPlGk6AKhBdCBAPbQ1joDCgS8DF5Uh18gx4/peH3fyZTtkQaxgw31Ga2yjJV
         i/K/tim9VYkiUHlx7OUkDDVuVo3mIPC7L26ftCkWuoBafKXo3xTwZkPGjKRgjE5kyE1E
         1a4GCU5MSKOTCLqxmymtqItP8rAgl+10mqJGpyEY7iNc0OalqlawC5y/GzurWYkldI8/
         tZFUwo0MxNrvw9yJYRp8YyyNIxb+V6GJ2tE6gYc5hX1/pAXn+Uf1sqXLLKT6KwA0RZ5z
         yRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653098; x=1795257898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=GArQo4Ijmc4KkzST3unW2FjFtxlCy8hs/rCvcpOKXAR73TajNTzYd4eedjCj7C6XmP
         39FpOiR809M43LZ4Jhg9SRLViiY7PNHyt/MLHVqylyHJ15FTcrfVZ1SryUtLQSKd4Q9g
         GkLKsv6U4kAmB4h3Z9d4qc+w+qoF+UhcO8ofyu9A+kWtWYze2x6QwcZWijwgo7NKZDgy
         V3gU0uxOcUJxyho20+7K3TM47Fexi7OCDB6zvl/XIiAzWvRqTzID6MqTym/mptLnBphF
         RFXCZVOoe9csYc/K22dZyNXAvGYnlfwHB6wdnOAU7m0zgGAeFWRscgjp5NgPPYHYA0y9
         PjBQ==
X-Forwarded-Encrypted: i=1; AL+hErFu7AutQIMaKsVc008cG8FbuWRoW5W3uPhfShkGe5tZXgeMtA1zDMI87kBVHz6+8ldu03cC@lists.linux.dev
X-Gm-Message-State: APuU4Z/94qbhy6I7pzmFugJeMhOU6VwthJIoYd4pAcmGOEO+O56aEk96
	H/H7FkXk+bbVX/ONN/+Nwx5rCLKDI0DIStjpYJVdEDcM3h56umYtuhdg
X-Gm-Gg: AYBFou0EzYS+PYLyndS4PU9BRI3Vn1fkD6EmJPcsJhXusCAfcHiaG2WYrUDl3F2yYSi
	oMNXb8fDXP5s26iZgExxt9huuTRPYkytrtdl4RZH+hULUZ7odosejo1RVdUyV2RTgec95ooYGC1
	LX5xhxrXxhktL9vfi6H+2ry/WtN5XQplMKyjK/H/cGx++gWhxNb8asiuvWHMBmDKhpJ1BFr0M6H
	nUYCJG4DUG3Ep8kCeV+68AmwRluV6X5IUfw+2mDZvp39b8Q/bvkBWN+e1QWfigS0nqie1efX2wu
	yi+aP14YkVfo3AsHNKhnCFSlk1v6VhJpyGFJsiDuvHovyfCyIgJBUPlJur+l+AQR2PQ4yGENYw4
	j54Y0XisWhSfBBt1tlCbkfLTVJMFGZGd8lof536vo6Or3CmAT64/OStM3lYJEieOvBaqpqF720E
	HHYjkAZD977gJcXbfm03CFiRZifJahBYXy/O6pNsxfZYXtd3xeFCfkEDG4OsWdjAnlpIyJMbTKA
	6mxdELFaIrLpeJAQ3+7KgT8iCnDc0l2BxwOKbDBaZqw0AF2bgHMxUo1RKFUuo//N+x01IcthyoK
	4uPe9xKx+GuNFjfaCojzgR/AnOIN2X2PnQTgYu0BM4dtOBnnf4EtQZpgUvGhdUinZMjoc1QXGgr
	6HqSk3S5d6VSB2BA2bF48TX2iRFrM8+V0Ow==
X-Received: by 2002:a05:600c:34d0:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4bb559f3737mr101333915e9.4.1794653098050;
        Sat, 14 Nov 2026 02:44:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:57 -0800 (PST)
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
Subject: [PATCH net-next v20 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Sat, 14 Nov 2026 11:43:51 +0100
Message-ID: <20261114104426.235620-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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
index 2bf7a1ecebd6..11f03f985c2d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1044,6 +1044,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1756,6 +1762,9 @@ static void phylink_link_down(struct phylink *pl)
 
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

