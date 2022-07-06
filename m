Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680917C
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 19:41:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so9753374wme.0
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGS8MF/Xhbljo/V0X6FBR6Q+x7h80TWkximSoLlEBGs=;
        b=bNBEpmvX2QfzrR6lILsXG6WHpLniE3Y+yH24C5dTXtslVhyxCu926tN5/DRb8rPaGW
         Gzq58ib+Bqjegyt4Jg69dEzdSx0tofEdELldaitVi8RLhUWV4hd0MyjsSsX7SgVqQkjm
         wsm6DyX8kBL0NEXR9roGh4FgWC4AucXmQnSaE0eep0TX2AV8nRsi8kt+Krc/jW0j/lQ7
         H2/+7vcuOYmByBv55vH048IeakzS4eQiTfy0fXNYJ2bmaEl6gRJZ+YsJLqgOs4pnoCNb
         Y71hA2m6JcYvenutz9ujtvSmqEhfg0JyhrouBg2Oaqaat/OlzGNKrsnzt+AIvHzZp9pF
         BUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGS8MF/Xhbljo/V0X6FBR6Q+x7h80TWkximSoLlEBGs=;
        b=wQo8/lF1/PanwGPIqI43iGal7Ky2W4kbhPfFtoZu29v6os9XOgzYxPJri3VxbkcSI7
         eWsMk9kR3qDK6haRwGGObMZO5NX56AzVICB/J9+t6/qehIHBluMeqqO8m+auZH/YDx0H
         6CKqURuALdMJsJD+ewngzRSgF1OmudtYCQlnmyObC3KJWyTdocgKHZKb+qqVnoK8totO
         QtYLhPMmtbPiIAGbKLEobAefBNFKCOjHDxyHynbbibOkspNifZqN0+lpQ5gpmhEGPhXp
         pv5rE5GIPWtRv1fmkSrp2l6LyE7tiKbNjfW8CqYoiwf2nzzWG8pl67AkKMwwX83w0HgG
         PymA==
X-Gm-Message-State: AJIora9PllHwU1JKtxvZcDIiERzUH/qpYATJECJZoymTWxEeg+d2K3gN
	Xc6WyDi7QCbyuBIkWIgAcrqKAw==
X-Google-Smtp-Source: AGRyM1sNxd/8XhYC3F5aYfNgv+Nhpu3gpUZPoFmwCOrA8M7/vH3awkPM/0tATAQwTG+RQ1UYvfGdlA==
X-Received: by 2002:a1c:44c3:0:b0:3a0:5f25:498f with SMTP id r186-20020a1c44c3000000b003a05f25498fmr248976wma.124.1657136501688;
        Wed, 06 Jul 2022 12:41:41 -0700 (PDT)
Received: from localhost.localdomain (88-107-17-60.dynamic.dsl.as9105.com. [88.107.17.60])
        by smtp.gmail.com with ESMTPSA id f190-20020a1c38c7000000b0039c5328ad92sm23387320wma.41.2022.07.06.12.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 12:41:40 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: caleb.connolly@linaro.org,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	llvm@lists.linux.dev,
	phone-devel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/2] dt-bindings: power: supply: qcom,pmi8998-charger: add bindings for smb2 driver
Date: Wed,  6 Jul 2022 20:41:25 +0100
Message-Id: <20220706194125.1861256-3-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706194125.1861256-1-caleb.connolly@linaro.org>
References: <20220706194125.1861256-1-caleb.connolly@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for the Qualcomm PMI8998/PM660 SMB2 charger
driver.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../power/supply/qcom,pmi8998-charger.yaml    | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
new file mode 100644
index 000000000000..277c47e048b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,pmi8998-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PMI8998/PM660 Switch-Mode Battery Charger "2"
+
+maintainers:
+  - Caleb Connolly <caleb.connolly@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pmi8998-charger
+      - qcom,pm660-charger
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: usb-plugin
+      - const: bat-ov
+      - const: wdog-bark
+      - const: usbin-icl-change
+
+  io-channels:
+    items:
+      - description: USB in current in uA
+      - description: USB in voltage in uV
+
+  io-channel-names:
+    items:
+      - const: usbin_i
+      - const: usbin_v
+
+  monitored-battery:
+    description: phandle to the simple-battery node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - io-channels
+  - io-channel-names
+  - monitored-battery
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      #interrupt-cells = <4>;
+
+      charger@1000 {
+        compatible = "qcom,pmi8998-charger";
+        reg = <0x1000>;
+
+        interrupts = <0x2 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
+                     <0x2 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
+                     <0x2 0x13 0x6 IRQ_TYPE_EDGE_RISING>,
+                     <0x2 0x16 0x1 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "usb-plugin", "bat-ov", "wdog-bark", "usbin-icl-change";
+
+        io-channels = <&pmi8998_rradc 3>,
+                      <&pmi8998_rradc 4>;
+        io-channel-names = "usbin_i",
+                           "usbin_v";
+
+        monitored-battery = <&battery>;
+      };
+    };
-- 
2.36.1

