Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C810792
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 21:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672953559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dr6WuGFgn3lsUzUTklOx1mec9m003HYE8pI42id0om0=;
	b=c81gaJqKa+4CRbURTX4d/xi7JuP1GclfyonKLoefFIDfTbyr1J2cCkVZfwZkMUoaswXEJL
	JU4gJL6inRNjGTPc+QD7t1ML3QjZQiRzAB5LIJUkOIZLypd5Cw9MfeXS67khhBkFWj3sEp
	IeCmJKphArKaQVWf+syhHrjRd/1BJ40=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-199-_bBrAxImOiOSECd3vQpjyw-1; Thu, 05 Jan 2023 16:19:18 -0500
X-MC-Unique: _bBrAxImOiOSECd3vQpjyw-1
Received: by mail-qt1-f197.google.com with SMTP id d12-20020ac851cc000000b003a8118f79daso13759691qtn.19
        for <llvm@lists.linux.dev>; Thu, 05 Jan 2023 13:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dr6WuGFgn3lsUzUTklOx1mec9m003HYE8pI42id0om0=;
        b=Y5fExM+T1+d9/NKKi3Z5Rt2CmSFoGjwUr+KO8/CDPB+EzhIcSc5CSW7xFK8pqraTY2
         iZz2Jvt9GbbbaPMLjDaTmlFsVGr+qdsEol4YPvYYuLunlIrhT719FDhMPrgJr8fXLzWi
         NsykolFh1m9BmhNJlmaolcl5RK9cWgvHfksWYbdhmuS5RbdN55QlMe/2PRD6mZloRWFl
         Fm2oAhPnSOVqhL/L7IphRR/94JRtMk61rJ7GwOBvNjFHgy5ZAghy750AshVWbcNgfWK9
         s7QjD5Ur3tMHKQG6ToXedDOCeeH3NyWDvU5Y1hBtJ7kw2Rfh204A/lszk0+uya/PDOXJ
         fkWg==
X-Gm-Message-State: AFqh2kqkJXLwuXiCGMZ/9egwjDhvZcNw7Hlf+itOdePvlSrmAYnbVfGv
	OJdRWLj7hrVGEuvX0AXyVMTwFA/24ZORgyIihYgCBuasroCD7oj6a2wHSL7rIbUbR/3MGp8j2+p
	NqeDvMw9rLulB1A==
X-Received: by 2002:ad4:5362:0:b0:520:f8fa:5ad8 with SMTP id e2-20020ad45362000000b00520f8fa5ad8mr64600721qvv.17.1672953558072;
        Thu, 05 Jan 2023 13:19:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXseXrlDGPJVvsIgIjlWKLibyWOq+e3SjxItVbfKqMuTnJRcqgiNlKhtIddkByXDz+/MSbYMyw==
X-Received: by 2002:ad4:5362:0:b0:520:f8fa:5ad8 with SMTP id e2-20020ad45362000000b00520f8fa5ad8mr64600701qvv.17.1672953557847;
        Thu, 05 Jan 2023 13:19:17 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id y17-20020a05620a25d100b00705377347b9sm11643264qko.70.2023.01.05.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 13:19:17 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	Vijendar.Mukunda@amd.com,
	Syed.SabaKareem@amd.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ASoC: amd: Return ENODEV if acp63 is not found.
Date: Thu,  5 Jan 2023 16:19:12 -0500
Message-Id: <20230105211912.824250-1-trix@redhat.com>
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

The clang build fails with
sound/soc/amd/ps/pci-ps.c:218:2: error: variable 'ret' is used
  uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
        default:
        ^~~~~~~

When no device is found -ENODEV should be returned.
A switch with a single case is overkill, change to if-else.

Fixes: 1d325cdaf7a2 ("ASoC: amd: ps: refactor platform device creation logic")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/amd/ps/pci-ps.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 401cfd0036be..cba8800ab4ea 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -205,8 +205,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 	}
 
-	switch (adata->pdev_mask) {
-	case ACP63_PDM_DEV_MASK:
+	if (adata->pdev_mask == ACP63_PDM_DEV_MASK) {
 		adata->pdm_dev_index  = 0;
 		acp63_fill_platform_dev_info(&pdevinfo[0], parent, NULL, "acp_ps_pdm_dma",
 					     0, adata->res, 1, NULL, 0);
@@ -214,8 +213,8 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
 					     0, NULL, 0, NULL, 0);
 		acp63_fill_platform_dev_info(&pdevinfo[2], parent, NULL, "acp_ps_mach",
 					     0, NULL, 0, NULL, 0);
-		break;
-	default:
+	} else {
+		ret = -ENODEV;
 		dev_dbg(&pci->dev, "No PDM devices found\n");
 		goto de_init;
 	}
-- 
2.27.0

