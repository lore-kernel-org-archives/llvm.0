Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B449388E42
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491911; cv=none; b=jLU0rv9u2wIlK8W7/jNiqPNnvtBhZ6vXpIuO0Q+hbgGN1AFrypc0KUJo70KBfQ6P+cb7ji1lapP8z/r3pPM9QHHyG7ibRG6ksZY9FNIGS/821g+GtVb9/73uynQ/MmTX8gVSP2E/wj2iIV2xFAln3gvWjzNvzMcPykkKsCjpwr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491911; c=relaxed/simple;
	bh=CjKnZSdKJcfduUYX6LZCm3V+sJ3BGLQkmRsI6DpGINI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+ITCzQ9Cv4fdsf6YbRmBLWeCeGuLE6oApNqoL+7VN62R0t1PVLOEu71BrGNsOvcrXRFsusInKQsesh3eSya5vn/OeuLeYKntLIgJrEejswvh5xoMMVtyjUNbqaZCiRHJp9X3nVfKwjTgeKf/JCFvSBYdbu4Zf7kad88RUHVbvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qd5Cbn9X; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qd5Cbn9X"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so2125055e9.0
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491909; x=1776096709; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWko0FMRajGjPHliy0mDmBxqRPZFl6s8N5nN4RhE8NE=;
        b=Qd5Cbn9XbJ4ZiKF6Yxl8Lz7zT1HzZP3JJcmNzXOeiggJkh8+5QPygyzrbydAUI3t0i
         gehjI+3CSXrf0BTIfytmp9pO1d16RThsSYzptJQO7ei7mgPVhLYO5mxHyaVYfd38mq/+
         ZblOVntwk9y07QsqCSDMygh9b3UCWQ0vqcEPNkgTPJarDm4nhasxaDl4J1+mJh2BDpAe
         DjPpGZ8RHeemnH0m1uIKAzOv09LnmFwjhr2Z4AYcNnampTdbFs+oXM4GU8hyRnkv0q7e
         UZDlTXEdvKP1FhjautrheHfqnsJAxIOYeEGrVMZctY7Nd7UsWWD+Rg69yPBfRCUBPYHV
         EL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491909; x=1776096709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WWko0FMRajGjPHliy0mDmBxqRPZFl6s8N5nN4RhE8NE=;
        b=TQ+0LxF8ETtOssxx6chlm5lsD92asFbvPip6zZMfgtSXpMkFkEfTHxWcL26HwWF4zR
         swb0As3YY4/cNDxcB9HtiEOlSHjVGEYMuA+EqBOzw5e9i7a2WL3JvqYYKy7UtKH9FLIm
         h3uSNYjXRHXPjYmdMeCV+o1gKgVQhzxLTdLuiuam9sUcA9ONcdI062fGhQ+UJJrEgEky
         acWqLV+YLjcb/46tfeghHGpK4VfQ2s8g4s/VoXmrtMQwtkDLRO76ZZ8blHKI/q1nupQ7
         q0bfbo+GdXHSHNPHBtxewY9dFX7kAtDzIm6n6OnmQEmCZ2i3nSLZSt5CwJ0h6teAHaPB
         tUNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt87LakcDP/lrlfXIbej+3w0CCbYVfFjOqLQdQljQx/v0Hi1sHxLLBHMMa/OHEFjO8LK4s@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn9hhxrmw+cXNrWTRh4Ggojnt6EO9c0rZ+8p1/pdhc2VAjjtK0
	C5twzbUux/2wf06xLiGkgJn1R3nOmKNkmQYPMHSFAfhjqsbn0qbMJ9SgczmrsXFhpC9h7eG2wf9
	jXmZh
X-Gm-Gg: AeBDieuvVHD3VCCQk2lSzXDSkHCLQXiNHQ3i+ijzwGhzlCTRBRE+lMq5u9M8nRgDmhw
	pHIxNzyHRWeSvb1eJgzcA+zV1k8OPqBAhOaV3BAKlYjNqXGs3006JTqmiFoFOM944RUY9ZdauIx
	sjqJdahlOoNeo6Umd0rBIE0kRbc4/fyJNOlVYE2Ekx51P3GpkI/+LnobHHMD19LsTyvnVv3aMvk
	ygYc7vxuzXPb+etu2N6jCdYzE+eMB7DEaLnFLkRhSSXD6rUaW05rNoAROtGd7c3ee8l+vzk4eEy
	t4WcplEXdKc/ZssQ7Itum14t9Xc7sdDYJJnPAyE2v/9tugS3is8mqVmZiGYNSQKASm+xVAovxO2
	ZRGWtmTer1nS9T4T6wgMeMhs9iMkukRud9VrfMAWDY1+E/LHNut9h0mSmQwmOEIGlnnkGr3lMps
	AzfIpqvIsIA9NwgU75iJXjkGE=
X-Received: by 2002:a05:600c:3f0a:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-488996a34c9mr202513625e9.6.1775491908554;
        Mon, 06 Apr 2026 09:11:48 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9baff553sm16516729e0c.8.2026.04.06.09.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:47 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:27 -0300
Subject: [PATCH v3 05/11] selftests/bpf: Make skeleton headers order-only
 prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-5-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=1610;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=CjKnZSdKJcfduUYX6LZCm3V+sJ3BGLQkmRsI6DpGINI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAQAgIyVLzDZaCEFyIqMBpX3GCLmGh7KvDLYvFRAtLIudDVGKzvopSefPFQPqMKQ7a+ST5xfldW
 Wg/cnFXSXfg8=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating
a skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 3e4c726870a1..f4d6c5ed7b3a 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -693,11 +693,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
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
2.53.0

