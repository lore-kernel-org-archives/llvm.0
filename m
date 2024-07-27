Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8AA18784E
	for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104458; cv=none; b=rBQrS/fGG5HEZESs2S7VY+MmPDgWxtNsePFaJ0of9rKsJRdXD0X8Z62YBr3j8Ev0A0o/kosl7YEWHvzKll7y/AOKrvw4KYi1g9J6Aj1umRWbi0EyEQFIRF0pDMV27Pna4SDdRMgvY8jCJOWyF9XBV7g1PXmzlu5um3H8bnlSqNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104458; c=relaxed/simple;
	bh=cjVHMpBbBNVIROJODEIAMPhNoAE9dItU05+iUVuD1ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMypSTqHy0SLCRg6yrIXidMvsdtEDVuGuwYe9TdWtm+W+JPuvIG99OoQ8n3juE5ZrlHl9p391xQYS5LqehBBeQrH8vj+0r97wxHjFuNJlxSIh2QWW/XySMBOF6zWiZ5dP9VRBjxANDBWDYjL6eeBAODJUtKW03MAdfDBd7PZy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WINXzjNz; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WINXzjNz"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eeb1051360so23118711fa.0
        for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 11:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104455; x=1722709255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b1UF2QE7ux02MF1mK2AOvPunWfuVvcN7o6J69AheMU=;
        b=WINXzjNzm/55/Vq8QCCkNq5nVvbDfwn/f3C8Tj8Sax2K06appMsNuZqtcNqXHJRQzi
         9I5QnSnls3/2Hm+NC0Qe7N7gJFtufhzx/lzDZqbybhjrdTPrk2OWzoPfVnkfW8fpN13f
         vJKMKO4ynXjPhGnlYGHkWxcJYRJp0q/eimY3nO1c8KImOtQYRObqZ4MyuJcfaF2t4TQh
         ctXeQCj/HUtyvECSNU166aLTla01bLU+IO8qJautRj+fXo/+jQcknrljx4rRku/6UQGf
         SMxpHkHjWTa5NkF5kPOIzxR4RsB2ZdQg5FlnvOThshgtlG+3sn6bWchnAoJvIdeKq2/E
         an/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104455; x=1722709255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b1UF2QE7ux02MF1mK2AOvPunWfuVvcN7o6J69AheMU=;
        b=n+NL0GRYVIEH+2+y/sZrXZS6P/cUkDPKfcMpJadRFnBxnYusr8rP3qBFfRbxQ5GSXU
         lqDETICFgcPOsATvKMGNw0Lo+49hmiGfkT2/y+SjYHYOcZpI6qqC1ZFNjxyrqjsZmWDK
         PbfVkY9qjXcqiPrrqDWidNuzJ69MXVc5AJl4eGoe1CTWUtU9Z0oAf47on3ufTOQptEAM
         vKAPktLjOvGd+Z70TTjEyvD6o/Gi3x+hzi28X8CaDTXRQclk+FPjfPqtDN2ptjCj0Zjb
         o2/DH8qg6e2w1BKvLBsptlVc1s2xXzORhV2s47xJvsRpnRG5ep9ABQIYBD6Nka4ir84X
         2J8w==
X-Forwarded-Encrypted: i=1; AJvYcCXSQBmJMAR5iPYDfxP5CWY+Gpy2s5Qarq37nD2mbhZjVzZTa2SMA2ed8N1Th6pZI7dsDn2LUMRoUuTNJMgw5U+DE0jNZg==
X-Gm-Message-State: AOJu0Ywb6gPOUOsxKPhedg4HqNfFgHdcwAK+7U+ADY07JxIflpuKuqIU
	cRjTfDgSxRjGfN8JyCS9nWvwHw/0sP+0sz8GDr+viC8fpowAZjI2
X-Google-Smtp-Source: AGHT+IFsHsOE9GFIml5SbGqV2PLpprs29PPSV7oR7rhgGyymm9vSuDoD90hrVIW/JyK4/9e8l+NdPg==
X-Received: by 2002:a2e:9609:0:b0:2ef:2a60:c1c1 with SMTP id 38308e7fff4ca-2f12ee1663bmr19475811fa.21.1722104454336;
        Sat, 27 Jul 2024 11:20:54 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:53 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/4] ASoC: dt-bindings: apq8016-sbc: Add msm8953/msm8976-qdsp6-sndcard
Date: Sat, 27 Jul 2024 20:20:26 +0200
Message-ID: <20240727182031.35069-4-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240727182031.35069-1-a39.skl@gmail.com>
References: <20240727182031.35069-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MSM8953/MSM8976 QDSP6 cards.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../sound/qcom,apq8016-sbc-sndcard.yaml       | 51 ++++++++++++++++---
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
index 6ad451549036..1706ce334d2f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
@@ -15,16 +15,16 @@ properties:
     enum:
       - qcom,apq8016-sbc-sndcard
       - qcom,msm8916-qdsp6-sndcard
+      - qcom,msm8953-qdsp6-sndcard
+      - qcom,msm8976-qdsp6-sndcard
 
   reg:
-    items:
-      - description: Microphone I/O mux register address
-      - description: Speaker I/O mux register address
+    minItems: 2
+    maxItems: 3
 
   reg-names:
-    items:
-      - const: mic-iomux
-      - const: spkr-iomux
+    minItems: 2
+    maxItems: 3
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -106,6 +106,45 @@ required:
   - reg-names
   - model
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8016-sbc-sndcard
+              - qcom,msm8916-qdsp6-sndcard
+    then:
+      properties:
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8953-qdsp6-sndcard
+              - qcom,msm8976-qdsp6-sndcard
+    then:
+      properties:
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+            - description: Quinary Mi2S I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+            - const: quin-iomux
+
 additionalProperties: false
 
 examples:
-- 
2.45.2

