Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A83BB693
	for <llvm@lists.linux.dev>; Fri,  7 Aug 2026 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108429; cv=none; b=KKJMC1Sz59jz+ivTYX3vgWCBmCakYqSeZ7bRepwD1+0Q0oWEuYSh0tYRVsBWbPfrZG0G23w24u1sdPyhOcAYPyoEbfcUmtnvK/1Log6nULgBTbG7Lc65ZZ8weSTdzouhPmbFzcHJ3e/bTiBDUIT1WjejcvKxN6A5W8l9sfHDWc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108429; c=relaxed/simple;
	bh=aSuv9m3SRfbbDLL6UMHt2VSLxYYZd1xdbxrhJPEfNVg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWNnsp1lmcsHRteRREPEFLutHx1b3Q8gisvLcJwl62ufe/SDfF3mjNSHuT9z2oUezuNffS79DnIwr4l9u5AtTUffRBdgsHe1hQOMxi/nxucYGKevpeTlBbK/74Aovt6YmVV5lUvcbZQm10B0zw+vdqM6efd60rikanZUaVrtXsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2CmK7Hd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2CmK7Hd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso18435685e9.3
        for <llvm@lists.linux.dev>; Fri, 07 Aug 2026 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108410; x=1786713210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DAXATgTkufRgDBElO/+VP5qlX2m9wHSj0la+spoaFT0=;
        b=I2CmK7Hdr6YeVqChF7tD1Bp1F/aUKlKPVUnq5eQr/g3Djv/r+cfawyqcCdWaaNomKi
         lbNzU+bTEzNg5Qld6H5qKPbrzG2u+dQMeqIoSJ488olRuXH9NtQ5nISCHedPsXRgbHp8
         ooZwX/YgZoJ95IIfYoeni0aW8anY1uxFR2J1o9eFCzucJeSReKdhW2L1AhMsUmL5DXbo
         FiwQO5Byjmsk8m6Kem7hJ5lZm2cI27AOpf3FGlnwbU6qrQhanQOY0TJhj3bWe2AMQITN
         hE5nEupjjlEewcnotQ0XIKBmpduRm/Ufo9iKGRwoWahtIhBszIoKlJ0gPE0YpBCxNdSc
         uJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108410; x=1786713210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DAXATgTkufRgDBElO/+VP5qlX2m9wHSj0la+spoaFT0=;
        b=LiSLcq5GnB8Yflzyz4Jp+gjcdQgUNaIdfJ/YuCAf+4sM1id338bB7g1Wv8zoyaQNdD
         K+RLIG9XXdc9NmXEUyHFjVrjYCdr6HXZDjc5UrRoFpoBfkjE0HYJZPXEij+Fr0zNwdL7
         YEUaSEBepfuLzKo1EnqWSEuyOOuYCXntQ57WeFqboPkT6Un0KXFuy1kOXsoyR82NonPB
         MLYeRCmsJHOKOLWuXLmhtaclTaWKQ9IGAiB8gSOWcxeKe+30EAN1TKLWx9M1nUpeDnmf
         OqlpKZ4aRYhY1Uh2Z+fsTFN0TnR22+OJtGTqeK8vPX7EOJp/+jbHUb2dDnOqep2Jzstw
         VE4w==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Gdkgakb1R7HiII/6HqgPzc7nvSjJWLQ+25DTITJ6NzCXwdxzthGZRNurbnqRTS/z1Oyk@lists.linux.dev
X-Gm-Message-State: AOJu0YzNZE4/LXFt/c10wQhVj2SLlLEMgYXtcqQSCQOsXuLD5koIHr0a
	xUm+N/wzCv1n39FnhhTaTwYjW0NATC/rolQwvFVxkTnW6h6dHfHm9xNk
X-Gm-Gg: AR+sD13hHojr1/Hlg/Me/cDnAnuhc4VIfXv2qjRTpn8yg3ahojxeDn2iRCZN4AaHUSG
	Ii5ak/JCoqN9FpG/I0w9DUuqcAAY11rwYr3BK0N55aJb82MV0UhZYhMbH1cFFJH9xrAEVwWJ2UQ
	DKFSmyuwK9FdxUOaptnykySRexHNnli3UnGCxtrxouu+ZjKHQaJQ/b1acJIBaB+QhJLOkwjocz5
	UYJu5920lsKFS8mgbyZSN/cqkKAJ+tnUVhED6rFWDMVBbu5wvs0jrM9LJHHjQ0e/ezCbWHoTDUR
	fV+qGC4NBmnktQcNDgT3RyRIRq7weCCFCqtaFx/zU//y28rUe+Zd1QXDUe52nnw2PgziKcmN0Pv
	HXHrhk6TIEhK3y/WHjyGDQq/n2hheyAIF/8bfuanf+j5uF+n6OSHxjFCvElk9RZHe2dI8YVQLuA
	TRUFxSTQrcFzC28vQaBN57SneBE9YtTBsZMZjcFhLgqXnHG3TTW2BN1gFcRDxeULpUkuYoiTdaN
	B6YgIQDP5bAXY5PNL/ESNsRJ4YowE03Xvwrz18r3j8NpvYtAQf49Q==
X-Received: by 2002:a05:600c:19cd:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4994e72f7b6mr296830145e9.4.1786108410336;
        Fri, 07 Aug 2026 06:13:30 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:29 -0700 (PDT)
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
Subject: [PATCH net-next v11 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri,  7 Aug 2026 15:12:51 +0200
Message-ID: <20260807131301.192060-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
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
index 69d4f6675db0..2e8d11573e3a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -982,6 +982,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1683,6 +1689,9 @@ static void phylink_link_down(struct phylink *pl)
 
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

