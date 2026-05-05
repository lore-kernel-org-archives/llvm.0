Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296024ADDB4
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005661; cv=none; b=gIYu41ZUOnpuvqFeJNlQoLiAnw45qfiKbWBO5PyVCz7QmOd2FgMulJ5JNE1tmymyeMSHkaBQsheVN8uOf2hAItKBthKE90f7NTF9yZ4oYRyuPmtDgjJEvP86iwMzsjnGz+pkjgLqxxCFcQsbo/bbg4eE2kKe3cdS+GOcBlqOzyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005661; c=relaxed/simple;
	bh=9SRiToZStmepK6Eod4FcGlMmOh1qu0e+H6ejyB6vaS0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpVbkv7NfNfDvjjXp5TTC1L9M9KGOfRzPoPLwls3Iz3TDOupRIV7fN7+Ux0rEqsHjA2CPTaD6D6+zsIeO69piyyzP9I+em7187K+PeOnYyFBv8ZVt9XNj54z1McvibjQlO1mWq+74Lm541N8/LORBF9pMRCVpZvM1f7CuTJDt8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rte/tDUR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rte/tDUR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so71335645e9.0
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005657; x=1778610457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=;
        b=rte/tDURl+mIzk4pJ9jEDVGqLLND5SvfBpNf4ZLk6yoTQbQHYfPrUTozrdH163nGky
         jyLtOYulapL16vkqWYbYjMuIftTW36NCCHjS9JL33xOCGpZkRgk1rDLEfpqr0RfKfh9w
         SggG3E0qwumbM80Lc8B6QJvckRF9++z72Tj1BXYU1+DiQxo36DP70xLLyAdA7PywdcWP
         OSEISphz/O2F4eNGGNlDPF9iWrejemSiTB3oSWEjVMcVvJt2D6GKZKJ0hYmZkbVgt+tq
         XxehLD3DTQwXmciFoErEZkIC6/ZZPxkLlFCiqahyqvr3xGsLxhO2vKd0TtWlP2CyDidf
         2tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005657; x=1778610457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=;
        b=OFOvv6BOxF2FgAtrUEa4B+Li+MrlKapV/qH4NqPXHdB36ICuu00eAcg0DOTAwHQ1wl
         T0gVqyv/o2riH8H9hwBFy/gEaeUNmBAtP5SQwc7PbLB8BUIE0yKVRDMfexwVLS4z2597
         cDYVqklSVc7IubFXNltWI/TdroIX6MmqElIip+rpsa5V8Yskz1dmPCtgla2hyyy//or2
         O6ln/XTS0BG2V8xoirCe6FOjCS7/m7ohOfth+6b4C30xKKl1Ybv8k6na0+AWsxMC8uAq
         66Muluoq+CWm+uHvnnjaJH8CqRRtEdPgoWA/N6oQf5Nj5NHqMxx2lXtLrZD3GBW6aGR3
         D0gg==
X-Forwarded-Encrypted: i=1; AFNElJ/qmrz+TuE+7d++v+BK3zEMJnfnocqbyMJQ8OpJHc+2I8SbCwYgH7k5+5tG7rbNNgNIfFvq@lists.linux.dev
X-Gm-Message-State: AOJu0YwBS4woQr1WjXsMKT8NQKZAk0jsWbaG/XhF0HR0ZcTaGUjSdC9m
	jvSSC7UPEVIRpNQpTqBDPNsrpgs8riEVyKqGMH3xChq/uev0G264+XLp
X-Gm-Gg: AeBDies9XiGh37aFNxAdUqGn8mA6jtaUJYSEpVO8VSmOtHS+h47hiq4CquiPYlW/ePM
	FFc+hdICwO81HS3lbnhWTxB2H+qpgmL9HpoE5Cbc/zKHdksb+oVEu6z/zCoQ+iAP2r08OQ1Cu+N
	wQ6/WEBli9cE2elDsGcanfrHhY/ibuCS0hW8Bg6iNfVwbaNdRSFjP2wNCYm1HqZZUbTa64m0fYt
	nS1sLWju7UiLCY9oxQXHFRlprUR7nJOwVXVoARiCJh04IAE44QB1uw6g3/w4/GF/HlqkaNJGhtV
	mgbvM0SkKUacECzHJ8cl5Iji4p+/pEnlQVrQFWFSv7UOSgFcyrhB0atQB9hNIEy7KC/T1o8VS6/
	8pngZOXTEyUONfIlMp6yXoUJVJqqrKNaFIRaoIllbiWK5OTdLqHkIHhP3Fq98WbYrpgOkwq+iDr
	zAEr7JqYjOtoVSGPzJk66bEa6W+TKg/60rXgVuAgCX3t3NHtf+e1EypmI5icwrRavEdmk0gxtPN
	uDmxYY=
X-Received: by 2002:a05:600c:17d0:b0:48e:526e:101a with SMTP id 5b1f17b1804b1-48e526e115bmr262175e9.12.1778005657086;
        Tue, 05 May 2026 11:27:37 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:36 -0700 (PDT)
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
Subject: [net-next RFC PATCH v5 06/10] dt-bindings: net: ethernet-controller: permit to define multiple PCS
Date: Tue,  5 May 2026 20:27:07 +0200
Message-ID: <20260505182713.27644-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
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
index 1bafd687dcb1..51a8a418955d 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -85,8 +85,6 @@ properties:
 
   pcs-handle:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
     description:
       Specifies a reference to a node representing a PCS PHY device on a MDIO
       bus to link with an external PHY (phy-handle) if exists.
-- 
2.53.0

