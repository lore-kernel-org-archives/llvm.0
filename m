Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3751DA309
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119363; cv=none; b=QShA9xmqw0j8yGGIK2EuWmuxyOUgN8AB46ylGhHy1aHfNMRWD0CD/BtT/01N518GueAZwCWF6/WjzI2TZOv6fLqvqCAuJ+hyPqYpyLqF9K59uPbbICfgumrw88u5rHKShSpr87ucGoAl3bx7Hzxf01RGMzB0SPFnrxUeD3XbGIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119363; c=relaxed/simple;
	bh=GeRI8BP/aA44kWX9PQ2iDTyA0xCW/Q++SRP2iIdQ3w4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2a32r/wGhoWKFvAb8OpzJZDTJ/BVlrlEcmAP1dgIRI/nKEv4kLwGl9OP7IGjqaRDK2SScLOyiCaVLQgMofylIfWM+eFqzNw53GlERw0TD6rijmeJOwAqu61PFm9nYdEXwHk/kPeZWbCYpMIxIIhM+08IIMzUQzI1oLV4OFTFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9UWtt1h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9UWtt1h"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4314c452180so36128865e9.0
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119359; x=1730724159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPqZCELaBqJktZQkb9UmK7uYBGIMFPnXLMqvprQAW/0=;
        b=k9UWtt1hjk+nyPO7k2XtRksXVkL2hi87qyC5EqZlcTA5wG1w/DJX+8M7xviWy/M47/
         nSmh2GUfoyA4UWw7bWyrkvC/9EwMK0CX27zEbbXn0Sanv1mn+fUEmYkYWdFuqAqEoXgD
         cBh0X0lGO0yxXzmPVPhAAl79YGuXjAPX5VjPqC199qLhbpD7wkt2Pr7IYh07zeLgep72
         aPtHJDSpvGPTAktDSIL+aYL2oDrQ3p1bcOg7pdZAkuSyv320INTM4qTNocWbZGxNVdHT
         XDOsNy/+CWxi5ROLq1F8Df+rfFL4DlbinKJOF0Suf23EaMjOr12Aki9zpsFdjB3DkSgm
         D64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119359; x=1730724159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPqZCELaBqJktZQkb9UmK7uYBGIMFPnXLMqvprQAW/0=;
        b=e2SMZxRT1AKtCkj6csH7a101lyG7Mqr2ADp8B4URgaiGGJr2C88w6/Hd7oqZw4mk0m
         HnpvyTLYbLQP/h+Cp63OblRi2bK3irF0pzclBU7M9gdOqKoaWVvytBabAeyTvEgQevbf
         K7pMnniuB03ILMhdHci+gJDBsznqkz375tlqggIdh1Kh0TcY1+RSLMBBUc5qtcKTSDnv
         YPGpTKJmUvcNWc/qy97DN8oSNaG9ugyhR/yEqfqvpqVQYP+NRAsubgyu7zjPYjQ6lIUC
         eiGO1Bhxlfb1TNgWMkLRuMdTo6yC9goT5XR3eVHopuyIUBgZZEna30Mh3ZpDGvpDTXYP
         Spwg==
X-Forwarded-Encrypted: i=1; AJvYcCXOGTBtw+HNsOgt2maIb0913WRz8ruNptXANn5f30tR/KMDKGEKyEcsIbYeDEZrNUx8Wtoe@lists.linux.dev
X-Gm-Message-State: AOJu0YzXNIHRt+82Ld8+SofJUPSTlWYGFN468843Qld336upL1em23kW
	pEPNfE2T1kXH31ftYLZ2BS+BfzXqzPhX2Qff19jgii2p5p47zv5D
X-Google-Smtp-Source: AGHT+IEx2APh5d+NgrUF/k2+1R8r86xC6OUaFya4GdmQzDVvcj6CAXvQw7NHIF8BBHby0KDz+fFvzQ==
X-Received: by 2002:a5d:4d4c:0:b0:37c:ca20:52a with SMTP id ffacd0b85a97d-38060eb2411mr6325090f8f.8.1730119359034;
        Mon, 28 Oct 2024 05:42:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b71231sm9352608f8f.66.2024.10.28.05.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:42:38 -0700 (PDT)
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
Subject: [PATCH v5 2/3] dt-bindings: crypto: Add Inside Secure SafeXcel EIP-93 crypto engine
Date: Mon, 28 Oct 2024 13:41:42 +0100
Message-ID: <20241028124206.24321-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028124206.24321-1-ansuelsmth@gmail.com>
References: <20241028124206.24321-1-ansuelsmth@gmail.com>
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

All the compatible that currently doesn't have any user are left there
commented for reference.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
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
index 000000000000..188240b74110
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
+          - const: airoha,crypto-eip93
+          - const: inside-secure,safexcel-eip93ies
+      # Compatible that doesn't have any current user.
+      # - items:
+      #     - const: SoC specific compatible
+      #     - enum:
+      #         - inside-secure,safexcel-eip93i
+      #         - inside-secure,safexcel-eip93ie
+      #         - inside-secure,safexcel-eip93is
+      #         - inside-secure,safexcel-eip93iw
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
+      compatible = "airoha,crypto-eip93", "inside-secure,safexcel-eip93ies";
+      reg = <0x1fb70000 0x1000>;
+
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.45.2

