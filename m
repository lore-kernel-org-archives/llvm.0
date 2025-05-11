Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C7265616
	for <llvm@lists.linux.dev>; Sun, 11 May 2025 20:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746994418; cv=none; b=WhoK5wioTd3mQmbh07EvetY7f30eQgtKXL7WLZ8uzb2YG3ffTg5ugBvgLe/bj7NmIlTKxAz7tYHTPdSHOyMh+H22pWsfwqryY9mpNGkCAt4XO5pFhGixHgTVJ3XjguPRHKjz68vakctya4F8OPPgs2EcLnOLYe5VMAf9mKJvDEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746994418; c=relaxed/simple;
	bh=jFcXF/4dVf1e7vAXuyL5qekxKu5hoLO5I3j0YrY52CI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ck+roy+y3juNAIOr7lnvxjBqGWRYpbNXj2WRBkIomrrYIRQo5gkzymjc2hBJwM1cB98IppwiKDgKCWlAdpfd/ZwG87+LEqT1I/EhjLjl3XpqbNyyjpuj0JVg6u3RQoxBCHOW1AYLpAscQ8nHQv5J+dt6SbZdDkorJLBCmsvvG/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hn79HlNe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hn79HlNe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso19635435e9.3
        for <llvm@lists.linux.dev>; Sun, 11 May 2025 13:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994415; x=1747599215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cwoa6YEoLumzQE8cS+ad1dIlqWJKYevB3c6NtJXNM8U=;
        b=hn79HlNeTpU4lFzRr5fBiHhsobh/8XO2DPkbD7UebtO7PBIGYvmZ/etEg6xl6OrZxN
         tS+9a86iv2xyZwfakHvgYx77BAhTQnJPCTnegQ3YjLgFkeo42zUAeKO61up7V5KTmbtt
         Q2j5MRuKi+ojgUWjs4uj8fLmgYAXLiq7SeR2Kt3JuVZBZnuAlCdb1yh2meH5BlZ8xq99
         Lp+qq7TacxRtFMtwL9/euh+Gwj8PAX5It+EoXJhvG5VsChUBhV423nigFo5H/oLyNc9M
         zEwzFRQzGqQIWj2MuIeSMkyn4ZEMBnZV3wUmk2h1VibrKQYqmivfoJjaMRFIhU1Ef6Ag
         O5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994415; x=1747599215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cwoa6YEoLumzQE8cS+ad1dIlqWJKYevB3c6NtJXNM8U=;
        b=b4nO+5OGqMtiLBJLCVOjW/E2xBcBlYRJSubQPm+mSDx3fDASxM6LJCh3FNHp3TVbcK
         Z7mdJGZCY6FE7SeWi4DNBEitmnIa+GTm0wdsPItmgNkqdZdk9X6BPqy/N+C1vQFwHVei
         d9bH6RCYqGDh7/bgr+ZHODbIX6zGUw0ddQ6mvaSX5EW09mal6T6xdc+FT4SDfIDyQ6F0
         oyz35h0AJNY83O7JoixJcRuowCXWn9wCz9wkW07AjxF70KEd0bCQvcCLzKIWA85Ge++m
         ooEwLmS8VUE1DqGwzcC7JDPOX/4KBs3rgXfa+EXBf8Vso16394FcMv/axECtudBKec6b
         YGXw==
X-Forwarded-Encrypted: i=1; AJvYcCVF0UMpZc6MMWAoGo3/YP2xzQezzRWeg7m9RqtuwTTqkgOeXYqCR1v1sqqFEN+gb6AD076I@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+mFLsNCO0vymazCqGzl73TmWzECJIxdD0pmb690aOyy8VLVH4
	4Ge7qs6Uael7UZMAvk4DbRjx5fCpKKi27MaXM1vLdHCJaNBSrgxT
