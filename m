Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564238759D
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491896; cv=none; b=ZDM5B7OEjW+PVKTcNZqNEdlaTA2/oRR+p4XA0M6m/EAnZhGiC+QcIcAoN1oCNl6NwsjKZHc8yjsCHo5szaR2/WAD37ODjfQLKBoyHnP7thVASm0e2r9c9Ks/Xjz1qd3Tre0p/WV+BqXGHdnH1e8+UEiVrG9Ia4Ec/DjU9D5lIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491896; c=relaxed/simple;
	bh=hAVHhP89HnimL0oLWLC0644/U3kawRazlk2a87ZKVDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZgeAcm34eegBTPLDZ1vAuPC0YGXvaUL4fDJIc1YYF0sJ5UNrq6lhDzgfpS/oxcb+kBYHfFDhDiTgUcWNmjF6uYqEhvhEABuZUXxaVizmgJluE7YcPQ9VJbhB5Jrkv4MyD7VM4IqGUtOtzFF9jH66IzDs31cXXR+B69T7QHyPew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pc8FpqJX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pc8FpqJX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso22634235e9.0
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491894; x=1776096694; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpHU6AK4GWIH/sbfOIo3yMGD1Gjj7cgz5YN351qEJrA=;
        b=Pc8FpqJXuU3FaBfYtcmxDjyA5FPZxsm6cSW5KjOEvxbNUpIHVMsbW6sSkG8ZvyLIBD
         Buu1CXDjpC4a7XhHSoXFaCAFEQXoO/jJqjTCfh1uaMOqoL0sIwNGPCgZDhbbCjT3cWCP
         pj0D9ztT0QxO3MuVNf70szg3TVvsfvQtMKMdo6a1/zwryMcKssHxb/i+ZjPMl/o5zgk3
         e8EMi25BH2ACah+TCRWJPeY5bRrLNDsN7KB2HmMYge8Yq9EGRuKTwXAaGtaYF/MqT3J6
         bcYDEhxQKCI2OcqxU+QROj14H6w6JF5ESddaYaMjDsPMks7kBB1OFADYmwh3aUEWywTd
         j6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491894; x=1776096694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QpHU6AK4GWIH/sbfOIo3yMGD1Gjj7cgz5YN351qEJrA=;
        b=ad+1m2N6NdXJR69ceTKt0r9lb1VNbNDCJr87iRVbSQOKnDh9RubcSgOJLghFJQN08k
         hgFdd8C/xK7yjpRtXWaRk83sxlEro0v7xrMNeYRBqlIXZnvjnO3pU1807SYMi1YspG6N
         0qaFiFVIRNxFMespbhQ+jdkF21WdExw2UJbpGa8TToIhk/8pjuATFzngPxxeWw6UtWiC
         4XlX4F6TKPk/N/BWgI2YvvaFpdHijTT+sAN2BjQP7+6ENn3ShuWhEjxlnGyXcqglaKQ8
         2rSG5ZADjGfgKatT+8SJKDOPJ4UDPdRkUNRG8TwTFd30MZXo9MRjCwxr9gDThRaYoApC
         DJIg==
X-Forwarded-Encrypted: i=1; AJvYcCXib9SAQsP2DczwaQw3atLUJOSXvNVGPdwFK56+2wnJkg+LQlNuBwvthwDVlYIZG5yC1whP@lists.linux.dev
X-Gm-Message-State: AOJu0YwDQfoF9mcNnISFyIM69LrBt3R+t0GFpUOctxPCvRta0wHkfZja
	cXymHpi9ZcvyBVGlsmiPiCXgTkMS150Ft9jDKRREA7V8D2oG39fRLRmDH6390jRU96s=
X-Gm-Gg: AeBDievjBbktXsQSWRDF0riS07Ba7O43o1nz867iFHJRZKgaI8wcnwFP7oFGSjOYeJ5
	THbQayBK9osu2E7ezzCDss4qFARAkOKpAY5sO0brI0umpkFi2J/MDCW/yRfF922uHO+DJDLv3qB
	PeiTmkBLHp+U9nwBndkF/HwhEMiJIe0Q1VhlLoPbak3t7gT4r0HJ84GGxN73GxNFAOK/lbBxUSk
	Upj5L91uNWoJ/urGVNfsjsCGFTx+ftKepXyyHzNWc1y41BuJE676kdfKKUuctGqiehGqKn5hNu+
	ApOvajbBtPJLXLP43ncRGnvLhwnjKUH3u9zFL9O6F6up8PWF3ZM4HqM69axDXLJbktmcJPWbELl
	rBoUf3FfNfahuyj+KZ6Jd5jmikMVyFpVwrAyAzUdg5xXv1kAGsdo9lUUjPDZlz+X/aniwcpbkUl
	Ay4L8R+WaLekLGc5jJ6J8I34o=
X-Received: by 2002:a05:600c:4752:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-4889976ea80mr196842705e9.12.1775491893645;
        Mon, 06 Apr 2026 09:11:33 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9cbbasm17235894e0c.9.2026.04.06.09.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:33 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:23 -0300
Subject: [PATCH v3 01/11] selftests/bpf: Fix test_kmods KDIR to honor O=
 and distro kernels
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-1-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
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
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=2399;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=hAVHhP89HnimL0oLWLC0644/U3kawRazlk2a87ZKVDY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDeP13XzXftklBawabTHxLwO2wI9EQvIwa/FVGwg4dP+BjbJ6PtnN0K0zE+moJIbSNzV7I3+hN7
 gHqvarJypjws=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

test_kmods/Makefile always pointed KDIR at the kernel source tree root,
ignoring O= and KBUILD_OUTPUT. Module objects were therefore placed
inside the source tree rather than the designated build output directory.
On distro kernels where the source tree has not been built, the Makefile
had no fallback and would fail unconditionally.

When O= or KBUILD_OUTPUT is set, pass it through to the kernel module
build so module artifacts land in the correct output tree. Fall back to
/lib/modules/$(uname -r)/build when neither an explicit build directory
nor an in-tree Module.symvers is present. Guard both all and clean
against a missing KDIR so the step is silently skipped rather than
fatal.

Clear EXTRA_CFLAGS and EXTRA_LDFLAGS when invoking the kernel build to
prevent host-build flags such as -static from leaking into kernel module
compilation.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_kmods/Makefile | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..47b1bd70e276 100644
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
@@ -14,8 +16,15 @@ $(foreach m,$(MODULES),$(eval obj-m += $(m:.ko=.o)))
 
 CFLAGS_bpf_testmod.o = -I$(src)
 
+# Ensure KDIR exists, otherwise skip module build and clean.
 all:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) modules
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) EXTRA_CFLAGS='' EXTRA_LDFLAGS='' modules
+endif
 
 clean:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) EXTRA_CFLAGS='' EXTRA_LDFLAGS='' clean
+endif

-- 
2.53.0

