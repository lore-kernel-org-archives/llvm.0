Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0087386C37
	for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286791; cv=none; b=ZBn0Z6symnkb93fUI6jCg7Bra1tTBsreN+GLlfbYfBY1AjGy2qUxy00IbrdfbyzkY4P335x3u5u80at0MImkrwjrj86BtukdW+fK0soJeRxqwvyoQxAwb9wRjgcurDpPgw8dDjApcls1A5aWjNUezr6oJuZAYr9TKQ5oFJppsAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286791; c=relaxed/simple;
	bh=Dr4PihMoMr3qRKNSDl7IrxVJ9HeBlG623zgxVHaeaQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o7xlPJ7d87+8IYRa40ZWwZryACj0rn2fjx2LsphQPBJeauXpkUmI8UEvENSKQ2Hq8+6K/1YTHZNnWIPwcZMwua6ZgudPS59BHzYd7YTaszoJazy5DcGmj167vtXRh4rnSthgMk/Ju6hlA9pQm5MEioJUchqiHb4YvDeS2y0Eu+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ELnB3H+q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ELnB3H+q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so50654985e9.2
        for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 13:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286788; x=1776891588; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFBLQbbwJlUBHhR630uwL3PndoUaJYspuC1LBCHiL9A=;
        b=ELnB3H+qair02RqjzRoka98U8O9JTsbFQ1cKIMoUfcdOb/lVmcBwiz0YTuMcV16nMw
         +iwL+wornouxyYZrI1ETbDAxRNygDBtaiBhBG/chM/9qfBUFVxCvdc9/lGjxUwpAIP+E
         vMJw2/LH7QMQLKidCUDOgJa0ZjLanmUjzJOt9j8guO2j52yvNj9MDxb142UTWYqUHyH/
         TE7Ho/gaNGMPOSI/7jh9WUzmippyB0UW5DKRe4xIeCvyUl9lxHJtyjacE0P2k7CU+Fd5
         I0Ccsy+R97oaez0ruoHqQyZJhvhCQSMnzaRQJUETxRX1cAHi8ckLPuYDT3jCeIvP1MqH
         RG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286788; x=1776891588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HFBLQbbwJlUBHhR630uwL3PndoUaJYspuC1LBCHiL9A=;
        b=QhDWIVdbvOgOwk/GpuxVpkqcDwwpUMykWI+0awf/i7Y0v99i1MaL09KF+s8bIteuCb
         +VmuVdyKqc1PszzZz5dgztzQf6mdgemD/bD/yZHVzBWzPiS4xU/l2Ngu7flk3PApPL7R
         kEwcGi+oNv3JSkAm55P4Nb4uP3JZJqLx+WKUa5KRjNaoophQWlXpxRlczDfCag057XcN
         OiKkMbSikMel1sK+1ND2H8bQ1B7DMvzyN6AClUxOt59ujq9YjE12zuEqhzG5f3Ugmw+2
         TtGCtA3/nPoS1Mc22JIPuDPi3wYxc+CYnSJGuqk6TCouLai/biICyIZ3POqE2EDBTMRv
         4h3w==
X-Forwarded-Encrypted: i=1; AFNElJ97sXnQFrm/LwAMW/JuW8pp1o51cAhJLdtQY+QnEQ52SY/xcqPQ5bW9H90TyH3p/+h14QPd@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd9nw635cghniqlANIZyW+kIDWbX3TaCVITYIZuG15oxGHCo5t
	qnos82oCyyx4JEvEpRKVx6gHCaCTvYK4JAvMzHiUxMDfndiUknlG8HD4NPkejzfqZyk=
X-Gm-Gg: AeBDiespTgPuqgjpGiXIKbYGthqI4Jw3+g2BAjKPfGYEmV4IM9yjSBz2U2bWjW2mxo9
	oLgG8kdPsp95llJGZ5DwcLvLcOZ91751C+C0arCGJXhDKy8Gbzqhi/EaMHCzray8CH8JRUNQpn5
	lK1uDN5KwjBXKHLd5X/4flAgfLiSydPxn9BcmCmDHR+0REcFt+LHpZOhJx+Dp2kQ8SHjHNN/xul
	k3gUS+fuBTVIsMUrJOSk1AU4PLPcCgtf6ZdcHAoUEhix2QymjZbMasgrWJOvqyFZKh6/gN39JVJ
	loXlYOTpNRUUIa6N6ndGMKVvAJRFiZ5B7ny+3tjtydQHAQviKE5/F2H0E1yehZ0ptM9dJR1nev2
	QVWkHefJ2wkrax5DP8tbsOZ7/inJXVy91pVHv7l83LeZUNSBLDHhyjAkrc092NQq5G+c+hTrOF3
	FsracEGkHYFP4=
X-Received: by 2002:a05:600c:630d:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-488d687cfd0mr320769305e9.27.1776286788430;
        Wed, 15 Apr 2026 13:59:48 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6a8496sm3468696c88.10.2026.04.15.13.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:47 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:23 -0300
Subject: [PATCH bpf-next v5 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-5-03d0a52a898a@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=1610;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Dr4PihMoMr3qRKNSDl7IrxVJ9HeBlG623zgxVHaeaQ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMGWWbzfWEk41CsDSxTzXZll/JOC2pUkK6ZFcauKpPfsNAx1Y5sHy8bgQ7+Tme92jV66sKfhQJU
 1pmDrrEwGUgE=
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

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 040617c01bbb..3c9d61023414 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -713,11 +713,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
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

