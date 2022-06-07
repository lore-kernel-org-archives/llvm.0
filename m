Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69267F
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 00:09:07 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id u67-20020a627946000000b0051b9c1256b0so8513257pfc.9
        for <llvm@lists.linux.dev>; Mon, 06 Jun 2022 17:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5njyuqsJfb5ANEto3T4lhSV8l6ei77v301vQGlsYZZs=;
        b=Xarlvgo+aGPSnUVW4AOncnP8EbZ3BDRcAMJ/n5Vh/I2VAK/jbjiHP70PuNcB5+ROEq
         L5E1vlBRIZKAd/n389NC8wA25BLPCjYTKd8SQ9AmXkzshhNsaYdYIQeb2YoVwbviJijj
         DHtroToE9o7QMHbETr6NQ/PqJBn/pA3glQhTKRmS5cHTWQ/epMRkS42JuM/iOd0kEu5E
         nVfq/0CEs+H9LqMuL9j203jGJlksrY6JXLcL1dkDXkI9Jg9GUQFJGLwTh491SGdDr0mA
         7aLezO8L8vN2MTOXmmYx9ATd3CwK1Nwct7CwcLAaMmxPQ/uSHhVRj7SEm01O3BRzbbSe
         fEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5njyuqsJfb5ANEto3T4lhSV8l6ei77v301vQGlsYZZs=;
        b=wnaO7nWKbt6GilZDiMhO4y0muxl/b2VA/EerHGGlim5aVIDpWWyAlDLu02a6YWACgO
         t1bR54Ret8ADTmN50Q83aFKfjgv4ajJoYtGccXGCSBH2VHOrq1pEDf+Qma46QHuk9Fao
         n2sB1a9E0jYxwb4sB9JofFTZiZKDXchBhemSSA5UdxSQmfNe/JYmuD9EHSHGoZU3MIWT
         st4asLWHBZYQRZ6DntgPMS9CNqZlzbdH3IpDojRSjrFRBGhPnb4j55+5UA7nYV/eKokd
         fvRgL4V3i+D1A7+rRnra45pfFRrkasUIywSHBiM9DRnwCAtI5N2j3c7iAmxLTbgimUBF
         MPug==
X-Gm-Message-State: AOAM5325Z/dj38D4JrsKkxOPJvr+Y/lw1mrkgXLPcu0xNV6f7wcMdVaK
	mIiFDbbU4F/vf9a1PT5N0MtZte07QXrH
X-Google-Smtp-Source: ABdhPJysN3Jfvc2kr6L+a1zuctuQEbH8RmFdNFd8u4ZR9Tc4WGWrW/1ALQMRqSCJyjJYXehXqmpBCH6RijA0
X-Received: from irogers.svl.corp.google.com ([2620:15c:2cd:202:e763:4219:a098:af4b])
 (user=irogers job=sendgmr) by 2002:a05:6a00:cd2:b0:51c:28b5:1573 with SMTP id
 b18-20020a056a000cd200b0051c28b51573mr5173255pfv.59.1654560547157; Mon, 06
 Jun 2022 17:09:07 -0700 (PDT)
Date: Mon,  6 Jun 2022 17:08:51 -0700
Message-Id: <20220607000851.39798-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH] perf unwind: Fix uninitialized variable
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sedat Dilek <sedat.dilek@gmail.com>
Cc: Ian Rogers <irogers@google.com>, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>, Sebastian Ullrich <sebasti@nullri.ch>
Content-Type: text/plain; charset="UTF-8"

ret may be uninitialized on error goto paths.

Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Fixes: dc2cf4ca866f ("perf unwind: Fix segbase for ld.lld linked objects")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/unwind-libunwind-local.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
index 37622699c91a..6e5b8cce47bf 100644
--- a/tools/perf/util/unwind-libunwind-local.c
+++ b/tools/perf/util/unwind-libunwind-local.c
@@ -174,7 +174,7 @@ static int elf_section_address_and_offset(int fd, const char *name, u64 *address
 	Elf *elf;
 	GElf_Ehdr ehdr;
 	GElf_Shdr shdr;
-	int ret;
+	int ret = -1;
 
 	elf = elf_begin(fd, PERF_ELF_C_READ_MMAP, NULL);
 	if (elf == NULL)
-- 
2.36.1.255.ge46751e96f-goog

