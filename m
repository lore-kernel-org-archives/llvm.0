Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C2C2F0680
	for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286805; cv=none; b=M1ouuU4+IoZ5I5DbU+fz0YlxI6FqHmtnpJaikrNHkpUtx/OwC9LbgGQ7asMtwOKS9h149hnSHD4kZSAWz94r9puliwBVmyhy+YvlAKz465v4vwOKqRRhX5jjBsJBVI44UWJehO1qAsh4icB8xp8etdE97LuH5lBQamCRhvbjlYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286805; c=relaxed/simple;
	bh=XCKe1TjHfJlwSJAX4fuY9DLW2sOgBtAwMXzZhTx/5F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6btmm+eKIyq4SPj240rjd4vPfMH5hfOOnsNZsn1gQa+I5omyZO3j4mLmQVvTzKo4Pzz3cbpbF/EbDHlrl6ZLW3rdtz5a+GFaEasicHoP0h8x0Z460bg35JXJHTfK3kAUii8wKnQ+fI5PSXvjClDxqMFzT4wv7Y1w6WvugfB6/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bDIMfsCE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bDIMfsCE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so111369045e9.2
        for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 14:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286799; x=1776891599; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtePe4tVB1ppaoNVFmbhZuXMDT7E+RF+3Sc+9onPhUc=;
        b=bDIMfsCEFSNDaO/TzJ1oo4RC7oujb5U/GcF++/eiwx53/N65V5owwAGg/phTZFeuTO
         poRgQr6sATy6/yUtlW6siywdXtmCBN/+9db2EIO8r40N3BatV0kzTfERhCEUUmRRmHxP
         bcuSMu1owtehwbOgPsblJc95gzDBc2TsL18D220NiV6/WyfSUjZp0p0dfVatkOoq8JEv
         ThDe+iYCo82S+liV8V+TXCoePZlSVgA51QKNZgkADlGgF6IOoTW2/ysvBnT7STRLAC0M
         ULsJVZ/TXFCD5N/xFwvCDf0XImSZV+u7xl6cBI32pe83KagbxsLh02QYE2Nrql7WcG3j
         B6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286799; x=1776891599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DtePe4tVB1ppaoNVFmbhZuXMDT7E+RF+3Sc+9onPhUc=;
        b=DwGi5qwcHEWNbgy5iCSFtrzRQCGXQSQfQemSJjefclkXO5aQJhZg7XwKmvHMfOQF9e
         LADaxngEs9M+c8x5lYGkjlLrZ1mPNJFIPIrqaJv4a8eJNytv35OnuqAQ4oo/PjyVSUx5
         j6orCQaNF+ZXipDagdTrNRCT4R4CS6nIVf+ZlbpIGtWINeV5OuZzQ6dWsRYsjPVMXwLd
         56vTJYWUThOfDStsY8ARV0Mse2lNXlZmUbSx/TTYb9JJnvFv7mgZK0hz6vPi/ucYvVpu
         mIQ96ctdEuqw4E4HicUEVUbnktVfCVOcOam35U2FcNEdziOwBEg0CBge1+pNvl0uKz9X
         WEvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KnqQ2NHcemgN56OnwV2B/tFsAfKb576aXWUsddMj/FB8SFLqYf4HmbCpTlM74Bhu/87MA@lists.linux.dev
X-Gm-Message-State: AOJu0YzZKl1knPjylJdkb4PsqnVrlZZJOyYwNZApiD4AzRyyLPn77oE/
	q0orO27A1qIUT/XmPnJmyzrABMpmsUJXpgDS9Bet0arRFJd5B8UeaCuW1zHEl76ExlA=
X-Gm-Gg: AeBDieu6aKruT3OPZsOq+fN3DybwFRreTJ5H3hMBRhHTEcDYP2jLJSd+pNbP2OsMXmP
	SaIwPysxOgmXSG9cAkBFV9FBLwQK0SQCkMUSO9RX1Oqh9Vi4IQRAKxcQMVz70F/VapMGu2Cz772
	fHIVR9/odSN3pspM8oO+mApUUoEp7pwgf4t/I7iKZNazATMNFLngYPuZA++bTvQ0WQYgrc4U0YU
	/SjR/wgYsrZX0DJqKFmxD5XxOEvIUy8X0jrh7vQW9Knlb66EpU9wzcEyjg/lNiBRCRhfbVZbL2/
	r+kv/LRXiILMSlOqYKmyJdIz+HnKhRIKN4+HCW8TlXPyzXO7r0LawNGlj6FEwR4oPsmcU4Oyo5o
	3zlwLqGPTQunIbdONu0tLt713msmqntEz1DlWMFNjew8YhFRu/KRvQDr94E9UVlX2HRyXrqGWtm
	bdnup6oJRVSCQ=
X-Received: by 2002:a05:600c:c0da:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-488d685c12dmr272771665e9.19.1776286799559;
        Wed, 15 Apr 2026 13:59:59 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6b5627sm3423734c88.13.2026.04.15.13.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:58 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:26 -0300
Subject: [PATCH bpf-next v5 08/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-8-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=2217;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=XCKe1TjHfJlwSJAX4fuY9DLW2sOgBtAwMXzZhTx/5F4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGIQ/GwDhPKHV+R8rebF8BWOcRFMS81S8508Z9JJXDlNZw35XGIdfstY8zicLVz7LEf5figjWEE
 JMfBs4EJgvAI=
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
index 128ea61fd986..163552458327 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -891,7 +891,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2))
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -934,7 +935,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(if $(PERMISSIVE),$(wildcard $^),$^)) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2))
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.53.0

