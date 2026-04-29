Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44532364E85
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473260; cv=none; b=VgtZGfowlodhOiy3hV75HLt5NsAKF+0KrC3CMma37a2D2z3u3MuxCvekFAteK76PfJws0fHFeOSWZ2p6KXwJMkVkYYX6/eSWGYEUtIUo5q3Z5IMZyNRqQkgvRnqbcHwNyOAPN39rIDL/6mb4cjCx585+EgAdXm6Ae7blK7w0Fds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473260; c=relaxed/simple;
	bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DONjYxNphSzev7jVeGBDgPpp08+79vsai4NqMzr0iypaiSUl+IJkBaCXLZW4nEjJvo9bjKtfSRKJdxkRy/K/iMWsAEBoIa/PMEAlyADeaIsSMJfUxmZORZngLLjPGRL+Yfp0hwfrLoVgWCbfRi++KSbuBorS6e6rZyzbEqyinak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NIclPcdn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NIclPcdn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso129231595e9.1
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 07:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473258; x=1778078058; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=NIclPcdnHMCPRhHZauRRPC0hLctsKOqssovLceQ1GSGDWVXoK0riqk097dVmrVa/3z
         Bs2MUwOdc9YF/sAAuqa/ZBlVi47EvsrC4LtbPyZVk3ARkJ62bNr6cxybCiewZoDYcGih
         UP7VhbFRgfm5Pepi4hsT+PDKj4Gf8WFCbNQao495Z1xZ8vqTa+QHnuRdKOg0reWTfu/Q
         pNuSx4GT0yLazMIgOTSb5Zpr0QuWuD0LEe1pa3+TFNJ5rACMxTkRqX+WSOB2lGFVQ86g
         pYZRyjH1CZtuo7muMO8MX7csSW2GYB++9b5kiqJkoi8lRH7JNa0nLJGo6CHQShSv7Cg8
         7ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473258; x=1778078058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=pEJSQNHnKA9RUelt631UQGHPCqYMaXqLaQu/wNdkU/p2griTrV3eKGmpacfVbnjMVE
         SMC1956KJCCOo/1taI73pkVDjhJ848fQFDzLHiCo+OhE8esDv6rbeP4hz4NlTCwqB/KL
         p+iZ7RDqoDHIMzzAqZpQFd5kM4JviLVJ4dWQK6PVU2goHuSSxVLmp5UPNYteKJM+H5MI
         a23QatWo9bjeN2FAE/70UgDkppcDKeKjMml09Pc9LkdqqKSu/IIp5YubhIDOY72PjJjW
         w1VmhPwv4meq/EF7OdxVNr3hnGpu69KDtX6yEDma6v83a9lMqGPD840lAhor2YF96wkG
         99UA==
X-Forwarded-Encrypted: i=1; AFNElJ+GRWYXoTLgQIo0ZQLFWHoeZHs86elvZ0XrgByQ9OT4NngMI79kKhAJ/5sTzIi3kI1BbkBr@lists.linux.dev
X-Gm-Message-State: AOJu0YziTBr8C7FtDIgwkt5fD3XrOQe2D2Jgxs502T7H2oZi4Z9ODFe8
	ByinSx0/vGJU7yUM5Wm3I9dLh9kINvh7xQMROJ0DITRu2bYbbPhcoIOKJrP08xeWkl0=
X-Gm-Gg: AeBDieuKYN/Rq7x+TGYrpJTafhhRviccan88Jc/laWaWvp1dsJowueJKui4cr50U2ji
	V84xPPrExN8rZUGYohvVgiZvp7msy3QqU9KXeYtsXzN4RCun5mMTs+wikPyfS+OS26B+xBT3GuQ
	6dHQXIw5H2ZSgdOGuhtbv8m3V4P1v1PVBr+jf0ZEhNiyk0AcInEZZWd0W97C/Z2/cqC54U++eVM
	q15MZsW413Rz2H4CJhOPWOSSP8g+ORIVUMEvNkSMmODijGC8u5rARFFYzAdCAK4MDxw+PzAupjO
	0TsZtmbKvW/xAJhNGvxcz30ec+qNSBg/H7/nto/OxmpF7iuL/uPTpBcjWB9dcon9ksI81uQufws
	7m6FR/ZCbmzvni16ObP5DML2HZe0jEWAI3hwDI6GCzgauztL4UMk9m0xi104BmbJQ9qLf3zNKSE
	97l2Wvsy82TspmiIe7ayLtdMAlgTFT7aNdmk4=
X-Received: by 2002:a05:600c:4e91:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-48a7b54bf85mr71682935e9.27.1777473257522;
        Wed, 29 Apr 2026 07:34:17 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7831df4sm1071527241.12.2026.04.29.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:16 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:46 -0300
Subject: [PATCH bpf-next v9 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-4-c311f06b4791@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOx6r1sN+pHaompviJvGnsc7htEYgbZYrQe0hCIZL1j9hp1PNBETKr1kJS4dG0hJni6LhDBotXn
 AqgE2bAczzAc=
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

