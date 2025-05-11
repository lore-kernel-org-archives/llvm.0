Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969C26563F
	for <llvm@lists.linux.dev>; Sun, 11 May 2025 20:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746994415; cv=none; b=JxONcGVzX+0Xh6uS6qbRsdCiT0CVgC5OtuhcCiW20IptcMcLzEmMto+JOYAyQgt1AH3NIhx3Ts+YNSEJYKoOD/S3cMD5wLlTkyaJWv0y7pTRa1o8p9a+MGAT/z87UxF2v5Yg20mRk6BbA3DRDDa8CVOn36mZDl9STJfVoymOOkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746994415; c=relaxed/simple;
	bh=CQQRGPRya/T/RQmdK5luqPwFwvLJepnnIgqfBudN7ww=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n//lk9WSjmGVUJ+YGY9E+naSougmFak2tZ9oSVwn4Z1+SDfNVNr7zJ8ShWot9aIrEhkElIGooUOq6E706v7SdPO2OfGdNXfNh1AtMWNhpT/FDoyBahuxaH1h6R/Pb8zE/YFXHmCCz/DLCJtTWomzv1RN8zolq18nxYDV3870xn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/FKhExl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/FKhExl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0782d787so25649985e9.0
        for <llvm@lists.linux.dev>; Sun, 11 May 2025 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994412; x=1747599212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkLGswoAoqo/118QvnKQBtIy92ngW50tFunPEBOrZ/k=;
        b=L/FKhExlJa2/Zo8QiR3Q6cIpYwO5njCxW8sJHc96XNG0mcs8sGH1N6ZHsfZB22L66q
         km34W1V/rHQ3f+PSltYeM7yoIXpq+gHx4GG5K2H+iFGQmEZDJMSki4F20U7LCcKcg1I7
         INCEcfJyOq9G66NOHfVaeFej9cvDlql1fIM3oWSTtQOawAEJr9aLYpK66ZCZKuM1tZ4T
         VHT2lTZ7da2c+gW6iQ5fJq5yDTbxrtsv3B2Tf+Z02iJX9RBnck2xEQZFPmFC6WvxOZKm
         9Mo1A7YT3MiZZuehkIKiVQIbImbx3NKX3yqqPKdfa3L2xTtLehuz+BCkGgt9gfVQWxQb
         DGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994412; x=1747599212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkLGswoAoqo/118QvnKQBtIy92ngW50tFunPEBOrZ/k=;
        b=QKQUXx3nop9jOmGxRdjYoKcD5Rpv7stR5LnM954eF/OGH9G0dCk0JkvS04Al0M02xs
         km7MaWk8cjsnT7Q5RTLTuj5fvCvQUMT5tJX+AyeWX47M9irBRAwZz2mC3CF6z3BJqebV
         3BEKbjZiL+ECKmPxSP2IV4KOK6+Lcoztxn4LaXMsoCSN4sJeysr9n7v5VEEZBKuSJw4J
         sNMLO9U5lf+6c5BRIywQm7PIN0Ysx+no1CdLJkyOg7zAYWk1HGURiBiEEzbals1agw9I
         t5SLSLndS81ZwWXDuGEre+bYEo9Jz3zcmYkHlg4r8ErkGVSNWVprUGxBoWFwSBLHuZZp
         R4lw==
X-Forwarded-Encrypted: i=1; AJvYcCWrfCnjgFma/DCKAl5Fl8k14jNvIULC2sIi7azZaY625X7qypFNjHTSON+sG7Djal6G7UeY@lists.linux.dev
X-Gm-Message-State: AOJu0YzoV/GneunvvCG6YM0H8J/iNF19W0WLVqE2MFaYCSm1SYaOsF8T
	M+mAC+SEhOGfIBbvRNUEgK770PTJUaxxhA5sW5pTt0fh3XWaZi+7
X-Gm-Gg: ASbGncs1QSYA3OpzPsmItR8uKrvMKDAOpwoPSyzpCWf/+n8ZQ7Vq9J4yhcVjwFxgZLB
	JoXcs9t4i99FkVsWRgwtnch+CiTcR3KDtk5ehKIXpH6G3cFe03nI+IdGj5rv/AQXtiKoqvsugxt
	RCD0HtOrCMaj6MltipIJwmUbBPiqZBXU/YTylKlUqXucDBz1S187lwgj4oPitVOAHxMfO+wluts
	sLII9G9N55NJM7iQvenVZaDa1+ieyZ2u2fv9hu7hu3fJh09WsGSOy0RFMrmHuJnEV8MFMw2r4NS
	qTnnPJalT9ALuMj+UzRxArURlAoExx/KuLeWngxhKgfaJfEy6ewbePHuxeRicClimo8LGK9piAU
	kg0IFi2fC2973l4a6hFrm
X-Google-Smtp-Source: AGHT+IFbxNC67QrJzS8ubdHLUfywR0W99gAi0Zl9vw1n/B+YFWZSNpU2mxOgGnTWER5WWOFxR4TBWA==
X-Received: by 2002:a05:600c:3e0f:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442e1093222mr47155515e9.24.1746994411685;
        Sun, 11 May 2025 13:13:31 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:31 -0700 (PDT)
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
Subject: [net-next PATCH v4 07/11] dt-bindings: net: ethernet-controller: permit to define multiple PCS
Date: Sun, 11 May 2025 22:12:33 +0200
Message-ID: <20250511201250.3789083-8-ansuelsmth@gmail.com>
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

Drop the limitation of a single PCS in pcs-handle property. Multiple PCS
can be defined for an ethrnet-controller node to support various PHY
interface mode type.

It's very common for SoCs to have a 2 or more dedicated PCS for Base-X
(for example SGMII, 1000base-x, 2500base-x, ...) and Base-R (for example
USXGMII,10base-r, ...) with the MAC selecting one of the other based on
the attached PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 7cbf11bbe99c..60605b34d242 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -84,8 +84,6 @@ properties:
 
   pcs-handle:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
     description:
       Specifies a reference to a node representing a PCS PHY device on a MDIO
       bus to link with an external PHY (phy-handle) if exists.
-- 
2.48.1

