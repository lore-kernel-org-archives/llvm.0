Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA93446AEF6
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564946; cv=none; b=tVnCrCK2vx+FkCyzGzEnE6folnHFlxdEaLbYoR4uciXO8Mu0EtcMlmQucO9kuTeAIQbIjuka9SjCf5Q1/K3Fn4TsSE4jaXRkZMFk+lPHbZr+yyMB76hpiZGD7Z9oSN6dWMuheVzBYX8445yCUA8BBTtkgOsGIrNrt+zjTh2iP7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564946; c=relaxed/simple;
	bh=Z9QzhMA/nmBpTOn+59uKlh4SuEqVq1B7WEVOVvaB7s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WpfizVQSNJJBJhhVwncEU3zw3sXEMLmeEcJ+1zMQ/fl47TIaY7JbLyBQDjeSTEJ3PI1QJDfsH3Q1ufJa3YiUJYXYGSjrwCYDq6+N123BKXEBsxrpUbTepFwL/7VsQuPhKIhx54yvsOv5mMjuDxtU/qG9rL81U5tPWn8l3Y6/aRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e/lNP8AJ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e/lNP8AJ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bbe539fc355so27212666b.2
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564943; x=1778169743; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiNt5zgA+hxs+nRe0WbTX3KCmUAfHAiSaAWZgK9AmrE=;
        b=e/lNP8AJ8BLmJPwRqsIdR9gQQkOJXQlRzkxJkvs0oGySxfjN0FVTuqp+zPwvF/pChy
         GD1XanPYgE2yLcLe7t0ceMbCsuaPl8/uzGkp5haW6GGZPDdcswJyBimOpG/IB1LDWOFy
         XSRmbqyFrAD9Xj/Ii0Eny99xpIoOCzBkCO9MrZSd49nsDtYiC0JhWDFUb3ebpjsimpOk
         hpjyujbV1IVMW0Gb7jbRy57LM4VAG4xEsYoYtjnqTU/HgH4/K+2xNEuSBmSM8ZeeUw4/
         aS6Glpm6Ax7m5G2Zg8X/jPtiNDxQQKFu6YOSc0AaWSMUTRCyJgD7m73uaiNjw1FtgIuv
         GOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564943; x=1778169743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QiNt5zgA+hxs+nRe0WbTX3KCmUAfHAiSaAWZgK9AmrE=;
        b=NPAaPdbIR+Qq6vp1j52App5pknPdoYmkCsDDnGv50Fv5BzjRLIaSbHOOLFBl0wHzyV
         UUp7i7S+CpL4MmmhYsXcK7iAQGG1OgCtsdapNWXGB12tcjdxHmrDLocZF9Eb360TyZ7U
         rhLoLeQGVobcv7g22vCEqMg6j0RLcXzdGPuJfO7EKaJ4UuTpu/2I60PgggOwiDOvBRIP
         wU3aeJcZYUsWkS3VOXSHGn5SVY2i0OqY7XYHaJXT1TN/XHakq43IJ+BRPW33D9JO246A
         drgrasbm+T75mbPUrAwNfDdjn6C3UiCa/21Ip/QLjuXQeSeZevGy674Z/ocvejeWo3vN
         hqzw==
X-Forwarded-Encrypted: i=1; AFNElJ/KiT7IsL/Tk+hjjM8TAeqLDISFiaBLkmR2u+THesU6xIv2l4Q1YI6SlxMWQj1bYgWvbx9e@lists.linux.dev
X-Gm-Message-State: AOJu0Ywkna0DFJ61LVfklx/5xmN4gvyjBjvDZCsF50SydP5bsNGGFKqq
	1HpzAc4BYtpOjdwFNlmLO0jLeFhYfxK/WZ78eQ/39MhTS+GFjyt/IqRERvvdNu4UmdM=