X-Gm-Gg: ASbGnculLgurRrnr5+nMQl6f7wUQbtj75WtqLE2dBkkFR1QN9//PJcqax0+r/2doHDA
	slxOoj+oN2wbizl089oWcxBQbOYbg4Xw5DhnKZg6T4Dzb2ZRL0VdwiQD1qEQwp7tLLG9BM3IX7k
	eolsVePHlztyhzK4XSS/kYeWSqLuWKhe3vrwFOrrToefZcuRsa9BdiZxGGDlZR8fC/HAPAXknwl
	QmzUGDFXyV11SspSIryppF23XHgyYK0X5PuDjnVqMjwbYxvuB5TYp0o9GgYGcn9zXAMErz21/pM
	qJICRoaaTEAKs0dEt3TJcFGR2iv8ZWNEY1FBtf9BnYGfSWore9faD1IgkBrzENSzquutOv7CA4d
	79soLlevvfKagJ9VlNmiO
X-Google-Smtp-Source: AGHT+IEOWK8ud3qNK29LCO+35MG4PEuwn5Jd54n78utiERk537v3iwnnobOuImhQnqz6zBJyk8U4wg==
X-Received: by 2002:a05:600c:8205:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-442d6d6b6b3mr87886265e9.18.1746994414900;
        Sun, 11 May 2025 13:13:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:34 -0700 (PDT)
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
Subject: [net-next PATCH v4 09/11] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Sun, 11 May 2025 22:12:35 +0200
Message-ID: <20250511201250.3789083-10-ansuelsmth@gmail.com>
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

Document support for Airoha Ethernet PCS for AN7581 SoC.

Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
the various Serdes port supporting different Media Independent Interface
(10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

This follow the new PCS provider with the use of #pcs-cells property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/pcs/airoha,pcs.yaml          | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
new file mode 100644
index 000000000000..8bcf7757c728
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/airoha,pcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Ethernet PCS and Serdes
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
+  the various Serdes port supporting different Media Independent Interface
+  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).
+
+properties:
+  compatible:
+    enum:
+      - airoha,an7581-pcs-eth
+      - airoha,an7581-pcs-pon
+
+  reg:
+    items:
+      - description: XFI MAC reg
+      - description: HSGMII AN reg
+      - description: HSGMII PCS reg
+      - description: MULTI SGMII reg
+      - description: USXGMII reg
+      - description: HSGMII rate adaption reg
+      - description: XFI Analog register
+      - description: XFI PMA (Physical Medium Attachment) register
+
+  reg-names:
+    items:
+      - const: xfi_mac
+      - const: hsgmii_an
+      - const: hsgmii_pcs
+      - const: multi_sgmii
+      - const: usxgmii
+      - const: hsgmii_rate_adp
+      - const: xfi_ana
+      - const: xfi_pma
+
+  resets:
+    items:
+      - description: MAC reset
+      - description: PHY reset
+
+  reset-names:
+    items:
+      - const: mac
+      - const: phy
+
+  "#pcs-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - reset-names
+  - "#pcs-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcs@1fa08000 {
+        compatible = "airoha,an7581-pcs-pon";
+        reg = <0x1fa08000 0x1000>,
+              <0x1fa80000 0x60>,
+              <0x1fa80a00 0x164>,
+              <0x1fa84000 0x450>,
+              <0x1fa85900 0x338>,
+              <0x1fa86000 0x300>,
+              <0x1fa8a000 0x1000>,
+              <0x1fa8b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XPON_MAC_RST>,
+                 <&scuclk EN7581_XPON_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
+
+    pcs@1fa09000 {
+        compatible = "airoha,an7581-pcs-eth";
+        reg = <0x1fa09000 0x1000>,
+              <0x1fa70000 0x60>,
+              <0x1fa70a00 0x164>,
+              <0x1fa74000 0x450>,
+              <0x1fa75900 0x338>,
+              <0x1fa76000 0x300>,
+              <0x1fa7a000 0x1000>,
+              <0x1fa7b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XSI_MAC_RST>,
+                 <&scuclk EN7581_XSI_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
-- 
2.48.1

