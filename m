Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93097F
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 13:21:38 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id o12-20020a1c4d0c000000b00393fbe2973dso3223034wmh.2
        for <llvm@lists.linux.dev>; Wed, 04 May 2022 06:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bIzJlgmOg9YiKbOpYW/F57m78adXKAVkRe+KXRci2bg=;
        b=j3V/s2IRf9hFGeuzK9juEkMCXHJ1cbZDrP7Ql2RiQJeM8R0ebx1Yr8EC7SHGJNp13J
         JfwmCunK/UWZdcN1W6CibqOX9t1P6GPh9LbrYQzvMO8HpQZqJ/ZdTXMs5wOd4353Q7+5
         5w/AqtUqsoEgevgEh6zxncr0OMzKE1wBm+HoWj6XU82kYnvMIOaCHpTWx8pWs4+rW5pV
         Jn4oaGewWU51/7QX0FtxVGnTfxqfhHd5eGaJE4NUSGA9Gm+J7/tifdqBSxlNDzT+DFUC
         uYBvMfRM8UMxg8qaTexzL3Sj+Tv2eh0XXfq1SAbHJld0IjuMMYjb6799gDAKZkiv7LMz
         b6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bIzJlgmOg9YiKbOpYW/F57m78adXKAVkRe+KXRci2bg=;
        b=Izj+8FCS80GdCwDoivEEHH2bIGBCoMMjoQnvZjgqZBJ8yZbrhm4HO1vIu7tid7CP0G
         wF8Yoxr/LDa+fGZffFjDJiONUDKi2oQ/0QYczOHfzo+F5Hfv/ChIfvchAD9kcUnVvacZ
         zKrm3zFw+DQM8NXQOdIr4VKLZ9flr9L4xmtLo4/JOxaIWjOmbQKWHnmZLiy10G0iLhqz
         VkaoF8Y5yFIFY1DfJvjneRuNggSN9JusJDtEBMbohhdEb142cWyCjSD3gD6GiQgQJwSM
         i1bN94RnwIjN9Q0PP2fkqvGN4k61hKLluyU0K93vhmuCbDS9yiOCs0YFv72Osv6SbauR
         QRnA==
X-Gm-Message-State: AOAM53298Fl8wTicXJ/117p3l2Jdiq5BrK9KsoYzoHM1Cqrkwn2oM0hT
	NCMY5gSA0IPNamvdZ3TRg2A=
X-Google-Smtp-Source: ABdhPJzJN6G23D8uMob63DnbbeBf1pop4Zafvwcca/FweJhoFEf7s5Blf1jwse+83kfTgVRfuwAysw==
X-Received: by 2002:a7b:c186:0:b0:394:bed:e0cf with SMTP id y6-20020a7bc186000000b003940bede0cfmr7578863wmi.162.1651670497066;
        Wed, 04 May 2022 06:21:37 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id f8-20020a7bc8c8000000b00394615cf468sm369401wml.28.2022.05.04.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:21:36 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH][next] mm/shmem: Fix check on uninitialized pointer 'folio'
Date: Wed,  4 May 2022 14:21:35 +0100
Message-Id: <20220504132135.229601-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

In the case where shmem_swapin returns null, the jump to the error return
path via label 'failed' will end up with the uninitialized pointer folio
being null checked a few statements later. Fix this by ensuring folio is
initialized to null.

Detected by clang scan:
mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized
whenever 'if' condition is true [-Wsometimes-uninitialized]

Fixes: 2b58b3f33ba2 ("mm/shmem: convert shmem_swapin_page() to shmem_swapin_folio()")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 107f1e4dd0aa..7faaa61ff7fa 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1682,7 +1682,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct mm_struct *charge_mm = vma ? vma->vm_mm : NULL;
 	struct page *page;
-	struct folio *folio;
+	struct folio *folio = NULL;
 	swp_entry_t swap;
 	int error;
 
-- 
2.35.1

