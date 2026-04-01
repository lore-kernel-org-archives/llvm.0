Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE3C47CC80
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060165; cv=none; b=f4P1QFkMWPtF0P53HpEqL99FXVptoliC6PhQqagiswYaadX+RJlqstRBHmmv6ZGrRIBOFQrlklhVJJHf/CLTMv9ex7AC+8EZdhROYGgWHXlfsAQyzBeGjM3w+DBmLqpdJOwscp5Ds5yBZYZ2lPX16WZXqNFIV4/+58qUG97aXKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060165; c=relaxed/simple;
	bh=ZDpDhrb8K3x+nKVfSMVripp7Ba903b7FbJshmKVp4e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Py6M8rm9eq4gyFCmqj9bqBk9DUMsMco+z/fkw6akwPcpD562lMCBmKRzGykZyiNNlPVl/r/VYFWG4kAjuvMUfcTnWRAV4pva/8azP5c2SkV6R1PMRS6Hw+gHFIrhGtP8fRTQaxQHPYqlmlJwT6LC5PMwgb3RcDFNPWq0N+RxD94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e8Zs+kHa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e8Zs+kHa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso12018605e9.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060160; x=1775664960; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sb7iiZJr4C2OmhtNVcbDjj63mOfHgV/qxPdBAzHlw9E=;
        b=e8Zs+kHa5NtWNofET/FF+pTE1OnUk36wLB67DQo0XdcXa0sG0qXBVB4D2FE21bN14k
         FoqGSwk0LsmaLImGv8lJEMZkons+Jv/0ngkGLIc4NxjoUDpTkdUa0tc21qTbHmKpc/3O
         1K8bzRLiaaDbzJSBBJb7zSRoOrushLqrX+AOVvp/7lHEkF9GkpIlmSI9Sug0IYvRP08D
         vT1y/exGaXkBF1TA8G03ThayQtJToVazCg9/THHLJJS0RiwfouytLlFQ+u6GOVYgb6Ii
         l3sYJBFabefTjSk3ILEOLMEaOe3kZKq3LRaAlpCDjJbkAb719cVNOCULlqg3rAfJQvr9
         0cxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060160; x=1775664960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sb7iiZJr4C2OmhtNVcbDjj63mOfHgV/qxPdBAzHlw9E=;
        b=kvb4PgahS6u3U93qdwSk6KSiTDbJnqG9BLRDV9u6hBo8DEyZj9BarRQ5COXhge1aCK
         VAxMvH/0B9cPApDJYW2pGprw/Xcc801v0/aKzS4CVP5a6kUO81LGWRN5SoNxLou2XW6x
         ID1VnYJYyUi2EjnfYuEaHKK17xhPFZfuWkNWw1LAhqLX0kmmjVhJDayqokarvtqyyWhr
         1AMRy2P1mwreGiH+IsfF3mxSEwfTg3JNNx+5S2UAoariT8SMZHhNquHyNC4aspeMCmz+
         cq2Cp2jOLwMHIXYHqbwZDYS+E76qgXF7Xscd5lWS0YWQBsykSU59GSxtLUJE1c2afdDt
         xZQw==
X-Forwarded-Encrypted: i=1; AJvYcCUR0sTnuScKO3odSJrjsxmJ2/sgtEAJ4QZ1ej+hGegdOIujrpVCwj99VC6bVQPc3KRXxQFO@lists.linux.dev
X-Gm-Message-State: AOJu0YyiN9g43azUj8yangXGX+NDXZ+rErN83p/vyKLIoEbzAjvs/SbV
	CkKV/zJ7wxeB0bHaX6JeGwUQvBNREXfCeGE4MHWddFjXXfX3enigwUNIz3Ca3/9uKTE=
X-Gm-Gg: ATEYQzwdoOtMn0brivxIjGMlRTH5lMEYvDj5zof3WPimEvcc52qSCl9ZVu/YbnDhP/g
	bRLTqrs1VKRIx773OzPoIwXRFSfDu0mTaRkHwSwujm+npgBxkytDdIQHYKZCzmeGSTuT831h49c
	FTq7Ezx7B44d1VrpuCMDEPMnMv4DTyeNUmjv+1Cxux4P36vI6jCgsXkXOQ+KnamHcRCBU30ntXd
	yQ5qp5sHwFOSK8GCVKqiVLLiqTazRLR0C+PRklRYUuGuzihG5kdYT2Q4LqxEVCe5m8REyXTAzor
	P+gESibdifD2hyq1J7ceG29VuDZwPjv2oNxV9nulSbi0ishwDDK90WS0sXBwW/0PyJaUBFzLlDH
	VH6MlVWHbO+thloz1jQO8lu81dD1RI/VV3W907hqiDZoM5B6Z/MXBgN8PaD1h0wqIQxjFBMUk66
	MlZcILZHHR
X-Received: by 2002:a05:600c:8509:b0:483:6fe3:bb49 with SMTP id 5b1f17b1804b1-4887810ff5dmr180318755e9.0.1775060159808;
        Wed, 01 Apr 2026 09:15:59 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9b8d22b4sm68767e0c.0.2026.04.01.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:58 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:14 -0300
Subject: [PATCH 07/10] selftests/bpf: Tolerate benchmark build failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-7-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1818;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=ZDpDhrb8K3x+nKVfSMVripp7Ba903b7FbJshmKVp4e0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCk0g95hLxMgDX1/3jTgSqsYvNrwe673JDbDzKeVbl4dGxCLuUY1QTt62Siq6f/tZmrRb9DqVZp
 ZpVL2gveRFgU=
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
index 7f4825dfa5ce..3d5b88435446 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -873,7 +873,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2)
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -916,7 +917,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
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

