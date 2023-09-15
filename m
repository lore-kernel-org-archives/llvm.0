Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557AB1A73C
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:04:03 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68fc9a4ebe9so2310157b3a.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808243; x=1695413043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WBuZz+BdckpJHOm1ZISAhTef4sCi4HSxGN+vf0MxAr8=;
        b=c8z80qkbhOdp2UqPUxSyAlwoz9fPFiLbtR+fuvDMgH5oKJnqgXP7eMdtPX0PCyp7En
         qwTq0hJQHToPzg8sa13TAkqF9b+GJDRtyO3dsBve90bl/4YuVKNp3u2bcW8l2Mr/yle1
         Odm8Amu8rUDYJPiuAWVNq22w3eN8Rd2nQ/VMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808243; x=1695413043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBuZz+BdckpJHOm1ZISAhTef4sCi4HSxGN+vf0MxAr8=;
        b=En1tSroamaGIfblrtG5wU7cwmPnmsWauVOfCxNcxkXt1GHtn7ncAaWHqgwexVlJ8Ju
         I28cjtMwR+OeS5TK73HbjuuxWZ/6Dw408lx6TydRW0yf23/tgGT2BvyZMxYQF4Ez58D9
         N3dpMIusA4RMAtTa5NfF/usdZRxVNdb/hg7ekU2dcQ/DNVYQOVToB0Y2T+rs/Gk+ZlSq
         918gxS0F2gncEuyvqWDLS0AdL2R6ld0759RRAByaAzr02bY+FpyFMF7cq/rTAHzobq2g
         woshAJ/LBj1AchsLf2KxFOAlbgTJQ0vWB3OHac1moUT3XbLbguHesUNHcDs8VBA5WwME
         YbFw==
X-Gm-Message-State: AOJu0YztVhTIuIi3/tNenRI4xI058BqBvcb8432CwzvvwnP0xK4xRmSO
	3gbxqqEGtb4fqbrPOsOiLmL0S6EU+CTwmOMCIAo=
X-Google-Smtp-Source: AGHT+IHRUYTJjIKllYHBewMbpKQsYsoD6C28ob0Nn4eDxpBQYKIGmGp4tJnxthVcYLQpU9tsohhP2w==
X-Received: by 2002:aa7:88c8:0:b0:690:15c7:60d8 with SMTP id k8-20020aa788c8000000b0069015c760d8mr3508557pff.22.1694808242750;
        Fri, 15 Sep 2023 13:04:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k15-20020aa792cf000000b0068a3f861b24sm3312716pfa.195.2023.09.15.13.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:04:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alasdair Kergon <agk@redhat.com>
Cc: Kees Cook <keescook@chromium.org>,
	Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] dm: Annotate struct dm_stat with __counted_by
Date: Fri, 15 Sep 2023 13:04:01 -0700
Message-Id: <20230915200400.never.585-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178; i=keescook@chromium.org;
 h=from:subject:message-id; bh=hh6/l0ERrceykgj05rTGEqoGv9O3N3l11v+m7r5kK6w=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLiwjAee1aCYWRgESmBPvaP+ZPywLMQavQYy6
 K1opOJdk7yJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS4sAAKCRCJcvTf3G3A
 JmEyD/9Nw4qdkEPs0CMpZYH9PJm4rFd+PH9nRC+v78Gfq/aOca9MZMGgAsVTNZVVLy3P6KBjD2m
 mtmN77g1YZHJHCVzbdUI0UvlIfsuR086YpqaUWYp7+Q7hZfHkyCcKKrUFceRRDruDxkNaUOsNN2
 IzNy4s/CR4vogKkDt+GZ1M4KjWCNednV7pIbc7OTZ7oDfmLZSemK//MribH6UwbwstZZ/IbuMuy
 aeNZcS/1An4v4h1P+RuIKViYXbrMbIVTWpvGjOIbLasIYjcKoW9pSlewMy33Z139w9b2WMNcLGN
 01cMC9t6y0j1p4xe4bkCrA0JEvmLH5zv+rMOGyLuvyeaG6u2Y41oqm+FNy5fEZOI3Neo6HIqjrW
 8dQ4XaWrwKCWR6rc2vzr2N6EFCxh7FMrjtAvMQo4HoYMuzYpp+4owygZiP1XptuqamDfXDnhjTf
 d79h5FKJzmmzKtPa7y41OC7rFq2Hk7JciHa8JTHI3cw1D4J5VvcDE1ZlMq+Cxpi9QK4ImW7tWhS
 DrKAuYb0nA6Npm4thazac1wWwsCnAmJf6MLJqBrJfE1yYX4s3Tr2XuB22ABIm6T4hfpag6YFrbQ
 NiOsSHMZ6+N3PeHEo1lrusu22nve1JOWkpcUnxD7lJ3kW3pdEnfUXewlmUjhQFSa9tdp54xnhT6
 5iS4QDJ ir8mttuw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct dm_stat.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@kernel.org>
Cc: dm-devel@redhat.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/md/dm-stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-stats.c b/drivers/md/dm-stats.c
index db2d997a6c18..bdc14ec99814 100644
--- a/drivers/md/dm-stats.c
+++ b/drivers/md/dm-stats.c
@@ -56,7 +56,7 @@ struct dm_stat {
 	size_t percpu_alloc_size;
 	size_t histogram_alloc_size;
 	struct dm_stat_percpu *stat_percpu[NR_CPUS];
-	struct dm_stat_shared stat_shared[];
+	struct dm_stat_shared stat_shared[] __counted_by(n_entries);
 };
 
 #define STAT_PRECISE_TIMESTAMPS		1
-- 
2.34.1

