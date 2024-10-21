Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D01FA26D
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729522678; cv=none; b=TYEMZL5cJysDSw4VtWJbX3uiRoeKErE1djKhCayYtsJPdhHT/zsG7npmAsUTADVCCDLEfJvMJ/ZiotuOfdL36d/Bh5JMOMU6K5QR+dncmtg61so5cIvhdFE+jyFZ+jFeB7HYohsmXixohrJHwRDCeRzRiODA0HALvwZElX0dKvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729522678; c=relaxed/simple;
	bh=gecDBEmY0sD60QwCnonmOVpeQjrQUGS/cu/ZPOxV3qo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hM/m/GWc0jViae/qx6sGuaqUwsOnJZxST71pNEWpsFvgYzzfP6H+tPbGmcUvMumHQ79x2uhqldTmfpStvP/ThttdZfs+C3F+qTDLfTbHH4pZ99X4YAEYfsX2nOGMUE8U06+8BCLjTRJDxrVozSDsUszJOGswcTOkeTJ29NZXqcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOm788LM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOm788LM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-431688d5127so22566775e9.0
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729522674; x=1730127474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyjRdiaE6nTIgewuuCY872JN5MIT4tQknteoZiav5V4=;
        b=iOm788LMmOhTNWanJ3zBgE0p2vKmWLK8wXQHz+gIeySeyN+ZEezRyrXsq70FCNWy4t
         Zx4fgzKuYQI9EtglMoBufx7BGrdvWYozTY+3GR+POgeH2SHDZjYo4ZWlgWkeQ99DAV6Z
         +HOfK7aJ7xqbrPSkhnyswTQYE2PPg6Pe+SeU5edFGR4DcIGNC+MRt46ULzG6sjER4c2z
         1bjmmmE2ZsaUs2smF4EMyBBKJHf0iUomhwp995fOHFoBAhneAoSaYSG5iXwY2d8cZQgX
         sZC2kvaS4F3qtbA5+a1j82CVoz6MLETV4DUTyvdXRjhZh3CRzNluO5MelsmADXHegn97
         AF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522674; x=1730127474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyjRdiaE6nTIgewuuCY872JN5MIT4tQknteoZiav5V4=;
        b=gfpREwSfRJdytoKgT6NBLNAS5LWZk7gHttoDY3+8NM8oYuYP8yafCCmIVR2NWbln8e
         0yelmOmqNylHz3rP015geCaM25iSAXFKUavGMcVdYBtPvHGGe4nYOhXYkp2rTA9fxA/C
         L5ZWSmvS2PArxHyVkybiPO/4Jb0y/dB1Yz17f5aDy2PqAZ5iAfhqw0kVXkoEYYjUL02H
         Xq5VqR1dqo2wwdgCYKu1k13Y7WPJeNMXr9Nn29y+cZaeS7RPuo5FCr7bYacdi9hJlQ3b
         +ObVUEFd6B4IozmECeJcuh8yxwYY6mygJSTi3MR1UZBYGqHQJhHeJhUhUncUC4sq5f0E
         sBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTjLgYE34NOf4lNWHaZIVqfWD5a7lId6bVoC5KGuZ1k81HJQaR8TOqMQkFgYavNy2Ot6jk@lists.linux.dev
X-Gm-Message-State: AOJu0YztOhNNVJkrej8LGb4nGh/XUSqcpStLGHJzK/n/joYHCW3LmYWo
	kZxNO9BFhlXxOLi0Cfm7u6SQ4wvXMqX6hfhWjWfgPwPWIlQ1YKPNkEhfPw==
X-Google-Smtp-Source: AGHT+IFJ6pNoheZrR8MhJjKr1rMyc3EDvk3n8K70/4Jifu8dBb+tEafkHCCof/nh+VZ27evZvngLUA==
X-Received: by 2002:a05:600c:3591:b0:431:4c14:abf4 with SMTP id 5b1f17b1804b1-4316163a1b2mr97813395e9.14.1729522672863;
        Mon, 21 Oct 2024 07:57:52 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4316f58adffsm60303545e9.22.2024.10.21.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:57:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
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
	Richard van Schagen <vschagen@icloud.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH v3 2/3] dt-bindings: crypto: Add Inside Secure SafeXcel EIP-93 crypto engine
Date: Mon, 21 Oct 2024 16:56:38 +0200
Message-ID: <20241021145642.16368-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021145642.16368-1-ansuelsmth@gmail.com>
References: <20241021145642.16368-1-ansuelsmth@gmail.com>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v3:
- Add SoC compatible with generic one
Changes v2:
- Change to better compatible
- Add description for EIP93 models

 .../crypto/inside-secure,safexcel-eip93.yaml  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
new file mode 100644
index 000000000000..13341710ee31
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -0,0 +1,63 @@
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
+    items:
+      - const: airoha,crypto-eip93
+      - enum:
+          - inside-secure,safexcel-eip93i
+          - inside-secure,safexcel-eip93ie
+          - inside-secure,safexcel-eip93is
+          - inside-secure,safexcel-eip93ies
+          - inside-secure,safexcel-eip93iw
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

