Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88CC47A0A4
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060144; cv=none; b=bJkrbhOqIjI7d59WIhFmxrSzQhRLTUC5IGw86xjV8/FNeB9myhwEe6onSNI2FiMfOLNmyY7yxguB7V4x3yLIfYWYbnryAqihpMc4aYr0k/SRBc5CHhZgIFD4IEtuNKXjSsA2cy7S0x5gfEpDr61EWsQxhmnpBzsXgdCFbxFs3zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060144; c=relaxed/simple;
	bh=6womnhNkPVIMC9BJtbyzHpcUSwPDJFVk2MnEcmHSrI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuHOjk6yoKNim9gOUp2QThNPRVmydPacyk9E0emIyOottlMLknRJINVYEI3dsqLGCsBUjCHkalQ61bOGvVzuzCkhs90wHl+UX+k/3smYAgNHVFQhIqD2D0gV5z5l7tB8czH6i466hkzfb9wRsb4ZGqiMJHNscvWRsEce3boKqUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=B5ErWlvX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="B5ErWlvX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-482f454be5bso12015875e9.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060141; x=1775664941; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BE6rCgLm4ycfO9rARPfewZKzJOvUfIcBPg9sKbASzA=;
        b=B5ErWlvX49yWIeK6+FuNOCpwqqr4DH4HPQwF/MviT6kl0++jr8Sg0fbuiw3HnCP9Dg
         4G+MVHxJWXhX0BGXtiRUH+mWARxBJNGY6kJEYgSDYzjwi4d8fEKx7NgSngeLDiVuaUmO
         OBZ0mt6zwdjSawjOAGEmpfbNHmj/rG2Sq92Oa8c93RdvWHMieaf2cFALepn4sS/fgpgP
         RVril5IO7Iz73+leVthS26Hd4udGT4urodoigAgGaiEqmgrbhkUeTd13Ouwx7Zu/OQW8
         hdrKzt9GWRC6Nti2bsCIHCX4LzF1hEd1v8SV5vGFhDqUMbmiZmig/C1L081ny4ucrLQ/
         eLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060141; x=1775664941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6BE6rCgLm4ycfO9rARPfewZKzJOvUfIcBPg9sKbASzA=;
        b=XYysadQoHsKxGVKsKZGKlxlCupHuOWp+kybJG8wQp4H0PL/yHBFgkHMvCjOc/oCOsj
         wScRR1F0y0DXr2YU7mpJ10/pu+9lx4U7QUIgUra1UqcIfkOTY8dsclRuF0XUtRUM9X6v
         QPN8YtgS/SFd00nrmixIx2YqXQFztl1GIrV6xy57cYsSsFHWs97F4Vh6BnEdhL5l7hdV
         CRR15BRjl1V55HBTBDjeslmudeVNjzXbmPV3pmnvd/MG4c4J+rpQZDFQCJiA4GYy2yud
         EuHpBZVeKfZ9ZZwq6d+FNG8f0tYPtSH52vuLaY9K49+qaCg58f44r+hQF6a6k98ruybx
         8BQw==
X-Forwarded-Encrypted: i=1; AJvYcCXH88lbKAcCGiPxaxcIo/bgT+s9iv2O7Dbgn5/TT34k1UpthdACsFoq7ZJTO9ojy9fgKmCu@lists.linux.dev
X-Gm-Message-State: AOJu0YwkzClsv46/z4parL03mU/44VrIBbhjG6+NTkNZmi9Jyaapbq3f
	H7h2bZAWFKh1OLI3YG8vo7wvB31Qpm/kITxTgyrrI14To4soNYgGVsMAdUFkP+e0peg=
X-Gm-Gg: ATEYQzz17xJMWFhSXMc4/s6NIhV5kDhz6Anr32FHpUCGSW2PBf6VSYwZYBP78GKVORt
	VW4pOG3p5v1tH4WnYSGWRel9FJmqsCcmzukU42peRxfK/Cxloki3uATQAkY2r22zFadm/zG0u8G
	ZPRyxS4ObFv7s9bVis9C73RDOhSRXXynEOJJ6iYkO0qA64Fe2nnuH4Sxvb2r62hpOiwtYLdMcZ4
	UTNJu28JzO54YssgDEivpdbHeqhTLX0rzOODHt6IAw9h8Qk+k05VidNkr8q23k7a7AuiRp5WlBY
	6aAe+ilDvggy4jjRgRwjuPBDSKI5qBrSltzuJo3DX3iLhwtZtkiT3SrKhbBa7x+RE1L4Z0KIX4u
	aCzwhm3PoqQrm3D4yx80t/LO6noS7GaKv9mlWK+gwoTKhmcEOCMOBoba9TqIOOleTYqbTiYw4/s
	LstcCgNRV5
X-Received: by 2002:a05:600c:8509:b0:483:6fe3:bb49 with SMTP id 5b1f17b1804b1-4887810ff5dmr180289275e9.0.1775060141179;
        Wed, 01 Apr 2026 09:15:41 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e73126sm238531137.4.2026.04.01.09.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:40 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:09 -0300
