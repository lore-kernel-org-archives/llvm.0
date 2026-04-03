Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ADC3CB2ED
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228375; cv=none; b=nt4wRNWqZLVvRoij8M7gInlCXFXrMhwIKzG7fhJ0ihw8wDtWj9FKTwQFYQqH4/ZcjW9N3iUosnXtk89b1hpFciIdDaDS7Mzc4NULw5To+Se/yUxy7j1UIkuOeugjyOO6hUuZopeKfiW95TtxHcxIQvNE4edyAgyoBkhnuh7++5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228375; c=relaxed/simple;
	bh=Vb0AXhFsDt9pyoh+t+bE4qmDULoWMSdi9FuzL2SfgS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeSDJpHwcM7Qb5dYvlLHCoQ4Wt2eTNm0E8+BD4Yq+9tGu+y7ErrtTfRZQvrbMot+ouVAHuEBfKZUTuihEcqP3eAXV0w1f91ApD4w6yw1w4MkVsWcWh204O9A8Wnj7wG1nv37IVoe0Z3gTZirO4RRiZNNQAjUQWlk+sZ46oGLQg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KHyxPA1i; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KHyxPA1i"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486b96760easo22998175e9.2
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228372; x=1775833172; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ls1McLWMN73ezSsTrZA7UyKWtFmBmekWaV7EBs/FdgQ=;
        b=KHyxPA1izsCVaitzLDzjWhtyhjAs7tyBl+zprIqGlAdsQdc9VinGPl1e0tQQv2NUf9
         l3cpwQ2emxsHxrKwVcRYIeH4bsYORyo13wTAe9StLh/+o6mPpiUl6Msw8Rz5jwwU15c0
         VeR74n0E7HC6cOj/CEbGu/zECVPaX7XQ0RHO+4RG1O/u3ESmmV/5Lu2hV58Cg207xdHC
         Mhw2FMWkmKmEdM1j07UtdcHp2CG61UV0gQEIn21hEtksLI4tCg1fFCCCPMqy6FkleaVg
         s/7bExLVRxfwfyjpAuRuZtU8Y4c8y4sN0aFrz1jzQa1+6RDCOmS5FRtt4KAM+GsPIpO4
         3lVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228372; x=1775833172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ls1McLWMN73ezSsTrZA7UyKWtFmBmekWaV7EBs/FdgQ=;
        b=INGIZF8fYdgR81KGm5NW+M2NqMZQdueL2GV3JLcJ9CFgTqxrTaPy6cbo0CRWjSjpeZ
         jesX08E6xsaDSRvK6E4GWiEER0wilLfihNVwr6I60X4MBI594GPXMuUdP0n7JbZYolOT
         IKtEIhzI+wLTnicocyWZLFaqD/cUWyUyPEqjTnuw1yqwIcfTqc2QNM407rrODJkonwCY
         D/pr+EUBKt9+oXsKZVKPi7Ardeur3QeDWdvqyzr4n42dUNjaeQrGIhYVNs6cokFwdnWs
         p8umpEHu0MuiWKnM/wXR+KVg2ZVive7YQlnqTEfBAuXC6bAjlXtPMwxOLJqE+UIAn0Q0
         2TSw==
X-Forwarded-Encrypted: i=1; AJvYcCXfQCDTi+p+mcTZz/8iC6guuIyUBjBxZXfF8YW0m4H9lgqPfw5V6X6gK5L+2o9zRwcFF8fP@lists.linux.dev
X-Gm-Message-State: AOJu0YzWKsXynbImQNs6F2q0XZi0Fpt+Y29FrQi8LLrg9rEWshKDuF4F
	i5Ft3dGCEgpxQ+m82LRomNGeJjFacdo3CI5cqGYD9KLcOTomc88UAxHo6w4NCroXGIc=
X-Gm-Gg: ATEYQzy1591YrJwB6i4VCeyXE0wbbGVGh7OjcX0y0pFS7oDgP91eZRpdn25P5pxHTem
	UolDmuKA4A3P1DCpfqwdmQenBGHcm5W5ipkT4NgDdoxsuKUOqIt2TvohFowmN8fjcHr+ZvGlPkn
	h4bd0Dw3kUCtS6xJ37u59T+hj9rHBv7LFnu24dnDhLzlkDcLzE/v7NB1XgzWpKwdPahoVDUkfpG
	/69+mM90sLbHJMzB7CHjao1pJSg2s8XSjJazJeCAlq5D8/OayFnvRtQBRGjQqgkU4a086TSjCAr
	Z4JHxsKGJJt+rvGzNQDgmlhq8Z9lhJDH6py9adybebbHthmDbqbgviJWsfj1tKrxbUgkn2i81gb
	y7gDx7EhPe1BfrN7OQ/0mfTnq30n7SSHsp04XMwzgwIPCaiM+gefakL01Z9/SU75Xu861S0q4y8
	ukBSKcRwO0
X-Received: by 2002:a05:600c:4743:b0:487:36c:f5ab with SMTP id 5b1f17b1804b1-488996ff833mr53031475e9.10.1775228372464;
        Fri, 03 Apr 2026 07:59:32 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1214esm7347524137.3.2026.04.03.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:31 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:59:00 -0300
Subject: [PATCH v2 07/10] selftests/bpf: Tolerate benchmark build failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-7-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
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
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1818;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Vb0AXhFsDt9pyoh+t+bE4qmDULoWMSdi9FuzL2SfgS8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLCw7U/C0zz/637riIE16w5PGpjm5IiodgjmbH4UtLs0ATObTBKTosvzaC8RaAPLzHEy/4wpKYf
 PXEGmhaqR0AY=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Benchmark objects depend on skeletons that may be missing when some BPF
programs fail to build. In that case, benchmark object compilation or final
bench linking should not abort the full selftests/bpf build.

Keep both steps non-fatal, emit SKIP-BENCH or SKIP-LINK, and remove failed
outputs so stale objects or binaries are not reused by later incremental
builds.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index ca64a7678dfe..6c4f85459486 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -875,7 +875,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2)
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -918,7 +919,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(wildcard $^)) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2)
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.53.0

