Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D20C368269
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473268; cv=none; b=LlhqIhQ0g6nWkIGiOBFd2dKHFkuoMDjHjBTasBjKK0BLxuhsHTBdFGnLfeSUnB2UcZt1ASAljbHTK1uAV8Uh5RsAXK7Qwsgw7xcb6WFxlrj/8UXZ5JQHPHfcpW1v8TebhDqNSrFF7vmPWNx2uPTIbaFLBcB9mDzifNB5fuG9CUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473268; c=relaxed/simple;
	bh=jhJGxFLXxkLJMjYYafkYMHZLmy3CdijahvtwkglC+SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJ0OtCvaMQa0ageiFKnpeJaxcc+JsQu7Bx/gPE36xvpXoZjh7KSQYbyp0ep/2Ym09p5wUOR7C/ICqAAasDLwydAJEOUxeDg45pr1Gvb8Y4W5n54kBTa8l8UThZdlBiyDurn7W7Ay4i4Gr/N5Czi+t6+frr4NnaLmlB9MXV/I4/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ku5FmxM1; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ku5FmxM1"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so14244420a12.1
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 07:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473264; x=1778078064; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FT2xKlbvDdzA1YOF+HW6JVqGVpjLZaiDVQi7htx3o/c=;
        b=Ku5FmxM11QPV/zlTf/v+vFWegvdVxTprV6JWFo7JQLNVIhMNCiWKCkUpmYFVjeeh1j
         0hxzxpiw5FmGBogCBjvR0Nqgq8coejkk2shSflUVQmpdf3HsZ4BvMDCvuFscbu2Azbwx
         oMHVNk/dTogkFGG9iwx2eDaePkJi5wehXdCC+zamPtrKj8rp9itO58tHRZ8SkSCD5xMp
         8vgkMNZDRkTkgzQxx4e0bcmbaXUPWzJSyCW9sV5pyATZR6XzDUjQuHSIYhp5knk3yhr5
         GEFPYdIqkih0g5QKDVCBpVPMzTkNyq/+9gf5mEcrr75PQItRx6qODZ0yoQB86XZ/LGcf
         CRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473264; x=1778078064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FT2xKlbvDdzA1YOF+HW6JVqGVpjLZaiDVQi7htx3o/c=;
        b=hsqMNEx63M1DJazo7PbPiK8SYUeivU36r2MJ7COtmv7L8XQtmIXPVBLTDyJ2eTQ/zm
         xwi++tsgdtonvL4iVHrK7thqSIq8g7kckZiCDhSq/MdzVvcQbuNvaFX4URrcbAQypBEr
         cdfBUg1CldAfVZ4T9edw1icq8rtJBx2LyVMYYfXGfDzZ/++Q2EpfG72aB1JUrvmoyn9i
         vBgLv5xXKZx4PetYqZLp6YouuXokD5gj5nAgz9gzvG/zZllT9sZL7l1bnC3m/UZHxk1D
         5mrT9fjYAQb1/lR7wjIArcAe79g9bmGs4np+X0550OdPq/4+GMJzB3hzUCabXoHTmUws
         +/2g==
X-Forwarded-Encrypted: i=1; AFNElJ/a1FEdH1C2IBP+8XtGS0wv8v31pDqiVN9zbXWaHAFBky4jlKZh5FJ175yVp0EhggPewYlY@lists.linux.dev
X-Gm-Message-State: AOJu0YzKgp7WECt9cXjiGm77FciBAq3Ou8oKmAFn/7iWCAboK8+OjUmY
	MBQmxtCVaJBEB6Ad+O8DJ7ohIgnozI1MBI2ZNcZ9zYMV09QNrdaAhUfg0VVYb7+cNp0=
X-Gm-Gg: AeBDies2K7KDkqTUYaGIB/2WYBBFXbdfgG+nBIhoWwYuDD+9LARchV7TTzrjVsT+Lc2
	i/ayd7QEQEKrQHyvbwoHCRTEHYc2nKTWn1WPZG5ZIsB5R4P1e/z4f5gJXJKjMbf1TIFBengj8Fc
	cx4GwXZOl8xa7ldmIXJmkeh0yVndcQP9f/LrToKKTPjt1ymtq6QNfJc/icvB3YrPKkWqdPb88WW
	trsWFavmjotzEQatmo/VqNec8RznwvbjexQ9swtY7VYC78tqKDKxMXaGGbnZ6sGYJjEV/VguZSB
	NT9rjzWlejMyXwAmbaJo9meoPZignAN/O+R/WqXPM0MugJnHla2CCj1ivwKZ08T6QSxSmd+2oew
	6nynsQoVnyuxI0GX5yAm30h8o3jTd0FktCeJagqwY3zlhTZHBWu755TUSyXrIzRHcmrkmY7xA+h
	x1r9wgfxnyBs0uzlXff3YcofXR
