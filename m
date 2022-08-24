Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127DB7B
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 05:57:00 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y141so15518549pfb.7
        for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=YSPT0Qki7Ju6xZPR8zVKpd/3Y86SHIvAxlRRGYCf6+4=;
        b=cJxCFckjGJmmRH3AxuVSwOTHmKPDvNUdHzsphspcL7MitfDj8cpemzRzFld9ka1JzG
         WnlEJmWoRnoQ0gxoov7Yt2rf6aTE+TfXoQJvWIXYocISArwgddH0SidAHEq6rI3BEAyN
         lTCzC7TZlFS/gWBvSe7q4HjuJZm2PmzxhmH39KjiNT25T3wxl6rd+nx3TTAEHqkRjefB
         GdI9uw+uu7SgshMtpf8Q4Pap89vTe6dJteYBtDjWBy3J1GMWr5EsxKSpmmXX0h4FUQtj
         GhPxiJ6N14F3KQEG3Fsuq79NI0Rt8cZtb/ZaylWiz9B1X/yS1OJIoDWBzLdxviW9YVnq
         xjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=YSPT0Qki7Ju6xZPR8zVKpd/3Y86SHIvAxlRRGYCf6+4=;
        b=fX1umsuORfwnXvNz3TCwqHnpw39jv6x5NbMIijjrUzSp3UKuKdWRHI31Zihcre1wte
         UtrgPx+S5Ku++KuzeOSdjtDsR2dw7UbF39c0lJ+vNAfU2tWe60CfrokedUjbVZc3gXA5
         rBt/heGBoKsUNZ3HS7xNnr+sugyXIFYiMZTJFGnHMfN4s3/Voq/eYl0HUlEORORQME6u
         L7VJabgSkTZvDRYqeuyzPB2PeI32iJIMaLGq1eHHUVAegzSyDumulqxdyJsj833K/GXR
         HXHEBY17MhmHEgaypXgqiOVn2s2jQr4Dzwr+kUZzgWKkAAFpqzjMir3URQ+hsxSOEBfc
         SumA==
X-Gm-Message-State: ACgBeo0I8Jp+CAK3/hUrbGI0y4eGhaXP593veJlcEhiPc/RzphTadxd9
	4YUyu6bfwcFTdN8NsOH2Lf8=
X-Google-Smtp-Source: AA6agR6SU5V/MTOUdkMzfuBJ885alWNFmMOeIBJqlCJlfH7pKsFBZWwp8COvHDCLw/dA8nRjvHlUeA==
X-Received: by 2002:a63:de02:0:b0:428:9e02:5f3e with SMTP id f2-20020a63de02000000b004289e025f3emr23286847pgg.592.1661320620513;
        Tue, 23 Aug 2022 22:57:00 -0700 (PDT)
Received: from localhost.localdomain ([64.64.123.33])
        by smtp.gmail.com with ESMTPSA id q4-20020a170902eb8400b0016c9e5f291bsm11423473plg.111.2022.08.23.22.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 22:56:59 -0700 (PDT)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: akpm@linux-foundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH linux-next] mm: fix used but uninitialized variable
Date: Wed, 24 Aug 2022 13:56:37 +0800
Message-Id: <20220824055637.10676-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function walk_hugetlb_range, the local variable err may
be used uninitialzed when:
ops->pte_hole in side of "else if (ops->pte_hole)" is false.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Dear mm Developers:

When I build kernel using "make CC=clang-14"
the compiler complains following:

CC      mm/pagewalk.o
mm/pagewalk.c:318:12: error: variable 'err' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
                else if (ops->pte_hole)
                         ^~~~~~~~~~~~~
mm/pagewalk.c:321:7: note: uninitialized use occurs here
                if (err)
                    ^~~
mm/pagewalk.c:318:8: note: remove the 'if' if its condition is always true
                else if (ops->pte_hole)
                     ^~~~~~~~~~~~~~~~~~
mm/pagewalk.c:311:10: note: initialize the variable 'err' to silence this warning
                int err;
                       ^
                        = 0
1 error generated.
make[1]: *** [scripts/Makefile.build:250: mm/pagewalk.o] Error 1
make: *** [Makefile:2006: mm] Error 2

I initialize that variable outside of the for loop because we can assign 0 to err
only once in this function.

After my fix, I can compile the kernel. 

Many Thanks
Zhouyi
--
 mm/pagewalk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 54b2a1beeeb3..b6eb330e8ecd 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -306,9 +306,9 @@ static int walk_hugetlb_range(unsigned long addr, unsigned long end,
 	unsigned long hmask = huge_page_mask(h);
 	unsigned long sz = huge_page_size(h);
 	const struct mm_walk_ops *ops = walk->ops;
+	int err = 0;
 
 	for (; addr < end; addr = next) {
-		int err;
 		pte_t *pte = huge_pte_offset(walk->mm, addr & hmask, sz);
 
 		next = hugetlb_entry_end(h, addr, end);
-- 
2.34.1

