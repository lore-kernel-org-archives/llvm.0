Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19E34BCAD8
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005665; cv=none; b=QhFlzr2r3Ry63ytTK5hzv28PiJMD8TPd1eNyWkWUnEX7CtOJX4BTyc0wBLnee7oym78pdrMptKejGsLMtOPjG3iZf35wH2WlAxvN0B8ie+Z9DG2aS9Bzc+a8SyDoyhS6UJq/fZXZ51JIjZjfCEgLU5L0v/OYUoDzsYvNS4sD6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005665; c=relaxed/simple;
	bh=57tf4IVtaTKf4rXMfOx1/pGq9M7TpHDLMd/27uedaeM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwnXce4f5wSTRRrpn7MfDgxprPWxvH1KxyVlH6q8c7NRBcHPs4Ak/ZWFs7zIi2P97PsP9wx2rkXAWJov5ytyCpWrWeJ8DGB9V67UsvYB93NatQL2iwyFTrVpvbAVvqbIDC10DSq9fnPKLeuD0x5UnNY9Olfsis05xerGOVxCdJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4LfVQTT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4LfVQTT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso30226065e9.3
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005661; x=1778610461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=;
        b=c4LfVQTT8GtO66gRnuKqMiVN62azWk+BVZQM9Xf2TSB3dlp/bZnFrffTHCEwXjL2W9
         NOs6fRgMXNuKcXyeOYqV7E7EctsgFc+39VJ1YXO9FIyB6hW1cRjTeGe/QmOCLgG/M3Op
         OVvW+Lf6d91iwdrFoqxLZWWsI6MBALRiypT/rdn4xT4oodH2sQSRmdqHILUnyuLdS33x
         px+ctr9IKlFL5y5MacQP+B1/TuiuO7VGvHhlz4i33fzRPl2OJaYJDDzECuDjXzu8Cvjz
         sSY5mnx8ByRxNx6b55WK5XwvEuuLnStyjDLU8iK6fN7WiZO1B+InDj59inxJYW+OP914
         xH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005661; x=1778610461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=;
        b=n20sYmbloqoYtDSczpPcROlKBBbgdPXhd0a1KnInq7Q7JTn8C/j98UAYtW6dPenaCe
         YLUdZzyEY90Zt/Lw3Oh2cl2RiM8HyxU0b6swW55SMaOyHGXwNqnog9/9ToqOwaHFVLpd
         ihm6vqCrssKDuvZi80DD7V1WjRNXl0CoK2jQCPIxpqIS5ecDlVHmYJePYKC6xZ+x/uvu
         Vd5q7/fP66bVIXJRRu/TdFrrM4DqZr4xVXHO9zhffT+dac6jMJFJdwfCXgfR6Y0T7pLj
         7lIK18/X8LIiEX+kIe/Dg/f9QC0n2sUrYKzC0Co5qDsRDZLv3l0sCF6UxGC47DzdGKNi
         9T+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8R6XSlNUj8BgJBuLAY3dDAqqlQK+wG+240RBIK242EN3t65JkQzzYlmlbjYQvQt+0cEcfI@lists.linux.dev
X-Gm-Message-State: AOJu0YzfmLNetUfi+AZWFfyQv7qoUP/wSsKIN+Am0Ei3O3pb1sMUdJHr
	bK2UnkDJoRVKurxUU6s8fugQKICWG3giYAFWW7nHSvtR0k7Bq20V2sH/
X-Gm-Gg: AeBDietpOO+41JMhZbGslEDxI8E96espML2lfdALhv2eosgu6EuSZqi25b8vC13Gv8F
	V27nL5VPtg1P8baxVXQrFus6G+Qj1B9pEu5D/t21gv+PA5PU075ACMzJi/J/WfGG1I1mXOoECIv
	MZ++viYrSt+HJp9N1AkVQO8h5utO3onJSwKQZQiFfoWx0lPU1teEuKIagVJ8deBbZMf62FhBXYZ
	/uRdMVjYnBkDC0u46MO2ruyVJ5rprbve2ud3gu1y8Zf7csF7rYeLjxOmtRyOgderwluAn63wkJu
	he5IbHBNfnPq9+w1qx7Vfve42r5hRRVm5ZU1w3JSYi8NxcMrW0EMQ7CrGqkYGLPsUtRXuHqA+iE
	ZR41UjdVUpZcsyPqTx3BKFxXSZY5nAY+vf7FQWXr/E/yjBuWOytnm/Sg2qhN+0q90Yd7ZTXKQQ8
	YOAQB4U5EuiFOVc+lGukUoQo/79mvbh8QCZ6gw1Kkp4cMRetmVaUhlHfQjWHmKCO3WxvnvehBuC
	yNN/qrpwcZaWOiYxQ==
X-Received: by 2002:a05:600c:1e8a:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48e51f4cdcdmr5427305e9.29.1778005661133;
        Tue, 05 May 2026 11:27:41 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:40 -0700 (PDT)
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
Subject: [net-next RFC PATCH v5 08/10] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Tue,  5 May 2026 20:27:09 +0200
Message-ID: <20260505182713.27644-9-ansuelsmth@gmail.com>
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
2.53.0

