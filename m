Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2313451068
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564950; cv=none; b=b44TePkOU7MzBwBB6UZZImOMtDXOk1m2RT5yWpF3L3856CeOfyZGK1J/0owHpdV25C8QXEdBcuV49ofrq6pAId8bxgLasfMJ7HNnHdj9hCEc5kqPh7bi/NSfajZx9LHL4By7uGCZMbF2Jb0EF2nq9zNMHWqV1e8477NW77HGVGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564950; c=relaxed/simple;
	bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0bX90YGZFt3SaoWhopY+HHU3Ys2+T4yoW9HsN3Qbc9xu1uoRlq0Xoo3CticVeUIzgxTAG+k/7c+tBiobhw3nPlUN1Cg9HCKKPkRFZzbDNq4wqNXScFy4tDelySNezSguWFLJsyPdfeuYQ3gQJlRebJI+9x9OEyIwZvnrO5dptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EXX7NqF2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EXX7NqF2"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a413f83226so1976418e87.1
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564947; x=1778169747; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=EXX7NqF24XG8ajozCigsPs9Mt0kzamSKkx9NxBaagOonoP6fU2MbjlrQlbOlZFeWaf
         RS/BztrjvIVccu38f32E2/wGLN97Uf/rK5cg1e1xvd1i+nEPSjFB0qzccphV/dwwSSdm
         OBtYUzUyRpGicBYooYvEGIPXoafWkOWQ1rN6C0uvUOR2san68erv/6cWS3COSf18ObQa
         MDjo2U7AtpafnJ9qIgQpOkaZGgJMl8XfX1WYKqdTYskX4+kLYlOke4gQJtVDE1TC6o4/
         jocpbic9586b4txFJj6u9kYJVhK5ll6CuXaIYXlWtZxLH4hpx0Dyd7xF8XhA00fb86lK
         dzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564947; x=1778169747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=BCHxmmYVq6Z84yzPnFFFWDP0wviZ03myAvoxrxcSngjCH+Fill5SYZ82SwGf1iR6eN
         z2hJZXg+QY5WLHlkmfV+LlGf4+uDq+3R8hP+Gli+YHmYe/xG/TE5glpyT6u825WS5T7+
         6/qF/MEFMLqAutxlkSEBlOLP5vdjoSAwR8FPZWd6ka9dASRM34q0y9TnfZF8jJ5ScuWu
         8VEJLbfyZwwW5rubAU13J+M6rW4I0pIysDBK86tw/AlByiu4SAYo3/Jy9Phrq8WUaU/U
         CpOqK01HQHQlvD/jnv11mRz3pvyAEy8xiyQFvBgYqZq+Qr8GcSfVGX4s8yzcoPaXbyv2
         QxKw==
X-Forwarded-Encrypted: i=1; AFNElJ/FqkWvpktAbB7/RDD8+LBdyE7DQrPape3vWs6Y4cnmFzQqDhDw+uBNu2zU/YC2Bu3gzMVf@lists.linux.dev
X-Gm-Message-State: AOJu0YyosmWs0s7g76ZIMLkyoVeYfX6E11cFxHxqI0zCKIej3pdnyEew
	HLjhtuOOK5B5BHPQ1pjrrnc+2x/xqyA0AZRzprB47z/0KHsoAGEX25Pkp6W6YbD8shg=
X-Gm-Gg: AeBDievJl7tu/ocBPvkpMMQeXrJ3U7GiJo048ZMF9RC8KNZZPSSDeLUgOSGYIaRF1S3
	8jr48s/hFEQadGAFSImq84SbNy7gdTQfTuaUgfSKGsKR4jj/6Ou3BaQn381gvvPJB2oqDFGwnBx
	KxabV1324iDtLh0kPlTklTeDGkyCTxZ/Gf2BqceWVFwWpRYHrgBajdFPWx+ff65gJzN2VVUzNwo
	VuxLdKjNXXrb/hFo+6wWR2oWZdr0h9+G4iMv53aUvrgpTnah0Y4NgXc8oVMBHqpz+mRrX/O6YO4
	2DbwSC4eMnXc0OmIYY/khGzTOxGWg9e6tnORwZDyKYgACRogpnrOW0ncJ9r6A52HaiNURKiapqt
	nfhsIQTSQ3IcfEDBOEDXctTiyzB6H7iFeOIdrtq3WN2/+abLlOvpJHLu4gKwG8CpMcLs0D3ey+J
	hhSdG6WfM6Pgn/4a6fxoeX3l84
X-Received: by 2002:a05:6512:3b97:b0:5a7:4a61:251b with SMTP id 2adb3069b0e04-5a85274574dmr966110e87.23.1777564947049;
        Thu, 30 Apr 2026 09:02:27 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd5500decasm10147037b3.26.2026.04.30.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:26 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:05 -0300
Subject: [PATCH bpf-next v11 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-4-e11f7a8c4fdc@suse.com>
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJCdl3O6dJs3KBM3TNjFWh/ti1NuSibuphC5wNsVk2bNEB1ItoSCp53bCr+TLScjI4dk9j82MgB
 V3vt+5ImILg0=
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

