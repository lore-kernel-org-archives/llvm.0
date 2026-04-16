Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64683B7B8C
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342103; cv=none; b=UZBGnFloUWORCgRyRrH7PtTvt3Y3/CBaI7M9fzBQKHR2o05L18ka4K9b4H4HIEfAasnCrhPQmUcaENB0hA37yh+83vevBh1vnQMUFL/3XsGkyluKoB1+PGkdLRwIEotZPsJTLyns7QGB9N4u79Lpw/dgrwDydIaMVB8exsGrBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342103; c=relaxed/simple;
	bh=XZauXOAieRbpp0BheMwqtILoWamalkYTAPiOZR3YiEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSYuarQzTBOjcf4bpYL62tW6leViLyi7HKVoWo6Gdr/lBwEIbgxb037/LpyLZt8j/VqMTN+dCrGXekNd/3zOEqaOIwq2tytKlvFpUBYkys2a+Wh3T2p4N07K4Wol1eYmvyD3PtFazwhsZLWpcpcFoecVmv++3zoyTnENV+RsQ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eEnAeXpj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eEnAeXpj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so54800155e9.2
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342100; x=1776946900; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SPqUzgQ8HO3ei5P3R3nHBlHmYH40ZRSaPj30DCTMfc=;
        b=eEnAeXpjCImvCYa+qYrmGCrv8R4i9jo2I3+yrXbYRRGCrBIG+o/Cy3pN9NORam+Bh5
         YnbADrG6ApaQTE4fEmcvu4iNyZ+JZrVNbGWCW4ZP8yj8bR6HmPHWe1xy7mqwgHl20OCn
         K3gCTan9iQwqUfoE4hTOQ2ShpTlu056M9U9TdoXctjXMnufUpvrC+MW6I7AoRh9IApzJ
         F1Io8D+0HZCgT5T5HW4TDNN99DQw3pExR16pwQgY6COZN9K6QdPn3j/Cbk+Vipcd8EbB
         DvlS0D47fnXqNZlLOY0hfFPq+NjdvPJGoiy1IQ8MeFPnOAK9wscx5aRNjy59rKv24E5a
         Ysow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342100; x=1776946900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7SPqUzgQ8HO3ei5P3R3nHBlHmYH40ZRSaPj30DCTMfc=;
        b=fT6x1Z98YtlhxFwXvbNxsxgv11diUZm2ZgJAE0YbEoCc2g5Nw/AVaG0vYLmDosUPt9
         hD4cjR2ZXdi7rYVR7EIiJeu1Ztr2K7CyHHHRLQrVaXprq6LaHC9FIRYFsIuSqADukuTo
         hqc0mtfh35A/uRXWELn9XpHH689dWcpHg5UIKsC29G5vtBWGdLCxVFwwZhHXE7DcWjUM
         69Oa6WckO11uJoC21VERvsrcXr1BpWS+HsF3x/z1fhtNqeicCNlrCbLxwFC6nR/dCy5y
         BZUnsdM6WJIx+mT39ZAvSbf2FPN1WVEvmSAIYGnX/OevdwcdJ0kLdWF5BppSI/0yhZYR
         R54w==
X-Forwarded-Encrypted: i=1; AFNElJ8vh+LRcBaKU6XQOgIQfh31kc6c4SH4lLDnOw4i/0AKFXPppdP+HPitlTmg/Fs4aQ5WuUwS@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ2ZPCyl7yvhjne6gLymbatLygSGFQdwulyoFI69CM0dz9yqdm
	Ef6v6DKjy+5z69j50OAhfBAkWo3e+IfZA5l+jgfYcDYj1OaucU2X5Gpl2RuFPiNjbHQ=
X-Gm-Gg: AeBDiestpn/3qrIhKOWXNj48GkcG3l/y9xRFmqrIL+60GJ199idNLRg/Y9lWapH/bFi
	+BVekkC52mttW5wLHYaElTlM0ULnNW7XdMDd41/Vs8R5UoDlajm10ala6HCRFE+kFhQjS7P1P34
	qrVbRovhYEqRbvif/o0jAHIqTHAr4yKo6eiXwhonEwSfxm7zwxzFQO5FGs+6isxbTPsc8oz78V/
	7TFcFkNXfp1cdf+30K28xI6dk08ITy2+IKpQlUDqpP+VsSjm78zkvcSsh75V6BmLjZ/CAWxrBkF
	IkiwPw0jNaLbLlywbdUvESiqvS3POfdFfWHvLMosSlTgUGOsHuQ6cGaSfSDgC/hQxrv+nbRy7FR
	LKAVmK1qYOrfXhqkF8F9m+MPzYpnmMkvDYwY4S51280vPKpUTCVMHqBVRYMEAbpUzOdf+ZYQhvJ
	Alg3ViHZ1VI4Q=