X-Gm-Gg: AeBDietvuPIBKJMtEVh7rcvmslhXcFRGw8h+RXmNGpbvDSjoleiUD/XELOX7CGcYOkj
	p6M57vtD35Jr+jqRI20EfjqNF69Fz03f3NW0QRW5o2cuTfU7YrufjPqWKCHwHc39tvxghZjFq/x
	9noeaz1k8emjzwIw1d1+f+zll00hE+EU3ZG7ZZBnLIDwDM5r6wbQP6RE2S0IybUkAlDfoJlN7fm
	0iQMhSfBQumdUX3JXA8LHGaZfsPC4hqaOWqzv42WOLGghNIgtSsHzqsUGvwwivff+BzodY7jRSB
	7No4gt8eFehx8vYWh098ZLFDSOtgst25VziVefh5CRrjOXkS6GYpxIv+iYiEeMdf7eIO32Tz8m6
	M4Ox2t7C64e+lKoOoHxZFv3T4dv8/HmhYtjtD/FyXr3VcpoSuaUYM1Tot4qEUHOyC1600ryeqYp
	KyueuJIq+/8nXRJceiPy+nZQTs
X-Received: by 2002:a17:907:961c:b0:ba4:94f8:4df with SMTP id a640c23a62f3a-bbac64aa001mr234162966b.17.1777564942849;
        Thu, 30 Apr 2026 09:02:22 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd548a00f3sm11067717b3.0.2026.04.30.09.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:21 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:04 -0300
Subject: [PATCH bpf-next v11 03/11] selftests/bpf: Tolerate BPF and
 skeleton generation failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-3-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=9623;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Z9QzhMA/nmBpTOn+59uKlh4SuEqVq1B7WEVOVvaB7s8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKDr3l2jPXggoh1qvyJjFzK6txZSylsenhu5rEP4QfeIFE8IXh1IK8AdB9KHqOfvE/dmEZ+vlm+
 bmPCx6kWzWQk=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Some BPF programs cannot be built on distro kernels because required BTF
types or features are missing. A single failure currently aborts the
selftests/bpf build.

Make BPF object and skeleton generation best effort in permissive mode:
emit SKIP-BPF or SKIP-SKEL to stderr, remove failed outputs so downstream
rules can detect absence, and continue with remaining tests. Apply the same
tolerance to linked skeletons (TRUNNER_BPF_SKELS_LINKED), which depend on
multiple .bpf.o files and abort the build when any dependency is missing.

Note that progress messages (GEN-SKEL, LINK-BPF) are also redirected to
stderr as a side effect of rewriting the recipes into single-shell
pipelines; the $(call msg,...) macro is a make-recipe construct that cannot
be used inside an &&-chained shell command sequence.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 108 +++++++++++++++++++++++------------
 1 file changed, 73 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index cc6ee7a2df93..b104c687dcf0 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -485,22 +485,26 @@ $(OUTPUT)/cgroup_getset_retval_hooks.o: cgroup_getset_retval_hooks.h
 # $4 - binary name
 define CLANG_BPF_BUILD_RULE
 	$(call msg,CLNG-BPF,$4,$2)
-	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v3 -o $2
+	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v3 -o $2 $(if $(PERMISSIVE),|| \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2))
 endef
 # Similar to CLANG_BPF_BUILD_RULE, but with disabled alu32
 define CLANG_NOALU32_BPF_BUILD_RULE
 	$(call msg,CLNG-BPF,$4,$2)
-	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v2 -o $2
+	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v2 -o $2 $(if $(PERMISSIVE),|| \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2))
 endef
 # Similar to CLANG_BPF_BUILD_RULE, but with cpu-v4
 define CLANG_CPUV4_BPF_BUILD_RULE
 	$(call msg,CLNG-BPF,$4,$2)
-	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v4 -o $2
+	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v4 -o $2 $(if $(PERMISSIVE),|| \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2))
 endef
 # Build BPF object using GCC
 define GCC_BPF_BUILD_RULE
 	$(call msg,GCC-BPF,$4,$2)
