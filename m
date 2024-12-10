Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB122B8A3
	for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733863769; cv=none; b=kvoARXcd0C2aZrBo34JEUwyjm9byXB1GU0WUt/kLRUiCq7I2yq/jdVkCE9M4k5L2JxxoQU6GY9gBVnHMM4qU04urR4uzsXRs8OOpVyI/Pzdqm3boskjHncJ21z37d987gc1584daagZQx2SxOXlOA+Zp9HUHhZ08PGU704rTW6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733863769; c=relaxed/simple;
	bh=E8cFp+bHGIU6pZjCwgdyEMfWXs0JQy/krXTTtrw2utY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVQzZE/XX2EjPbpLxtpmqWuUVygECIaXsheF0gDt2Tg2ZRnMozlmG6XtXNWCmwjmzc9Dk+ojHyryQw3p5aC41ZlEgcbtT/iYyknBInuKewI/7B2+h+nCz7E4+qXqCbwYRBul6aew6dcsSWvt1OJZ7Qsyj8hJ/29PVIKLYqfaodQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFmX1ox/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFmX1ox/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361a50e337so5022535e9.0
        for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 12:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733863765; x=1734468565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0cVLwNBaKmRixL4jHSZNuCFVNGOC7PS8Cjxhvb4LMQ=;
        b=QFmX1ox/B5waNF/8Uj5KVgY/yZ5rSS2l4iv6frXCKzLsLz8tTifyLUhOT2oznIRw85
         4OoUN4A5RT8h83jJGqhOH5w25EC2T70CCUlSJLKXUKKY/l5IP4x2u4+W7lOay52vluI8
         tvPGfdiBQvACk8HzLbWyCuysy0fLfswGgsSqwGakbNOUhylGl/PrmAZu3YFoz41GzgT1
         5J+zThF2AqDXev7vEXb+kFO6a7qcrebMZJKo3cnbQokfILZCk/SIaQLVaTHOsUjirjSM
         JtENIDdDPtG10X1Ljme7/Q6bapqCKh7XhJPiz00FBgEp4vQEyUBpYCl5nkgMiiNasDd7
         FL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733863765; x=1734468565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0cVLwNBaKmRixL4jHSZNuCFVNGOC7PS8Cjxhvb4LMQ=;
        b=iLxjHkIUXcjYO98jAjeQzSiK6eMnqRUaVF/2bSVczLSGQ1ic3gRMz0IP5+a0+LszgN
         b64hBd9UZsdZtUqE7lLQ7Y1j5J/Km+tVCbfa9H83LBHl5nYBPzjUlz4b0fpc/Jt/oP+B
         NQ62n02YUulpwIDfB35dTDsoYw5QFnSrDUTKskf5s9SHHACY6zhKHj6b7xsv2h3XqFoS
         1nmod0tDMBBI6VscwP7RiJCp6mPnNczZ5ZLAy0Evdm3e+s6l2Dwt1ZJNuKiPwpWeUnG5
         jNjoWB4SXIptiO2gMPS4sTuzk9tjbGfC7yN9v5t10iToIsdscHMzDXYvmbI6djhWQu6G
         T7RA==
X-Forwarded-Encrypted: i=1; AJvYcCWvTBcd5WkuonYlBvRH/fg/KNgGOwLH3obATzr3EemLM0x4N1UHneb8BHPId6DJ08M6cjlZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4AX9iH/xK6tVS72h7bP6Nrbf/GZ6Dgcdlw2jbo/wp3oVEhxPl
	1r1q0yoqchsBnWndFeKqqTwcUhpuwuuoWlQHyasww2Ff9+yiaVQx
X-Gm-Gg: ASbGnctmxrhgnoKzRFbAhjpBMDhqteG8944h/pjPWC8DHtLNo2RCUsmkha2+0UfZmCN
	Vps/ojunjzU3E9POtKpH9BIcfIa6gVyYweTbg5f8q1DOM2IsxU8MF+uOei754UmrQyG4KGvBh7p
	BzVywZeYrRXt3OJRXEUXWGg7VcwA6Bm7r3745dH7C3CoGKERJ65iAKZruDpatd2ql68rCQN5tcQ
	tuPk+YT4isLWiOorICG1ebd9TmYOArlxjJHpnymZQ8HBkBMMBsfdplhiTlu0wTDOEpoE1jhR4eg
	huLX9Z9EhZE5JMF1Hk7Ng3k=
X-Google-Smtp-Source: AGHT+IGvv4Ly2KPrbRRZpRumd0qbQ2u8GLsDvhDkpsORNeY/yaMp4Cm5evTgLhjTFRv5XUrVeAKi4g==
X-Received: by 2002:a05:6000:1788:b0:385:f3fb:46aa with SMTP id ffacd0b85a97d-3864ce98548mr397640f8f.43.1733863765391;
        Tue, 10 Dec 2024 12:49:25 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-386334d0486sm11808307f8f.50.2024.12.10.12.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:49:24 -0800 (PST)
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
Subject: [PATCH v8 2/3] dt-bindings: crypto: Add Inside Secure SafeXcel EIP-93 crypto engine
Date: Tue, 10 Dec 2024 21:48:32 +0100
Message-ID: <20241210204853.18765-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210204853.18765-1-ansuelsmth@gmail.com>
References: <20241210204853.18765-1-ansuelsmth@gmail.com>
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

