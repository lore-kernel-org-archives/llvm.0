Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0723E8C62
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367899; cv=none; b=CCOaV9FsFYwKTRUSufGG1e/hYA6Hf1KAKfIEERajWxDZO6vEPHkFzsd688FnVrP2QbEM0TE1dR8BZvdjjuFGm/D0Jtw+idK68LYcpU9fxLLJwv9Tk2HcuT+wZg0A6+AnLwRTnBxXHyaDl8bD87VWnQNNPpFkkqPTb+Y3NxW6jGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367899; c=relaxed/simple;
	bh=Wbv1yMwruHmacSBHbwCIcsHQsTrMRdd03crOI382Os4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ih/tT6F20S4ABv/bvQR/CvE7rC3NepKsV/vwQBJckWZASfX3Dz2ufngTniscSs0GLshGkTuN4VpJldXjIu2QtYvm/Xb7xLnM5CA+csVlZZQyBPs5H0uy7cft14y6efMjgJY1iSHBB0jGIMYBLJho+j7ceOmpeScxeAKC2h+Sp1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HVM9qxYQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HVM9qxYQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso84678335e9.2
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367893; x=1776972693; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdtCy+qHzaxZ/moUnNmr75mhFuvrteH3MIYR4DgHu4I=;
        b=HVM9qxYQJ9eEcrjQPnaZEy0d1Tpch6+iZKWGplD2vtsPgUSvxFX6JI0EAp3pWrpcBk
         ckHIvMIcGIytHJ1cah/kCX49/AGEOGTlZw+uGkZkR9T0fg1cdSje00DXro79klkDfwtS
         6I2x9Db8rDfACe1rD7gU7IoTZVzeKBB2UmBbnSXbBcVRrhO6XhWMNAJ8cUDCnJaVLndi
         KpJ2zwQF5fN1NLFtV0v/Ce48FSselYBLPeVA4h1JjLKJ32WrlaDuXojZ05Hdblmrb6wY
         aK5dRVHAJq8mAywXwjzXSCabdKgi4Jf6L/nawAKzCAadMjJnrdrQi2fmb+DoPjhrlqVj
         huLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367893; x=1776972693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GdtCy+qHzaxZ/moUnNmr75mhFuvrteH3MIYR4DgHu4I=;
        b=m7GWQXUrrKRipb6k9NUXKzioPf0MVMwkE9JssIVzenQcCk/Hpb0Pr9C3z2Z5iuSd3+
         ihsEjNKT2uqYwrS5k8lWzEzp7bahK4XyTAGc6Tb3aunDnvbDcibY4CPswfmh3dJqGQO1
         +fUWJm515Y0o3ChPSEfEq+Bi0Gz24yjLjBMIa15tVZmC9SkPzStW8ksSheXT7mn2Mw37
         mNfkqvTC8NM4KcYNF8irmvkOU/2txhfPRYu9Egw/e1TglHl3dj7dsNmecPDaOlzATn41
         qnI9dgUjxhrePX9j448Gw9OuO1x5Y2RVplJGbC+Ihcg7LovTRQIJ/7gioW+hZg9TuYwR
         d4tw==
X-Forwarded-Encrypted: i=1; AFNElJ/V4ostr3MQNNX/Xy//vOW8ozXyJ9LQdew+8LGCFeJZ1d8YVhAG4n4BSGDceL8mkRBtk4Wc@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo94CXxawqyXnd6FVzcE0891M0esAaEKC9Mdi9MTKgTY1iUJo3
	qXfwstX+PKZEQghVbCmtbIzEVAJLR0+Cwy33SvL8oDQOkR6j1zMskPutiKyBYjCYZiE=
X-Gm-Gg: AeBDiesydpJSvPDCktF4E6Vg4eH3cxx2OMBdAS0dMm47u6/KR2SoJSAYa5vkq1t7Uks
	NvB3wRDJTWcJN+hfWLsdWKz/6Ok44jkpe+yVTM8+C2S/VSmVxWtb+EtPoQSBv8UC6N+/+NsUBAE
	DSMdQWMFMammiZl5rwX7WTe46ZEfSGwFJClj1sAWl1c2BbIfVao6OszRVyCna89etK4fGM3GbGM
	9DQQuKGf5yApDu3H0BYmuVzGyZS43etFo8shexl333HTfvqtvlH1GsSpBVhjeJDS6BZRY6JEMg1
	hzrukeoxi7+qKMM52mDlwXawVgmuaRQvSJrao/whEW8EBvN1YbMuBZVl35EiAcE9CbKx6Vz5rYl
	4FpicK48EF1QgVe3hO9TKBzs/jxKkyDbebnUcMLt1e5+Y5YBw51bJLSL3hq1NuTkG5KICU1iE/K
	HFjYOHJ9k2O/uZfs8/YEjRZOU=
X-Received: by 2002:a05:600c:a102:b0:485:3f1c:d8a1 with SMTP id 5b1f17b1804b1-488fb261c19mr2801625e9.9.1776367892836;
        Thu, 16 Apr 2026 12:31:32 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8fd54ef0sm8310644eec.29.2026.04.16.12.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:31 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:58 -0300
Subject: [PATCH bpf-next v7 09/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-9-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=2217;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Wbv1yMwruHmacSBHbwCIcsHQsTrMRdd03crOI382Os4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHeNPEzKx87y0oH3xHNzsJmu0HlabrtVzf0mkexFuF6yDtm5/jAYzEmJqmpIdxxMvWiTU1LrjUD
 tvfGonaegRwc=
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
index a5597e8431a0..88a03366f6aa 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -896,7 +896,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2))
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -939,7 +940,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
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

