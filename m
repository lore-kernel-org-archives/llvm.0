Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75B39EF1A
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 23:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419953; cv=none; b=Rjv7LbJaCnTbmsEcNkXzRAKVN9SikxTdmeZb+1RpUt21LW07TC5JycTeesYDoBQ+9i1S7x7nflw1H0WgdaxgY06JuGA/qG6nf9V6baJ7y4f1zk9jTM+zjhxAeL/qBDeWVfLit5q5CjWWEQK0S/BWVDd6zcaew3j5J5psbv6PQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419953; c=relaxed/simple;
	bh=bp6nwxzrFREUgn01pCEsReac6kfcDYuXiYr9ESZXpIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkVX5PGDXq3kShjWsEcfkN76GBqC/6JpyF0yColwRmLBdLKWvLd7cvRjfbn5zGXAIk+sOVZmzuYKoWPH20+0h2unhMdwjmFaJ3M0uHDd1GUszrIhnmwZ3LeA9dqD+5O/J1Yrabh7nymp/axLsdm+FVEtFlWc1ZXyyLnC/4cwdrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T8euT6u0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T8euT6u0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ad135063so108536495e9.0
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 16:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419950; x=1778024750; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hdu595jYeB1D4K1cw+a/FSX5Nhp2ZnO92G/7aUFiPw=;
        b=T8euT6u0yAhHAPBXE4bOfcr0FMh98fLlTqKxWVgPuNj/Rkjml/1CMrZmfXc9FbDZai
         EwuaAnkZaNAPbPciSEigAhxP4J9ZoG5mFESlYJibNkwBRiS41++0Qj6Wa0HStXpM1vEt
         CvYdfEdAh/I+gPLbLB9srXI/uub5SyMBHP24VUN+LzVdj+TY3M/QU/kTq4KLrmh6yqLv
         GeefBj3afGtbFhYAmMrLbmWsNXsjOrEnH0U0rcwHhl5IElD1Mk7MjiNeH4+sCGGsKs65
         /mT0qjSA9mjvY0BDMNlxVPBnZJYI5c7pRCB0ydT0yke+/7uuM1U/H9o/h1UlgoK2aKsb
         tw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419950; x=1778024750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6hdu595jYeB1D4K1cw+a/FSX5Nhp2ZnO92G/7aUFiPw=;
        b=D25mmaqo4wpQm4T5D6oE40oRu4AO4RG1uVu3CR5Mj2k3se9OjHKBKN8x1XmWtvVMw0
         Bjb1VLHhKDdgOhUtpYvSoparaxQOVvZf/Uxc+rVitmdqkZf/vAuTCb8dvgVxTz13AbZY
         5mvYskqaLMf2Se69ATHYAD3QQFWyflVpuDAbecWKY7gv1cscJMywSW/tDJQs320yHZdq
         LMmEXVOLSEzt2n7eISxE3ZT2KTb3Yar2bOXVtTBotvD2KefoKobe03cVUr/aXDW76y0I
         T1oo+48WnVIsPX0hT+Zdnm70qEfuQrNssZ6NhJATgpbD86Oq3kHTppPOYzbvrSDhTIrE
         5kaA==
X-Forwarded-Encrypted: i=1; AFNElJ/qJZKiQzZG35vMa97L4VvQ0ZoIJOLuw62i3rkJf7t5MOtayRybq9SMc6yKrqI2QE4fSUF+@lists.linux.dev
X-Gm-Message-State: AOJu0YxBs3NcK74r2hOSTDDi/aBQMYDwfE3afvgj9FfNvoc0JlIc3kQ7
	eNevyP2EWvZpu88yRAgBus4Rv0F1s/Q2mcWYb/WZPywFaAFiUFGtMGjb0iWECmZxE/U=
X-Gm-Gg: AeBDiestQPpT/63im/BIZMSmcMyJQNFNT2L+FOPrdKpzw6m0HmWG3o7gslltDUmLgG6
	50WgSUBzyJmJcPmGuzNdw/KgN21s+EiWrf2opcMKF5oi/JRQHWnqV12RXYl8cfCgtihyLVXK9k7
	loYFvHpswqaanbog+eK4fv7sU+5xjzM98sLTpRbgERYh9nfwwKTxWzQsasbSS2im6bPj9IiKA11
	Zuf4Kp2tSg3Bios05Gcat+oariUFOHiOcSexl1cTKhK6KczY0SSatvU537UR2dzfRLkM8Oz2JlH
	h7vOcvRwvx75stGXWGTRHeTMgIaibYA8nh+qXxKywTT0tbF6Btkz5Im0S7s1iU5f/tyO+JThic0
	PrrlTn1coezuaoqisazum090qrWB+S6ZDxb7PEn9ZZ12alGqiSfLw1JuHI5uz8yDyV7uuMlVxPP
	p6AN8UObrzaLDkkuWFmxTkIJlHLVIyI8r6ijA=
X-Received: by 2002:a05:600c:828c:b0:489:1ca2:eafd with SMTP id 5b1f17b1804b1-48a7b51bcf7mr25090455e9.11.1777419950411;
        Tue, 28 Apr 2026 16:45:50 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7831df4sm131316241.12.2026.04.28.16.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:48 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:09 -0300
Subject: [PATCH bpf-next v8 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-8-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=3164;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=bp6nwxzrFREUgn01pCEsReac6kfcDYuXiYr9ESZXpIc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI0hxMH5mboGWDH9N3nD/FcQJitJcEB3D5vN43cKT82ONg6T2bIh0WA3f2tOXEcc0QmwtCIFLlr
 kbZw83cM8Bwo=
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
recipe-time $(wildcard ...) (which catches objects freshly produced via the
order-only path on a fresh build) with $(filter-out
$(TRUNNER_TEST_OBJS),$^) (which keeps the non-test inputs from $^ but drops
the parse-time wildcard duplicates). This avoids passing the same .test.o
twice to the linker while still presenting test objects before libbpf.a so
that GNU ld, which scans static archives left-to-right, pulls in archive
members referenced exclusively by test objects (e.g. ring_buffer__new from
ringbuf.c). In default (strict) mode the recipe remains the simple $(filter
%.a %.o,$^) since TRUNNER_TEST_OBJS is part of $^ exactly once.

Note: adding a brand-new test_*.c file in permissive mode requires removing
the binary (or a clean rebuild) before the new test is linked in, because
the parse-time $(wildcard ...) is evaluated when the Makefile is read and
will not yet see the new .test.o. This is acceptable since permissive mode
targets tolerant CI builds rather than incremental development.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index f0545ee6b32a..9a5177455f0a 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -767,14 +767,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $(if $(PERMISSIVE),$$(filter %.a %.o,$$(wildcard $(TRUNNER_TEST_OBJS)) $$(filter-out $(TRUNNER_TEST_OBJS),$$^)),$$(filter %.a %.o,$$^)) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.54.0

