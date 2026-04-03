Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0FB3C8718
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228356; cv=none; b=HTclaOoL6g0K27rJ/v69eGZgAVkwXcsrnYnncx31/uaOEDYwAvmcKHz8v9mo/GQmQu1Bi6o+f9YR6/LCntXPaLYAT47hGlbxwHDzlyo9jwAjf2B2PxdLDr1ZGa3dVf9wglStm9qtyvP7lA53ZPiofrE0niONrU7T6JmuFIz0A9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228356; c=relaxed/simple;
	bh=f6HIgkgW0zS+/mWkMw/sxAs0VSARPuwtTbc+sdvuugA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTpsMfKfmkNnpRF7KUD8LaDLjKEYXbmZByq4lyJHYwe9qnmdPvFrOrdMptTfZInk6Lsshrr08Bcl3qIFOLdlCE333OpsljV9oELY2OrI/c878oRnOXDTYDQfvWTeISlo3ISDIElndRytabHEGeQGcB8KESJGVuiAnmoxpHwECvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PGQic9Tv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PGQic9Tv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso27262105e9.1
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228352; x=1775833152; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+1wdXb+bRQTa0pyI8/7iwKfOf3F7IiDnmsocIg8xPk=;
        b=PGQic9TvXPcg426yVHhpydt785gukQEu5QsMaZOWDjye+9OpKh2YgYj+fr+yJDhRlu
         EDStGmK4JrFksi1z3SqO1Abv9LfFJ6UwsmizGWSPiLldhoAx1TBsNg1j9fKV220kEki8
         zdF1BKIPBblZw2JPMlXcQoJy8D42yjsORZ65eHQDDIPp54o8oPVEWIs9inTshhvvt/hl
         1C6Fyz8Ov12X9RjrURdWw8oynsQ4uTFiB/L6TNT/aMV6En2m72oVhKvIOZBdpfmUMz6x
         Krv8s2I9Z/mLc6FyPSxRa8iUcitr72fX/T1ofN4D0TlUV+hQdJOx7lmhalr4qMvC20BJ
         q30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228352; x=1775833152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+1wdXb+bRQTa0pyI8/7iwKfOf3F7IiDnmsocIg8xPk=;
        b=FxAKvon4yCpxVO/rV2R9ch3Du6amCvCOziJit8R8wbwKR5wxdyyDc3+1rGdTI0bwUV
         GPRFOhEqqhre5eFwUDamaDlcyTdir5EqrKJ7sZIqnBL098FMnKRJNmqyzKV8hsvA+50q
         gHcgCeY4c7LR4xJ+ZEAvJwCOHedJMpQmKRKVH5RccxxfIwyd7lEEaKOhYdkRcZM77PVL
         qdSUmY9hR62/M4h+lxAutnwaWss6IJ0i7SDK/X8IIIXuXMwL8O66tr/H90c78XZjzZC5
         y56MifD55HVZCbcbUikMdHgrLVwIlbC9lrEYo+fQDN2/pTET9lAmridEQ/ZevYl5A6KL
         cTRA==
X-Forwarded-Encrypted: i=1; AJvYcCVw0RbHAV8C2uxL4tXmK+E1pCHuVhq+zYg4/ASw6JM/UsD4Y9lYB1ohlo21ycAuSOBBBl4d@lists.linux.dev
X-Gm-Message-State: AOJu0Yw56BY95Djpevvjb87On6MnxtJcelEGbifqbGyYxZxUKyEh4A9k
	rDsh64VLjDDYGHgvHnfGIq42cK4i4Iz9VTThtuI9IGiOjGyXAiNQJJlsfLbWJA2XuDM=
X-Gm-Gg: ATEYQzxUc3hVRIDYLZ8mqSsWCCHpcudH5U5VJHr9tavjuck3DuSx4OaqNI0vVDaELIC
	B2ptE7qLEJ+GwSc7P4gKT1p0PykwPR9PaGJ/WmNKsNQjUzsss4SyQ5qygJXpV0SGpecs6Kr/A98
	qOkrfB/mjeUgkuWgsP6exySdaw98p8NLKIqSgcnFV0B1NzguDH+PwvtCNZ0fJPyEY0novmRIJ+u
	bHtJqSVGrzx1PSl6rX6RaZl8brcrEO9lj8LKkIxWq8WrVBRPyS7muheuuyOfuAjljDo0RNtX6Fr
	KutDFzCHYNIiUvGhXg0GYF3Iuh7JH67XJuvyWD2Di6j7TTnkLmOLYkGlFsJDnWHeiLvKyWqD/xT
	jGCasiKmCjCgw+Tue2Fw5M+vb+8z1IdB/ujLvO3uVJe9t0eBukHqoTGVIArTgTTxibyP360JWgt
	Yi8YcmP2vf
X-Received: by 2002:a05:600c:c167:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-488997810bcmr56269185e9.14.1775228352171;
        Fri, 03 Apr 2026 07:59:12 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1d1edsm7553018137.1.2026.04.03.07.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:11 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:54 -0300
Subject: [PATCH v2 01/10] selftests/bpf: Fall back to distro build
 directory for test_kmods
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-1-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1670;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=f6HIgkgW0zS+/mWkMw/sxAs0VSARPuwtTbc+sdvuugA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOTB/yRzeCjFiieMiNd6HsKGUrnkmjlQqa03nLaUBftbDGnMuhh46RMMM7pNW3UfiOFFyJeSPD+
 yb93iZcWxfwI=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When building against a distribution kernel there may be no in-tree build
directory. Prefer explicit O= first, then KBUILD_OUTPUT from the
environment, then an in-tree source tree if Module.symvers is present,
and finally /lib/modules/$(uname -r)/build.

Also skip test_kmods all/clean when the selected KDIR does not exist, so
selftests clean/install flows do not fail on systems without that host
module build directory.

Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_kmods/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..a5216815d989 100644
--- a/tools/testing/selftests/bpf/test_kmods/Makefile
+++ b/tools/testing/selftests/bpf/test_kmods/Makefile
@@ -1,5 +1,6 @@
 TEST_KMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= $(abspath $(TEST_KMOD_DIR)/../../../../..)
+SRCTREE_KDIR := $(abspath $(TEST_KMOD_DIR)/../../../../..)
+KDIR ?= $(if $(O),$(O),$(if $(KBUILD_OUTPUT),$(KBUILD_OUTPUT),$(if $(wildcard $(SRCTREE_KDIR)/Module.symvers),$(SRCTREE_KDIR),/lib/modules/$(shell uname -r)/build)))
 
 ifeq ($(V),1)
 Q =
@@ -14,8 +15,13 @@ $(foreach m,$(MODULES),$(eval obj-m += $(m:.ko=.o)))
 
 CFLAGS_bpf_testmod.o = -I$(src)
 
+# Ensure KDIR exists, otherwise skip module build and clean.
 all:
+ifneq ("$(wildcard $(KDIR))", "")
 	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) modules
+endif
 
 clean:
+ifneq ("$(wildcard $(KDIR))", "")
 	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+endif

-- 
2.53.0

