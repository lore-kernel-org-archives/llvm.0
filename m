Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE736C0D2
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473265; cv=none; b=YeqyPYjbAts3LZkkkH85acQaJLHENopRkTFTtxrtmDSu7o+xaXx/+S8qvfOrjJ+AFZG9SxU6XDiPdNpgitEZO7ZdWvWhHkLOhPLVDeJ24seqxojwlTjRpaH/NjMJ+Ox4hcoDRwrm6auY2fzqKlflPcTHdjxfVOVJAKm5SnKbMPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473265; c=relaxed/simple;
	bh=aqXG984YlUxMtsZ+i7vquyVJaGX8IceA6DEnTDh+TX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOsvKSjofL1cqWt2Y1wSEATGgVch9WO3TOccwRYBP4JGRiSeRhlHGqCu1iAhfqdCZ7K0os5/Z9M8A/8wo5Y+OM0CZmEBIHkq/xos1aGY4B7twIXb14XWdCgnFnSOyT9kfeR4YlFczgo0LEZf2ZKCE0VrS2RDRn87APRAyoZmiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=diUL8KMJ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="diUL8KMJ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6729c6f0ca7so15613115a12.0
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473261; x=1778078061; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysP9AGtPxCAbfR+Tj7mfuITrZ+N0ZILV2wyZ0Jzr9sk=;
        b=diUL8KMJ1/aqwbjJGD/yuCd/ghU10ZLfnMj/gGYgsRUdioXr6AKSThieyazynfhr7o
         00pEiwTZdOf0lvLOWFv6Dt/tEaDZddGkj6U7piv+jkqTgytu4jeXMiXjmO8z7G+1f6+I
         gTHptdH2UUJaYNDr1o0KvZ0VNIsinq0KeOzOL0lsPqlXsu8JQCtKq/OLNGXy4vEbJyDE
         MGxWMjLc4ukjqq7hBkyHi68ht5lG35U49eo2fV8d/c2MrL10oPfXPex7iW9Gqqax/XRD
         3io7ANRIYErEwBgVN6xQVx/cJGz1ZODi3Dfr7AZCo85MROdgCZm/VDMOvdTudITWeN0b
         2l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473261; x=1778078061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ysP9AGtPxCAbfR+Tj7mfuITrZ+N0ZILV2wyZ0Jzr9sk=;
        b=fAMremgNciQiT/RGFYt17nXRXk45MDeUvM8X5UKg54ZpxTmmDRNRfVjXbkNW68WBSg
         SQIbYUgwI6QkBxH4dlEMGHz6emqIllAjwIygk1r6PohMftXQCM/gUPZcH5C+ZEycGM+g
         ukiZ3fYBIYea5KrG22scvI0pG7mv4MWXi2hQQ3lOGQyNUoldKqk9UeUFeD3fzk9S9/x4
         QXWBpwU9UttYKWaYbJQvN3sSq49OvuW5MHoIoEHUSO68OnhYrA3zR1muqnqJyjE4BjnV
         9GIrpAJG8rAGZv4lSGRH6kzXAR8UENhd2roRwCT6wuzZrOjuhUIY+JNvbdzLGSn6nY9g
         r8kw==
X-Forwarded-Encrypted: i=1; AFNElJ+liwJeGoXsccjztjCkCFY8IbtdM7OnAFtRvBPSuF+WIFRh5exa5o+twoHWUHVwhEZW/y0W@lists.linux.dev
X-Gm-Message-State: AOJu0YzNtmngDP00VWidYugl8I95459SNGC5kQbqKoYmZ1moUPzYNCNG
	f7RLcH/domytu87W2uDurm/JNZf1h3EExKrhYsNCHJ4BrxX4zWEwN+7tlFU+Ev5kH9U=
X-Gm-Gg: AeBDieu657RU4uMyuKZf8Kv7+WD1C5DEzbvxc7d27BzAHxc5FobN5gdq5jU21zBn7dV
	39PvZ8/PD6e1xTPxkoAEVjDmxxgG5qxxJlE2ao2UYTtxSaBl33p+nezRHg+xtg9EnqeH+qya34n
	79jho6KeefUEe744t/cXksHAN5aWLLZk8yT80MQBy3YWLxNikFCWaiqcW3XE5SzgUbINwpm7rHj
	GYQyp90ceGjKIzdcGLN1sNfAh0NkIqiqM/oNqusQcLP9VwApVmSB1Aa924ZqggL7W7JYu7inmkT
	Yx9XcFk1DU+itHXIZPpdkA4B7Lb9KYXPZ3Q6l2pOVK2GX8MAU7JXfgPdBCs/I3JFdA8SSg4a8QZ
	83Yo/FM9CBwywbhaWTM2fOus/30N9tVFUWvPWlbjGECAxT5FeG40mWYHBsvMc/oTGDcFMWCBEkA
	aBZjOqOgsNOqBQr5vCkZpuXTfW
X-Received: by 2002:a17:907:c50e:b0:b97:c719:14d4 with SMTP id a640c23a62f3a-bb93e64c44dmr268755366b.29.1777473260782;
        Wed, 29 Apr 2026 07:34:20 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6d87e40sm1209035e0c.12.2026.04.29.07.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:19 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:47 -0300
Subject: [PATCH bpf-next v9 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-5-c311f06b4791@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=2402;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aqXG984YlUxMtsZ+i7vquyVJaGX8IceA6DEnTDh+TX4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFgbYQ184IounnbSc2yS5rRTZVxJcGqh/hXS3g0Je6tNmN/jnaYCgSWS4Hbx4AaGX+s1ErFeyEs
 tZWsUuJcpdAo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating a
skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

$$(BPFOBJ) is intentionally kept as a normal prerequisite: a libbpf
rebuild legitimately invalidates .test.d, since libbpf header changes
can affect the headers .test.o sees. Only the skeleton headers are
moved to order-only.

Note that adding a new BPF skeleton via a modified existing local header
still works correctly: GNU make builds order-only prerequisites that do
not exist (the order-only qualifier only suppresses timestamp-driven
rebuilds, not existence-driven builds), so a brand-new .skel.h listed in
TRUNNER_BPF_SKELS is generated even when .test.d is otherwise up to date.
The modified local header invalidates .test.o through the previously
included .d content, forcing a recompile that regenerates .test.d with
the new .skel.h dependency captured by gcc -MMD.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 9a4d8bea0c18..608e6dff0392 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -726,11 +726,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\
 			    $(TRUNNER_EXTRA_HDRS)			\
+			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)		\
 			    $(TRUNNER_BPF_SKELS)			\
 			    $(TRUNNER_BPF_LSKELS)			\
 			    $(TRUNNER_BPF_LSKELS_SIGNED)		\
-			    $(TRUNNER_BPF_SKELS_LINKED)			\
-			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
+			    $(TRUNNER_BPF_SKELS_LINKED)
 
 ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))

-- 
2.54.0

