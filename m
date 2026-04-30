Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487BE40B6FF
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553622; cv=none; b=nhX0Y8h06pgjOika7uSz9Y8MS3WiHGiFrxjUkalcFidwNzxgetyf/rGrChmh5RwAtxGPNAGaj23P+2MxHCM3HMTw/EewEcOY99/ojhahImHoSultJAKmDVF7ImLK17qSfcsiG/DKKJN+4Gopk4+b7ffhrnn2yvuuU8/C1Cxt7HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553622; c=relaxed/simple;
	bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjITOUFM1y9YQe2VO7jFugjwGZlYpkN2lj5JDRXdEKstba/CCCj5BzVBZT2W3ecD/RHLZJ+IuW4Dj9evWhaa3CCpgg5sr8LBwdX+o22nsjxhaJ0OyDnLszJIsUYfD7Q2UnoeAEWK+HVLdI1ML8VGBPS7kuOE9o71ma0811MtAx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KLB/F9mv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KLB/F9mv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso6789525e9.1
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553617; x=1778158417; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=KLB/F9mvKiR12vHWUc5C9uwVn4e8T6r/FQl+ofjPqRKIPgbfkBjIzhCsViMOTmf2gc
         thvppWV5frghIiPDpi1uPwzVr7IcAf4yrZzpjTPZFRjPK7F8Md9s2A1EF2paalMKkIe5
         gAE3POtIUd9nPn/0VQX026OUPEtWWgqURq9ABOhBvqwhndHMFSqXmhmvateUi5kQkKT5
         6A6pCyWAQVHG7Q9++UqjeTmel5vKaYvzY81Pl2i98MkGUEQ3g91drO8ookCH8uH1qCvJ
         33RPWKPpGXMVAm/42GT/0x+rHnF471f2T9QfHXTCm0BWo278V6Dj2itidLjfPImgeh8e
         g9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553617; x=1778158417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=QH6Pld3pqrclv9mnJRlsiQR5mGXjP9cvqHoWD+6MbWM0VUW2yt+Spgqq7fgMwLpnmu
         bkn3zPX5Xc3KsQpbWjYTUGQXJXtpcjqyZA1x/MoAGczLHe2q9b5t8z0RtGugPrJ43CF1
         YjoO+nHqTe1I0DYjvQy3uYPrcf6o9kO6CZ7FTmLDvbfA2ZQIgAnFMIEtlY1WAJkB3+rj
         JHINbYhk2T8e/Uk7L7/2DgOzj0cw9WlgikNE4D8j3QPwFkFKEWCxnnvznTRIV87QPXKl
         ogskKBSqvIqrPsCl50ch+ENxhkyCler9+ZIq00T1RD93r4B/KXUjBBLmIDM3pRnA84So
         u4BA==
X-Forwarded-Encrypted: i=1; AFNElJ8uVkovnTWQFI+TmTDOl43FXr4qKHwfvGNLCz8FbMPXuYOP4g+v+ESXkhJUNyd/z0zITRF4@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp0wPtoTrcJ/iJ7KvnN6DYHHtdFA3lqwAoiRhgKqTQvL2JGOTP
	8SyLESUntnt9bIhLTVLD40edS3rvwsP4/xjc67E8bJN5sqS6hFG5YpQ05aHKAShIAZ8=
X-Gm-Gg: AeBDieuvAH7mbeW3e0mRfVrsTPWD4RKfCiX7pgNJOR6fsl681QinEcyyNBUo52jBYzY
	k15+12c283lwJr3mOuV+g0P6+MD61xrSEfvNf1sWBNcVptIEAbIzQOlBwQ3iZZOqs/TUlop3r90
	GpDP5IqkmHu/N/kZn/Z3yYOXKBZBTIEU2RhotUCv09JAz/zSjOQxOVBKUsTCF8WrLJ70l5meeoK
	8Jh4bv4rGmVc3qaKjek6AChEl+YJOR+a5URnp/x6ckYJ84Zy1UjIWOnDzb+1CxuzAkoxXtEo4Jt
	e85v2SZ2u4Ct1Lfhp9SBYhDB+5tHB+HmsP6sPwytEgyUhSZ20optXIwCKz4goTsFl24Ey9xOQEt
	XGKNTAagSiR96gX5c1xZ6JKNQ5qiUf+RiRxyiTu5Rm2egG/LfvWrnMVCBVLqEK3R/6LfeFTR95U
	SeYxllpujd4ED9AvgO//T5/fwn
X-Received: by 2002:a05:600c:8b0d:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48a8451d095mr46117185e9.13.1777553616550;
        Thu, 30 Apr 2026 05:53:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf8ddaasm6815518eec.7.2026.04.30.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:16 -0300
Subject: [PATCH bpf-next v10 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-4-cd302a31af16@suse.com>
References: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJIjnHCrkesnvZDd+1xOOBY/I9I5aTn568IujXQ9IpcHNyVhJvVFyR8S5WD6xdKtB20+tTHHv+y
 eD6jnHos26AM=
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

