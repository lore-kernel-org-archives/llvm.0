Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847C05328A3
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602771; cv=none; b=FVb3bBxOt4MnaZXcorPjP3iPGP9ROxoMLz6b05mh0wTfC42SPF+TRiL9T0ZZblbXWm5chIPW/4bHAzNa4yWGMJswlML9m6AEuyAnDSDL9Fe7PDxevT/1aFfgey+xjViKf9nMlGJwkIb7sx3BCC8N7oHmbrMO02D0ukTcJUrWu0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602771; c=relaxed/simple;
	bh=IsB+/mNnadOGz4/5gXnO4N7516c+Vy5Qv67dmXc7T/0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvHg1SHhaOrQ26NVVa7Al3f7KVTv5T8ru+gRe88N+cTAnnVrtBOK86NwowWy/MCGVzD67gy299i8uXAmeAHKnbpEb9ksupOgqcFeqjPgjaUBMjdEehsCkd3k4g+49SP2fFSo0NRRO5xTxbGNvqTrkXQgDj22ykhBt5EQnYgzMNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QL+zcGzw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QL+zcGzw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so210697f8f.3
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 16:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602762; x=1790207562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NOSAjMcDZxkdDbPEwxUvcdHW1f39aw8QcEQXE69JDbs=;
        b=QL+zcGzwBSKJCFAOv94Y8PCJa0JgrBVUo6tyZLL7Aw4x2rjfKUGNkxXf6G/OUiB7pG
         2at7gzFl8hQS5Xei1C9qMgnc8lVhvULxVp32yra/ej5wigSp+LvWd5KW55apGGoEoEDu
         Zu8bNfobJNcUQYPOWMWKWx6C3Hq5d+mw1BMwMaXZv2if4JjRsvPVRmY2XUJBfD6WlU9y
         hLMRSZykN+8mum0Ey3O5j4LTF7QNmCJdG37k37S8vU956zUlDz6Phhfpy+D/JiZsqGeg
         GCngisCgpf49OQ0jVub8+mOTdBkNmIkeRAYjKjcTsLhYKOop6saqtgoB+2mlWEmhmsG7
         p2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602762; x=1790207562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NOSAjMcDZxkdDbPEwxUvcdHW1f39aw8QcEQXE69JDbs=;
        b=aZVy8DTfmsBaRW0gWNdojyzYoBhXYzdDNhQS2Jzsf+OiMaOFoYVLIGLYPfj1cwNM4X
         Yla9NTDgp2Irg49GMLmv0foziz4ImQ/uOg9/ZAeTITxmJ4oMyxdwzVDYgHMvPOh5mjt4
         Mi92HzRk1bqUbNVfqLzZR++dWk6K2kWzir9vJBcAl9J7l8XMfjYRQBatoVpAezNX8/Vw
         Li8PHMKLDMgACRePNguaZ/ejhas5pBCnwjoOPtfw2aKNFMe8IAGRKloPutgrHMUBT8kb
         Bgfc96HUjBgZjVbCMb6G0QG4D1kkMtbVKO9WBfoiYZwJTGOJwXF6AbaF1F0mIvDGxMhF
         nN8g==
X-Forwarded-Encrypted: i=1; AKwUvBwMuBNJHuz3IcDLVyoi3eVn44fL6B2Q+47wm9kDDwyzx4+IcwXXJqo0m5jDTPm2v5EBDTTc@lists.linux.dev
X-Gm-Message-State: AFuF++lRhnkM+y0VDzCCDjPhhEFvf6wu+Jgadp476wnGRtcIRpSXzJaN
	qOnvTE0cpiotH+uwFVwVOrPIUAss9RW4AIiB6uX7RdsmqQBPjM1FHDdv