-	$(Q)$(BPF_GCC) $3 -DBPF_NO_PRESERVE_ACCESS_INDEX -Wno-attributes -O2 -c $1 -o $2
+	$(Q)$(BPF_GCC) $3 -DBPF_NO_PRESERVE_ACCESS_INDEX -Wno-attributes -O2 -c $1 -o $2 $(if $(PERMISSIVE),|| \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2))
 endef
 
 SKEL_BLACKLIST := btf__% test_pinning_invalid.c test_sk_assign.c
@@ -607,47 +611,81 @@ $(TRUNNER_BPF_OBJS): $(TRUNNER_OUTPUT)/%.bpf.o:				\
 					  $$($$<-$2-CFLAGS),$(TRUNNER_BINARY))
 
 $(TRUNNER_BPF_SKELS): %.skel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
-	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY),$$@)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.linked1.o) $$<
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.linked2.o) $$(<:.o=.linked1.o)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.linked3.o) $$(<:.o=.linked2.o)
-	$(Q)diff $$(<:.o=.linked2.o) $$(<:.o=.linked3.o)
-	$(Q)$$(BPFTOOL) gen skeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$@
-	$(Q)$$(BPFTOOL) gen subskeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$(@:.skel.h=.subskel.h)
-	$(Q)rm -f $$(<:.o=.linked1.o) $$(<:.o=.linked2.o) $$(<:.o=.linked3.o)
+	$(Q)$(if $(PERMISSIVE),if [ ! -f $$< ]; then			\
+		$$(RM) $$@ $$(@:.skel.h=.subskel.h);			\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+		exit 0;							\
+	fi;)								\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $$@)' 1>&2; \
+	$$(BPFTOOL) gen object $$(<:.o=.linked1.o) $$< &&		\
+	$$(BPFTOOL) gen object $$(<:.o=.linked2.o) $$(<:.o=.linked1.o) && \
+	$$(BPFTOOL) gen object $$(<:.o=.linked3.o) $$(<:.o=.linked2.o) && \
+	diff $$(<:.o=.linked2.o) $$(<:.o=.linked3.o) &&		\
+	$$(BPFTOOL) gen skeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$@ && \
+	$$(BPFTOOL) gen subskeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$(@:.skel.h=.subskel.h) $(if $(PERMISSIVE),|| { \
+		$$(RM) $$@ $$(@:.skel.h=.subskel.h); \
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}) && \
+	rm -f $$(<:.o=.linked1.o) $$(<:.o=.linked2.o) $$(<:.o=.linked3.o)
 
 $(TRUNNER_BPF_LSKELS): %.lskel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
-	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY),$$@)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$<
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o)
-	$(Q)diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
-	$(Q)$$(BPFTOOL) gen skeleton -L $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@
-	$(Q)rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
+	$(Q)$(if $(PERMISSIVE),if [ ! -f $$< ]; then			\
+		$$(RM) $$@;						\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+		exit 0;							\
+	fi;)								\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $$@)' 1>&2; \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$< &&		\
+	$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o) && \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o) && \
+	diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o) &&		\
+	$$(BPFTOOL) gen skeleton -L $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@ $(if $(PERMISSIVE),|| { \
+		$$(RM) $$@; \
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}) && \
+	rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
 
 $(TRUNNER_BPF_LSKELS_SIGNED): %.lskel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
