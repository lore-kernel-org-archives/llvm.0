Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2243E315E
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405416; cv=none; b=TfbzoVk9HtvjXXcKGH4XQhlbwz3vph1Z7CtxA4wZAViuoAnsJTHs61n7TWGtOLmdaCNksFibmg0i1cGNUabIRgMUQdW6dM/iObQcKam1BrAN/ECl9x+GBL0zwYOZ/Scf2PFBZbYKXD3TvHZntQNfjgW9m+RsmLJELH+sAvgLjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405416; c=relaxed/simple;
	bh=KQMQ4HA7sxO7BUSzHCnxywkdpfJKSWuXs/B8rKOPhnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeKe5UmRBQUheyx1D+cAfYRQVtbKhUqfEYcL9B4pEjiz0V+u3e21Y+TTb64VdcF1+LxeqYmvwsRPcUReFEO5+KU62rYKqi9O5mTniouHt1IwAPxxoTyZKwygdPHuFoHX+2BT/Inv1K5PIfB7XDpA3uCxKNMxnkrvAvYkLStOBTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KE6aQaG7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KE6aQaG7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-beb7f26ed62so307156166b.0
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405413; x=1781010213; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22zLe9Ow+Y8QfsqqgbxzwNbQJ3fAGWrDqmjGgu/Chr0=;
        b=KE6aQaG7sIHoty2pOHraAi8AF+FjjRX/O9g7wRN1O5SmZCYf5QnXsrW3ls0wAudZEm
         HzF47C+fpg1a4zw0aQOCdJzzDiNQmH/QerBM7mwj/0q/XdtWaX+5uzFK2uiAMEfrwvlk
         RrWbB/MiptNZgcoOCmfZyafNver3pj6LtJzc7dUdOT0IrStVpt2fh16RJDRj8keJ/rqS
         l0E8XNwGFjrWKrPBhLdX0ZNhTk9xMXK1aETX2sezurl55GOBtBQwJWmyquX9NmnFdXVT
         JEh/pb2qxSCJC49QSSRdnjacPokDFm17Ogs4D0Hj9NS+4Po6paV+erXhGML9UVOhHA/v
         HPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405413; x=1781010213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=22zLe9Ow+Y8QfsqqgbxzwNbQJ3fAGWrDqmjGgu/Chr0=;
        b=XRw1+YRc+EueQ8ob2vS2xhmDG41kYjncF8xebacjHtb9jbJAsVjPo8Y6Q+Rbxiuony
         kkN+QUFN3taGV9FSoOWfxKIpoBf0Ur+u4fpWvYEBo1f3HpwymGHQXy1CcLzR1A9CYZI4
         vty+Z+gS1J0llNNE9TmVGSIYUhTf2fvGSMJ56Kat4x1MpXqby568wSmifZJ+NMrjEXPN
         vd/dJt2dtRiITcnbLt87OGb5Ghf5ifQNCocC29K9Ig75YqaMnIWFfh2PHnN4ePIsIwJs
         92mhrzN9wKs4whst6lTsYBuRbE+BBoX9LjzMyy15tD/ajddr98Msr6KqgKHWGxV9+Dk7
         kIsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nU5S9hna/mhMb1lom0O8fyUDkfhTc4jXaAPMLSp84nURDoMCK4B+Z5CZBOsvwuvR4OOst@lists.linux.dev
X-Gm-Message-State: AOJu0YwiRBSQ19/YySBHMeKtz1dvzfejyRfP6OoQlXY21i4TB/7RPoM+
	Y9hYjmIcw7Go43/6rInKsU668iwZqqlf6Gxqi8MsIgdE9KKkgCdEHU/HnsstFd19z10=
X-Gm-Gg: Acq92OHPdKfUL9eGFbYMMEzWq+fUzOprBN2I1/18gBl+kFe7gnuYWZU2SLyKACboGAR
	dKUooYCa4+INzlGc4jRBCRdcYgfG0SpqyEcSWpJjwnGjlqnF5J7r4lMGtXAzT75+mjJt1xgUof2
	OcAB0s+XiL3bXihjTiIvYni7HGiB5zXTUXZ0SpAVsB1pQNnvJBQJpYaOwreT7oFUCHxR1AwPcJH
	AQSRbyHX3iyXoG3EsB6hIthCY+yd9a2GX3YB3E+N+M+LY1k4oKxmG7bh1U2a0Wb8fyL6n+PQsMa
	ItsDTP7HAYymISaivV2nQ/EMk/8oglztpKs1ZT8ozxkYoJw6cAW2QZwxyhNNkRU81kLXfDFqmZd
	O2TNCj2DIt4LvjinCxARs3dEe2Tjeaj5EdXQbBpNyTbWt6olJUumSMdkHlUxOtYswY5eVFmOgAa
	iFNIIa4W+TsAAGk4Cmeteo4xri1zsg7m9y
X-Received: by 2002:a17:907:72cf:b0:bd8:f776:6980 with SMTP id a640c23a62f3a-beab0cd17acmr906172966b.10.1780405413366;
        Tue, 02 Jun 2026 06:03:33 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bef0874a308sm121575866b.19.2026.06.02.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:32 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:53 -0300
Subject: [PATCH bpf-next RESEND v12 04/11] selftests/bpf: Avoid rebuilds
 when running emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-4-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=KQMQ4HA7sxO7BUSzHCnxywkdpfJKSWuXs/B8rKOPhnI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJVp2o2ipGMRt38bfAm/cSRpwXsGhnDw6nwPiUVeigzN4J/zhtbOkN4oCrGluohl4eAH++dD3Uw
 ZUULOQR40ZAo=
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
index dc1f4a4a3582..49f6a5503e84 100644
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

