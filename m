Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C334D90E
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491902; cv=none; b=caFp1Ybs9sZ68fb99ie83MUmNNzc+InkG9irpjQiQtJBOKCWF1ztgYbO4hJRDfwRCQxcPET/QdVleFUc4JPajwDVvKI6+lUJygtV1zed8Dn2ny+SYxeb0JyI0Kr6ZOhlEQnWHOSRzrfqNSO33VoWM4ZxqhCtq6ZlWEtoXyxgadU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491902; c=relaxed/simple;
	bh=UNpkyM9z2Uk+FmGgvL1GAOWInz7HiCFNDnRCqP3sEoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkRX8ZXIwmba7K4e+6OyFwTPnbK2XwpjG16+3sj1LkSiXx4fWN5zpHtk7A4Noju6xK+KeK5KSYou15ImFv2tamMXnI4wMItSSZePnad2SVLxqqEmIRMJjkhFFbI/yndeHPqoZStXVGfLqtMJi/AQpqRNO3QChu1QqAVpugZhxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DPcMbZgu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DPcMbZgu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b150559bso7890205e9.1
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491898; x=1776096698; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++yFqZU4YJL2pDC+uPFxgCL5MIK1kEP1TNHUNgeqal4=;
        b=DPcMbZgufThGwFLzoFoAxAoxZaAvKiQEwoTbiyNc/FCjUk2Goi4csLhhgIXeb24d7z
         zV2//WxvLnY3Yc4cHxjW6KfpDTCxncvieoOm0hjKy/4fQmTJ6zlyyHJIx0ci14fwprdz
         VU7uZr1r4SdYFTXIlrakGQI+9dcX2wXGojj+uKHYFFmuU2J92zPzaRscCp6XeM4J9Y8D
         RkbR3ph8EMKY3J9djnDZPmpzmHlIQ4X/EYVRWznHjwlRO8ruYZpNNfxMgqA9nAp+VGta
         eaFvufe/fMIj9TLakktVy8j8G9NDmr4B+Wp8GZC20JY2EMwdpN8lpLjhZH4Sp8C+739/
         kOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491898; x=1776096698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=++yFqZU4YJL2pDC+uPFxgCL5MIK1kEP1TNHUNgeqal4=;
        b=nRzrtseBJioZWnPGpNE6LHxTi6GPp/TAYkDvkCB2t9978qJurempZQBKcohM4Kx+Mr
         gMibH/5o80AwKvp7VVQjM0e6XuOQXLe/KJu1S198iD901ttXj14xNSZT16PhqE0rXtmy
         PCmufDtdBqkI1wmQnVq4vYguUAFJPW13gE5a2ho2mEweWN3KQwmrZw4yCuG5K/gvNwEr
         adyI/iSjcPpbVwo1H7RUm7o9B0UtUd+kV/iqeSPqZD+cS3DrrufZn+t77zM7QCGaaWYd
         oTwD9RDUUVFhR/+zCxQ1Lu+mmPvAT9B1xZMcYvZ0vGqapwLrMYJnKKjCoNKJIRKO2/gR
         WQlA==
X-Forwarded-Encrypted: i=1; AJvYcCXdEf/p/Lb26cjoj1yGcY75kxSGtp9qzm3y9YeytxB4hvoCC8QCx2oq7jerE3KNfndPK+Nd@lists.linux.dev
X-Gm-Message-State: AOJu0YypSt2tA1yrx/sOGUdgqKV/6JmfWeK/5yFfNuxcSRFniUSF4mN9
	Y6Sm09faYNyAc2qMXz99jXybKScGOBNSmK2VYnMnRg2v1QaqXktYnsyzFb9V5sCLTS4=
X-Gm-Gg: AeBDiesFti4ZVorklFgk04tv4kWntSR44NYB8hsqFok00uvnGxZGsyjcFAF4RJp5r+q
	gBOSOUEaMDCVcW16iRxmVbea0vEmfKU+0a34TmDpfdLf0fy+i45B1O5OWqKd4WD6j/aMRhUAdAa
	YMN9qv2dcslZsrYgGtvxkKd/UKBoZ/+vcKsI7L/gl89MK3QRMLg7fKnEo/XnA1p9iNXy/8EMuGe
	jec32K9OWNMUd7QTJw/IoN8tx5oaqKTj2rMVXGcF6pyQg9oMvSEAxWAM7EuMrGF5y5chjzzFJza
	5gobvUMmnrb+MWNB+8DlTTCIoYcLTRPL8+JMhxSGRtz6hnliK2POgUehJ+hwTTQUIoYwKCkRFAU
	NCZUyY5tMtDpCBNXetYMBcKjvFI2CHHZzuAr60XOXyp+a4JqvtsjUWt2vSwGU7sgWITFXWcGhso
	RSIQK4fFRarPga