X-Gm-Gg: AYBFou2qwzQDPOLS8/3KXkERbOCow8r5IAWp8rq8QjSWxYB/PBBwit5SBsPQYW9Fzyb
	kOWGqZ3qxqrnwN3Yr7Qr2Migi52f1yvR2dpahzmCoxb+K4bPk5s7aOWMidycpJvWtMm2TG0QArF
	SfMU4lStKIeSbO3AmzFmjvnY43hVOdK/aBqxxZ/0YeYxhqUmCegPZJvDbbtTIPRu7o8NYIvm4so
	CsRVkGgm3rx2w64AU7hSFTsEZpZCIcu7acSuCH/lm6X4GocWCQ+IO7EIZ6RPIG0AV4f8OGhX7lr
	vsLNTkEiM+t429CuRJ+vzIrbw7JlpCcEYbkNQVUNzP4qwTc7+1eq3efhbKFn9y1ltjlKwc+yd6O
	3DjRd/Q6D3J25latSYqFDKgzTszyjuxfx1Ra9Z8j9YILJO1/wCSOhhd6yeUKP5/ZldeAhhrUj9V
	lMqirEiz2WXS3N0nX0G+p/V/oU+TJQPEsTQ2XwXjz+pC6ig4OEckJHHW+mLWtMFtVVzPyNxMOkU
	yySRGycEzL2vQLOmP7xDY5yjNV83xdAIDyzj9FUO8QlbKgV/yLbGgymG0SlNUI=
X-Received: by 2002:a05:6000:1787:b0:487:ee4:b5e4 with SMTP id ffacd0b85a97d-4870ee4b665mr7828302f8f.8.1789602762270;
        Wed, 16 Sep 2026 16:52:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:41 -0700 (PDT)
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
Subject: [PATCH net-next v16 10/12] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Thu, 17 Sep 2026 01:51:36 +0200
Message-ID: <20260916235200.20712-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
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
 .../bindings/net/pcs/airoha,pcs.yaml          | 261 ++++++++++++++++++
 1 file changed, 261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