X-Received: by 2002:a05:600c:c0dc:b0:488:aa3d:fab1 with SMTP id 5b1f17b1804b1-488d68364f2mr239993935e9.17.1776342100172;
        Thu, 16 Apr 2026 05:21:40 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606db2sm6895637eec.11.2026.04.16.05.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:21:39 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:19 -0300
Subject: [PATCH bpf-next v6 02/11] selftests/bpf: Fix test_kmods KDIR to
 honor O= and distro kernels
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-2-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=3813;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=XZauXOAieRbpp0BheMwqtILoWamalkYTAPiOZR3YiEM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ2CGdvjzyCdFFHrg/vER0+bzdB8I6chKCPSdld8J+2xnYtc+PPtkRjQ9qd7hEoaU1l8fkIpwdr
 BUCqGRNcZUwo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

test_kmods/Makefile always pointed KDIR at the kernel source tree root,
ignoring O= and KBUILD_OUTPUT. On distro kernels where the source tree has
not been built, the Makefile had no fallback and would fail
unconditionally.

When O= or KBUILD_OUTPUT is set, pass it through so kbuild can locate the
correct kernel build directory (Module.symvers, scripts, etc.). Note that
the module artifacts themselves still land in the M= directory, which is
test_kmods/; O= only controls where kbuild finds its build infrastructure.
Fall back to /lib/modules/$(uname -r)/build when neither an explicit build
directory nor an in-tree Module.symvers is present.

Guard both all and clean against a missing KDIR so the step is silently
skipped rather than fatal. Make the parent Makefile's cp conditional so it
does not abort when modules were not built.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile            |  4 ++--
 tools/testing/selftests/bpf/test_kmods/Makefile | 24 +++++++++++++++++++++---
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index c8ba8ccc2c6d..52176dc226f1 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -296,7 +296,7 @@ $(addprefix test_kmods/,$(subst .ko,%ko,$(TEST_KMODS))): $(VMLINUX_BTF) $(RESOLV
 
 $(TEST_KMOD_TARGETS): $(addprefix test_kmods/,$(TEST_KMODS))
 	$(call msg,MOD,,$@)
-	$(Q)cp test_kmods/$(@F) $@
+	$(Q)$(if $(PERMISSIVE),if [ -f test_kmods/$(@F) ]; then )cp test_kmods/$(@F) $@$(if $(PERMISSIVE),; fi)
 
 
 DEFAULT_BPFTOOL := $(HOST_SCRATCH_DIR)/sbin/bpftool
@@ -711,7 +711,7 @@ $(TRUNNER_LIB_OBJS): $(TRUNNER_OUTPUT)/%.o:$(TOOLSDIR)/lib/%.c
 $(TRUNNER_BINARY)-extras: $(TRUNNER_EXTRA_FILES) | $(TRUNNER_OUTPUT)
 ifneq ($2:$(OUTPUT),:$(shell pwd))
 	$$(call msg,EXT-COPY,$(TRUNNER_BINARY),$(TRUNNER_EXTRA_FILES))
-	$(Q)rsync -aq $$^ $(TRUNNER_OUTPUT)/
+	$(Q)rsync -aq $(if $(PERMISSIVE),--ignore-missing-args) $$^ $(TRUNNER_OUTPUT)/
 endif
 
 # some X.test.o files have runtime dependencies on Y.bpf.o files
diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..10f202bd0d8c 100644
--- a/tools/testing/selftests/bpf/test_kmods/Makefile
+++ b/tools/testing/selftests/bpf/test_kmods/Makefile
@@ -1,5 +1,7 @@
 TEST_KMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= $(abspath $(TEST_KMOD_DIR)/../../../../..)
+SRCTREE_KDIR := $(abspath $(TEST_KMOD_DIR)/../../../../..)
+KMOD_O := $(or $(O),$(KBUILD_OUTPUT))
+KDIR ?= $(if $(KMOD_O),$(SRCTREE_KDIR),$(if $(wildcard $(SRCTREE_KDIR)/Module.symvers),$(SRCTREE_KDIR),/lib/modules/$(shell uname -r)/build))
 
 ifeq ($(V),1)
 Q =
@@ -14,8 +16,24 @@ $(foreach m,$(MODULES),$(eval obj-m += $(m:.ko=.o)))
 
 CFLAGS_bpf_testmod.o = -I$(src)
 
+# When BPF_STRICT_BUILD != 0, a missing KDIR is fatal (the default).
+# When permissive, skip silently.
+PERMISSIVE := $(filter 0,$(BPF_STRICT_BUILD))
+
 all:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) modules
+ifeq ($(PERMISSIVE),)
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) modules
+else ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) modules
+endif
 
 clean:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+ifeq ($(PERMISSIVE),)
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) clean
+else ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) clean
+endif

-- 
2.53.0

