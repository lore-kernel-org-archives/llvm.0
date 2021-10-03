Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FEA3FD1
	for <llvm@lists.linux.dev>; Sun,  3 Oct 2021 11:41:41 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id pg10so9115641pjb.5
        for <llvm@lists.linux.dev>; Sun, 03 Oct 2021 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/D8bXyu49DxBdYOqHuSui3s+tc6MfuSn1HC3CjVWP6g=;
        b=l3/+qZ+lxn3ZuJlc69ANU1xZBUFyjznJ/dhb5dnFZVdSQ6HSE+KfbSegxcLYg5Hclx
         yk+jTUbwXtdJ1i3Ta7MkC1dYj/VU422S7zXSRcLo47vfYzEWjmfB73PKT9C3TpDc6ule
         Czeo7Ee0CSGlfe0ghoqVFLiQmUHG4S7UEySK5SDhF2eHoenmBw36f60g6468/0yY9RTx
         wS2GbwToeD3CD4wtdyuoBnaDkPG33H5U/zNEVkll0EWIaRitIN3EHraSxCBbcH3KHtfd
         7+E0ELX49iOjLVArhmmAAMLe7rqvDzS+L+E6KZCClR2wvU38LSby6Ht7kpKPtHI3AvM8
         sX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/D8bXyu49DxBdYOqHuSui3s+tc6MfuSn1HC3CjVWP6g=;
        b=MGV4pSgsoaoOx+jxtIgv8pSlsb2MMUB4llF/GTcxA8iFDq88OxWhnP6uqwo9sTlwhu
         ym4I/DeyGOsOyUH8NFOStPj25pQKJC9wiHbfHIEWLlfJYm7Qb7SsMSjkfKHsT1eAp1IJ
         H304yZPm8iGJ0ek/hIK67Fe7lwOViBTK/F6PeBDasUswE9tBbAtdl2R3pJ3vWkA060Ln
         RiDvdkRJ2QwvnnfejxISZIMMk9s/N2J7pM/nZmRNmtMywQC4/rTNHAFfxzZK/ZOG9+bu
         cF2QYh+jGKJhK1Mt10GKH8BHyiotgquLpSkPVFcfM/7RqhLW2a13tPiyHXvScNoVQt6/
         /kNQ==
X-Gm-Message-State: AOAM531zGm5IUAgLxPT9rydL5keoKPTHUCsmPpMIiQ53pnfCMd8PgPUe
	/eOQ2dmnRb8FSE//vj7c5YQpxsDuG/hNZhpzdA0=
X-Google-Smtp-Source: ABdhPJzEXo5XpNXHFNgCL+WuGLFf0o5O5/LmEBJzprQr6lzDPqEAs4lqCoAZYlQZi2cIIC1OjnsqKw==
X-Received: by 2002:a17:90b:1d84:: with SMTP id pf4mr8614263pjb.107.1633261300673;
        Sun, 03 Oct 2021 04:41:40 -0700 (PDT)
Received: from ubuntu.localdomain ([171.224.177.7])
        by smtp.gmail.com with ESMTPSA id d5sm10071574pjs.53.2021.10.03.04.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 04:41:40 -0700 (PDT)
From: Nghia Le <nghialm78@gmail.com>
To: mike.kravetz@oracle.com,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: Nghia Le <nghialm78@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	lukas.bulwahn@gmail.com,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/hugetlb.c: remove dead store in demote_size_show()
Date: Sun,  3 Oct 2021 18:41:13 +0700
Message-Id: <20211003114113.109463-1-nghialm78@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The command "make clang-analyzer" detected a dead store.

Remove demote_size and corresponding assignment in function
demote_size_show() to fix dead store, as demote_size is never read.

Signed-off-by: Nghia Le <nghialm78@gmail.com>
---
 mm/hugetlb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 993efa70bce4..ef00e6ad0f6a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3706,11 +3706,9 @@ static ssize_t demote_size_show(struct kobject *kobj,
 					struct kobj_attribute *attr, char *buf)
 {
 	struct hstate *h;
-	unsigned long demote_size;
 	int nid;
 
 	h = kobj_to_hstate(kobj, &nid);
-	demote_size = h->demote_order;
 
 	return sysfs_emit(buf, "%lukB\n",
 			(unsigned long)(PAGE_SIZE << h->demote_order) / SZ_1K);
-- 
2.25.1

