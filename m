Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6404D3E6DD8
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405424; cv=none; b=tBp+ZF8IxBI0ofot7jH2fvOgmlUKqa8Ix7UdBmIRYXaQJjvtfodm09K/WDknnLFkkhq1DNQTlPi5uL9/V9brL+DeQfvz5uUmjpTCFaXCKlQpBmMZlCz2nndVXz29Ia71OAgujjpdhE/IpxFGysG9ANH6Q3WkoQd7IGUXskMMtAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405424; c=relaxed/simple;
	bh=uWNPJAMMvZz9ncMt6g8dFuRJQCqMabAEhkRHLSv2R9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrAsYrv6Y+UzpMQtC7d9Y9Wx04kpVx9fW6FiF/TZA5uegb2k9L5QBWZHDviCVeew0qwNV/jemM+z3gIp0uPclJvcAlZfvjwwOOrHIuUdfKe4zOTMblmmpl8iTmjyJzVNHnzW4CAMMRLcrNEWzBRYY9EvbYU5MlEK2e9mV2WWSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e8SEMIjC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e8SEMIjC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-befee9e5ef7so41418266b.0
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405422; x=1781010222; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XxjnI4cuMJlR6aAdNJiBVaZBbV9Bk2wM3k3iz92VQ8=;
        b=e8SEMIjCCT/cLYXTiYei/8EtZ8UJiad3UUGgymwFNq4CtSYe0+L1oXFXIo5IJKGrCy
         DaH2a0kAvM9oVMrpDSRfBDhWUn0YPwK8f7p9IMFXVhygn91C9p0abmdp74aoFsrVqzl4
         WP1FcDa7yy8FalLCwZIC3PqB8H6Tw0eVRKdLN8SS9LB93PjR4b1M6wze54IFbre0bQU2
         881ltXsZdhFJ89J7yCGB6z+9Ix6c26v4FxM/uzCuj+mAzakd0zpIYF1GZ2GXdbExd8gx
         gAXyt7bArj5vEHWfquPYkzv7M/Uf51qREmsE/c8KZBcQvkZut9e6xbJIRdiJpGMGYBLk
         U+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405422; x=1781010222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XxjnI4cuMJlR6aAdNJiBVaZBbV9Bk2wM3k3iz92VQ8=;
        b=s3a+/bgZuDg5d1XKQn+gpRSTNsPCyvGFP2ACwrCUDgjGjEe6qpCKPF3iC7NjMV4yyQ
         6ovrbNDZ57iduQGPIvr6/MR4Q0rY5aCBJDuvPcgzfn79xX1wgqAjpJ0LgGXOnLtfOY6m
         539aAE2Vr2M36OGMl4mSCuWSdaRJzr9v6abqZJBVjjoswYrTLbis0UBIlK+nC00glqoj
         ZFLJSOgmOIC0yEXO2DGiRRBoG9PQPMRxOjxuFCQxIwlDMBR8rTMWu2iqSn44ru/M3Vsa
         tgfyfI4wa3C01RUlmQy3aPhwU2aU15OaDxjtBluH9MiFU8p0uIeSdPeCpw5r36Kkaahg
         5nKg==
X-Forwarded-Encrypted: i=1; AFNElJ9pOuaFJXZoOz6cKzlelXgQiSFnNg8EYuy7/3roBTivPKBH0HIRWG9AWfNX4+Yp4l+Gm3iW@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk0ljuYj4X6Ons89ORELTADpXZj27iTQoLeKU21CBWy4c0zZG3
	WFdRHyjwtzgQQBZniI9v7F4qmQLYBU6ooH/ks+4RS4ntcH4+Erc7noYuhG8FBPC0rBo=
X-Gm-Gg: Acq92OG6K0P6xyHJFyzdRiE9s2oDICRnkAKoIHfYFCM8HN8wKpyBLgp8gjRV8ncy5bT
	gzwS9ML+n2En+pDTX/cJg7W0rFJI+E3u6jEBqcREzp6K7Q4xdzm5KlocuMQTsF+zqnb+i+rWwBZ
	+w4PdbJ9rDS3BRBO7VKYbqjtuspU5gVdAQNxmX4r5/Z6boFmWkKIYV9wCA9Tm04DlByBPdnXkgw
	1GcMJ6SQmsO0R/awito63SPpoR18e1PKnDRhqhbqnaiF+8sFnCF2xmUjIr0zV3GF/HcZ38USZz7
	46qpFlgxlmC7CqVak6Hd/SLrF+7WHBr7+GSDr43o7rl+MLgN9IYt0T3adZ/2JrtIgWKrb1LpwaB
	kWveYoHnYIEvqEakUhIhfOHEdjHlf+JhSIJ9NVVTkHpqz2utZDNaTce7fkGU88eWePr3rNLlg8t
	XUZpBSycsGrMqXqZBKggFU6NTQBg49ZPnM
X-Received: by 2002:a17:906:4fc3:b0:be3:d140:2b54 with SMTP id a640c23a62f3a-beab2082dd2mr893000566b.31.1780405420163;
        Tue, 02 Jun 2026 06:03:40 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d27f2207sm487792066b.2.2026.06.02.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:39 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:55 -0300
Subject: [PATCH bpf-next RESEND v12 06/11] selftests/bpf: Tolerate test
 file compilation failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-6-27f898b3ba26@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=4111;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=uWNPJAMMvZz9ncMt6g8dFuRJQCqMabAEhkRHLSv2R9g=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJfDMS9D/+mnKEi0RM4P2U6qEEc/iRDpOKhEK35wD9KWU6NgFbMRVtLsZpl81hOOy3rU/imj7qV
 RlXJn464vjwE=
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
is invalid inside a shell if-then-fi body) and gate the printf on
$(filter 1,$(V)) so verbose mode (V=1) does not double-print the line
that the recipe shell already echoes; non-verbose modes (V unset, V=0,
V=2, ...) still print the BTFIDS marker, matching the convention of the
shared msg macro.

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
index 09de69a81112..7739799c2566 100644
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
+		$(if $(filter 1,$(V)),true,printf '  %-8s%s %s\n' "BTFIDS" " [$(TRUNNER_BINARY)]" "$$(notdir $$@)"); \
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
-		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
+		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
+		fi)
 
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\

-- 
2.54.0

