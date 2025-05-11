Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D79266599
	for <llvm@lists.linux.dev>; Sun, 11 May 2025 20:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746994418; cv=none; b=tKcGAOdWpwWUtVR8sZWVLxLHEQ9g4t3XKkfvwzxzwEavV0E5YqGAnCT4qUrD8yc4/sqEEzB3Mjdw0aMmpQqNsimtyW8ic7ti1nmHo7LozNkzdjQQTQBl5Ni0o0PS6CGi5yGSHPUw7q+ZN+9X8NdbWzv+viw/er82eGMYD2ZlbVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746994418; c=relaxed/simple;
	bh=gqKPur9Mdhiy0psYhphHRNk5Arh43cVbpCy9/OXJHU0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXb9ewhD7dcMi/xcW1vcqqaDsXQymiauLip7bcu9oXZMR/Zy2v/OQvN09c8Xok82s6RIY/0ycGABo2o6rZUlvMObzb01J5cRNViUWI/U3mK9J4AYZwfNhj65Id/CNsqwSktllkcptUtkyZ6IftUo5eaWkSoqjg6VGxWaEJARbO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3Y4dhIJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3Y4dhIJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso19635375e9.3
        for <llvm@lists.linux.dev>; Sun, 11 May 2025 13:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994413; x=1747599213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hG/K7/CcnoPnU06F7gqSInpeWfEZ3X7ik6awgPKsA9U=;
        b=D3Y4dhIJSaw7Z51NAa24CwT8Ff+1iQggOKWUfp+clMDPZu3YgajZvusaW7b0VAENND
         RqfXXatp5CMwVusdy3uUZ+BL6Umz82m0nUPUY98Id2dkpBHCSEqh3NGxtJP/VU0bfO8E
         iPFFtozhcyROqMoeqxnLlHe73jUJxsb0l8QOF48ehGBDySV+524DcPxzKv1kBDWZIbSr
         JRVEdUkzxHGoH/0LPCxuZsSJkFA0iwWaAi124MoTJJJiPe9L1I77WwWbP0GKiVvxXNtY
         jSq3GAhg2slYSrLR+q3+5cBOz9531Y78HK6/unEUM0Jj5sn6Tc2BxyDHUquSedVG66sk
         hLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994413; x=1747599213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hG/K7/CcnoPnU06F7gqSInpeWfEZ3X7ik6awgPKsA9U=;
        b=gB8DSVDkB9zv9jQQoz+apXCoyFL5qvhRx5uB4GI9aqUZpf/inqlv8wQVOor1f9uV0f
         RdNJZcVWJUjKNx+rbC/pGHTeqONnSi6VBat0UaDY4pa7Uo8dRvVmfrKql4v3Y/MMnTga
         rlXTQ04ll+plMrEsLnxL8KeleyC4RMN4+mNG6EKVs1AlVeA7bRFjD4P+X5+J/SotSBSA
         BvyPlqCOIcxlmmCPP854ppXl5XRjQwHhsyiZH6dJK3aCXQi3u4XVpEsDmB53Rjtq7SqK
         L5MbuYzGGXWfVgAVwsuCHYu8oAaehxJ+UJMX1Y3/f3agKFR3gHA53jz0y6euyzIAdyqR
         jshw==
X-Forwarded-Encrypted: i=1; AJvYcCU6PGwsY6+cfuPEOPwI5LivxcoA3Yp99w2ViRAE0TKEwci/2xqnOmniszsri5gs5+dlJdjt@lists.linux.dev
X-Gm-Message-State: AOJu0YwwtDjKtLCEQ58I1SXTHpQNxZejosyburgW3WwU2DfLxVKmozG8
	nu/QFOXY9sBeAKm9UGXu0tdd5H5+dl8ag4I6JE0Q61heZWHd8gYa
X-Gm-Gg: ASbGncs+fLswbwRm6T1TVIFUFDv4vLGUdMNeFy8W9imF322J7l0+Lqu5zJcBu54Y88P
	kfZabt8Eti1Q3+F0KMPY8GH1ES88hIutnvKti00+Xlz1++DqW/zGD06ySvzxEtOG0Dj4PUulggw
	4soyxwouAxwcJCgW/56WG/3XwyiFsn5Vgsq4iEzvPVAsdMjWa/OaYhuuEIwkBk5KWmfGs17d4WG
	kUk8mg+9jsHA3hsqVedKb4ifaPxvdUC4Qftb69XBzUTAcAR4iYxZCbUcjlosCdlYXVN4JPe9oQE
	uwebNjZmFZSrmIg1vCcp1o6Ce+QfeJnf3aY0bAFVNLqGl83TohRu0hcqGpaUjWp1w30CwfUa8v8
	zbBpgLvuPUIA/FNxCflt4
X-Google-Smtp-Source: AGHT+IGGCa7Alqq6J/p30a6EixQuNCj9gDOJTU7dC1o71lcggGsCPUwPts/GbLPkrX6Teoy99aBGYA==
X-Received: by 2002:a05:600c:8205:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-442d6d6b6b3mr87885895e9.18.1746994413252;
        Sun, 11 May 2025 13:13:33 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:32 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next PATCH v4 08/11] net: phylink: add .pcs_link_down PCS OP
Date: Sun, 11 May 2025 22:12:34 +0200
Message-ID: <20250511201250.3789083-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250511201250.3789083-1-ansuelsmth@gmail.com>
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
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
index 1a4df0d24aa2..39cd15e30598 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1009,6 +1009,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1686,6 +1692,8 @@ static void phylink_link_down(struct phylink *pl)
 
 	phylink_deactivate_lpi(pl);
 
+	phylink_pcs_link_down(pl->pcs);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index c5496c063b6a..8b3d1dfb83a1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,6 +494,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: torn down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -521,6 +522,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
-- 
2.48.1