-	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY) (signed),$$@)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$<
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o)
-	$(Q)diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
-	$(Q)$$(BPFTOOL) gen skeleton $(LSKEL_SIGN) $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@
-	$(Q)rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
+	$(Q)$(if $(PERMISSIVE),if [ ! -f $$< ]; then			\
+		$$(RM) $$@;						\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+		exit 0;							\
+	fi;)								\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY) (signed)] $$(notdir $$@)' 1>&2; \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$< &&		\
+	$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o) && \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o) && \
+	diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o) &&		\
+	$$(BPFTOOL) gen skeleton $(LSKEL_SIGN) $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@ $(if $(PERMISSIVE),|| { \
+		$$(RM) $$@; \
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}) && \
+	rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
 
 $(LINKED_BPF_OBJS): %: $(TRUNNER_OUTPUT)/%
 
 # .SECONDEXPANSION here allows to correctly expand %-deps variables as prerequisites
 .SECONDEXPANSION:
 $(TRUNNER_BPF_SKELS_LINKED): $(TRUNNER_OUTPUT)/%: $$$$(%-deps) $(BPFTOOL) | $(TRUNNER_OUTPUT)
-	$$(call msg,LINK-BPF,$(TRUNNER_BINARY),$$(@:.skel.h=.bpf.o))
-	$(Q)$$(BPFTOOL) gen object $$(@:.skel.h=.linked1.o) $$(addprefix $(TRUNNER_OUTPUT)/,$$($$(@F)-deps))
-	$(Q)$$(BPFTOOL) gen object $$(@:.skel.h=.linked2.o) $$(@:.skel.h=.linked1.o)
-	$(Q)$$(BPFTOOL) gen object $$(@:.skel.h=.linked3.o) $$(@:.skel.h=.linked2.o)
-	$(Q)diff $$(@:.skel.h=.linked2.o) $$(@:.skel.h=.linked3.o)
-	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY),$$@)
-	$(Q)$$(BPFTOOL) gen skeleton $$(@:.skel.h=.linked3.o) name $$(notdir $$(@:.skel.h=)) > $$@
-	$(Q)$$(BPFTOOL) gen subskeleton $$(@:.skel.h=.linked3.o) name $$(notdir $$(@:.skel.h=)) > $$(@:.skel.h=.subskel.h)
-	$(Q)rm -f $$(@:.skel.h=.linked1.o) $$(@:.skel.h=.linked2.o) $$(@:.skel.h=.linked3.o)
+	$(Q)$(if $(PERMISSIVE),for f in $$(addprefix $(TRUNNER_OUTPUT)/,$$($$(@F)-deps)); do \
+		if [ ! -f $$$$f ]; then						\
+			$$(RM) $$@ $$(@:.skel.h=.subskel.h);		\
+			printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+			exit 0;							\
+		fi;								\
+	done;)									\
+	printf '  %-12s %s\n' 'LINK-BPF' '[$(TRUNNER_BINARY)] $$(notdir $$(@:.skel.h=.bpf.o))' 1>&2; \
+	$$(BPFTOOL) gen object $$(@:.skel.h=.linked1.o) $$(addprefix $(TRUNNER_OUTPUT)/,$$($$(@F)-deps)) && \
+	$$(BPFTOOL) gen object $$(@:.skel.h=.linked2.o) $$(@:.skel.h=.linked1.o) && \
+	$$(BPFTOOL) gen object $$(@:.skel.h=.linked3.o) $$(@:.skel.h=.linked2.o) && \
+	diff $$(@:.skel.h=.linked2.o) $$(@:.skel.h=.linked3.o) &&	\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $$@)' 1>&2 && \
+	$$(BPFTOOL) gen skeleton $$(@:.skel.h=.linked3.o) name $$(notdir $$(@:.skel.h=)) > $$@ && \
+	$$(BPFTOOL) gen subskeleton $$(@:.skel.h=.linked3.o) name $$(notdir $$(@:.skel.h=)) > $$(@:.skel.h=.subskel.h) $(if $(PERMISSIVE),|| { \
+		$$(RM) $$@ $$(@:.skel.h=.subskel.h);			\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}) &&									\
+	rm -f $$(@:.skel.h=.linked1.o) $$(@:.skel.h=.linked2.o) $$(@:.skel.h=.linked3.o)
 
 # When the compiler generates a %.d file, only skel basenames (not
 # full paths) are specified as prerequisites for corresponding %.o

-- 
2.54.0

