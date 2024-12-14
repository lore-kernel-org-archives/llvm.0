Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AB6192D8B
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734182929; cv=none; b=EnHsnSzlAN55+/ixRb2BxcYR+gIbWk469lQqWxDs4bWnUtn4JISy3ByOgMYbGIhrt5Z29z30ba76Zmaowg292qRxfxX/OTu9dKtrSs5vNCQabGbJLvntX5QyRo+CQWWag0iIMsNSdYJcN8wxFl5200RzYX4NpE+9cdZgBTh32wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734182929; c=relaxed/simple;
	bh=E8cFp+bHGIU6pZjCwgdyEMfWXs0JQy/krXTTtrw2utY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpsuIn2lIbQoogqf8fDF3ZjL34LHEdLDYtbNtfNrHSXTZ85mm6nmfIAzyQSws84CHk2H2XWL2uCK4qqxmmZvAwKc9pfahnWX3vkDky52ano+NYDgJv2LS4venIIwYhh8J3m/2yVIuNSpSPxIhLFIIJKPDFMEAVToTnqmCaYVB6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5WNLE3j; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5WNLE3j"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso18834615e9.2
        for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 05:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734182926; x=1734787726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0cVLwNBaKmRixL4jHSZNuCFVNGOC7PS8Cjxhvb4LMQ=;
        b=H5WNLE3jga7jaiI0Og/6rEEBMwgPwN2srrgC3NlLqm9VoAfMQTyaK5SlmlopvQF1KF
         CdnnzWIq7NuJqO4GA7fG+xhPmstLh0pT9u5i47j3OhxnuhRsEIrxoyWRc/b8JyTuVag6
         saqLCjnYrFUzTWydZFDyNc7DjLyC0etPdvW+bRhkN0UBRlCjhuqzhgRXYnDK6Qzdf0Ej
         6g0HkzesDor5hwEWDlT2tltNNbPaPhO5FniJIbpCi8x0yMpaBjb8LD3c2YxTJ9HEt4Ej
         bL0rWZtClYH9eJn/2HMcM+7rtAVC1ylW3IE+32vd5GpHESwvyvgoYdn1F8AgxTXCfF1J
         UW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734182926; x=1734787726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0cVLwNBaKmRixL4jHSZNuCFVNGOC7PS8Cjxhvb4LMQ=;
        b=n2W26CWAuB3w/kytJM4Mo9iaWD4zP2yOIDXRhSMtJbHurPezcPgh81nvHBDr09mCu+
         MGck5RYPYnwXgdKfeoAp/7T+JVXbHX4XwAmDia5pK/XFkGUicAh72KFtffbMiCuWcwRU
         +PjW85RCLN2FOCgjg1dbEQBjopBSjHR5GZBzbKh7IdofizwQp7J8RIXJJvCrkoLa0FCD
         OzGPy7RddZqGLXKVSKpNIBC51zsWF0dPWfGLKLSgoJKozQftqs3ZzyXd85zl3FIbL3Sb
         XNsHtOvKR5x94wQxELEJj5Nojerf2Bjzyw3de+tL8xHo1XXpv6oy+8Fcrbbw6Ud9rW+8
         I50g==
X-Forwarded-Encrypted: i=1; AJvYcCVEJFKuKERhabuEDiqRaIh/4WKITS4PBepX6FEY+NjwoYe2FeX1bF5iaexkm48N2QWUBO3V@lists.linux.dev
X-Gm-Message-State: AOJu0YzS6QEinb5thGFgBhmUEHkdnwtTIbG0rQ1v6/yfGFCZIkc05yhh
	/hjm74gV6RgNXzBJxp2GBIiqRHkeQTOHVkvW/CVA9RTel/z4CaFwn5kAQw==
X-Gm-Gg: ASbGncv0e++ZQKlDMLvYZ77aLbp4GkuHgoQ7w0IF0lPOJ8kXhWrIJVXxsufCR1nRgBa
	/a/eYc0bi7sAcr+9FU2bxiZd5e8aFJOTsasFMf9U043QRrOgi4Ou3kihkmGz6QF9cFrF25OgiRG
	1Xyf3exTzMga1Zw3mTuRAAQvDVc07IR5GG7LoPfbuqHAP/jbG5f63Au2qlDIAMU1pQuDt3SzGBa
	0+NlGZZrvg5svNacGqmavtc6tgGLzBqTf5mwnKI17vw+PgyZVOsFVrGFeytJO2R68rpYyxJfjXl
	GGBIijKfsGfdll5yEGXp0qaAeg==
X-Google-Smtp-Source: AGHT+IHWOOjAx92o0UkZW27B4uW0stxX940JFjTYyBWPuPIFZaoCv+Fku6fPNjhiKs2/AftSrP3jQw==
X-Received: by 2002:a05:6000:71e:b0:386:373f:47c4 with SMTP id ffacd0b85a97d-3888e0be376mr4821291f8f.49.1734182925995;
        Sat, 14 Dec 2024 05:28:45 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80162a6sm2559850f8f.33.2024.12.14.05.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 05:28:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	upstream@airoha.com
Subject: [PATCH v9 2/3] dt-bindings: crypto: Add Inside Secure SafeXcel EIP-93 crypto engine
Date: Sat, 14 Dec 2024 14:27:53 +0100
Message-ID: <20241214132808.19449-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214132808.19449-1-ansuelsmth@gmail.com>
References: <20241214132808.19449-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the Inside Secure SafeXcel EIP-93 crypto engine.

The IP is present on Airoha SoC and on various Mediatek devices and
other SoC under different names like mtk-eip93 or PKTE.

All the compatible that currently doesn't have any user are defined but
rejected waiting for an actual device that makes use of them.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../crypto/inside-secure,safexcel-eip93.yaml  | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
new file mode 100644
index 000000000000..997bf9717f9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/inside-secure,safexcel-eip93.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Inside Secure SafeXcel EIP-93 cryptographic engine
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: |
+  The Inside Secure SafeXcel EIP-93 is a cryptographic engine IP block
+  integrated in varios devices with very different and generic name from
+  PKTE to simply vendor+EIP93. The real IP under the hood is actually
+  developed by Inside Secure and given to license to vendors.
+
+  The IP block is sold with different model based on what feature are
+  needed and are identified with the final letter. Each letter correspond
+  to a specific set of feature and multiple letter reflect the sum of the
+  feature set.
+
+  EIP-93 models:
+    - EIP-93i: (basic) DES/Triple DES, AES, PRNG, IPsec ESP, SRTP, SHA1
+    - EIP-93ie: i + SHA224/256, AES-192/256
+    - EIP-93is: i + SSL/DTLS/DTLS, MD5, ARC4
+    - EIP-93ies: i + e + s
+    - EIP-93iw: i + AES-XCB-MAC, AES-CCM
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: airoha,en7581-eip93
+          - const: inside-secure,safexcel-eip93ies
+      - items:
+          - not: {}
+            description: Need a SoC specific compatible
+          - enum:
+              - inside-secure,safexcel-eip93i
+              - inside-secure,safexcel-eip93ie
+              - inside-secure,safexcel-eip93is
+              - inside-secure,safexcel-eip93iw
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    crypto@1e004000 {
+      compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
+      reg = <0x1fb70000 0x1000>;
+
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.45.2

