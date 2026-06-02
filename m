Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3162C3E2AA1
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405432; cv=none; b=X8rSoyE1f7Rd/peloLvo9At9kFibSET7b4N00/LEpaFl084hO/Vy0fLyEbeBZ91puCWPg4T0p/n2O/s4t3lHGREniKAtkynEwEK3CPMAWURyxbNeMePk9KngqCUJS7u2i96t8S5tEjEStZf8pLnjXITqoEIMoQcml4IAQi0iyL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405432; c=relaxed/simple;
	bh=WDLnHiZPtsQn+nJrqLJZCP+unVavs2qfj0Icse9NGF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMSDNNi5c1aSqgNSLQBD24w7kcW9CmbMsOUef5AzWB9pu2BXPzxVdNUEXMu9GvGBfyYlLKTRYYF96LURxOfXpi+eVFhQhooTmvES0PFpC7DslIDNn+/FGQZr46TZi7ugZWGrCStLUGPpHrE+f+e6VgI46DolmyaUI0h5ZA+KuKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ByJMCFPz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ByJMCFPz"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bec49f7e35eso326010466b.2
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405430; x=1781010230; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RALhkDAmVWzUkKWUeiSZlbMaX2cF2Z8Q6irmSkI6Xu0=;
        b=ByJMCFPz+zQmA119BzXvUUSS7HVMjrIFIPItNPvLNGO+NJ1TYs2NpwI+YVKOwV39Kq
         abY3/xlR9mrXXXIhJ8XrvaFcrhva/BqPp65FaYZ+6F5H2cxVhHq9fxIvo8ddzSsWX/Uy
         kjozhvj/ykLg6DFezQzOkgu/5/mtWhdxRBZxUpDlDGKluDXYRansHC4QM9ksNCBLmSc/
         e16N5jFST6K7LJybtKvLGIl/Jadp2328+Usv+VuQ38q53c0cffYpfT5IY+PJ4yQzjPwO
         UX6TkZOyNH0tazMxHBdm8kx/PgecQRzwgJ9jk0tzdS0bbwvhd73SjXcK0zB7fvhOvXxD
         gGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405430; x=1781010230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RALhkDAmVWzUkKWUeiSZlbMaX2cF2Z8Q6irmSkI6Xu0=;
        b=mXe7VwkuPbWaQJrCKkjc+eAgkUqrrRNj/LrJV809u4kqZyiNYXmM7LkZ9FA/4iY0Rm
         /hTmCBgHG4t+L89g3eI2YEpnd5OrvpVfAWjVjsci28epT5PT1nt5gpSfohJTqVsa6xlw
         Y+HodCWl9op2Dh+PxE42qfHhZ4/rWxR9McjsB9Lm021T9LcInpxFsYnLHSjHMeeNyVyn
         GGx7PzbEHfEr+E2wR9ngH0Ppfbd6/Dw7Jfr43ewVe5g0ZpTsCTyKY5gbUXn1XNSovD7z
         EJcSrWS2v4Q6SHv5s2A1DOFoK/fY7TB8tDuGRA3R47/W5btc34lawsPlbPbVHEiT7R+T
         MPjw==
X-Forwarded-Encrypted: i=1; AFNElJ++QuwQnoYjEwucqng+IOa8wco+a5WnDjRfakaAnp3kYk5pV8rs5EuL3NygsC6LJVwrx0La@lists.linux.dev
X-Gm-Message-State: AOJu0YyVqAKPCNPlRiPizzg27zn9KZDSS/BksN+7cNg8Kxksxuqo6WXb
	Q9soqp09O7yamn49RiwFtxpZM96KSOA1ZOZrvSPlM5xssKW+Kw9eWghDus+pZBxg5KE=
X-Gm-Gg: Acq92OFfPfCSUyair+9XO4uaKzOdUvWrzrroDf0V9KscMnabB3Tz51uwveGlJTnQNQA
	lVZOG8jHWGJ2Tm9uqdXDXQpF7RkndI/JpjetBdoQ9/GtfdnVCL+5wJftMGr4Q+EmCdG3lxug9wU
	I9cjFiWNJt0+61v18aLGjMXk8QxaR6r7LtzRgiaxpFMzF6fgjg7NGNWs5akZdeuOZKiEl8lK12X
	a2UB0CJlTHGoCj7yxxl2rlszBgcJXch1so5Bj3sE4s3YFohnSmojPG2xBnL/BltTP+5HvAk3Hde
	LrPh8EKsBa8vosBs7OEhzc7PMJFqXaz3INt7aebu3kF28DizR9KxlZVyToS2lpr03N17F518Umu
	QgCmCeTQ4VIXCT9YLzPS8b6wwO5ytR2WjDJHVk2+FBN5MLFBSZUKMXiJ9Tlj8iG12OZO0tV4go6
	5epArqpgNW0yn56rYlA0ZFoA==
X-Received: by 2002:a17:906:45a0:b0:bef:12f:346b with SMTP id a640c23a62f3a-bef012f3d62mr204216666b.15.1780405429527;
        Tue, 02 Jun 2026 06:03:49 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de5c60sm493403766b.16.2026.06.02.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:49 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:58 -0300
Subject: [PATCH bpf-next RESEND v12 09/11] selftests/bpf: Tolerate
 benchmark build failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-9-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=2182;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=WDLnHiZPtsQn+nJrqLJZCP+unVavs2qfj0Icse9NGF8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKMXfHUk1I1JTIi4GTbj16UrnRNnyc+KvHxKx4cxzf3g9RoKrr0SQ0O3kfcYEedas1BqOUIhlYq
 o/u4jLX9QRgs=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Benchmark objects depend on skeletons that may be missing when some BPF
programs fail to build. In that case, benchmark object compilation or final
bench linking should not abort the full selftests/bpf build.

Keep both steps non-fatal, emit SKIP-BENCH or SKIP-LINK, and remove failed
outputs so stale objects or binaries are not reused by later incremental
builds. Note that because bench.c statically references every benchmark via
extern symbols, partial linking is not possible: if any single benchmark
object fails, the entire bench binary is skipped. This is by design -- the
error handler catches all compilation failures including genuine ones, but
those are caught by full-config CI runs.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index bc845022a7ef..4eebc15670e3 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -945,7 +945,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2))
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -994,7 +995,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2))
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.54.0