new file mode 100644
index 000000000000..9c1d116c1b01
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
@@ -0,0 +1,261 @@
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
+      - airoha,an7581-pcs-pcie
+      - airoha,an7581-pcs-usb
+
+  reg:
+    minItems: 6
+    maxItems: 15
+
+  reg-names:
+    minItems: 6
+    maxItems: 15
+
+  airoha,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the SCU node required to configure
+      the serdes line to the correct interface mode.
+
+  phys:
+    maxItems: 1
+
+  "#pcs-cells": true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#pcs-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - airoha,an7581-pcs-eth
+              - airoha,an7581-pcs-pon
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: PCS MAC reg
+            - description: HSGMII AN reg
+            - description: HSGMII PCS reg
+            - description: MULTI SGMII reg
+            - description: USXGMII reg
+            - description: HSGMII rate adaption reg
+            - description: PCS Analog register
+            - description: PCS PMA (Physical Medium Attachment) register
+
+        reg-names:
+          items:
+            - const: pcs_mac
+            - const: hsgmii_an
+            - const: hsgmii_pcs
+            - const: multi_sgmii
+            - const: usxgmii
+            - const: hsgmii_rate_adp
+            - const: pcs_ana
+            - const: pcs_pma
+
+        phys: false
+
+        "#pcs-cells":
+          const: 0
+
+      required:
+        - airoha,scu
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7581-pcs-pcie
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: PCS MAC 0 reg
+            - description: HSGMII AN 0 reg
+            - description: HSGMII PCS 0 reg
+            - description: MULTI SGMII 0 reg
+            - description: USXGMII 0 reg
+            - description: HSGMII rate adaption 0 reg
+            - description: PCS MAC 1 reg
+            - description: HSGMII AN 1 reg
+            - description: HSGMII PCS 1 reg
+            - description: MULTI SGMII 1 reg
+            - description: USXGMII 1 reg
+            - description: HSGMII rate adaption 1 reg
+            - description: PCS Analog register
+            - description: PCS PMA (Physical Medium Attachment) 0 register
+            - description: PCS PMA (Physical Medium Attachment) 1 register
+
+        reg-names:
+          items:
+            - const: pcs_mac0
+            - const: hsgmii_an0
+            - const: hsgmii_pcs0
+            - const: multi_sgmii0
+            - const: usxgmii0
+            - const: hsgmii_rate_adp0
+            - const: pcs_mac1
+            - const: hsgmii_an1
+            - const: hsgmii_pcs1
+            - const: multi_sgmii1
+            - const: usxgmii1
+            - const: hsgmii_rate_adp1
+            - const: pcs_ana
+            - const: pcs_pma0
+            - const: pcs_pma1
+
+        phys: false
+
+        "#pcs-cells":
+          const: 1
+
+      required:
+        - airoha,scu
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7581-pcs-usb
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: PCS MAC reg
+            - description: HSGMII AN reg
+            - description: HSGMII PCS reg
+            - description: MULTI SGMII reg
+            - description: HSGMII rate adaption reg
+            - description: PCS Analog register
+
+        reg-names:
+          items:
+            - const: pcs_mac
+            - const: hsgmii_an
+            - const: hsgmii_pcs
+            - const: multi_sgmii
+            - const: hsgmii_rate_adp
+            - const: pcs_ana
+
+        airoha,scu: false
+
+        "#pcs-cells":
+          const: 0
+
+      required:
+        - phys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    pcs@1fa08000 {
+      compatible = "airoha,an7581-pcs-pon";
+      reg = <0x1fa08000 0x1000>,
+            <0x1fa80000 0x60>,
+            <0x1fa80a00 0x164>,
+            <0x1fa84000 0x450>,
+            <0x1fa85900 0x338>,
+            <0x1fa86000 0x300>,
+            <0x1fa8a000 0x1000>,
+            <0x1fa8b000 0x1000>;
+      reg-names = "pcs_mac", "hsgmii_an", "hsgmii_pcs",
+                  "multi_sgmii", "usxgmii",
+                  "hsgmii_rate_adp", "pcs_ana", "pcs_pma";
+
+      airoha,scu = <&scuclk>;
+      #pcs-cells = <0>;
+    };
+
+    pcs@1fa09000 {
+      compatible = "airoha,an7581-pcs-eth";
+      reg = <0x1fa09000 0x1000>,
+            <0x1fa70000 0x60>,
+            <0x1fa70a00 0x164>,
+            <0x1fa74000 0x450>,
+            <0x1fa75900 0x338>,
+            <0x1fa76000 0x300>,
+            <0x1fa7a000 0x1000>,
+            <0x1fa7b000 0x1000>;
+      reg-names = "pcs_mac", "hsgmii_an", "hsgmii_pcs",
+                  "multi_sgmii", "usxgmii",
+                  "hsgmii_rate_adp", "pcs_ana", "pcs_pma";
+
+      airoha,scu = <&scuclk>;
+      #pcs-cells = <0>;
+    };
+
+    pcs@1fa04000 {
+      compatible = "airoha,an7581-pcs-pcie";
+      reg = <0x1fa04000 0x1000>,
+            <0x1fa50000 0x60>,
+            <0x1fa50a00 0x164>,
+            <0x1fa54000 0x450>,
+            <0x1fa55900 0x338>,
+            <0x1fa56000 0x300>,
+            <0x1fa05000 0x1000>,
+            <0x1fa60000 0x60>,
+            <0x1fa60a00 0x164>,
+            <0x1fa64000 0x450>,
+            <0x1fa65900 0x338>,
+            <0x1fa66000 0x300>,
+            <0x1fa5a000 0x1000>,
+            <0x1fa5b000 0x1000>,
+            <0x1fa5c000 0x1000>;
+      reg-names = "pcs_mac0", "hsgmii_an0", "hsgmii_pcs0",
+                  "multi_sgmii0", "usxgmii0",
+                  "hsgmii_rate_adp0",
+                  "pcs_mac1", "hsgmii_an1", "hsgmii_pcs1",
+                  "multi_sgmii1", "usxgmii1",
+                  "hsgmii_rate_adp1",
+                  "pcs_ana", "pcs_pma0", "pcs_pma1";
+
+      airoha,scu = <&scuclk>;
+      #pcs-cells = <1>;
+    };
+
+    pcs@1fa07000 {
+      compatible = "airoha,an7581-pcs-usb";
+      reg = <0x1fa07000 0x1000>,
+            <0x1fa90000 0x60>,
+            <0x1fa90a00 0x164>,
+            <0x1fa94000 0x450>,
+            <0x1fa96000 0x300>,
+            <0x1fa9a000 0x600>;
+      reg-names = "pcs_mac", "hsgmii_an", "hsgmii_pcs",
+                  "multi_sgmii", "hsgmii_rate_adp","pcs_ana";
+
+      phys = <&usb0_phy PHY_TYPE_USB3>;
+
+      #pcs-cells = <0>;
+    };
-- 
2.55.0

