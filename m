Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E3028E2
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 20:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650142303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MCs9sayLGT9Brlcum9GwaQ0BqXD9O9q7oXRvk2xKu30=;
	b=Kn+Z2838mrB2ioABbEm3oNmaGIEbdP1ECxNXI38HRy9ZOrDcXkt3nIkBsX0JFbRRRbW0JN
	vDhFTpgVyfQlw96BM3vRETv3SXY+71hd1toTIZRqqwG+BVctsULL9F/vhQke1UlYHnOk0o
	ot/YiRSEI3m/5qz/LLKIQD2hGZH3N0Q=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-051iYUC8MNarSVpx_j2ksw-1; Sat, 16 Apr 2022 16:51:42 -0400
X-MC-Unique: 051iYUC8MNarSVpx_j2ksw-1
Received: by mail-qt1-f198.google.com with SMTP id o2-20020ac86982000000b002f1d71c97b8so5507441qtq.2
        for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 13:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MCs9sayLGT9Brlcum9GwaQ0BqXD9O9q7oXRvk2xKu30=;
        b=3smBNgaAhNmNZCLtsltJojdUOuRsoQ+jqs3R2HFpK5L15WgaG+YjDEF1mnAx4Qt8bG
         ct8Tm2nJX2nWqShbLgpS6YFrg9HKxVeUQzhz6o+mkfz33OxC22HE7qN3v3OIwgxQ6gd1
         xBWxdW3tmKUCoBx6rXijyffzd/iXX7hua5YH2CLiFHFsMZfA0s7ftdozg7p1ADzPvor5
         CEzM1OQlNVk1tERkFc+PD6fGgs0l5Tus4k8szA30AI5EkEsvb/r2f+XjsJvxL4Wfd36Y
         TSaUFqkgv7jC9XfROgYTj9ju0wpZKSz9sBlAW9/101fDAHKBHsLAr6238D1AE+D0a9aO
         fAiQ==
X-Gm-Message-State: AOAM532/Y2TVmzRH0xpQmQQ58O3bwNmpYDpa60zW8HGOs6KLkMFa4cXO
	CyNSnv6YH/8qvfo7hZehMUoggcydCRGP8V462/LS7gImZhFNgAPpP6NdjQyZ0ZDJJg+L83Imzbf
	2yXbkMtwv9+841Q==
X-Received: by 2002:a05:6214:1c4b:b0:446:3f7e:a35f with SMTP id if11-20020a0562141c4b00b004463f7ea35fmr3645558qvb.122.1650142301786;
        Sat, 16 Apr 2022 13:51:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTuW3w9sGv8eepPDQ4d/FajXjVBd+8BPaPmfU4U9Pg98GQ/3Wfo5Tqv35AdG630N6byhpPMQ==
X-Received: by 2002:a05:6214:1c4b:b0:446:3f7e:a35f with SMTP id if11-20020a0562141c4b00b004463f7ea35fmr3645551qvb.122.1650142301616;
        Sat, 16 Apr 2022 13:51:41 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id bj12-20020a05620a190c00b0069c7df40747sm4079774qkb.133.2022.04.16.13.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 13:51:41 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: broonie@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	paul.kocialkowski@bootlin.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] spi: initialize status to success
Date: Sat, 16 Apr 2022 16:51:32 -0400
Message-Id: <20220416205132.295779-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Clang static analysis reports this issue
spi.c:3583:2: warning: 2nd function call argument
  is an uninitialized value
  trace_spi_setup(spi, status);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is possible that status is never set because
its function level setting was removed by the
commit listed in the Fixes: tag.

Assume that setting 8 bits-per-word is ok and
initialize the status to 0.

Fixes: b3fe2e516741 ("spi: core: Only check bits_per_word validity when explicitly provided")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/spi/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 563a56ce34a0..890ff46c784a 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3475,7 +3475,7 @@ static int __spi_validate_bits_per_word(struct spi_controller *ctlr,
 int spi_setup(struct spi_device *spi)
 {
 	unsigned	bad_bits, ugly_bits;
-	int		status;
+	int		status = 0;
 
 	/*
 	 * Check mode to prevent that any two of DUAL, QUAD and NO_MOSI/MISO
-- 
2.27.0