Subject: [PATCH 02/10] selftests/bpf: Tolerate BPF and skeleton generation
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-2-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=6534;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=6womnhNkPVIMC9BJtbyzHpcUSwPDJFVk2MnEcmHSrI4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH3ZNAn2TKD4/dRXoJ/Bm3zjfawXZ12IOscGRX2I45gtK8Q4McVeaZjj7fo0SSx/x/FUfTB2ega
 lrV+E1Nckxwk=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Some BPF programs cannot be built on distro kernels because required BTF
types or features are missing. A single failure currently aborts the
selftests/bpf build.

Make BPF object and skeleton generation best effort: emit SKIP-BPF or
SKIP-SKEL, remove failed outputs so downstream rules can detect absence,
and continue with remaining tests.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 77 ++++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index f75c4f52c028..6052bba2c157 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -470,22 +470,26 @@ $(OUTPUT)/cgroup_getset_retval_hooks.o: cgroup_getset_retval_hooks.h
 # $4 - binary name
 define CLANG_BPF_BUILD_RULE
 	$(call msg,CLNG-BPF,$4,$2)
-	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v3 -o $2
+	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v3 -o $2 || \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2)
 endef
 # Similar to CLANG_BPF_BUILD_RULE, but with disabled alu32
 define CLANG_NOALU32_BPF_BUILD_RULE
 	$(call msg,CLNG-BPF,$4,$2)
-	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v2 -o $2
+	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v2 -o $2 || \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2)
 endef
 # Similar to CLANG_BPF_BUILD_RULE, but with cpu-v4
 define CLANG_CPUV4_BPF_BUILD_RULE
 	$(call msg,CLNG-BPF,$4,$2)
-	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v4 -o $2
+	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v4 -o $2 || \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2)
 endef
 # Build BPF object using GCC
 define GCC_BPF_BUILD_RULE
 	$(call msg,GCC-BPF,$4,$2)
-	$(Q)$(BPF_GCC) $3 -DBPF_NO_PRESERVE_ACCESS_INDEX -Wno-attributes -O2 -c $1 -o $2
+	$(Q)$(BPF_GCC) $3 -DBPF_NO_PRESERVE_ACCESS_INDEX -Wno-attributes -O2 -c $1 -o $2 || \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2)
 endef
 
 SKEL_BLACKLIST := btf__% test_pinning_invalid.c test_sk_assign.c
@@ -591,32 +595,53 @@ $(TRUNNER_BPF_OBJS): $(TRUNNER_OUTPUT)/%.bpf.o:				\
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
+	$(Q)if [ ! -f $$< ]; then					\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+		exit 0;							\
+	fi;								\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $$@)' 1>&2; \
+	$$(BPFTOOL) gen object $$(<:.o=.linked1.o) $$< &&		\
+	$$(BPFTOOL) gen object $$(<:.o=.linked2.o) $$(<:.o=.linked1.o) && \
+	$$(BPFTOOL) gen object $$(<:.o=.linked3.o) $$(<:.o=.linked2.o) && \
+	diff $$(<:.o=.linked2.o) $$(<:.o=.linked3.o) &&		\
+	$$(BPFTOOL) gen skeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$@ && \
+	$$(BPFTOOL) gen subskeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$(@:.skel.h=.subskel.h) || { \
+		$$(RM) $$@ $$(@:.skel.h=.subskel.h); \
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}; \
+	rm -f $$(<:.o=.linked1.o) $$(<:.o=.linked2.o) $$(<:.o=.linked3.o)
 
 $(TRUNNER_BPF_LSKELS): %.lskel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
-	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY),$$@)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$<
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o)
-	$(Q)diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
-	$(Q)$$(BPFTOOL) gen skeleton -L $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@
-	$(Q)rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
+	$(Q)if [ ! -f $$< ]; then					\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+		exit 0;							\
+	fi;								\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $$@)' 1>&2; \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$< &&		\
+	$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o) && \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o) && \
+	diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o) &&		\
+	$$(BPFTOOL) gen skeleton -L $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@ || { \
+		$$(RM) $$@; \
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}; \
+	rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
 
 $(TRUNNER_BPF_LSKELS_SIGNED): %.lskel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
-	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY) (signed),$$@)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$<
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o)
-	$(Q)diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
-	$(Q)$$(BPFTOOL) gen skeleton $(LSKEL_SIGN) $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@
-	$(Q)rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
+	$(Q)if [ ! -f $$< ]; then					\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+		exit 0;							\
+	fi;								\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY) (signed)] $$(notdir $$@)' 1>&2; \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$< &&		\
+	$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o) && \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o) && \
+	diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o) &&		\
+	$$(BPFTOOL) gen skeleton $(LSKEL_SIGN) $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@ || { \
+		$$(RM) $$@; \
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}; \
+	rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
 
 $(LINKED_BPF_OBJS): %: $(TRUNNER_OUTPUT)/%
 

-- 
2.53.0

