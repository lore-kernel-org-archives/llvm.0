Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA84D1AA7B8
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730569882; cv=none; b=S4GZWEBl2NyprdSAumdSi6+lP6S6zFnE+bX6kCuOmdZAuN5Ys+VY4qC6u+bFajV4qKm3YTJlGvNQYUuTBpUpNV2jvRoCBUBTMd/YeFS3GM5HsyxyForGmcEmSxxLOJjAwk7AvZ0r9H5QMK0t8C3n4eITKjdh625R1E7X6FWWPvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730569882; c=relaxed/simple;
	bh=yEI+hQHiZQY7ehD56rzBwPffwdH92W/UhMThLRYgnhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzrEaCT9Ns1+B03mPMYy3cYNo80fOBgTNHOPcS8ZIYdXGPZJtJHLWmDsUUmk/4C4Nk4mrTeTO+CyoJeBh5vcLdBC0DfamSHQKqIuQtlLuTQ8Y7gmqNCa8taPZL0wcmC/9nLFlH4e18FoqcPe/ktc2Wpxo2M5WsVgqkBAfMQGpbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG1SJ5ZZ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG1SJ5ZZ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so1961515f8f.2
        for <llvm@lists.linux.dev>; Sat, 02 Nov 2024 10:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730569879; x=1731174679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7A9KiIj5azyBmcBDWj3pk1ALcLPY6NaAlc3dg84Ruc=;
        b=OG1SJ5ZZuw7g0yOwA7oWxEnYvu/JzQGURlTx1WJjBYWLSKDy0TNXJvr73c8nIne2Gg
         2l0cPfXRpSgF3jE3Z2m1QazBmxARCJy6rsi707x4wYY8GxKBG8fEfgg/3xo2Sm6qKrwM
         zcF+T1zJx7WQa9d6NcGSryGAf94S4ZYZYlsQ6cRoR+alfAzdOmrYpkvZp9ZyG4GDEEkG
         54Pr5VsF7YhkZ3tPGfVWcJqSj2e2WPrbRTqRpQ4qyWeR7nlr/j51/roEpBSkBHTrGZuz
         CyxUI80Stve4Czs4T1NkcSc0TFF8tLODtGFyReytdV+jAWm4MVvWyq3L79HTMahfcpnu
         5/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730569879; x=1731174679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7A9KiIj5azyBmcBDWj3pk1ALcLPY6NaAlc3dg84Ruc=;
        b=lRjngnU1D6HantbBK6XVFEICbX/v5j8ZRvHDIHTOWWmD45YxQIF9324YpiqVb9/kkC
         6GNIRrPKnL66Bz4erJ9LKiH+tzQtkkabM6489J3rlW/arb7OiN4XTnukD/nA59291oF0
         H0Ma/L3uZ6qKMBoD2P5IrlAuZfRhMsYsprqKDqX4BaW5exrblLGg+Qwk8vMhjEmsf52N
         vtNgJlH50kWLC9WOBDJDomtQhUEtmev2ik9qHBFzNm9IqtyZ35Bcrx142A2DQK7DyyoL
         7B4jcor0ra9rooNfoZsXwNSWQQMW2TpzIK0DjLA7L99jrzeTyu4GKYemFwFqhVv/WGxc
         hTpw==
X-Forwarded-Encrypted: i=1; AJvYcCUf6109hqhq6bobH6BmBbS5OfhqXkYSLo2SLXaBp/+ckzUKs9bGFbUKavrZSwtzMaaWXHFe@lists.linux.dev
X-Gm-Message-State: AOJu0YwTIsysmEBXSmfWxykPB3C0SHSxT75N6D2ejWhbH1G8DNs2KLG1
	qqBxa/rTrlHqeg7LMf25+tRSiAiY+uBmqXVSB837Ub2KAaUDBhnh
X-Google-Smtp-Source: AGHT+IG/88Fs6owiWfglDv/qT3GWO4sjkF23tstNx+tGKllkCTOcMQ1YtJoOpjeW19r68AgBat9Ecw==
X-Received: by 2002:a05:6000:710:b0:37d:4821:fa0 with SMTP id ffacd0b85a97d-381bea26456mr8048925f8f.48.1730569878636;
        Sat, 02 Nov 2024 10:51:18 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-431bd9aa611sm131471715e9.34.2024.11.02.10.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 10:51:18 -0700 (PDT)
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
Subject: [PATCH v6 2/3] dt-bindings: crypto: Add Inside Secure SafeXcel EIP-93 crypto engine
Date: Sat,  2 Nov 2024 18:50:34 +0100
Message-ID: <20241102175045.10408-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241102175045.10408-1-ansuelsmth@gmail.com>
References: <20241102175045.10408-1-ansuelsmth@gmail.com>
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
---
Changes v6:
- Add SoC specific compatible
- Add now supported entry for compatible with no user
Changes v5:
- Comment out compatible with no current user
Changes v4:
- Out of RFC
Changes v3:
- Add SoC compatible with generic one
Changes v2:
- Change to better compatible
- Add description for EIP93 models

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

