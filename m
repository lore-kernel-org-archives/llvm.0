Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E38399
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 00:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679356946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oaxgoRknGgdRu4OK8QweJTWsOvaKVFDsJ1zcV4NK7y0=;
	b=ceJbWXQJJyvWUByXBDaN3z8tKlwrAWTb9Ze9lT6KxmsQzXMGm4ePGd9eK/uGrfFcLnYfkB
	c3UMIgOQtpFWQFdtk6w3idjZSfKmlVrp0MuSv+39bg2MXYICsUo61xzMgNYpgdcsCKgoOi
	YKOb+YRkLWEWPJab0bqYJpJ81152594=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-7mj7r_nIOP2U69ECgI17AA-1; Mon, 20 Mar 2023 20:02:25 -0400
X-MC-Unique: 7mj7r_nIOP2U69ECgI17AA-1
Received: by mail-qk1-f198.google.com with SMTP id z187-20020a3765c4000000b007468706dfb7so1898934qkb.9
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 17:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679356945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaxgoRknGgdRu4OK8QweJTWsOvaKVFDsJ1zcV4NK7y0=;
        b=vFBA3R1g3SqqbWVaNlOoML00cYCtIcUhhD10jq0FaagTYLTImu92VMgL99/cNjnzf+
         E9o++e8zkD8v5nlk9a4wf9xoas8x5eZdrswNx/Hv4Xc1KGx/S4pn0LDCD7j06XmwEdXO
         46YNJXQD7YXORDm13h7uUS7q1wgoiK1/6Iwx6wId80pSfAb+H/aghe2H6tZ6TgfzDW2j
         /TEhC24+lwcVFq/UYm00F1Afttr+4EzgrZosIwoY5zm816vxGkEiFf6UjiO1D6f1YSxR
         jw4SzMHqL+H23UPg89vkLEpgLI4oaFIIDcPGuw3147/gMCNSswQ8ak9NGH+SeYMCgEcK
         kEOQ==
X-Gm-Message-State: AO0yUKUWksQLuRifJfb/L0A4xEvWaCjPounq3/3PaR9vzsfl1wF23OKx
	MzuYbFE450FLCn3NAy8EhxHpM+mmx+CizVlozJ716NjEyrkGBhwhKYrb7q3LKH19BodyPHoZClo
	ewhzP8unXcjBZHA==
X-Received: by 2002:a05:6214:e4f:b0:56e:a88f:70ef with SMTP id o15-20020a0562140e4f00b0056ea88f70efmr1086857qvc.23.1679356944986;
        Mon, 20 Mar 2023 17:02:24 -0700 (PDT)
X-Google-Smtp-Source: AK7set/vloqXuJHQb4gmhNtaN2vQNHHdc+vDhwBC/G6wQnC0xCCyIgIxZN3YzPPHshhTFFZCEA5/0g==
X-Received: by 2002:a05:6214:e4f:b0:56e:a88f:70ef with SMTP id o15-20020a0562140e4f00b0056ea88f70efmr1086833qvc.23.1679356944683;
        Mon, 20 Mar 2023 17:02:24 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id y3-20020a37f603000000b0074382b756c2sm8287715qkj.14.2023.03.20.17.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 17:02:24 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	skhan@linuxfoundation.org,
	bhelgaas@google.com,
	linux@rempel-privat.de
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] misc: alcor_pci: remove unused alcor functions
Date: Mon, 20 Mar 2023 20:02:03 -0400
Message-Id: <20230321000203.1730802-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/misc/cardreader/alcor_pci.c:98:20: error: unused function
  'alcor_mask_sd_irqs' [-Werror,-Wunused-function]
static inline void alcor_mask_sd_irqs(struct alcor_pci_priv *priv)
                   ^
drivers/misc/cardreader/alcor_pci.c:103:20: error: unused function
  'alcor_unmask_sd_irqs' [-Werror,-Wunused-function]
static inline void alcor_unmask_sd_irqs(struct alcor_pci_priv *priv)
                   ^
drivers/misc/cardreader/alcor_pci.c:111:20: error: unused function
  'alcor_mask_ms_irqs' [-Werror,-Wunused-function]
static inline void alcor_mask_ms_irqs(struct alcor_pci_priv *priv)
                   ^
drivers/misc/cardreader/alcor_pci.c:116:20: error: unused function
  'alcor_unmask_ms_irqs' [-Werror,-Wunused-function]
static inline void alcor_unmask_ms_irqs(struct alcor_pci_priv *priv)
                   ^
These functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/misc/cardreader/alcor_pci.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/misc/cardreader/alcor_pci.c b/drivers/misc/cardreader/alcor_pci.c
index 5b637171c46c..0142c4bf4f42 100644
--- a/drivers/misc/cardreader/alcor_pci.c
+++ b/drivers/misc/cardreader/alcor_pci.c
@@ -95,29 +95,6 @@ u32 alcor_read32be(struct alcor_pci_priv *priv, unsigned int addr)
 }
 EXPORT_SYMBOL_GPL(alcor_read32be);
 
-static inline void alcor_mask_sd_irqs(struct alcor_pci_priv *priv)
-{
-	alcor_write32(priv, 0, AU6601_REG_INT_ENABLE);
-}
-
-static inline void alcor_unmask_sd_irqs(struct alcor_pci_priv *priv)
-{
-	alcor_write32(priv, AU6601_INT_CMD_MASK | AU6601_INT_DATA_MASK |
-		  AU6601_INT_CARD_INSERT | AU6601_INT_CARD_REMOVE |
-		  AU6601_INT_OVER_CURRENT_ERR,
-		  AU6601_REG_INT_ENABLE);
-}
-
-static inline void alcor_mask_ms_irqs(struct alcor_pci_priv *priv)
-{
-	alcor_write32(priv, 0, AU6601_MS_INT_ENABLE);
-}
-
-static inline void alcor_unmask_ms_irqs(struct alcor_pci_priv *priv)
-{
-	alcor_write32(priv, 0x3d00fa, AU6601_MS_INT_ENABLE);
-}
-
 static int alcor_pci_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
-- 
2.27.0

