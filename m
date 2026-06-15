Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BEB3F44DE
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526664; cv=none; b=VPHHnkgu7PSv99STH05tFbQreCT8p1PLVzIFX1QEDWasb333hP6aOKA7a366894luOVhdcsmGAylCCjVRLBbBRGW1apkLQhPj06C5B8DjFYqG8yituAcIGD2ewGBzBKnpfq5pY6CxICO8u3YLGdAE8jIP1W3/Iq/sI9NOtce4m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526664; c=relaxed/simple;
	bh=30QNHt/uyMqU2qLsz6aFbvIpIdmUJ01fiuBt57q5BGE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Idf62wgp1VLvbz2JZmBjw+sfpfYaCwtLgkZmqhMgxD8+Mh2BlagzNeI3JKEGJ44Ct/fjwHYXrgoXWLkalTSE4ftN93nqlzMerZVgbS3ag49c27dyUo9akEkwg7vkaqTacy+RW9EkX9hHmm9H3HcAVihr3XY2ffzfpWx32TpIA58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJ7lI54x; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJ7lI54x"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so19210595e9.0
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526651; x=1782131451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=CJ7lI54xXZ82ugNG6D9ZRvVCIXipSbxFWF8N8kzW4po/jZkvVzLumhsw9/dW8m/0LE
         vPDaAnv4wjqbv+YlMnrFu7HcAOuWnhiggkNpb/ZlkEOv4ABDDGjRfamul1T1LooDqWSA
         DwbC2mKpuSYAu9zUITU2xHQV57nTy2T5p0OxhLNdx2oXj6EWn/txUWiAWqp9/PWoqlb2
         BxJmICE6Xm1Wk77sDyRUyDMu9CKjTgC1t+YE+5unXAvHJPF2x2y1Ry/P9KcWgtgLYMk9
         h5Jh194DdfZPA+MBLlNkpZPBmpFhvvxojYBnUVefJcYPEFpD+GWFpcW0Kk5sEXLnBbhM
         XwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526651; x=1782131451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=BHeAwFMJZ90c67F7SRmtLPMP1vmTB8Vnsw3N+lBr3uCkofHRqfews2WwOxgMxXk0e2
         3+Z8f68iknGB1ZKhaJ8yYEM3zaKvBF2xcDg/zE2vHz6FzMgzayoU2L2ZyIMDWgO1JlpF
         2M2y2ZUh4jb/eGTu0gV7TqhxObSYeZksjlHoVpEc1oVtGZdkOKyWFVuimi/tBeed6hYt
         9/o4eQBUn8Fh7p1110Fekd0+cnmPlxx1v2XCtnXbY2fqtye4IV+yaUh6QzxZZonKAEd5
         vyilVs5vyBDa7tiaSlbBh/6qu+jFhiGJwoUozcdahHhb5+JCTnxUK0tJgHkGPQodu2hs
         6Dgg==
X-Forwarded-Encrypted: i=1; AFNElJ9ppVQUrJuUpqC2VA4hZ+OIjw0uGzxaEfRm0hkowLAUyKq1SAO++iUB/oT/s0CQusJvdo83@lists.linux.dev
X-Gm-Message-State: AOJu0YzOQ3xjknFxJkue0+QM2y40tLVFhvRkomzoZoHc31f9awubT6C9
	X0CXBCLeu/lzDZmTcNsCXXMkWn/PiU+zj4318A0MAaWL/mw5a/CjZLcY
X-Gm-Gg: Acq92OEBq1gllNc6kehgejuJJpF3gCAllwmIn+268ixKDOifsQKE96qTabd0nVdZ9jI
	oYDcKl8l0HbN1/QopblPV+j5kXqaP+TkbYN0/wNnu44nz/K7Flu7b5kOANtuS5bt5o9wL7lXmZM
	/1299jOqAuHVvBQoBjpBpeRATYaCtmms2D9Vroeka7hJVBkCgV8exd4QCTIpWKo27C2wM2oh3Cw
	c1Ie/Uf1askx2dm1q0P8AGB13gaPk6aydRKFo1o/e3meBEj6u8xLODmBSZuZd1+fT1dw81PrBGG
	EzlSJNHuZil7Oxg5C3cNPcMnGcUhagV/xXlk/1h4fQ/uMtaScs1pEfdSEHOtkKmBt9HsAhFsZdw
	pF8rFYgFfopAGVjbjyRPHW6C4/UkSQJL+zDe5U5hGMWoX3J6z13YHaylGGSlIlQlxPbKyt5Ax0x
	EocvtdA6yjqV71QYFeRlXWbb5sr3yWuhtfpDN4O2hTfmsFWSu2F78Rqw0=
X-Received: by 2002:a05:600c:4f83:b0:492:2c87:3d34 with SMTP id 5b1f17b1804b1-4922c874027mr31192735e9.15.1781526650826;
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
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
Subject: [PATCH net-next v7 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 15 Jun 2026 14:29:45 +0200
Message-ID: <20260615122950.22281-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 9 +++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0734c98498a9..1bedac517d21 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1035,6 +1035,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1736,6 +1742,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..eb6c6ca34147 100644
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
-- 
2.53.0

