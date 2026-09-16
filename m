Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C63E49FE
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 06:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539197; cv=none; b=tO28qYnseFC8jjrJrCWVhUxUaxgSJjfVkhKWaaIJ/93Ad/Lh2VSlDquZkNS81ziWIDEBAn6F5ALROtVWi1gEbn/NDcja8Hgj3j420NlwqozeTQ3cdMx1VHlzU3xYUTE1c8oLbvrNAJgDCy0hwe0LNj76ymx3i5558/mUe442BLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539197; c=relaxed/simple;
	bh=hNWirlQjs7zzyx6axdyrOn6luGlogerhrckrgySM31E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=RxWXh+K/EDY/PVgRp8v6FwHhWgad+tZDCj1qKjLJOoBS3AimYWa18BYt4sttzp9jZ0EmvjAw7DI/bhW3Dy3Wxp5StXtdJJUi4ng6CrJxVd4+5uOb1fpJ0FgUT83FKOZ2vOb/5Kbzk9er66N2+YuDkcOC66qwSSwd9h7cAUka/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJzB7WmP; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJzB7WmP"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso9712093a12.1
        for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 23:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539194; x=1790143994; darn=lists.linux.dev;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtP2IcMlbfSjyfjMZ1e0vnZ72bPs3Qn3Gup/k917MuM=;
        b=BJzB7WmPg2v7fFIdFje4QGAZdoyl5uRB0MmJxWXciovjzimTQvwSVxyaUJMxWgk42T
         q4EH8tBedaTuAYOHS7OGEnY842+KVvCkcc+Il2KDGj1mDgQiIacQLaDegniiO6XwcAbT
         t0uHA+BKGViP8lKJBkM75k31iLmdsKA22vMN5inQ2Y4QaTvO5kH0FKFnN4gVcE9vkamh
         eAxaSwruCFR48kiY1JtfOhsoEEWfeYtFe8JrHAbBDSB3YyuWHqJD3EHWGXmPjoLmwZp0
         0TsoWSreLuZYNo0Jwwdd8VJa0q7COzmMQsVqeJ/WgnBchC9cCzZG0/4aTHyRisUxgb8Y
         l2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539194; x=1790143994;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtP2IcMlbfSjyfjMZ1e0vnZ72bPs3Qn3Gup/k917MuM=;
        b=EpIGrZPRuEl84IMQmDx3stb1ThWI+9wHjaNCzUVvYGAc/G1qf2vMd1kWS5ew9gHAQP
         WA2XcQGBopxCq4DpuIK6l8p22LJH9TwfigrC2RmEkVLjLZpSJt1g2YqpSr0msjJ6MlBW
         vk4+VKm5W0bVOKe2kw3TLgpWBlgJaPLIgPXZo6PEPopFEhksqQE5IVXWg3Sve1EJeIrW
         u2yllRgK5CaZqbVJsj5a5/YxI70Gm6uzP/mOx+bcFzSOjC5jnO+exCuDE4HqO0S9aMfY
         8mq9PGtVm/NoLRgU/EwGm1B3Gg3SvY2C/GplckLCZIWHtpVptiaB7BfQh3bpdcQ5vvwo
         PTnA==
X-Forwarded-Encrypted: i=1; AKwUvBxxWHmccG9N9hChDhW7BgD0ERj1D4AGCYpru2cwYFEOSFxt0JrNCedgD1WyHi3hIPdA/pnZ@lists.linux.dev
X-Gm-Message-State: AFuF++nVhhAh+a6jSGucFLVMHG0kXSNwKpt7OlBHwJ0ZiWxK0o6TWZCi
	XNyV1+UtjR2uBWN4LWC6HXtVj38n7sbFD7PpjIjjCs0vZhdl+X6qVMnhuAKLrRVY62iDgiXqoVj
	j9uFgazrcAA==
X-Received: from dlep8-n2.prod.google.com ([2002:a05:701b:4588:20b0:143:7f78:e839])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a1:b0:3da:f969:b077
 with SMTP id adf61e73a8af0-3dd5f495c5amr3407933637.11.1789539194276; Tue, 15
 Sep 2026 23:13:14 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:10 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-2-irogers@google.com>
Subject: [PATCH 1/9] perf libbfd: Fix the clang -Wthread-safety build failure
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

perf_bfd_lock() and perf_bfd_unlock() are the callbacks given to
bfd_thread_init(), so by design they acquire and release the lock on
libbfd's behalf and the lock state differs between entry and exit.
clang's thread safety analysis, which perf builds with as an error,
flags both:

  util/libbfd.c:56:1: error: mutex 'bfd_mutex' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  util/libbfd.c:60:2: error: releasing mutex 'bfd_mutex' that was not held [-Werror,-Wthread-safety-analysis]

Mark both functions NO_THREAD_SAFETY_ANALYSIS so that libbfd.c compiles
with "make CC=clang BUILD_NONDISTRO=1".

Fixes: b72b8132d8fd ("perf libbfd: Ensure libbfd is initialized prior to use")
Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/libbfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/libbfd.c b/tools/perf/util/libbfd.c
index 33dc6158b2b1..8ac6670a39aa 100644
--- a/tools/perf/util/libbfd.c
+++ b/tools/perf/util/libbfd.c
@@ -39,13 +39,13 @@ struct a2l_data {
 	asymbol **syms;
 };
 
-static bool perf_bfd_lock(void *bfd_mutex)
+static bool perf_bfd_lock(void *bfd_mutex) NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(bfd_mutex);
 	return true;
 }
 
-static bool perf_bfd_unlock(void *bfd_mutex)
+static bool perf_bfd_unlock(void *bfd_mutex) NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(bfd_mutex);
 	return true;
-- 
2.55.0.1032.g73a4cd73de-goog

