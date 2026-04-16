Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409DB3B634E
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342111; cv=none; b=o6KrkdPE0l34vv3hTXyzUM7YzxpuXhRX0Yfm5kZCuSzoSYmlUDvlMuw0lDQAmjyXEBRB5Rn2WOn7MZ1rbzfC61zuh/NIrCh+lkskBqeOec9dgrLI9+ORSTQvqzU19iT3SGz7O8pXOIEkz8AFoWiuvQOhfEdFu6GEKFnW6o4ZVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342111; c=relaxed/simple;
	bh=LGjyQ4DJZImIa+l6d/sVh7HyuyYJEGS3b/TTHgcThlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpVcwpiug3uIaz2WJAkA3t/6LSDXr83NvgXRubWUpjgg/rByspDSB1Q7n1CMMWxsSt4nndjprlus9/QBjr5/49C8/lkvIc6GEeid5wkqjhnFqVLj7rpweUtcrKXGCNYKvK30vdYsnrBB97MwUzsq5PSPKfJECXswHn2S1tzeKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FzkFJSq3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FzkFJSq3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488d2079582so74011475e9.2
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342109; x=1776946909; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+TFkSx0/A90udZGFwEtC3VdLgE/56vsioCu8yOMo9s=;
        b=FzkFJSq3rCRaECw2pZ8Ew3USY/T5Ig47X0uCeX+rRKth7huAzYHkxX2GHDasNOwGyn
         8B4Z/1+tl6D89lcG9Zrgsl2+0SOALLllUJqpeAOkK0x6qThIqwq6oEyqvW47aQpzgnG7
         Y3keDCgtsH/YNs6fK27BdVc7Bs00FJlXmROVDL1YIewMy8+CndniMczmTppZD9XF1Vw2
         Zgo28sMmSlw/EJrkXc5ciY8jD83BDh4UJBrSEoRBKhgdZ26hxZ1FIw9yalMtImaSaX5q
         lqG9DxKEtiuDBKvtLhQ8bWGKme2UH/tLgmZTNtlUjUEO2bY4Tn7k+NXJPKVUKxQZv73G
         J8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342109; x=1776946909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+TFkSx0/A90udZGFwEtC3VdLgE/56vsioCu8yOMo9s=;
        b=blFxnkUUF6QNoJ9GHAeaWgw1RSTbfkdvp2z4Z0scSC5kbWC6xCpvG3lYXQbomCsBG3
         S0A316K3vSj1pS7lvnWpIsfLDks/NooY7tI6Xo9FzPhqQWSRXgwZ9tnpb29s21FZzYHp
         D+77FRdOc0omNgzCDliGFIvPi6GxQgjSaYAjvUkW5hwDUSdgNAtqYOyqkWUR3xwlPVqI
         vS9CbRsXri/q5/z2MWfJeIsjv1ov0RpJSQtKOCevtHTCCJ1yg0Fp79Cbw5yZsh56yH2F
         iEK44lflC1v80fHZrTENUk4ccfUuvoggu6o9fTWslG13Ud2UkLQva2q+/xWVt9JPHjcu
         /dwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qowkVxwQryw6aqOT3wUpme6x4km+dRQ6N1vIKwQeo3kqFPwMG/HZ8Os0Y82LdOIei66RA@lists.linux.dev
X-Gm-Message-State: AOJu0YzulwSDxu2DAdCX87u15pxUFTwb82fukj0y0dLaC6wYUlTTW6AT
	zzCD0OzgiLAvWPR1gHWz/FnO0bDv4yfMTDE3lquqGdUIuYyNBVeWXEVMrZJOtxs3L3U=
X-Gm-Gg: AeBDieul8NDXq1vrTdxypP9APwsZ7zAhyPjTSRuomB+u21kgsU4m6Kz/GA0XC+CQj8a
	pduYY5rQ4x2KQUpc2zZhLuN9uBIZCQCpfcoCEwoxfHIFDIsqjlpqUU+bvz2/XxuG3JLBMgn5dzA
	WMRWOn11o1f/C7zMcNjcohYl22vnHfLnQ3kw+2XrjQL41ai2mjbfdFI5vsfEEFVkn27BL/gwH9c
	A+4sCZHmZFEijvg47HGFiGI39dQnRjuoYuF6YLhN4jnFyr+/xEBJGJxVWAzaAefRTQIe+YctVOZ
	Ch/o1Qi+Oa6OF6gysTMa0WDNIOrw1JRZyR6KeY6Vz5SUkJEIHkUQhqYATVwwVYyOcH3dc7n9Nmy
	auboKFtSMpc0DgrGmjFyCx+y/i1rfuovSDg/TqHsJR/HcWG8J8mm3j3o7xPDmLdTlgcYQSBMGOW
	HtRZdev5txnbE=
X-Received: by 2002:a05:600c:608e:b0:488:8185:e672 with SMTP id 5b1f17b1804b1-488d688d2fbmr359059085e9.30.1776342108536;
        Thu, 16 Apr 2026 05:21:48 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8fa5efb6sm7313415eec.28.2026.04.16.05.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:21:47 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:21 -0300
Subject: [PATCH bpf-next v6 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-4-7efeab504af1@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=LGjyQ4DJZImIa+l6d/sVh7HyuyYJEGS3b/TTHgcThlA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDuUZlqeRiwM48yeqBaWgbQshRq/5+n9C2ohjmUxqNsIOut0CKCIU7ha8+GX4rUyfDTrcqgg3UW
 dPZDs0PFE1gA=
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
index b23703f2cf89..7d1e5d6c30ec 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -164,7 +164,7 @@ endef
 
 include ../lib.mk
 
-NON_CHECK_FEAT_TARGETS := clean docs-clean
+NON_CHECK_FEAT_TARGETS := clean docs-clean emit_tests
 CHECK_FEAT := $(filter-out $(NON_CHECK_FEAT_TARGETS),$(or $(MAKECMDGOALS), "none"))
 ifneq ($(CHECK_FEAT),)
 FEATURE_USER := .selftests
@@ -723,7 +723,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.53.0

