Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E23446AF32
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564965; cv=none; b=WcyGTXsF5kYNTKDl9Cla8mfvBCsztgRtTt+NhZB4Nl8ty3UkALbbQMq0+zG4Cq7utaZV8JOGn2tK0nAAMotOFOd05TlvF3toSKk742RYxe1MVqHoLNTd85LQvs6bIL/ufnHFvO7Lb3/nFQlqyWAWwfmb5qBi/+aS3s74CPXlDHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564965; c=relaxed/simple;
	bh=Tn5NUZT+pbq8d9j5af1FMYMU7d0yJV1oSa3Io45PNeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHlpzBDtrF0YTHQVWt+LP1OrVavijJeGsCzw2RoJGD2VEFqx/u+QSGEEu6DFyocFITLLWnUoFXjpU2ZYUu/DftND4hrK9A4MfqdBxPV3M1Bauw/6JLIRs5JWOT4WnxXYlKtqeAeLasL2MKUcG88bgO5hTJYvgg/jVQk4g/zZDJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aJSDNXZu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aJSDNXZu"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a40502e63bso1043073e87.0
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 09:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564962; x=1778169762; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZ/nC6oZIV/xRN2y3005qSyz6fuB0fLlWJ3jGKxB/as=;
        b=aJSDNXZuVZ+SbSYGv2ie1AVnDDkmPA6t8iP1aWv6Z28JpXWgwzR7zNrGVYPppgKQTh
         2fGBxsejriPlUPXQvI2gxd/7Dfxz1qr+2N7w3qyMddNvrsn6eGgsz/Zf5+rQyrLl65iv
         FfaeHncSPxyaYG5OaE7FwG1gxR5dp8ulS9Qa9PHIeCYgR1WwukuFAwUUNDTq6k/wDz++
         J5SdVoN+2PqlHiVBjg8PVUUYzM3HpvBkZaxsHiT1zGc9f2q3tCQV/AemDQaEbgNuh7V4
         iQmsefVHssvDHejoI2W+xn90Qvzp2R2f/x1985A1+8SNA0q8GxL1NNFfzNtReP5dKEfe
         17xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564962; x=1778169762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IZ/nC6oZIV/xRN2y3005qSyz6fuB0fLlWJ3jGKxB/as=;
        b=aoAC36LSkAhqEJftMYnfMfKfGqmLkp0FnRl7e5rizobYkG+wQv9VMCdKtSmFEpiBnr
         F/9BYx6kj8hVChMtZyJY/Gfqnqbhvf3wl0gGtdlZFnQC5Nq6w46mRzCCUJdluWH01nqG
         Sm5hAB807Em/+V7Ki9ctMNF2PeMr49YY9wlbXhGd71YP9ORYuo/+cgFgodiT71/g0fpO
         BPdZvYOo1D39gA6TF8ZoH6UcB/PKOHszOdm28PAZmN4KWtXlknyGz2IURunYu74t8tmj
         +xnoh4iu9dbR7FNbjpnBIyKdq2PoRFFZrvl8ej9DYtzrfCt1rTJGW1yd6oZm02SEYpeh
         3frQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hzISOT1WQR6f87Ohq2Cdm/UhRKto3iERxkpj5eQcD0pt2bniDOBgdCFPnVYGfzIpB0qXk@lists.linux.dev
X-Gm-Message-State: AOJu0YxhiWEOz3ig2Y87wabXk1hqFBTU862aZVgKbq4mNj5x71h2hDqC
	uCzBs2Sxy4pr2xJ8C+U+H4KSKNcLdAXlNjrMnslvCzVL8m7uNTHCGHt9MAUj0W+Vhec=
X-Gm-Gg: AeBDietvBhLObTbswWPglHkyvjA44Vs5ot1WHLiNJxgrNHRRfQzg2OQpDcyzNUO8kV/
	0IdZI+UTohKrgInChemo6WM64BGttOk35uuP5MbWs0T2rqDxp/fvv1MHggv+zaQAkZBF77NY4Fb
	LB5rY1Z7pN5L5zeweld7lgvI8leMav3LHDkA0drWfc3D9ebRTqNGG+QCQnAgq8VFIt7uDVG+Pzm
	AiECf7eHLUF8PpZFOhxMwSoRGE6CErtaSyZU1P+HYhvgbAvELyD0WFYyCCe+BhYjCKM+T3Sv+X0
	rbpmTV8GfhBn+UC6GTMPJs2bz5J9pXSCsLybcxCSUlQ/sc9l0whgBxoObPD2aquz6+qRVoaOCfY
	Bqjg4UOyvyx57FDwwgbZ/gaZbTC9vw/f3CLtxWWdLSW3lHZlnV9g/ZWyzzhO3zxs2+2mN2e5RN4
	3o39wX0cy3qJle3HhDS6DVc1ve
X-Received: by 2002:a05:6512:3ba9:b0:5a2:b43d:ac47 with SMTP id 2adb3069b0e04-5a8522b2610mr1204014e87.5.1777564962328;
        Thu, 30 Apr 2026 09:02:42 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de326a583sm9949074c88.14.2026.04.30.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:40 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:09 -0300
Subject: [PATCH bpf-next v11 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-8-e11f7a8c4fdc@suse.com>
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=3578;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Tn5NUZT+pbq8d9j5af1FMYMU7d0yJV1oSa3Io45PNeo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB7rtyLKv2zd0Vo+lD7jhMZadO7ImkINeDH2z0HsbYRtg70xcDwaC/3gA2KGFzTlRajqwomOy1V
 fwc1xnxJEKA4=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

In permissive mode, declare the test objects that already exist on disk
(via parse-time $(wildcard ...)) as normal prerequisites of the binary so
that modifications to a test source still trigger a relink, and keep the
full TRUNNER_TEST_OBJS list as order-only prerequisites so that initial
fresh builds still produce them and missing objects do not abort the link.
The recipe filter is split per mode: in permissive mode it combines a
recipe-time $(wildcard ...) (which catches objects freshly produced via
the order-only path on a fresh build) with $(filter-out
$(TRUNNER_TEST_OBJS),$^) (which keeps the non-test inputs from $^ but
drops the parse-time wildcard duplicates). This avoids passing the same
.test.o twice to the linker while still presenting test objects before
libbpf.a so that GNU ld, which scans static archives left-to-right, pulls
in archive members referenced exclusively by test objects (e.g.
ring_buffer__new from ringbuf.c). In default (strict) mode the recipe
remains the simple $(filter %.a %.o,$^) since TRUNNER_TEST_OBJS is part
of $^ exactly once.

Gate the partial-link behavior on $(if $(filter test_progs%,$1),...) so
it only applies to test_progs and its flavors. test_maps and similar
runners using strong cross-object references would link-fail with a
partial set and intentionally retain strict link semantics.

Note: adding a brand-new test_*.c file in permissive mode requires
removing the binary (or a clean rebuild) before the new test is linked
in, because the parse-time $(wildcard ...) is evaluated when the Makefile
is read and will not yet see the new .test.o. This is acceptable since
permissive mode targets tolerant CI builds rather than incremental
development.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index df173f9800f7..04634e6e0661 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -773,14 +773,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS)))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$$(filter %.a %.o,$$(wildcard $(TRUNNER_TEST_OBJS)) $$(filter-out $(TRUNNER_TEST_OBJS),$$^)),$$(filter %.a %.o,$$^)),$$(filter %.a %.o,$$^)) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.54.0

