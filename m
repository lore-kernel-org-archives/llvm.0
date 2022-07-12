Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9502CA7
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 23:25:35 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id h13-20020a63e14d000000b0040df75eaa2eso4044526pgk.21
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 16:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=OhirvL3LrpsrpGUFLH/SV2OLOMXqNUAB/vXAw1XRY00=;
        b=R8xM1rtChBJCyKph+bVpC2te2Q0v2DLVsD8aFQuy8l2zZkyEHlV5DCicE20Y8T9uRW
         1jc2S1CQi4fEh/28xemYWzn+E1SfGirSE+OQEPvYJveHwE+/F/6FJYMjpftsBW05O9US
         OOQInlQ0EVeu5FuhmLv8dTYRebVYbSYZA1zsy7m41XNFkplNRR3kgsDlsazFpzd7oIus
         HqK8FRzTjHqmOTy9UExoMi+dmwCbpv0u+nAj4QwP3CVJmgM4bWmgIexoILG046LhDQ4B
         t1rJl4VfcBRY+VmYzEtBUH5vBbaulgiZS+oVi3GQcasTQyHcmZWXnivlt2whBfObAnz4
         TsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=OhirvL3LrpsrpGUFLH/SV2OLOMXqNUAB/vXAw1XRY00=;
        b=GQfPRTe9OFbFCNRWaSOw0ZCkaWQv6y8dV4zzXC4rf6mzJ+L0KxnoALsEUQmK87ltO6
         jzZqcgZ00ZqePDLz8l1Ct77h3CnDeOGM5Tbnvk7WwjmW1NgS5rVgjDtjIb9swbC63sdM
         Ju1LgcJ9Vt60IJS8QLO+zb/DDOJFmd9bLwxlBSIAsUm1r8OUwl8sSCpjpMJdI2wA8/pO
         Epc0O40qmMw7Gc4b/a8plhBdRoydAERipUQ7EnOFk2iB5UF3B6wFRJiQIsFw7wyG9341
         PEdMoj1hqGfSudYKZI4ntO9yokPIJrJX6wHybLOvADSMMEyEbD7/E16LUNVC8x20id4u
         V7CA==
X-Gm-Message-State: AJIora/aXotIqI01hJH8hBPHNFbs/NE6V4+AbFu4tASV5G/tBMOh8PNB
	XrnmbFK6mXdOL8vq/E6i2C3+WdO2rsAeWw==
X-Google-Smtp-Source: AGRyM1vnAn3L1a5orvF7pBa+LLZ8msIBU+2aUfJxeXzDvaD++UBWHlHM4MdhaBExUPvkVqAR7ySiTLQpTvPeGg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:90b:278b:b0:1ef:b15e:61e3 with SMTP
 id pw11-20020a17090b278b00b001efb15e61e3mr6864938pjb.143.1657668334688; Tue,
 12 Jul 2022 16:25:34 -0700 (PDT)
Date: Wed, 13 Jul 2022 07:25:27 +0800
Message-Id: <20220712232527.1864211-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH v2] kunit: executor: Fix a memory leak on failure in kunit_filter_tests
From: David Gow <davidgow@google.com>
To: Daniel Latypov <dlatypov@google.com>, Brendan Higgins <brendanhiggins@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	kernel test robot <yujie.liu@intel.com>, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"

It's possible that memory allocation for 'filtered' will fail, but for the
copy of the suite to succeed. In this case, the copy could be leaked.

Properly free 'copy' in the error case for the allocation of 'filtered'
failing.

Note that there may also have been a similar issue in
kunit_filter_subsuites, before it was removed in "kunit: flatten
kunit_suite*** to kunit_suite** in .kunit_test_suites".

This was reported by clang-analyzer via the kernel test robot, here:
https://lore.kernel.org/all/c8073b8e-7b9e-0830-4177-87c12f16349c@intel.com/

And by smatch via Dan Carpenter and the kernel test robot:
https://lore.kernel.org/all/202207101328.ASjx88yj-lkp@intel.com/

Fixes: a02353f49162 ("kunit: bail out of test filtering logic quicker if OOM")
Reported-by: kernel test robot <yujie.liu@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Daniel Latypov <dlatypov@google.com>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

Thanks everyone! No actual code changes in v2, just fixes to the
description.

Changes since v1:
https://lore.kernel.org/all/20220712095627.1770312-1-davidgow@google.com/
- Fix a mistake in the commit description where we noted the allocation
  for 'copy' could fail, instead of 'filtered'. (Thanks Yujie!)
- Noted in the description that smatch also found this (Thanks Dan!)
- Added the extra Reported-by and Reviewed-by tags.

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