X-Received: by 2002:a05:600c:4593:b0:485:33ad:3c9f with SMTP id 5b1f17b1804b1-488997de1c6mr212429245e9.25.1775491898536;
        Mon, 06 Apr 2026 09:11:38 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb84c289sm13683068241.4.2026.04.06.09.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:36 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:24 -0300
Subject: [PATCH v3 02/11] selftests/bpf: Route test_kmods through the
 kselftest module flow
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-2-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=2698;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=UNpkyM9z2Uk+FmGgvL1GAOWInz7HiCFNDnRCqP3sEoI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKtb85zZMJ0Of8jLIIs2/ZtZmDnk1/VJC0cgPUaU0InvJi68iydff5f4QHUlKyEl3s7u80ccp47
 wmLGfUHqI0gc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Now that test_kmods/Makefile correctly handles O=, KBUILD_OUTPUT, and
missing kernel directories, wire it into lib.mk's module build
infrastructure via TEST_GEN_MODS_DIR.

Replace the bespoke pattern rule with a gen_mods_dir target that adds
VMLINUX_BTF and RESOLVE_BTFIDS as prerequisites, letting lib.mk drive
the actual build and clean lifecycle. Make TEST_KMOD_TARGETS order-only
dependents of gen_mods_dir and make the .ko copy step resilient so
that a missing module results in a SKIP rather than an error.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index f75c4f52c028..715f282193c8 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -123,6 +123,7 @@ TEST_PROGS_EXTENDED := \
 TEST_KMODS := bpf_testmod.ko bpf_test_no_cfi.ko bpf_test_modorder_x.ko \
 	bpf_test_modorder_y.ko bpf_test_rqspinlock.ko
 TEST_KMOD_TARGETS = $(addprefix $(OUTPUT)/,$(TEST_KMODS))
+TEST_GEN_MODS_DIR := test_kmods
 
 # Compile but not part of 'make run_tests'
 TEST_GEN_PROGS_EXTENDED = \
@@ -152,7 +153,6 @@ override define CLEAN
 	$(Q)$(RM) -r $(TEST_GEN_FILES)
 	$(Q)$(RM) -r $(TEST_KMODS)
 	$(Q)$(RM) -r $(EXTRA_CLEAN)
-	$(Q)$(MAKE) -C test_kmods clean
 	$(Q)$(MAKE) docs-clean
 endef
 
@@ -277,19 +277,15 @@ $(OUTPUT)/sign-file: ../../../../scripts/sign-file.c
 		  $< -o $@ \
 		  $(shell $(PKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
 
-# This should really be a grouped target, but make versions before 4.3 don't
-# support that for regular rules. However, pattern matching rules are implicitly
-# treated as grouped even with older versions of make, so as a workaround, the
-# subst() turns the rule into a pattern matching rule
-$(addprefix test_kmods/,$(subst .ko,%ko,$(TEST_KMODS))): $(VMLINUX_BTF) $(RESOLVE_BTFIDS) $(wildcard test_kmods/Makefile test_kmods/*.[ch])
-	$(Q)$(RM) test_kmods/*.ko test_kmods/*.mod.o # force re-compilation
-	$(Q)$(MAKE) $(submake_extras) -C test_kmods	\
-		RESOLVE_BTFIDS=$(RESOLVE_BTFIDS)	\
-		EXTRA_CFLAGS='' EXTRA_LDFLAGS=''
-
-$(TEST_KMOD_TARGETS): $(addprefix test_kmods/,$(TEST_KMODS))
+gen_mods_dir: $(VMLINUX_BTF) $(RESOLVE_BTFIDS)
+
+$(TEST_KMOD_TARGETS): | gen_mods_dir
 	$(call msg,MOD,,$@)
-	$(Q)cp test_kmods/$(@F) $@
+	$(Q)if [ -f test_kmods/$(@F) ]; then \
+		cp test_kmods/$(@F) $@; \
+	else \
+		printf '  %-8s %s\n' SKIP $(@F) 1>&2; \
+	fi
 
 
 DEFAULT_BPFTOOL := $(HOST_SCRATCH_DIR)/sbin/bpftool

-- 
2.53.0

