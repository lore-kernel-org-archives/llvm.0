Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884F15A0
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 00:00:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b19so9583856wrh.11
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 17:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IIXshEu2SisdlfyC9FOixjGVdzZatqacST7BF1cavuM=;
        b=CvfZ6nWFFRgf4JTHcIc5nt1kAhXSUr0ukL0Z48c8FAOwdK9Ee4fYROqjl6YwfDq91e
         0AHh6SL/gAnETrsJgk2FLZdpTDvF88MQndNafFnUvMLHna5RLFI3fxMr80hTsRuNQwOe
         pw9hRGpx/aGgBaS/hbjoT2M8Cqe1aSl4ND8W5JxpPpy4U+UWf1tyI8R5UeIoIIkciYkL
         rCF13ws+idDApGAgqo5o1aNHRSndWdAfqLdsrtpbVVZGL9SLxOV2gfztQR1bDRDEVR4N
         nGzHfFy9gc+HS+FNpbTiiRkEcw5D0O+/JmHv4q69EljIM4MVimLJxpkCputzm//x5W2Z
         818Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IIXshEu2SisdlfyC9FOixjGVdzZatqacST7BF1cavuM=;
        b=3gOpKSj4KXtBPIc1iTzYeE7/AVOatNKnXOBgkClDR9sWquF/W1wgV5VgEX6GyXDCKF
         eFiDfoGFn1sZZJIESophIaITDexONvcmly/bOcD/4Y7v55R0Eoupls9kOeyTwABafBeS
         KJG5/NirCcCdrT7J240n26o/gvc1VFI6J241kzyMHekob424xBuyARFqjtngreZS8P4Z
         /boXBHkPxX5VWqVGd4NtD3+IvEoKw80tfn06w52aNRrsEiA9cFOryVPOAVGQS101CeVv
         CGuuwkseJ7OIvkSdYDCUHxn1VvRsV7HOpNITfPDkx2q9zsZzhZwBSs+by/goqSlZJBKW
         9YEw==
X-Gm-Message-State: AOAM533fYfEzAdYGklCOb6APlR+HDGJM3Hy8A6AKd4aPtbLjEBxdwgaP
	emZ4FtIDm7Exm24J1evIdTmzLIKzDxF4XA==
X-Google-Smtp-Source: ABdhPJwyHsR2ZNVPsAvwcWnVhCNDiDCSshChLqWoCBzEErGVywBumpsRGk2DMjPx57WaR9Bfl2JdtA==
X-Received: by 2002:adf:ebd0:0:b0:1e3:f9b:7b77 with SMTP id v16-20020adfebd0000000b001e30f9b7b77mr5717458wrn.691.1647561657036;
        Thu, 17 Mar 2022 17:00:57 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id w6-20020adfee46000000b001e4bf01bdfbsm4973862wro.46.2022.03.17.17.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 17:00:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] amd64-agp: remove redundant assignment to variable i
Date: Fri, 18 Mar 2022 00:00:55 +0000
Message-Id: <20220318000055.79280-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable i is being assigned a value that is never read, it is being
re-assigned later in a for-loop. The assignment is redundant and can
be removed.

Cleans up clang scan build warning:
drivers/char/agp/amd64-agp.c:336:2: warning: Value stored to 'i' is
never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/char/agp/amd64-agp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index dc78a4fb879e..5f64991c73bf 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -333,7 +333,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
 	if (!amd_nb_has_feature(AMD_NB_GART))
 		return -ENODEV;
 
-	i = 0;
 	for (i = 0; i < amd_nb_num(); i++) {
 		struct pci_dev *dev = node_to_amd_nb(i)->misc;
 		if (fix_northbridge(dev, pdev, cap_ptr) < 0) {
-- 
2.35.1

