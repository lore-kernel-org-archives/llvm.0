Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23872CA8
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 07:11:40 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 75so13257127pga.3
        for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O7mO4QSiClmvTaaX6IIKICBgLfMPuL0ZWPXZmY5jlu8=;
        b=peDnRfTxFeniLUU1rpOZungbmSZ9OVV27nF3ONdlf53Oh8unPTZ7UG5O52wBws2zsW
         Fiil+nJmZWL5Qnuw7YAVjnNrxSx1hnFHVuUb3HuvXFjOLi2+kRXTtI3E/F++EXBOasUL
         7U4pagC5UfeRq9IVshr/ai/GkrYBKoRm6+yEVCfmtT3NH7FCdK/TZKacxVCa7zxdV/6R
         r4yi7yLH8VffkrF6Pypsn0dQaifPzi5YkuSi7J6YtE8aXRSULTYrwRVY6zbjaaVm/5Af
         LuSabIc1UYrANqGrxGDp1o3VbIoBNpJRYy4bMFKU7duZBA6Tg2ZtED8oO6lMzSus0D1S
         8wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O7mO4QSiClmvTaaX6IIKICBgLfMPuL0ZWPXZmY5jlu8=;
        b=TYBVNAIyURdWHCz/dS2lMwwnN6cQbviwYE/htRimmdrTXXRJ5RB6JFEmtCefnNBmS4
         8DVdth6t9lI57B0EPbVIAfvIlHKzFs5MwlgxPCXX5+qWX5mZ/dEbMY1l3D1zkB+S9jBV
         xonq0m1BhibQ0MGmGG+EB6SXxmjF/uUHMt1wHG8Y0O1JWVzAK6NXkmBOEIGV4k0K5deU
         4kz/AMd051OdtpMfNdz2N7FASZu098wxSbVXC06lMlxg9/6Rv8HvUZxQhG+hTqh2fNCw
         5Rfl6FnGpyA9VyqY/sVXZAAFuNv/FBBbLXHk9iS7Z/c6+4f27CsMpNh+k/GJ7zOyDJu6
         FP0g==
X-Gm-Message-State: AOAM532bDr2ohOjyNzz6jPfyeve/l59AfGn7AXOypEVIxMXu+ZLpFQi8
	OIZ6B+No6vzUyr3VZ+qdB4o=
X-Google-Smtp-Source: ABdhPJyr2S18KFYtGOniHgeMQyBzTqhIITYHECliZpIAyL17CFcWo+IEaagwU5JPcV9Zcy6GpCumnA==
X-Received: by 2002:a63:7e45:: with SMTP id o5mr17469803pgn.47.1635232300290;
        Tue, 26 Oct 2021 00:11:40 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:11:40 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org,
	mchehab+huawei@kernel.org,
	hverkuil-cisco@xs4all.nl,
	ezequiel@collabora.com,
	gnurou@gmail.com,
	pihsun@chromium.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	gabriel.fernandez@st.com,
	gabriel.fernandez@foss.st.com
Cc: patrice.chotard@foss.st.com,
	hugues.fruchet@foss.st.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	lkp@intel.com,
	kbuild-all@lists.01.org,
	llvm@lists.linux.dev
Subject: [PATCH v7 02/10] media: dt-bindings: media: add document for STM32 DMA2d bindings
Date: Tue, 26 Oct 2021 15:11:14 +0800
Message-Id: <1635232282-3992-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

This adds documentation of device tree bindings for the STM32 DMA2D

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/st,stm32-dma2d.yaml  | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml b/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
new file mode 100644
index 000000000000..f97b4a246605
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-dma2d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Chrom-Art Accelerator DMA2D binding
+
+description:
+  Chrom-ART Accelerator(DMA2D), graphical hardware accelerator
+  enabling enhanced graphical user interface with minimum CPU load
+
+  It can perform the following operations.
+
+  - Filling a part or the whole of a destination image with a specific color.
+  - Copying a part or the whole of a source image into a part or the whole of
+    a destination image.
+  - Copying a part or the whole of a source image into a part or the whole of
+    a destination image with a pixel format conversion.
+  - Blending a part and/or two complete source images with different pixel
+    format and copy the result into a part or the whole of a destination image
+    with a different color format. (TODO)
+
+
+maintainers:
+  - Dillon Min <dillon.minfei@gmail.com>
+
+properties:
+  compatible:
+    const: st,stm32-dma2d
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: dma2d
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32fx-clock.h>
+    #include <dt-bindings/mfd/stm32f4-rcc.h>
+    dma2d: dma2d@4002b000 {
+        compatible = "st,stm32-dma2d";
+        reg = <0x4002b000 0xc00>;
+        interrupts = <90>;
+        resets = <&rcc STM32F4_AHB1_RESET(DMA2D)>;
+        clocks = <&rcc 0 STM32F4_AHB1_CLOCK(DMA2D)>;
+        clock-names = "dma2d";
+    };
+
+...
-- 
2.7.4

