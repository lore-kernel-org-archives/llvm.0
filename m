Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108001;
	b=ijt4suAxwMu3ts00IDkwpp5rxLm1G8xJBtgWuS+5TTIF5jJ6+AlNSNqbBwq8VLxDcY/Y
	 23e3CaPQqynktYTTa7a9dHm7sWrQu5obohbpbfHzypzbcjP9RemTgOtNbVdFCZsPo75oD
	 P/qFRZ3V9cMQP/O0gpzNnq9msMkhkzovN5jLgT4TnrxrMp0tNcyJ2CzSFUXxDrgl+ta2y
	 7NEYtJsk4gLs7Uh8anSPE3tjsLMRpPtnNlzCih+4VlGE1UX5p5LEX19t/V3HiaklH7Jbx
	 BZvJMSC3CGjeBdq2O5xmjD9CYpNYRtdLZap538+TQSORa6wi+976hbWGKS5csYLbaHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=F9rpw5yC+CwnnMf+RRz/bADcuyoWhuGDUJSy47EIYmg=;
	b=NoAYJQOfZM3RFbn06fmZi7nz0wDa+45o+ygRdsSM4OmsnXNXI/e3qCEGJq8Ewu6J+svG
	 YUhUHS0xJwzhSXnT2K9E7wvimshGVmNd1HC/V25GC4xBUNxKV0SF/7VX6aXT5K8CaMo+W
	 2+9LDsUawNPCIrD4SGiOnTuyn/SFgZN/w6i3+E4hi9KCcKegXy5Fvor4jpjdeqCyCAbPE
	 BEzazrwNRE46BcQ5QzatqHTrWA0xuTRsTCgWnOf2O63sFNVtT0/B0fJyIsRt3dJ4cgJed
	 Cp13KD1QnIU+RawCVD1RW6vZsKP5KuNzL8rofBdaTf71aNFWq+H7RWek14HhtF+Fd1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L56pgnQx;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0AF606A32A
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0AF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L56pgnQx
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b29df78132so2588466c88.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108001; x=1795712801; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9rpw5yC+CwnnMf+RRz/bADcuyoWhuGDUJSy47EIYmg=;
        b=L56pgnQx0K8+eCbNls//y1MiTr/IX08NXmPV+ybPjy2mlvENRb184AIO1PUie7TZ+t
         mI6q0gIRT4Z2RHSz3aHUJ5fRbHwT76J2/Wq4Pd+jWujs3h9gxreYut/8SVj8BELcV3vJ
         /fEVBIaWyg1tJiNGN6QbTv78sRVXQdxQlc4SkaFqkQxfZjMofhHRLMezQp8zhYFyhRCQ
         VvKczilKc5sHeDg+LEJfr76zJTqUHzkiVsKdGaMlINTp/CWolcsvxqSPU4/3Sx7JdAFw
         hEsT3rCMaMDgzcl//3ldSxvHM8mqCdCcJzCXR3+US38gT6vtoqZu2klYatL9qr1g5YAb
         rdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108001; x=1795712801;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9rpw5yC+CwnnMf+RRz/bADcuyoWhuGDUJSy47EIYmg=;
        b=cBuaIKEhwgB5R5d6g90a9g1dlz7pOMdo0eUYAt36kcMG2sDDbO14J+6d+DkwopyRzI
         8M+FGZPv/Cu/L/EucsWj4Soh/uO4OF3rT5cg6xgTEuBR9CbI7C3u2+jU+c15n0qD8vBj
         IXS61SQgMdfjYpe3pS0m3PIwIVHOgXuoCgQj9kjovIHrSKdMm3doRgCMGk5v5c222dW2
         W6exfiUd/qYwJgpaMav46VneRU+cKuPsDsq00aHupW0+wJZ0SDLe7QzclM2EtDb7Ug0G
         aEqArxFa0Y3HZB5tMMEZrMHQMpSAJ6g4fhkSJNS2qxsWGJtYCtYLrckT3o46dwy/wSGq
         BXzg==
