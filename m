Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405F83264D9
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 13:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616420; cv=none; b=lr98uHLCj7GumqwoFMkJg1bhM6/umXJIT/o1X5eANkOZXwjGDH5v46s9obg+05f5zcSLlR23v/0Ubm+w5n4AlHG7O4bMqSADq42e6a4OGnoaCgVEjk2d3XNN1W6BKgYZYNSq0g5c09sohsTKP4GMWlBxMZdjbTitEEXidFY/0+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616420; c=relaxed/simple;
	bh=zfSdy8NMKbr7R5wDqh8mH+/O4+c8Z/5ivVV70uaSLEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1xGWIR1gmRi/6LbDnJ7ojLRUBVO3E+/0mp5XQbWUH5OkNrb46xTmnRZUWJK9OCiq8bUSfr3+pUwcKD4vOVEgdMZhf1FzE8Wq1X3Vrd+73Zdu/Hr7gNGT0cT6DhH4vfgjNETO1QNi1+OlyQFu/X/pNUPxyArDFsT3D70fQNriYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=oG+rHt9n; arc=none smtp.client-ip=136.144.136.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="oG+rHt9n"
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4gfnp63TSJzQvtnC;
	Tue, 16 Jun 2026 15:26:54 +0200 (CEST)
Received: from [127.0.1.1] (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission10.mail.transip.nl (Postfix) with ESMTPA id 4gfnp55Ppcz1g93Pb;
	Tue, 16 Jun 2026 15:26:53 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
Date: Tue, 16 Jun 2026 15:26:53 +0200
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,hs-drv-slope
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-1-7d21fb1d1484@herrie.org>
References: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>
In-Reply-To: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Herman van Hazendonk <github.com@herrie.org>, 
 konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781616413; l=4470;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=zfSdy8NMKbr7R5wDqh8mH+/O4+c8Z/5ivVV70uaSLEY=;
 b=d/r+0Pua3XyjOfyk/Da25wn9aBabd+DW5o9spMJyRwEvfmfWRhNvHO1X8M0Z4uTTS0xH/w0fU
 XiVqpGH3zjICHcIx+IGFSuhYT8xXvTrP5H3gg0m/RVjJsolNgKnuRFi
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1781616414; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=4jUT/kMxqvdedR3A2AsCnpYyG9Jp0zuNsETOPERT+1A=;
 b=oG+rHt9nUMhZHk9J6Xc2BBrGKt5gyM/TxGzNnX3QbzYNhoRoPTFvTpehREqqYRkFSiuYKM
 VEFbwjz9YflLnhW4j38iIsevEmg/usvGn488Yi90zicvKS/yXXcqd1T0sO2/o6ziHDUrOo
 sjxWwL1hrRUUST04Eu58peFbkz8RgnlMCk8flPIbIYhwQxvH4MbcaVb/Z7ESH3Z4Ku8JIJ
 a/j3AMin3anWt8B2Lv0EOq3/VBP7RmH+dDWocjfodwgJqRe93M3cVDdquUn4pMfp0CpTZ/
 /Jwga6CMlB5bocJZW0iCnbqjXDOQy6QI6mAdMq/TXadGLb6spLLR7P+eJCAZng==
X-Report-Abuse-To: abuse@transip.nl

The MSM8x60 / APQ8060 PHY needs three vendor ULPI register tweaks for
stable USB operation: pre-emphasis level, CDR auto-reset and SE1
gating in registers 0x32 and 0x36.  A survey of MSM8x60-class
downstream board files (Qualcomm SURF/FFA/Fluid/Dragon, Samsung
Galaxy S2 family, Sony Xperia, HTC and HP TouchPad) shows that those
three values are identical across every reference board and can be
hardcoded in the driver behind the existing
qcom,usb-hs-phy-msm8660 compatible.

The only board-specific value is the 4-bit HS driver slope in bits
[3:0] of register 0x32:

  HP TouchPad                                  5
  HTC MSM8660 ports                            1
  Qualcomm / Samsung / Sony reference boards   0 (silicon default)

Add a qcom,hs-drv-slope property carrying that 4-bit value, valid
only on the qcom,usb-hs-phy-msm8660 variant.  When the property is
absent the driver leaves the silicon default in place, matching the
behaviour of the Qualcomm reference platform.

No public Qualcomm documentation describes how the 4-bit value maps
to an actual slew rate, V/ns or %; the bits are an opaque hardware
control whose meaning only Qualcomm knows.  The legal range (0..15)
comes from the field width in the downstream
arch/arm/mach-msm/include/mach/msm_hsusb_hw.h
(ULPI_HSDRVSLOPE_MASK == 0x0F).  Boards must therefore copy the
value from their downstream/vendor kernel; this is a measured /
tuned-per-layout knob, not a derived one.

Assisted-by: Claude:claude-opus-4-7 dt_binding_check checkpatch
Assisted-by: Sashiko:claude-opus-4-7
Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../devicetree/bindings/phy/qcom,usb-hs-phy.yaml   | 89 +++++++++++++++-------
 1 file changed, 63 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
index e03b516c698c..e605f5683f7d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
@@ -9,32 +9,43 @@ title: Qualcomm's USB HS PHY
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,usb-hs-phy-apq8064
-          - qcom,usb-hs-phy-msm8660
-          - qcom,usb-hs-phy-msm8960
-then:
-  properties:
-    resets:
-      maxItems: 1
-
-    reset-names:
-      const: por
-
-else:
-  properties:
-    resets:
-      minItems: 2
-      maxItems: 2
-
-    reset-names:
-      items:
-        - const: phy
-        - const: por
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,usb-hs-phy-apq8064
+              - qcom,usb-hs-phy-msm8660
+              - qcom,usb-hs-phy-msm8960
+    then:
+      properties:
+        resets:
+          maxItems: 1
+
+        reset-names:
+          const: por
+
+    else:
+      properties:
+        resets:
+          minItems: 2
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: phy
+            - const: por
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: qcom,usb-hs-phy-msm8660
+    then:
+      properties:
+        qcom,hs-drv-slope: false
 
 properties:
   compatible:
@@ -85,6 +96,15 @@ properties:
             the address is offset from the ULPI_EXT_VENDOR_SPECIFIC address
         - description: value
 
+  qcom,hs-drv-slope:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      4-bit HS driver slope written to bits [3:0] of ULPI vendor
+      register 0x32. Board-specific tuning value; absent means
+      leave silicon default. Only valid on qcom,usb-hs-phy-msm8660.
+    minimum: 0
+    maximum: 15
+
 required:
   - clocks
   - clock-names
@@ -114,3 +134,20 @@ examples:
         };
       };
     };
+
+  - |
+    usb-controller {
+      #reset-cells = <1>;
+
+      ulpi {
+        phy {
+          compatible = "qcom,usb-hs-phy-msm8660", "qcom,usb-hs-phy";
+          #phy-cells = <0>;
+          clocks = <&clk 0>, <&clk 1>;
+          clock-names = "ref", "sleep";
+          resets = <&otg 0>;
+          reset-names = "por";
+          qcom,hs-drv-slope = <5>;
+        };
+      };
+    };

-- 
2.43.0

