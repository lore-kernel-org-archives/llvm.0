Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A17A
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 09:56:40 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id e21-20020aa78c55000000b00528c6cca624so2047403pfd.3
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 02:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=x/kle2uksxTcc6x66ftiegZgKc2BrTGOuQ67dMnzc4Y=;
        b=kwkTWMMQwkkHAKjVLJeMpSK64OpdmOgu236oC0XBqrX0D7J98KaB6ERHvVIsxhbZCI
         IjZbLhv6i+RjBhueyuRc2z89NREHndLUI7P+1cS2M3rofdySIBUefE8Zx/tKIC62tGPb
         sBLF+iClr+Zn5Bm0RSvEka+eTWzazkVC/3O2ZFBL8jIT9WJLQsAfwBZSbJkQMZTIfI89
         cORewAgFlyPdAdlkPiW7xz3O8SKElU7ZpBuFMq87gGR/aTiD/l0R19PUxl4Rt6t5Q2Qx
         4aT5W6gW5nD0vJVxsHCUz3+2p5cFeMveFo94NEWcVBwoseoOsr7S11L+fg9cG/HfuMvd
         wVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=x/kle2uksxTcc6x66ftiegZgKc2BrTGOuQ67dMnzc4Y=;
        b=2UzPwPXf9RPq4WAc8M/wu0ch5dXKisB58FyT2Wcn0auSwNw7jzVQM+KBPuIyE9a74I
         orHQjLhmRyklG0e2SSZ+pbRjCesplAhW0VgKlSZnHwzCs8N4ZBKvLcAzoFxSNcRF5rAn
         tcNuBahf3bsG6uF91a6fVgs8QzfyCA/7KmViR29TtjuEHDz443MPsZ/VC1UK6aiPaBTs
         HlgxnEe1JUqlGWVvDmi82KjBwMe82y++SrrRMtOGuIomCh/6V0+LshjkswbhaiJ5n/x3
         /cksk1v8uDUDIdrOcXZVifj7YWU206kAKmXs3B2dWLZRm4CaKlk85LRqUwZMfrjgX5/o
         bryw==
X-Gm-Message-State: AJIora98WkNYXLg/1aqMZRsUAuTxWQ2kH+Qn0E/mSWXOI1KLV9Nx/1Ww
	z8TKzOQKZYrp4kNcxAfNLEzhcZNRwF/+Fg==
X-Google-Smtp-Source: AGRyM1vvm3ysCBRhKyHvAVl7sjPZJlrlsNeD8k0D/UrZt0He9duZpcfV3smERgIMPPYL1yRGLfEhOGf5c4KqDg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr120662pje.0.1657619799129; Tue, 12 Jul
 2022 02:56:39 -0700 (PDT)
Date: Tue, 12 Jul 2022 17:56:27 +0800
Message-Id: <20220712095627.1770312-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] kunit: executor: Fix a memory leak on failure in kunit_filter_tests
From: David Gow <davidgow@google.com>
To: Daniel Latypov <dlatypov@google.com>, Brendan Higgins <brendanhiggins@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

It's possible that memory allocation for the copy will fail, but for the
copy of the suite to succeed. In this case, the copy could be leaked.

Properly free 'copy' in the error case for the allocation of 'filtered'
failing.

Note that there may also have been a similar issue in
kunit_filter_subsuites, before it was removed in "kunit: flatten
kunit_suite*** to kunit_suite** in .kunit_test_suites".

This was reported by clang-analyzer via the kernel test robot, here:
https://lore.kernel.org/all/c8073b8e-7b9e-0830-4177-87c12f16349c@intel.com/

Fixes: a02353f49162 ("kunit: bail out of test filtering logic quicker if OOM")
Reported-by: kernel test robot <yujie.liu@intel.com>
Signed-off-by: David Gow <davidgow@google.com>
---
 lib/kunit/executor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index 6c489d6c5e5d..5e223327196a 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -74,8 +74,10 @@ kunit_filter_tests(const struct kunit_suite *const suite, const char *test_glob)
 		return ERR_PTR(-ENOMEM);
 
 	filtered = kcalloc(n + 1, sizeof(*filtered), GFP_KERNEL);
-	if (!filtered)
+	if (!filtered) {
+		kfree(copy);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	n = 0;
 	kunit_suite_for_each_test_case(suite, test_case) {
-- 
2.37.0.144.g8ac04bfd2-goog