X-Received: by 2002:a17:907:e152:b0:bb6:4c2f:92d1 with SMTP id a640c23a62f3a-bb93f138aebmr173310366b.40.1777473263728;
        Wed, 29 Apr 2026 07:34:23 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-629843365e9sm1145522137.7.2026.04.29.07.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:22 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:48 -0300
Subject: [PATCH bpf-next v9 06/11] selftests/bpf: Tolerate test file
 compilation failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-6-c311f06b4791@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=3956;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=jhJGxFLXxkLJMjYYafkYMHZLmy3CdijahvtwkglC+SU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJxoiWVdJnlM4a8nqBXmAhZlgBt/AZtIgb0JaFVSwQNmUj+tSqtoWMa7bWoR5Hcl0OsAIERRbI5
 hqTAjbjOH5gU=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. Guard the BTFIDS
post-processing step so it is skipped when the object file is absent. The
linker step will later ignore absent objects, allowing the remaining tests
to build and run.

Group cd and CC in a sub-shell so a cd failure cannot leak into the
error-handling branch and operate in the original working directory; use
$@ (absolute path) for $(RM) so it cannot match an unrelated file there.

Replace the $(call msg,...) in the BTFIDS block with a plain printf
(the msg macro expands to @printf, which is a make-recipe construct and
is invalid inside a shell if-then-fi body) and gate the printf on $(V)
so verbose mode does not double-print the line that the recipe shell
already echoes.

Restrict tolerance to test_progs and its flavors via an inlined
$(if $(filter test_progs%,$1),$(if $(PERMISSIVE),...)) check: runners
with strong cross-object references (e.g. test_maps) would link-fail
with a partial object set, so they keep strict semantics even when
BPF_STRICT_BUILD=0. The check is inlined rather than stored in a helper
variable so $1 is substituted at $(call) time and the per-runner result
is baked into each recipe.

Note on bisectability: this change is gated entirely behind PERMISSIVE
for test_progs%, so default builds (BPF_STRICT_BUILD!=0) compile and
run identically at every commit in the series. Bisecting in PERMISSIVE
mode at this commit still requires the next two patches ("selftests/bpf:
Skip tests whose objects were not built" and "selftests/bpf: Allow
test_progs to link with a partial object set") to avoid the linker
rejecting missing objects and the runtime aborting on NULL function
pointers.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 608e6dff0392..9becc077eb23 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -588,6 +588,12 @@ endef
 # $2 - test runner extra "flavor" (e.g., no_alu32, cpuv4, bpf_gcc, etc)
 define DEFINE_TEST_RUNNER_RULES
 
+# Permissive build behaviour (skip-on-failure compile, partial-link) only
+# applies to test_progs and its flavors; runners that use strong cross-object
+# references (e.g. test_maps) keep strict semantics even when permissive.
+# The check is inlined per-runner so $1 is substituted at $(call) time and
+# the result is baked into each rule's recipe.
+
 ifeq ($($(TRUNNER_OUTPUT)-dir),)
 $(TRUNNER_OUTPUT)-dir := y
 $(TRUNNER_OUTPUT):
@@ -717,11 +723,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 		      $(TRUNNER_TESTS_DIR)/%.c				\
 		      | $(TRUNNER_OUTPUT)/%.test.d
 	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
-	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)
+	$(Q)(cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)) $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),|| \
+		($(RM) $$@; printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2)))
 	$$(if $$(TEST_NEEDS_BTFIDS),						\
-		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
+		$(Q)if [ -f $$@ ]; then						\
+		$(if $(V),true,printf '  %-8s%s %s\n' "BTFIDS" " [$(TRUNNER_BINARY)]" "$$(notdir $$@)"); \
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
-		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
+		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
+		fi)
 
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\

-- 
2.54.0

