Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA51476041
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251444; cv=none; b=HukpqWaBPqZXEVXJEjxbEyWEWjQTqswkdJwIpDqyR8wt5oFyJ4bIDuQUWcQxzwu1eKf/Y5NL1HsVupDHkc4LmBpKAdIU2SEadWeKXJspgTiU4yn5nzS9H1nnFWZzLH9wC7rss4jXZg9klPfDIGJRRMo/9YmYKEDQ7hlWu9Lnq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251444; c=relaxed/simple;
	bh=q8erQ5YercewkjFj31D9or1Mr6d1F3WoS0ksnOd7MtM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpogiVu/ZnMbSTDoypZPkg0j9Jr8hJBhAJ1fkv2HD8W0OAFnn564J0gCzfWL/W3dWtUGQmWXmzLteJ3p0dBYczbCAxqqxEE4Gm40F4yUWJMnIOUgfGxkqog1aaOfL9VjVIa9COIAGDGBHt7VNIWKxv1FegYfmpnApiyCQ0k1WnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LI10Uwm9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LI10Uwm9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495437bb891so6371575e9.1
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 01:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251440; x=1788856240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FLNBnsANrTUMdnBcC9IapvMl8huqE7Ah/L99fobP8RQ=;
        b=LI10Uwm9yPGkGb3VM7Dkw66MNTLEEUGIi73dFS/0K7Pg2Rt7Iy+7ujrAr77JjRqhXy
         RO5VKCkuLSRYn+cOhRqCAf1cygO4scUuREaJPp+E9cwu0p2Ib3ZRH23scCBP/9TxZhZb
         y6iMRcC/nefGZOChU0sPdkX9erp5itslzkk+uTZm13tpF+x6iolBuZxCn1ZNnUUFpnL4
         opnXi7rI+JEFufHPhgK0EkLAtIGgUMSxYqG5+E5X8CltBeOtLgaHBY06iZNtukdhvJ3l
         /f6YPBbLVjFza0+OTK6w8z6XSGM/5fKPwAxhyZcIYmt6184q8HHLE/b3jx/8/UyEjCGE
         bpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251440; x=1788856240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FLNBnsANrTUMdnBcC9IapvMl8huqE7Ah/L99fobP8RQ=;
        b=ahlZNMzMlYXcII+kMmhNWdOspk9X387Qk8MjUKUEpfOb+mwey54HCHHtsWUUI4BeMs
         T6zlOX7yOw8c/41t7Z81AY+zteyrw4KsCxICfYb1yAj7cZtUVUwk3j+3xRdLjDz6ZtE6
         22wyG9br+Q1BaoUmSkeNUrVql9/mXaJis5LL9ZVcuzDRNXDkW1swTQNuqP1CxkGAgYBj
         ecTd7njUffMV2OcNF99W/ATJq5aj8V4zAw8oGNBLcjED6ZCZk+FnvZuq4RlWd02+M3f0
         +6tUugBAAf3QFX6Smm3+5nX5pueAk3lt6V0mkamTC/+1SOUI46UizocbwN2CuMVlIvDi
         nFjg==
X-Forwarded-Encrypted: i=1; AHgh+RpSEPI6AF9O2YANFycjgzR0jyPydS4MVq6SGKuBMiLS62+DtEpU90pBP4VBP7kI6DQnHzZv@lists.linux.dev
X-Gm-Message-State: AFuF++nFYBqOhJY+1AmazSfua8QoF0z/L2MvcWyRZm1L053FQhh1ObaV
	ih+gkSjLX6PZTmc6GB2fctHDIUMA0zZQaoIRYwOWbv/IJWCFMbeTSfPc
X-Gm-Gg: AR+sD133rXd6uMmZMiY0StGwTkwDo3AZrgTFPszor7V40Vj9HZynUfLFQhVqqbE20Sp
	ZzcaT6KsnCfENAQRWcCuqA321hICYCmDDkfa+SzhcU+cdB6nheSkfbjv3Unht9VgBQ+3+xfuiqm
	zbVnoR8wB+oWSsnN0KyvQUzSiBtXv0HackWjJjyt4cCl3GzWUGFlq8yYqhSZRkg/kjRSUkDgt1E
	NNedYqExPDNq20Yb2O5rDnaWmS76x8zlVE6bOUGxBUmrBFgVd5LWiYYBI9P603i1eEJi4e4atvW
	lMsm88sna9p0F6oLBws7+mONtdaty2+gYLk1envSnZmr0o9lrtyxGqHZ4p5TNvgYiC0GAxnvI+4
	xfg+nz0jUTjktvqezzm4vcVSl18q6mqKLs8d0kdGgUZ2ID3EbaavYy1dFp7YvDzok5Y76wFMkkl
	uHZH7AJlnc+pWNGs2sqi07NCZbvV91MMANXKSvJoYPfoOUjlHz4WjUZ6x41H48/CAQS9I84wzF1
	1nE1NznBSo7UEJs5OwcsdjJGOIcmXYOXcFMDiDO+X+Xx+NJzTeT
X-Received: by 2002:a05:600c:4e4c:b0:49b:e22:4ee4 with SMTP id 5b1f17b1804b1-49cdd416ef1mr58000585e9.4.1788251439577;
        Tue, 01 Sep 2026 01:30:39 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:38 -0700 (PDT)
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
Subject: [PATCH net-next v15 10/12] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Tue,  1 Sep 2026 10:29:25 +0200
Message-ID: <20260901083001.8044-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
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
2.53.0

