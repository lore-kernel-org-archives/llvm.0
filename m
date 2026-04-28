Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D4739EF3D
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 23:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419959; cv=none; b=c68OA9Q5QB5xFWDhPlRFnDBrRjyqncjnRRnl2ee2uUe4D62Zs9DQeoQlpLCP620Z9zCiZ3gyHW9lEIp14G6Y68fBiGxpJgy7xmqDd+K8Jy3Rwr8Lv4VQfm7OJmwhdjhQIlHxNEJmNf57rSydSVV5+Uvf5xnrE97WY4eBnHlyoWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419959; c=relaxed/simple;
	bh=K+vaP2nMwIyYoWLRAJ8KOc+0zXq9dzqeDfUA1fjaXMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L0TFECttsw1PXk0IPWbntlpCl7Swq29jyKCmU9NoberdPBsv/sq9DQNDbobBi4gYWxuAu6ZYXiyiIgpCD8FOFPQAZggnN+kvZ5lJpWtAwum8fJ5U0vwSN3g9Y7NIL1KTH1icn4zDwtDXZ5jm5QOb0Pc+63Qp67sGW6pEReSerhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G+N7phtX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G+N7phtX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso133224265e9.1
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 16:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419955; x=1778024755; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hjnI5sv67kd9Z2OrkU0HujdVy68CkTBm54JLMxtNMI=;
        b=G+N7phtXcGeVSlMCnydTf/hstSy7tSCMAj9K8zLLoOO/Q9SwbCss3OteXIFC0ElvVW
         JhkT9E6yqUsGUjVzzTIoPgIcIGPS3F6oztSlVxXScefEwdDSFjwdsVyz8emlxF4WtBiF
         R8P8lxYQ8x97CpCmH4L6WyrC+wuLNvs1Iepn1d1afRvgYdvQeBuiHv3ZIQeIeGw3tj+5
         rgD8ZZi5KhT2Qwe+h019NiMaG8NLJJ/IjDoMnjzuD3m6oG3lblfkdbfYDytEManXw2Gq
         dwmLq5bUUhXfVfsrvYr43/nH2mfdu7lvjzREIdZG23GWtzB65uR0DlIUThgQZACGUn87
         rSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419955; x=1778024755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9hjnI5sv67kd9Z2OrkU0HujdVy68CkTBm54JLMxtNMI=;
        b=gIrMpqBdWnTeOkIBsP7yYprjdq1K1yruOrLfg6ojUu1vB+scmQhU6c1Q7jJ3yDSQRz
         eFf9Uefdt0dhBch1TFfKhvoxJhaDR82uHDslQR/6F1bY9RknB19url4OeIwbML28giur
         DzQesluK0sshGjw5s1g0Uc4XimtxRaD713ROu60dq9I4A58LHlAZUXSo0nfnKs33HMoS
         N7658K+oAA2zhwHcxiqJYhoMGR3gUQeSnTMAnMnf/bAeYMdrqEETc0NqFJD4S6DKzRDz
         pOasrIV8L9JDd0kbHBPuOFN1Dqipc5k+5DVqMH7E+cn58kpg7dO4G10PePWG4rhyR4DR
         ftxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sAErehZvdwmzXploIOj0fBSEscscKpDywQXg8Rk1WuamdvpsxZDHqVUaSXwUs7FEB7WVe@lists.linux.dev
X-Gm-Message-State: AOJu0YxwIF/aCBEN3Kiaw979A+cOchBF/S6SpWTPkM/eiwsyUBQImZ6L
	taA1wu+0Yw6vfBlIOy3IaPY4zjAPXY33afiDypGNVG0ZrWdVwL6n+DJPhZfdVvowTXA=
X-Gm-Gg: AeBDietpZh8dtleafP/eCRT1BcVzsN7hqQhxbqRnqLJJL+RHAk+C6+rA2MQd5kuspg6
	Ob9+8UCgg7eajVeIZ4AX+LqNu2MxB0Yne2z0gBd+2eX0Tz8GB1+wPoQS0AWd6peUAFsOCXhYSDV
	6JSyed0T7JKe6RcAXYG8M3rzFhQQtNxx26O9SH/YWBzUFkXRT/POSRdyGLdrvj7wYRgi70MB8F7
	Zm/qL0S3ov6msyV+dnx0rOQuwsMVrVVmu8IAa5Lv++CKuR5M9d3m8cYQCstx7O2mABz18zM1Ahr
	8Wt2bwHEVG7m9vxWtnTCMYa41rC6aSGLc9HyLCybKC9EK24OxiEnoQp91QxSwtT2LVkM9zZnhQp
	gKpgi41HLPYf5TvUfW0HPwVQUHHzD9bh73IiT6Our8dRyolcHJlFgQo/1TGquq5qluc13GiL8zv
	Ky7YvEVXraYa1KNAt0qTnulHe/
X-Received: by 2002:a05:600c:8595:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-48a7b4d5292mr19685905e9.0.1777419955103;
        Tue, 28 Apr 2026 16:45:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6d87e40sm207420e0c.12.2026.04.28.16.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:53 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:10 -0300
Subject: [PATCH bpf-next v8 09/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-9-bf02cf97dbcb@suse.com>
References: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
In-Reply-To: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=2217;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=K+vaP2nMwIyYoWLRAJ8KOc+0zXq9dzqeDfUA1fjaXMI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCLRSJzLFmbxcd8Oti89XkYLPxUKPMs9XiDZ2GentAu+0JH4vQWhDEuNUNurJmaqlvTu7XnhPDs
 iNsBf19PdGQ4=
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
index 9a5177455f0a..461e2d9416fc 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -939,7 +939,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2))
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -982,7 +983,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
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

