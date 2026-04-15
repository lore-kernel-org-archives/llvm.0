Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376838D014
	for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286787; cv=none; b=jCZXdxnUK/LQsrQSwoFRBQME0slTv1gpadPNfUDLf7I3QhSf8kA8sBrcHj6hrffEfqiFsZ93Rq3jcpwdlw5GIap131MwtM0GfXSPtLuohb5BcJs53lLbGe4edSaoAoFyhml56aoYByd0AFSB6whdLVQjaOzGfMy6FMBoNu6BvO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286787; c=relaxed/simple;
	bh=jf/lYASugDruBo2CvozLAvQJRNcmvI/0KtRg+oBQlXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zchr5lW19kEcKNfqLRXii3LCHl23UTFsTw5b03m+U3ZpHG8wJSnmFpLrANx/8KIpbw7uI85vVp/XMlQtaq8jcgv0TnNSHFbv/scPCMONayYg2riB8fB35+F+ZrB5pUovJNoXkaXtmIDa/xwXZv/U4h4vz4RyfzENVlwjSbKn5mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YKNNLfns; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YKNNLfns"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0046078so70885055e9.1
        for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 13:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286784; x=1776891584; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWBVVAIazNyVJhptvtVZua+eaWOgIyfcbCtd+y2obXk=;
        b=YKNNLfnsH5Ta4LjH0wUiXqfb2Ow5cTlbadcUe5U1J9xlom6hfyzfaZX9KBETb/YMf4
         2mUdkBBLbl6GO2d6aQOFCbLmXfMbHAvzKKt4FD+4far70iqByHhnLYsdlAN1V3ZZu6/q
         pYOU+AA2SzNI65LFSxF/uNwDMP8gVCP0/pAoNNRwcE7H4Asbv6XcmouWFRXIpDpABHIp
         2KzV7Y+oMqqPxula/ElM/kn5xHpmrVPWO2UR6yOK0NwDDlOtR/4VJ5un9xHfTQBEckU6
         TvrAq9MIIUaEgSI0ULtPNIP1x1MjukCObFJIZIor0Zx32izw+D5qIisqMFdh4b8zvPoT
         CEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286784; x=1776891584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWBVVAIazNyVJhptvtVZua+eaWOgIyfcbCtd+y2obXk=;
        b=FDOIP3ohF2bslOmS3BB1S3QlkXQ+D05EmBg8FEBnxFzEtVrQgVa6zokaTLHxLj/R2O
         wD49jzOZEnUEebTRq55zBBdUiaSKOPSnmUDQPDXBf8PXmh2T7FBcPa+dDxLN2ky3vgFg
         cbaFxOQuAQCfqXlCg7YUbvinoDxEh5tW7nZC4TQHxRkp8Zt9Yw1QVwks8ZpZKK05fSx7
         GRexAYSy6Jeosyo77TnpT6JtgxxYDGTvbIJF0eW2IXGzHS9BYZNVnukwEBCMm3WbdDtr
         hM07YeENhh2kSH11cEEbd/hy7PpwLbnY/+WGwwOFDnKnpnJYDm0Ad0ypCiqPQN+rL3DE
         4XEA==
X-Forwarded-Encrypted: i=1; AFNElJ9ktJSlFet/OdoL0DzSn9jT8EuY3wYSR7/HR/yVSeoZbeaaq5N9hrfYs18FY9eIuT94mOuz@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ+t3AoHCjNbFJ/cprc2n2l2Z3Sdl4p1W/FQmLxuBcTNxRz0aX
	9Hds099H1AQEYWRv2BbDIczDPCnjC88eluRg6Yvjzy2eu7Q0yj6JhO/uz3Gy4+YZqU4=
X-Gm-Gg: AeBDiet73dIodvvfEPKF02VIXxv90T3DBPud8d1sHdtPCPy5pLP5Oh6vlKPgsFBXP0Y
	OKyYMXlOeEr5iu1NDtHA959iZXG74q/TA/3atBHtMAPfWElq22zqNRVz3pt8BPs++lZw6Visc+Q
	+dtGZePu8pduXEsB5dZq2UjTQd24FNUXGibjNku46CzxFkd/xD8N3fIvPYPATGY9Qv+bsNbwnKA
	Z2ddZ0VkB++V1caiXonn5yBbspCcZIieN9rHelM1NROa39X78mlFao8YodXgD4vLB9RagdOHMA0
	q2AE3fLIZj/wAvpYv6mrHGrXlzQmoQiGbiY1Iq1mqv8PlR9faJahKMBVegbVSiKC00F36F0N2+M
	k0gO1ev+h8qY5xSonK4/Kdp/2VCOCpywSpOAQCwA07PLWC8en49RuAAynSBeqYdTzV0Nd95wlgO
	9+P0tf1VT22/E=
X-Received: by 2002:a05:600c:c0da:b0:485:4bd1:4c64 with SMTP id 5b1f17b1804b1-488d68a10e2mr277440585e9.31.1776286784356;
        Wed, 15 Apr 2026 13:59:44 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c90cd7esm5413125eec.13.2026.04.15.13.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:43 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:22 -0300
Subject: [PATCH bpf-next v5 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-4-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=jf/lYASugDruBo2CvozLAvQJRNcmvI/0KtRg+oBQlXw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM34cirDbmhRm1nPaul7h/ospSnIGvJSl3eEH1VlVZwcLyto9/noFt/cTRess+j3NXHabjG9xfF
 M1J6t43xiUgc=
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
index a305d13409e4..040617c01bbb 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -164,7 +164,7 @@ endef
 
 include ../lib.mk
 
-NON_CHECK_FEAT_TARGETS := clean docs-clean
+NON_CHECK_FEAT_TARGETS := clean docs-clean emit_tests
 CHECK_FEAT := $(filter-out $(NON_CHECK_FEAT_TARGETS),$(or $(MAKECMDGOALS), "none"))
 ifneq ($(CHECK_FEAT),)
 FEATURE_USER := .selftests
@@ -719,7 +719,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.53.0

