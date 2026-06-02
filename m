Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5078D3E9C05
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405429; cv=none; b=WX/S6D19Um4LS875z8MTxIiwV0Gcz6eQ7asnkaSGRofUHrMksX7VEvGJUY5EFc0IscZZaQjJxxxROFiqxcwFxQo3Ndb8ew8n8W0YKG5AIU9ZLSsYUD9sPd4MhNz7IwDFEal2qfcc8HCiXDr/ea7X9e8ukrAS7nZy3xVuM+Ps2G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405429; c=relaxed/simple;
	bh=7A4fZQx0aF/J8ZiO4w5oZwZY/WHVX7IeMpF2Uvg7m20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YN58PjfGUqP3wWJTgfBsgNSpu/iSVmzVAzCj/9Xp12h42Z7g4qZIZ7YpsLfKFw9QSsHAxihbH93Lp/NMqj9LC0rBY2Re/CQPaxDZQrJsGTkKPp6UcJeMPef/zNXxAH69+MJcOV+rrVdb1IGrjssNrdgI26niYX86pqbAeIXhtbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JwEgSNsi; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JwEgSNsi"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6886be3d39bso17509190a12.3
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405427; x=1781010227; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qcfi42iIquMiKz4IUa3Xe6ZkcXakXKvJ4psdLxPT3Cc=;
        b=JwEgSNsiv9KF8gJ9TFZsNJxqElU9pw0SlLuMvj3Q8B1ZVNzfTID4i4eKqxfPBACF+g
         UVzH9YH9oH+5hflwxzwfFQ8khOoAXEiaAUgm621Z7D01XiNnxId+iITaNRRHEvkx9A5a
         SO8HVODtXTI24da7cF0cdZlkuoAYSlJHequuZdP40O80Ju0exc/SH1RyluwnuwpADkEl
         uhF3/MWf5sbvCblNLIEBGCEDqqTUrSovuOG1mesXVB0PjhhYYDpldis+FTltuHDUfAbe
         uIJmlHHHtQl4wI2EtGzReMLhND5pagD8j6qIsut4zMhdo3OBAaW/OcLPW/JciOrPeIKg
         H5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405427; x=1781010227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qcfi42iIquMiKz4IUa3Xe6ZkcXakXKvJ4psdLxPT3Cc=;
        b=YZ8IeW3rKjvYgQDoiwAtjNn5H5Gp4SS9dbj5vCJTzEc9T8EPAjBxx+hon8acXOEO7G
         oX/QUvNn8oP1ii0kBSajEUjbeDIbPhlb5FiBZM3unO64i2cUmfs2NjrCChuQwZBMJ7ww
         amx73zrhmef/e1C1OJWds9mujkS9k5SA+BFvFetEm1VSpI85b0es/HS/z8CMeU4hAr8H
         canI2EYz9WbDsxRm0DCiNBOtNpfoiY7jcis56n8jDCq0HRUpmSr5v9Hqml9BgNlRGkwh
         ZOJISI/meYMT/huxmKd8xU8MRRhzMjM//ENJFcQLeTusunz3LPRedKGThLr0/n46YrOZ
         ClAw==
X-Forwarded-Encrypted: i=1; AFNElJ8AYOvnQzHd+lK3mY0PQl1uOu51jTTQogZuuiXb6JzolzMGqRgxR7W0dZA8Pu+RNVFUeujl@lists.linux.dev
X-Gm-Message-State: AOJu0YxUCLvvVtq6sBJEd5m1PSaurbloHlMQf5pYiIMvIPLAyCVvfQW0
	n6Xi65DW50W8+m3pv3uJI6iXbJetwj85fJQne9mD025PJZ2cYgffREMUqxXq/3Dp0rU=
X-Gm-Gg: Acq92OFTPcWNMaM2n9eL5Fq+hn/W41DYDznsanu8lshuBnkMeZjRrGc3goUkfmGLeH3
	RdvV6REFZqCUy+hFSPBC6+vRarLvjBgDUzwqnDX/oU8tP23C9HZJloVL1AJ5rRCeEGQcQplaOeO
	Xv50y8G8h6DtlnV2SWdNH8EABGFB4O3Gi9O2zuJ0OunR+JLguUC9QxrBIl3b+f6+KxwTEoSW/dv
	0UXebLSYiFRyk4A90nqa3qpBbf1HCHz5vqBx2S0eckNWWuaDs/gCOCl/ZAvIVCU3QA7LVj+07XF
	NU7PKxoJ/B2s3e8fkA9MO2bBnRSo1LUs5LzGxIrVMcbVFCkw3zV1zOL/wBdKmj3IxBHHXHxa9Uc
	vCgTN+NWX0MuIDl3lOta2G3L3CCNnKe1UHBNd/YH9v3Y6Aigrik0LWWchOSnhTWDrSuZ7OG6wKC
	xOglpj4pn7plQ6vHF6OQ0Stw==
X-Received: by 2002:a17:907:da6:b0:bee:b5f2:6385 with SMTP id a640c23a62f3a-beeb5f274b6mr310434366b.11.1780405426568;
        Tue, 02 Jun 2026 06:03:46 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bef89493f1dsm79315566b.59.2026.06.02.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:45 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:57 -0300
Subject: [PATCH bpf-next RESEND v12 08/11] selftests/bpf: Allow test_progs
 to link with a partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-8-27f898b3ba26@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=3578;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=7A4fZQx0aF/J8ZiO4w5oZwZY/WHVX7IeMpF2Uvg7m20=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBG1tN2EHmzMbhlbqbAZoP4pxTRHSDvZe6y2rsZ4MnYO4yU0yK25T54cnpL45Vvl7K+m3C/O/Nk
 i3a3CYjMjywY=
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
index 7739799c2566..bc845022a7ef 100644
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

