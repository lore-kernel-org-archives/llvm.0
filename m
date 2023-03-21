Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328D9440
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679399203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ymNZ6VwYV2ATvUKNgNsMq/UfCBI6C3UP9i+FWnYVIDA=;
	b=EKXbX6hx6A8mhMr//o9tQWZzhPsrkk3fnB0vmT1+Ofz4mAr6CIODTDJ5pvBWHMD+RWZJsO
	5vVWPNPr6G/1iXU4XQ4fMJdNvtyJrXjTU9mxokcWPt+cd38GzoXJujrZTXGB0G/KnV1uFu
	uQnfoSC4E3BVBXU+9Hok5R3ogwfEA+U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-QS27_ZuIPiOOGAmxVO3Zqg-1; Tue, 21 Mar 2023 07:46:42 -0400
X-MC-Unique: QS27_ZuIPiOOGAmxVO3Zqg-1
Received: by mail-qk1-f200.google.com with SMTP id 66-20020a370345000000b00746886b1593so2444089qkd.14
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 04:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679399202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymNZ6VwYV2ATvUKNgNsMq/UfCBI6C3UP9i+FWnYVIDA=;
        b=TolU3Y2BeytGvbCayztnCCCw6jMCnTLZg9Vl3pd5zXZM1+JnzCDTkHxXnQGnH5jhiC
         Dg8+fMlyIFJ0Zz9Y/d8yUF3uhMCQWUJ1hCHK3NL7uGRxw887O6YDaQt7bNUh55ShxUQV
         jNEDAZfNMWCZJKsCvVvy7gHZhlJ3BhVGxxoXQIiyfVtVgtcZaRVPxPptrkKw+oWw6OmX
         a6kN+qdpYvZ46y0pk74ErcUSb2KMZmwk+T4gYOoRl6nnle+Y50HJ8w8b4Nze5umYfTwa
         XcWIB7novAg6uVZDTUYF+PpD3Ba7dhCBiy0Oc7GxcwMgWE5Yi8RDhLXwd7GeywBZ8VXi
         SM4Q==
X-Gm-Message-State: AO0yUKVz5VdFWOUQAIukAzq42a2e2EEPA5dNkkIhZjOm/H4BzUQMOBfn
	lkdCdaqVZoCIuJhqA2QurEfv5VehcZTWyAmMt2drtmWvOBaD6lCgN94J5QmUg/jgwCi3mwA/GQ3
	mDRGq1LoLc1erOA==
X-Received: by 2002:a05:6214:404:b0:56b:377e:88a7 with SMTP id z4-20020a056214040400b0056b377e88a7mr3463927qvx.21.1679399201776;
        Tue, 21 Mar 2023 04:46:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set/fiAb6HEprEWi8AUt3xnbJCW2fUvHyYpabsY5bMNHiKBf3tCo9LT9+NAcbKM/NkXH6hE4cgg==
X-Received: by 2002:a05:6214:404:b0:56b:377e:88a7 with SMTP id z4-20020a056214040400b0056b377e88a7mr3463904qvx.21.1679399201529;
        Tue, 21 Mar 2023 04:46:41 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 2-20020a05620a040200b007468733cd1fsm3864969qkp.58.2023.03.21.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 04:46:41 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mtd: rawnand: remove unused is_imx51_nfc and imx53_nfc functions
Date: Tue, 21 Mar 2023 07:46:38 -0400
Message-Id: <20230321114638.1782086-1-trix@redhat.com>
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
drivers/mtd/nand/raw/mxc_nand.c:1602:19: error: unused function
  'is_imx51_nfc' [-Werror,-Wunused-function]
static inline int is_imx51_nfc(struct mxc_nand_host *host)
                  ^
drivers/mtd/nand/raw/mxc_nand.c:1607:19: error: unused function
  'is_imx53_nfc' [-Werror,-Wunused-function]
static inline int is_imx53_nfc(struct mxc_nand_host *host)
                  ^
These functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f6c96341b896..f61ffcbe57c8 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1599,16 +1599,6 @@ static inline int is_imx25_nfc(struct mxc_nand_host *host)
 	return host->devtype_data == &imx25_nand_devtype_data;
 }
 
-static inline int is_imx51_nfc(struct mxc_nand_host *host)
-{
-	return host->devtype_data == &imx51_nand_devtype_data;
-}
-
-static inline int is_imx53_nfc(struct mxc_nand_host *host)
-{
-	return host->devtype_data == &imx53_nand_devtype_data;
-}
-
 static const struct of_device_id mxcnd_dt_ids[] = {
 	{ .compatible = "fsl,imx21-nand", .data = &imx21_nand_devtype_data, },
 	{ .compatible = "fsl,imx27-nand", .data = &imx27_nand_devtype_data, },
-- 
2.27.0

