Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42730472764
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 16:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564959; cv=none; b=azl8pyLJX0ezlGEXqKyBLmYbgzhPn4vN3H1H3bMQF1ECGGr0VwHWR2oQo4eshhry1SNAcKves0FLXC7DoPwAQeEf4Z1cqTJ6hDP5tNg0odg/1WfQSRCAFZ0FNa4sRCFNHb3Gqsez6TUVqAHglrbnR0lZZTwDWG9T1gg7QqKly5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564959; c=relaxed/simple;
	bh=sCL3BBNlvDSegGw1RYfwGLaOwuamABwTCX8jZIraTaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qsf4RR78ch3+o5GDUQM6iHS9e851E2Z+doPsZE+/sudnlsu4OoyIFwA6KnGY0ch6tDd+JSKmbpv9ImDvoIt8sDMeEewvPtnwSS2ZBs55uzeaC+dE6/IgpIVI8+WFqsS3yvpunIS1KqNuU9rpIxTWO2A5t5v/8CHitOfz6fBt4Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EjvHJlib; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EjvHJlib"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso892900e87.3
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 09:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564954; x=1778169754; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixuEYraq8V8r2ObYxyMzyXo1gSQVYrBbLSiWlZ9LJqs=;
        b=EjvHJlib18KhMmxbz/VYpi7UgJQxzK4telvGgDaI7iSMi2ZQUVx8rwLequS6I7Vby/
         gSdV0r0DA7A2q84qUUNGvohMnImIlIA2ATn8jmlJz7fSFHD18DVLr7JN/11jdzLFS19x
         PP+bqLku0Uju1lX3yKEoCgsykIVyTWOjsZCrP5ODLLx+NNniP2kpd7IhiWp0Fc5WUzhm
         0QMurTtKDtRCR3ChowTXvXDLagSYLJfaKRkyDpheYLtsxAl4aExtGMcFaIU7p9XfvxSY
         hxQEAk6qDRoDButvernWHqIGeXFaCrJPjgA5DacahxirvBa0ayUPMVU9raHlBJFWz2pq
         wOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564954; x=1778169754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ixuEYraq8V8r2ObYxyMzyXo1gSQVYrBbLSiWlZ9LJqs=;
        b=i/b1LlcET19vIOuQJmKFDK2QmVkEhU1sOMhcZeqmyj5+BugvKsVx5FlA6rdyrAYtgY
         D0uz2dO1bamx6O5B9p0A8D8Ytmj1c7/vDKd3TvpGUQLbvHohoGcsAFMvH64p3LKT4Yon
         QDxQpzpBJryeZaeL6QdWddT5QU+NH32EKmqfCW2sOmljJu3caHDcknputxYxBFFBJs9D
         cbeH9DiINly7p0EmRSh0Zv3rlyZHd6wzYD3o2PQ3lRpArI4KjgQBXoUzrIHDZS8xhav+
         4UhkJjM1qFm3xZQCiBJyxkLA4l/WolA8xAGZReNxD4i3JM1+XIdNUayoC01p70l4qQeu
         wZNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IH0H+smWaFSw70/tA3Z818rhot/t6C/l+9UB0tBrIbJGypJ0FTWiYjZOHHltLhSQ8ldh8@lists.linux.dev
X-Gm-Message-State: AOJu0YyAFeO/DwkzK6ooDvGXPnA9iTSdGz0n8fvYyXv/LJuCJRyRbg1P
	XZGOl8Ih/ulQN8HEsPTismmdxTE2Ju2yR8nQQdh1slrcF/v7QfzEGO/hFB1AaTTftRw=
X-Gm-Gg: AeBDiesYRdIGyKKGZc7gf/8U3xnjO+3J2+QIVBV5axfuFluVhYBAyqPahXLMeQ5QsY9
	0G44B+dmfokLRIjF0Ik00gSUE55azYJ7pLyLsAxldvwd4iSrT/GQw7xAfUbifRyAz/tuO/mkw6m
	xgungZ6RBikLmcZAys7l51kMguZvL+ogCdmC1vOzYSRClv/l3sPtL3ROPJ2MYgMU9Vd5iH5uZqd
	gP9KtjPnTeD1J6eMpmRmJL4w6zSYaxjYdN7XZ0Z4QxF9gvGoVR9wXmPR7XmPJ8g2YVX43rgbcCy
	7tSjFm6bJxq5bkkvZ7I9yAmy/TyEPghCSOdD9L02bDfa5/Nxoi1lIcJXDG/xr8U5iV0Vg8fmjbR
	zFAK+HHHWd0GeRxs8/qo5uwtVyl/nYHgaHIGMXT7lLYKYJjms2XRc5K03+CthPlrj7gn6pZFSDE
	w0yyu95eiO71PyuE2VTNpLeGf+
X-Received: by 2002:a05:6512:10d3:b0:5a2:b487:b945 with SMTP id 2adb3069b0e04-5a8522c316bmr1399814e87.18.1777564954314;
        Thu, 30 Apr 2026 09:02:34 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd54b018adsm10643367b3.8.2026.04.30.09.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:33 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:07 -0300
Subject: [PATCH bpf-next v11 06/11] selftests/bpf: Tolerate test file
 compilation failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-6-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=4111;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=sCL3BBNlvDSegGw1RYfwGLaOwuamABwTCX8jZIraTaM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBLv9nDN2lTqYKeZiw2HLgL+bWLZC9uuMjxtiu1Qcs08vuV2yeTKDzwBfamXV6aKfs4sGZVihi9
 QGi26znR71QE=
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
index 608e6dff0392..df173f9800f7 100644
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