X-Forwarded-Encrypted: i=1; AL+hErGgLt/l5/J7S9vvwSJLItKI9x1MizJtvVPwJLzxOavyGMZtXDPhC05NLZtSik/nEO/VIiQ3@lists.linux.dev
X-Gm-Message-State: APuU4Z9brhemcgS3R7dR18WQZmPbJzegRHJdntuqjuk92Dxs1YS7EWLJ
	3JwSL0ZSHim6RkCX104TZWVB6dpxb1eQUoyaN1JA3l9E/x68ISyFCylEPgqzeiyCd548yu0mD8x
	pjxR1CwiVUw==
X-Received: from dlbrx8.prod.google.com ([2002:a05:7022:1708:b0:1a7:44f:3bc7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:230b:b0:147:a685:9125
 with SMTP id a92af1059eb24-1b5567c0421mr210863c88.2.1795108000056; Thu, 19
 Nov 2026 09:06:40 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:36 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170636.1520696-1-irogers@google.com>
Subject: [PATCH] kunit: fix uninitialized err and static suite kfree() when disabled
From: Ian Rogers <irogers@google.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
removed the zero-initialization of 'err' in kunit_run_all_tests(),
overlooking two live consumers of 'err':

1. When KUnit is disabled at runtime (kunit.enable=0) while any suite or
   attribute filter is configured (via kunit.filter_glob, kunit.filter, or
   CONFIG_KUNIT_DEFAULT_FILTER*), kunit_run_all_tests() sets suite_set to
   normal_suite_set (pointing directly into the static .kunit_test_suites
   linker section when init_num_suites == 0) and jumps to free_out before
   kunit_filter_suites() runs. At free_out, 'if (err)' reads uninitialized
   stack memory and either calls kunit_free_suite_set() on static linker
   symbols (panicking at boot) or stores them in kunit_boot_suites.
2. When kunit.filter is set without kunit.filter_glob,
   kunit_filter_suites() never initializes *err on the success path (or
   on !copy OOM), so 'if (*err)' reads uninitialized stack memory and
   aborts KUnit execution.

Check kunit_enabled() before merging or filtering suites and jump directly
to 'out', initialize 'err' to 0 in both kunit_run_all_tests() and
kunit_filter_suites(), and report -ENOMEM when suite pointer copy
allocation fails.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not boot-tested with KUnit kernel parameters.

Fixes: fb6988b83b4c ("kunit: fix use-after-free in debugfs when using kunit.filter")
Fixes: e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 lib/kunit/executor.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index c798a02470d8..5525f4da0bc9 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -189,8 +189,11 @@ kunit_filter_suites(const struct kunit_suite_set *suite_set,
 
 	const size_t max = suite_set->end - suite_set->start;
 
+	*err = 0;
+
 	copy = kzalloc_objs(*copy, max);
 	if (!copy) { /* won't be able to run anything, return an empty set */
+		*err = -ENOMEM;
 		return filtered;
 	}
 	copy_start = copy;
@@ -382,7 +385,12 @@ void kunit_run_all_tests(void)
 		__kunit_suites_start, __kunit_suites_end,
 	};
 	size_t init_num_suites = init_suite_set.end - init_suite_set.start;
-	int err;
+	int err = 0;
+
+	if (!kunit_enabled()) {
+		pr_info("kunit: disabled\n");
+		goto out;
+	}
 
 	if (init_num_suites > 0) {
 		suite_set = kunit_merge_suite_sets(init_suite_set, normal_suite_set);
@@ -391,11 +399,6 @@ void kunit_run_all_tests(void)
 	} else
 		suite_set = normal_suite_set;
 
-	if (!kunit_enabled()) {
-		pr_info("kunit: disabled\n");
-		goto free_out;
-	}
-
 	if (filter_glob_param || filter_param) {
 		filtered_suite_set = kunit_filter_suites(&suite_set, filter_glob_param,
 				filter_param, filter_action_param, &err);
-- 
2.56.1.708.g77570a6a1d-goog

