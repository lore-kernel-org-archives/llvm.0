Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E75378823
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473280; cv=none; b=LT4g5goHVs+ip+ytPpVKZgX25QX4/djh0XasJR7/P16HfDUDV6hcBP9691kr0PIn2yKN8jvR69rUeRE8UcMNPux34Ozef7Mpm2hEiGfOapeAoy2YiEjo20e9h09I5Yvd7w9lLl+XDNWbOAScGxUn8OgKI6PNKEp8u04wu46stRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473280; c=relaxed/simple;
	bh=/tFqTU8qCqbw1U9FnIiYVTRI8v+EYywy6kgC9ZG44pU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMDSbK8ucM7l5BkPkV0wnoeBjzHwNl1G84hr9L4axHm5+qhuEggnFwS1BQCXBtWqxxIbqyVTA0Yap316BG0OVZANDlczvKZOFh9bpRWIbRUSc5n99v2g3yeFpcYJTOxX/ZlgggQPSn/EdU4vpfPmAWvoiGeiNEomPUkhcLetihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ElQjyI0i; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ElQjyI0i"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so125000555e9.2
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473276; x=1778078076; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5w5DjNIWsG7anqLb8lN7r0B795MouNr1LYZRRhTV6gQ=;
        b=ElQjyI0i+I576w3oy75C+7XPwlIIN1l5RSNxoVU8xuaWVKOYMRbbKV2NIR5TlXnnhe
         GmzlOhnSVtC8c9IzdjoNauXXj8coU3EQw8Uem9IWfOwMgAhcy/8oceeVBAbsHgPtCsqk
         KT9dgqa+VfEAVOMNNc/1K7H8owhZQIksnMp5riyDYwLx/j3iNJqccOZjKnjvFZkesxZ2
         nqgt+li4cJKSy+a7LZnUIsgUey/fk9PmbKOcBkomf/TnZsZYo8byLryagtrB/4ZXhx6c
         C0dHYIHvvrRA4O6vOqIISEqYU7pxlAm6/m8v8nzIfeSXH3lpfsJcoGhGombKhZG30NUM
         xQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473276; x=1778078076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5w5DjNIWsG7anqLb8lN7r0B795MouNr1LYZRRhTV6gQ=;
        b=l/U7Ym/aI7cvDEqA1F2gnJZP2m/CI1M1U2z6dwNAKMAUTGDwBncNE+8r+gwlKA7zgE
         iRnRGEE9VAW1KdqGDYXzid0kxSPRWEYTQ1IX+pm6itfqE95Ym10ByKAvqA+Fa/3CgyCk
         qpTWdTAgK6yJWa/Hjq0cSdOZFIyKO8jdDjz3gpHCvpLpEEXRaxAiI6VQsJswfZ2jJB7I
         Ih0IymjjLELuhlkb5zusaa7Z2k9av64uFdUYSUHVQBpktTbabJjkCVCxcoqUbkDwYHzm
         kCBQjIaaKHzbP2SKeBpgAbn9eCdGy1Z5qmwj8siJ50NDSm+YWUAeZ45mM+zAddzItXpN
         81CQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LUzUli5PYeoh0f9Du6knTaqe1fzsywnRuZcpynpkhWfSWgCh/QPcJr0HKMPc1m2Ij4RnC@lists.linux.dev
X-Gm-Message-State: AOJu0YwqVqkH956tqM9tii0zXMvsTrRyzEFFeneaOSTERXv2HMEzxTWm
	MHJV2R5Y52FbiS4Hj3nxiBOXnu+BPTi7mf3KE+k7hFb6b2BhIc5s+eZ3jad3oVpEroA=
X-Gm-Gg: AeBDieuuUXCdGjPrRIouRdbcCLfIvJNGXeR2wag/pFlia57tkTq8ZRfqM9aQXP6Y+w7
	V9GhF7Q4v0m1A9RV01VXoVQ8NxSKPZlIVZcpefnfusN12d6GSaq4GXnZmsKRjJd+oZEDl1aOXif
	zI9KB4fW7quffabz+YH4nDjDVOqbXfMhk1gFcanqujop4Hpnj8biybGzI5Ov030hCdo/6drzPTZ
	sLE+EYeh4jxdbwnIFaYM3idDFgXpnMKII/b6mUnRrh4jv+mNoq+EWdmDGO4ZD/ua4g8NAUbggX1
	GfgLYrs1a63AKxczz3fPeWq/TZHQQdBiR3KLwQu2H3IXngaFNciMEeEXLSUY8CRjUz1uYu+oRa6
	U/1zaYcVz4nMLgFcFTB8xyGYgLZ/IuinO1f2/TBwn6pJLc2hCKQmxA9IeMUhu1LV0/rnxoWSPc2
	/cOK/t352pPspfc+hMNSE0vFIT
X-Received: by 2002:a05:600c:5299:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a77b25324mr133662415e9.29.1777473276053;
        Wed, 29 Apr 2026 07:34:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb717d119sm1099129241.0.2026.04.29.07.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:51 -0300
Subject: [PATCH bpf-next v9 09/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-9-c311f06b4791@suse.com>
References: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
In-Reply-To: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=2217;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/tFqTU8qCqbw1U9FnIiYVTRI8v+EYywy6kgC9ZG44pU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGYVkomWwEQDvE7Wxp+afLciqIHnprO59BIW8nFs78OTE596z0JktPlMkzB3u0Bmymz9v5I618g
 V8+gHhjjGYw0=
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
index a64e822dc540..db4ff951fc88 100644
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
@@ -988,7 +989,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(if $(PERMISSIVE),$(wildcard $^),$^)) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2))
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.54.0

