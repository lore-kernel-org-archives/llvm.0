Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D14447F
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:53:25 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-57790939a2bso1738680a12.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405204; x=1696010004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKU0OOROZX8GtXmlmWtOSoc3m5tAbejEF8ueJbXNfc4=;
        b=GmLcme18ouaxPCFzlAP2ZlOCSK2XnkNsWavQ/HQoEyvvV9ZLvd2H/Gk5152lRK8v3/
         pb75w507B5yTXiDTu3DGaJXbgzkbr2tlaNH/LPqbrDronXMdZ4wdgBm9UwURvAS6q6Qs
         iXalU2vPHLSFfsIU4PsEHtbiPGVutKFQ3NOIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405204; x=1696010004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKU0OOROZX8GtXmlmWtOSoc3m5tAbejEF8ueJbXNfc4=;
        b=dwTvVfsjlsa5yIvvGAq5rItWoF/x8Yb/eFRxq82KKoV09coufGhF4DP1yGFJMgRlSd
         hCER67TDETIUuSsKftFRHZxzOkxnJBJayVS+idyqGmCrUDS/olD171ZV9g2uq5pg60wn
         kyOuNUCZDz4p8NPMRPjknKdwHu222ov4gl2j+HQHFs6v0JdUvSXGuGLcqw2cKk2LR0rt
         Ms7GqNrnBlNKe6IZQhHWXYV4oZKVHxTlZQIj7pT53hX6kZKxLTjq7DUC8C6Brdkhf6bo
         mh7acGN0MQbru5Ah82jmg1hbegfEHDiP577Xm/7Ni54BFrQNXBTuTES3thyPyqfM/VXK
         Lr6A==
X-Gm-Message-State: AOJu0YzV0cIFa6vIflieQuGsuUcvVtbnYyNSGV1zP/NLZkskG/KTfyog
	L+QArKIGhhqi820A1LJeCtqJjA==
X-Google-Smtp-Source: AGHT+IH/7MhTV633GUCdb/yWyD942bovfP7gG5TgqmAQGp2zBjX1j6I8VUXAYvte8NevDqdv1szPDw==
X-Received: by 2002:a17:90b:1010:b0:274:6839:6a8c with SMTP id gm16-20020a17090b101000b0027468396a8cmr417452pjb.6.1695405204678;
        Fri, 22 Sep 2023 10:53:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gp24-20020a17090adf1800b00268032f6a64sm5263304pjb.25.2023.09.22.10.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:53:24 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	linux-spi@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] spi: mchp-pci1xxxx: Annotate struct pci1xxxx_spi with __counted_by
Date: Fri, 22 Sep 2023 10:53:23 -0700
Message-Id: <20230922175322.work.170-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=keescook@chromium.org;
 h=from:subject:message-id; bh=e8Sf0qGa4GnkduLkbR5QVFirRy5SjwftZRC9XwaCaCY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdSTbzRFK4+Or9MsQ5t6WkcBxx10MfOAmUZo3
 pFRqrY3QsqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UkwAKCRCJcvTf3G3A
 JtW1D/0Z2xHXPyQGLIdKy1N7E/opbora00YtESYD+ty6cAdcM4pNdrtP+Jq3IH5IOOGBWn9n1eS
 8uG7hhmdw03xWE2evg0UZh3CgNCbhMBtcmy8MK8iPe3+gN/eTFfXr2sJrgUB2Qw749p3CWg2iew
 IfNsRu1jQAo6Aa77Jkp3bwvCKP0d3k196ICBYnePUOrosEyIETz+XId1BgfUFQIYfsN2oK8h875
 Tsu5WRENvEW1sI7BcjEk4hdYF6bLypg4kZpU+T9Ss5majLz4bYsG60uxFt77nH92rr5Qm78V+LR
 z8XII87IrDNiXgFrE7X6V/wyLDQ7feSQq5Y51LZIyQM9NQcH1humoQ2mCYrabvaWFaqEF3cEsF7
 275CdvQYgQXmatoG6GDm/mM5aeAU/5i/vvkAI35lEmW/Vf4VMbtcuB335o2K5v4R4kwZLkTf3Qg
 VQ62z2h9jSMFmNhCX/nL0h4aWZYOo6j0zjy42/nyQT+7jTvC2a4c6bmcOnwBiX/bI58sPtDBgnA
 Ick8nKcuJTVRD+DFYmPiAExYWBqzEfcggr7Ex5akn7SYwglRZ4bC84R8lksWvp19CN9VOaJy5mp
 vI5eTc1MJxnXmy6bVagZocn/17k/A1thqk5TU7ysuKVlx6nGUCcIR9AEhvvJ/KJEnGWV3I9wErM
 Uo/pDz6 SkGkVu0g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct pci1xxxx_spi.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/spi/spi-pci1xxxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pci1xxxx.c b/drivers/spi/spi-pci1xxxx.c
index 3638e974f5d4..5b2d3e4e21b7 100644
--- a/drivers/spi/spi-pci1xxxx.c
+++ b/drivers/spi/spi-pci1xxxx.c
@@ -77,7 +77,7 @@ struct pci1xxxx_spi {
 	struct pci_dev *dev;
 	u8 total_hw_instances;
 	void __iomem *reg_base;
-	struct pci1xxxx_spi_internal *spi_int[];
+	struct pci1xxxx_spi_internal *spi_int[] __counted_by(total_hw_instances);
 };
 
 static const struct pci_device_id pci1xxxx_spi_pci_id_table[] = {
-- 
2.34.1

