Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8E3394463
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499746; cv=none; b=HSriyUg4ZAWgJrvbAT88W7kv6RT9xq9J+8fM/Ja0lcRHpok9rYIlbZnu9H6BLQIf6A3rBSrzm8XB7er977WWWEPZgAS04F2bI81xalfWYix6FMcKoKQc/+fDSJ4Q4nHuUcac2IDRQnIm3oHTG3I8kyi5jRX9TR+fr4r0vhE35ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499746; c=relaxed/simple;
	bh=UdmIG5ZScOMurXbOdsM3+xZHzE6mxf0WBHcm9S4szVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUVImnRctvY8QImV/KNUvJoCwaxTDfOwlF7xRs9sPUXaErxUe/pI1BVsyhicao4PUcHzV+KHs1rz9wZueCdV0+XwYTyo/rN1f8GNHMgF91axxjAltt+9R8svib1IbHGELN3a7wPTQMbwMSqc6mj2jNirL2zBsDKFySQyVPk/Vxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IPrIgg2p; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IPrIgg2p"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso37815515e9.1
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 11:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499743; x=1776104543; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4g6ZnBzeP1JTZyYPvWQnENXpCsTRTtKLoMuVgANOhM=;
        b=IPrIgg2pozwfRxhwI6+3PseGpWm3lyw6nH/sIvcYKWrt4yUHA/dmtQTHemHXT97Gn2
         sJc6G63FfqLc29n/DlWl++BQHT+kaNRyCUGqE5f46jHWNDt4yXKDuerNG8gbHQY0Wm8V
         MI9+Ay9o1Vp+44Wsg40ZzeVAdwOqHf1vH/sEKKCnF+tQ+XmT5SdIwONdH3ntckbA1qtO
         0aovHzSfL4AlidqKt2f1RAkfeMZKHVfdzUMNXE4vuTL3scvKiUAYlgljUdkIDRjiOqcG
         y8udMLPNg1zUdoZNydatwFkNnLqVpQb5xWmbrcKVKg6odpLtmjcV/KLnOXnl4EqJmFgC
         7ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499743; x=1776104543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s4g6ZnBzeP1JTZyYPvWQnENXpCsTRTtKLoMuVgANOhM=;
        b=mQSycje55+Xd5Ta9M6HlLX5lQBNhguCAuEgm5iaAboRerIECd8xfdAgqDGya0/1OE4
         tjimPxo6OnGeHw+bPUyZfTWUNJbe8YtnOxi2hzmIL+TewIkKzLemgmo5CAVfIL05ojbc
         /gVKT3dnfhZxB/DQIYTYkogNFU9XNwNdlSYmztEdRIFvaQZPqG/JRn1QRYzJ2g1KGzbH
         V1UaFArTK5DZMU6bXCcnRdNe7QEpH3UZ2KpWqPpXYKG6m3HZQFiEgbF2c6pYFc7SRyJV
         HJADscqf+XUElVG0KsnqRhAcTwBM/a799DM4eHyUSRVqnBjS3PHyxvdGkTkIBKWemIyJ
         Aleg==
X-Forwarded-Encrypted: i=1; AJvYcCUB9RMG+Y7kC0kkbQ9nlVQFQytE+dkhkiJE/nfq3z8jFepiMjT82Gv8qPkwPEWq7N6UMWqq@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvc/7vNA5jy+YLfSJ9GLYQ1oOrA3pf9rL3auxZJ5Q4eOk0aQYT
	GDntvTaiKN6s3eehgN/B55NKKW9jRQV4GQb0ux+6T8YokH5eK/NRIusvI2qvWmxH+sNlvAPWtpi
	nUBDB
X-Gm-Gg: AeBDieuR0d4Q3cDMr5wh64L8/T0z7wWCqyS587+EMGD+gtd3HcIQ+IUb4vKZ+Pe1gxu
	p7p03BVaZPEKmOicPMw8MlqL2nJx5RFpN5kICB5qxGDJ/i8cFCB3qpUNoSwuUWhVBdzni7+rmEi
	MMb+1R1eqkBaOkH9jjBmxnx1Qud6+0VeoRUobnrlUwttaeNLakySkjGraVPaQNI6LGiPLFnWlWM
	DExvge6V3pXwRjXJbjg0LFaIIUPM3Jz5i+yiG91sQc4WVVZ39vhzid+ZyfYQDlXmFskp82foM/P
	7W4CvBiac0gZ0B0hy+/zfCGEC/+09au8AlRAqyIXr/iDCHZt+TfQjFKneqyb8D5vExoixz717YT
	9VRK74LA3dxa1fk8B/EAudPEyJpGszSwTm1y2gotLqkOLrZpqYMm/ua368xBHn9hW125uBqIf0k
	A155YwmuTOk0BM
X-Received: by 2002:a05:600c:1381:b0:485:6e40:5584 with SMTP id 5b1f17b1804b1-488996afdaemr206141365e9.6.1775499742932;
        Mon, 06 Apr 2026 11:22:22 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb84c289sm14052881241.4.2026.04.06.11.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:22 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:13 -0300
Subject: [PATCH v4 01/10] selftests/bpf: Fix test_kmods KDIR to honor O=
 and distro kernels
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-1-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=2171;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=UdmIG5ZScOMurXbOdsM3+xZHzE6mxf0WBHcm9S4szVc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPsFC+mekAxUuFuHrSS3/+5pngEcDl6zjD77+ez7jkuo+XJwp6K09aYbo1XfJInLFFrJH14hjkz
 jTijNopyyAwc=
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

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_kmods/Makefile | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..b4f86f151a09 100644
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
+		M=$(TEST_KMOD_DIR) modules
+endif
 
 clean:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) clean
+endif

-- 
2.53.0

