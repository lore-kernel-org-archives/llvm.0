Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319E399023
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 23:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419936; cv=none; b=ss+lU0U3/haG+E/9M4YSygaFap4fgMiAwswmutf/BD5j9/ZjDwXKG2A60fq+Ct/7hpbmIn/46EWOipv3Xc23f1CWo78kkTTV6+Y7Lds4CcWDdXta2LlLkxXhGu04j/h3zED+5kD1QVfsHq/ekMLz8avyg52xH2qggq23Vaw2pN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419936; c=relaxed/simple;
	bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gI8ymzeanMAXugoLNps4PlOFKYEfJ0i/gAZYmLynEg6n5sq8VlmFBE8zNEHWLIWCiPLL+37REAIstpesWT5zkjQFn0FWdk7tyTsuFX+DX+HMJrVPJv6PNGdQzSjohIWyFLMZJKg549Iedzw3C3ZCOYMVyVpREJK7JF8vdDCMri4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KAiawP1w; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KAiawP1w"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso103957665e9.2
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 16:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419933; x=1778024733; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=KAiawP1w+P5z63rQFNlhgmhQHc/djqpLJ3fNFJ2OtMIBNlV17jMZfzQGAWB9mzbIIV
         NoP7q5HPkUNxjThl8UB89XNgsIyqQnoezGlCAu46cnK8my9QQ8oKYJ/v9/dt7M0gZO9S
         iuZZ/fUQhSh4eiJWteNR2SdDKTS2DFRDN0prFc4hvpjy7VaS4e3HmxsTUAZ4lwWocXGV
         N/pbdwT1RWRuQXh6BMEOkLEfA7v4I29bwZwx0+N9d5xHmHz1/kv55tm4V5WGr37Ni93R
         sSmP0ZxqDgbFE6WlV6YdpLrp0TXkY1yRdR16n5udL5roN+5Xn9oG7ZMtD2wEySVEBmBN
         Z11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419933; x=1778024733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=b/FVLKNM0WNF8H+ePGwyiGyV6AXMEHkHObNIyc+aHY/GU4enHSbBAaYqORYfbGj9fF
         XjswEUPONZwkdtOYf/x4V1maRmGdsHuAmJ9MCx4H3WZUB/076VEHfANXDjBR/dgeBQaP
         dezh8ig98o55CWy6yLh87isatusH0+QXflfAxNtonhWwpw/xzxOX3l85z6ylzUCaEO8a
         m3lraDGZk31Ftvmc5srw+g+V8vvv/54PtYoYUuTUTj8sMAa0IrrhNuQBXyCYrywQxF2Q
         7Ra150sTsmmTydiffMOcfFNFcXklxTrlsKUW+38x4p4AvsNI7/br6Oq8MhN7UYXnqOcn
         zLUg==
X-Forwarded-Encrypted: i=1; AFNElJ/nR2iH/vlYx/JWePKk1cQNgA6TLUHQQX7zb/e7ZWPKxT9425gf8OzcYjHNaFxL/I3/qbc2@lists.linux.dev
X-Gm-Message-State: AOJu0YxAmFFb0q/Pp2FsAskOUz1bJeSUpAxcuaoZJvk0N7bu+LwsG9TJ
	Id8uc2G28wl8cmevhJ9AV+tsFPMBse0WnqsXNm6aSiFuPYkAssGq2td9occSMsG1Mu1Zoc1I38m
	uXGmpV/w=
X-Gm-Gg: AeBDiesAmw94/AK4SNEy4ke8Na8EQ8+Qo3slzYiL9XBJ0DyXYQ2Ol5RVow/awCxkGR9
	oLa71dKPva3Kigsdsxnul5bTufc5W0WeysZZlcnCorCOYi5nEOYI7OSWuXma11xjaaDBxNgW6MD
	2SviBBOLEN8MqBrNCvqPf1YvcPWvxJIYDs/SrrbYY3oGXpLtxyn9KiZzvmJpQ6WNI9A8AfcB+Av
	/T9U4EJ41jJV7lWOWQE0XaIO9/WJnck7BHXDUXsPqSWTRNvX5fDrTQcUZIHmRM4NEgJdfPs2QOB
	4lLHfpfiw4gfKZusAfuixV5ik5OHCOCV7cPqtsBY1Oqrj1iEbpNLgTU0ayZI8Z4LLBlmjhP65Gr
	g1NcD5kHWWI+5xisIQqwH5NaXLMGQfcBd/rTK2VLL+3HRk09NFaKvXVqCZKKFUvgppb6iSQsVm8
	8envb+QswY27oqQx4xiNzFQ3dc
X-Received: by 2002:a05:600c:4713:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48a77aed429mr80989345e9.12.1777419933461;
        Tue, 28 Apr 2026 16:45:33 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-629843365e9sm214210137.7.2026.04.28.16.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:32 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:05 -0300
Subject: [PATCH bpf-next v8 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-4-bf02cf97dbcb@suse.com>
References: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
In-Reply-To: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCxcEN5y899hg/gBfdfhM/iJ0taCQUUzGVXJ6akhKBwDcjQYo5+ftQKPAvExHbXI1hqz3Rykm14
 5VkDKVo5YMA8=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

emit_tests is used while installing selftests to generate the kselftest
list. Pulling in .d files for this goal can trigger BPF rebuild rules and
mix build output into list generation.

Skip dependency file inclusion for emit_tests, like clean goals, so list
generation stays side-effect free. Also add emit_tests to
NON_CHECK_FEAT_TARGETS so that feature detection is skipped; without this,
Makefile.feature's $(info) output leaks into stdout and corrupts the test
list captured by the top-level selftests Makefile.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index b104c687dcf0..9a4d8bea0c18 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -170,7 +170,7 @@ endef
 
 include ../lib.mk
 
-NON_CHECK_FEAT_TARGETS := clean docs-clean
+NON_CHECK_FEAT_TARGETS := clean docs-clean emit_tests
 CHECK_FEAT := $(filter-out $(NON_CHECK_FEAT_TARGETS),$(or $(MAKECMDGOALS), "none"))
 ifneq ($(CHECK_FEAT),)
 FEATURE_USER := .selftests
@@ -732,7 +732,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.54.0

