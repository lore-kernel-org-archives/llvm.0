Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE39234D0B
	for <llvm@lists.linux.dev>; Tue, 14 Jan 2025 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858522; cv=none; b=nsWIQBUANMLudr1cXqu+d0d/DPQi9udYHGbNn/tcv+/PdFBVkCYh9X9G8DC0GFwYc3ImRlt2WSUpoT7Asm/+DaoegO7rMixamAk8pz/U+UZgyCygNa0o6FNGpwioxF83/z+itNxPhzw1rW6OFntp7iP7yNCCz2QS11divogTdvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858522; c=relaxed/simple;
	bh=E8cFp+bHGIU6pZjCwgdyEMfWXs0JQy/krXTTtrw2utY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7vew6bUj3Is228Gb0oRFQuU7wBrJnu9RWZQ2JNy1y5YLuiNwHa9UHKhhQN+PDR+ezaQy8xwQ+lEVGbgxqgLYKdA3nSUGoGnTX2XEzQc3MyQXOKW3LDQfcoihXYJNwkjVLQ6VOhJk7BT1jxSj6W5j8w24syX7uKhriKl8t2MVxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOhaFGd0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOhaFGd0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so6570455e9.2
        for <llvm@lists.linux.dev>; Tue, 14 Jan 2025 04:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858518; x=1737463318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0cVLwNBaKmRixL4jHSZNuCFVNGOC7PS8Cjxhvb4LMQ=;
        b=dOhaFGd0ZLdsXCySiPRJXiOiPvGMLVR00upviLL65TE9sDdGy0ZeVIC9uN/wwq1KcK
         35tUxcwqijlxcLOrIbYk5/P2GVb8s6QAdu8ebDw82A4mNTGaJwZS83sUDWK0Ckykgus+
         LDu56Qt3eAsrKV0ctRE83rBduY/mNFWwiXdnA5MJ2wvUj1NS6o3itpmS81pMxhHmxj1t
         CDeKDngSDOH1bl6vqTuInvaLA3tBoo4UW8JMDTFEtTNkMVkW5EWxUwk03KTn5WT0EFW8
         07EWqaO/hXbXxwHTpAeByeN750RJyxBQjA3gamKzOeKLuQgfEQrWNodqCthXEnRkZDRs
         xfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858518; x=1737463318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0cVLwNBaKmRixL4jHSZNuCFVNGOC7PS8Cjxhvb4LMQ=;
        b=DB507pgPu3e119UKdL1UM1lH+ri2g8kzxyiTSUiWGma8aLfkpZ9A57e4GwjQhG8RYN
         Irt9F3dD71MdhZLKTL9AH5eovf9PKLkErOyaRyKenmWSdS6Kgh65L6m9WqLn1Vo+oC5j
         HXRTlzVDSK2V3g+2L0oV7Ia9W2s54eE/PThMxPkDsLq6szWNobQTeMtqLmalAtn/yELR
         +1GXrM2rz2rHwjiWj5k45ek4fYjG6gHcI7CB7MabdfPkw40aBiDaTje/pvruvSiDc+L0
         WwfilLzwmj6JpJdcU2QPbcj0rfy26F9XfALKBOpAzyc2RiwY8WzvbSA14pQ81gzRxjbs
         gj1A==
X-Forwarded-Encrypted: i=1; AJvYcCUF6qrMe2wfDE//RLhy4j9ClE04cU1QK5zrsYCn6Xwpp26LZzwjCh1KtqMD8hiIDwUceg5G@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx3iFiCNacFBqDdv14kZ5WJDLdvLJfB8cWnXCSsv2h9n5FqJJE
	GBzGiNt1f6DqPuEexRB4p6gP8vx9SYc+d0GMo9GjM8FX0ECp7jVE
X-Gm-Gg: ASbGncsvdg2od4Ey8rHCPGuqy8ECS0XhaIoh3YQKzfiRnZOjeoduRUCQObyG3M7A99s
	9YSV49SeySoFuCG4pQNESfMIQlN/DQAbzyn/0pMaxg3eITiP2WVFYTBNLqvzJdJIXcLV5OFv6Y/
	JDcBsCS+bMLolcwlADCiImt2PA7zH96iE1yJJsJkpbNSHfj2M2j3bMuL/5vCQjXMGVKxTSynRmN
	jOpvY8tBtO5aqfuXhe25cDMKK2bcuSpUs4NUHExMXSBU2cXcEOf60cCBdYUIJjO/15F81V9XWB0
	6RCBtL/qBWMKjYxkmjOfLoMDKg==
X-Google-Smtp-Source: AGHT+IHXY4XWbdnBWLd1KAqb2AihBKBzZE+gV9tUIoHxG09rz5ryWx1Q+/tx1cKZFhVbaysHV1GqXw==
X-Received: by 2002:adf:a312:0:b0:38a:88bc:bae4 with SMTP id ffacd0b85a97d-38a88bcbb29mr14866716f8f.18.1736858518309;
        Tue, 14 Jan 2025 04:41:58 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c6a2sm14798771f8f.54.2025.01.14.04.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:41:57 -0800 (PST)
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
Subject: [PATCH v11 2/3] dt-bindings: crypto: Add Inside Secure SafeXcel EIP-93 crypto engine
Date: Tue, 14 Jan 2025 13:36:35 +0100
Message-ID: <20250114123935.18346-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114123935.18346-1-ansuelsmth@gmail.com>
References: <20250114123935.18346-1-ansuelsmth@gmail.com>
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

