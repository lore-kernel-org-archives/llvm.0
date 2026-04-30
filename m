Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C940B6DC
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553624; cv=none; b=TTfxvy0vMeUXswH0/kBv4wr6y1D75Qy4/l/7ItOspL4Ui796A2D3Mr4Vdz3wK4vfdA6hQ4im+ZV9BlyYYrHOOSSpGaBl7fMVrFOeiROazZfUVrwGEEAaZvEBv1OtcGJUxkev7Y4BUNLsF1HnyQ/6haRGNoZPf8QNyx6LRtE3EiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553624; c=relaxed/simple;
	bh=aqXG984YlUxMtsZ+i7vquyVJaGX8IceA6DEnTDh+TX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aClowgcC/tHbEdSAUXRppRuHqAjsfRSA3MowgUEE9cWmzUDAauliQb04hYD5hRecxj/MGPJcpAjs0me4WaUqxYvNgXvxsZFvONGCDq3E4wgd+whMCL56XImvjArMjzZ8IklW+1S/pfQCfRbUwdqPzQt5sD3pECvCiR7pn1hHVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WYSyxWjO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WYSyxWjO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so8454475e9.2
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553620; x=1778158420; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysP9AGtPxCAbfR+Tj7mfuITrZ+N0ZILV2wyZ0Jzr9sk=;
        b=WYSyxWjO4WqId9zONJ63kVogqGGcnhzB23yggOVjoHuY/L6NUV2uebzUbAt+usk03Y
         9w5lYVhWCHCkxR54yFqY5i+mvZcoL+TCI1YsZS9pQjPuNomSwuxiOUo/c4k0ZQLs9XMr
         0Lqdk+lnLapdxt2cozADlCXSpRGA8v57Ywwa356/0dp/nCzwn7B/U43SExclqV2ZhWif
         S1GGSUq3ma0eUtnp/iv5FYFeu6WjdYOk1SybDtTDO7/t7E9JQu3bBr0kylZgY8GF9SQK
         9V/ZqbVLuUxqDBmEohsuUJHD1faF4Qf/um8q7gYmDJH0/hq8vefRm6KvKcy8po40Jtzg
         3sAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553620; x=1778158420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ysP9AGtPxCAbfR+Tj7mfuITrZ+N0ZILV2wyZ0Jzr9sk=;
        b=IQ1qBPNwu7uoZlai8Vo7yabZpncpbYxXrJAL75G2VrLuEonjudplrxLtyBoVE5nxY/
         guM4cwHAh/CbZjUm2JBqSE1T54LT5TTPXEj+eMrdg0TJbdSZPu7vqni9BQT+PKrllnMR
         okySTt5acg3Vhun5+lvQ5YmN1Mwup+5lI/UgHKNvnrQVNs2byJy8UY9kmvMNhuv38D+i
         dJMKCvzEMurJhMeRzzdkQgX0B3mztvtdIC0+JJZ2/yjPbLKSpm1WNo4cK3emQKT6S7aB
         Ff7k/6lQYTxCI3CTRR/d3lgtQe82ubOn1/HjKO38bCTXufS3h3RqGlDaNFKWAoGUhfDy
         Ki0Q==
X-Forwarded-Encrypted: i=1; AFNElJ85kfL509RKZIw+cSxJfpC3OUT2MTznuZrSW4K8VAK1Rd0jVppA/2U7RjYf75Jqhyk5aSVP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7r5w5v261RaRdBYY/iYb7+QBO+OBDwStq8/0GJd189DVBUAkb
	Y9pqzv1oLrze36z51CxtB3CNceSdYIXcBwKOT5E/KBSU/7vfheC7CNfBKT05L43LSE0=
X-Gm-Gg: AeBDiesMan4OjwIqnagEZuF8D4HCYhpYMFswurweoNhf70OEMrTzcn+W7g2zcX3nGDY
	SYgI5vzJppvoQtQekzjwGEJlkrKKKePOit7sNyYLtGT3bEPH0iLkHGV8xg6tuQ1gWcTpksRS0nl
	HbRyDSCZyV3hKu+/torNrFHkC+7JHif4blvkWCm2CZPXrr4nx3PU6YP2SFhpVCd/Y/HztqhHjep
	Xd23VMMmR9GEXzYIwFUVs8oF8p6qMx35ssRclrnWFkKgAg4umkhboZ6hjFaugRmVlrsOKLdi38L
	IFufCcBS+bSrQ9pjW1ZorvVz02s315rSlnNcP0YRHy7CNK+8j9rnKwqA5qkz0yy38aQNDEYvjP1
	TwEgOuZDCuQDOKIEJQCv8+kEjIsb8w5bCxKEIAX1tOliz/gfZATspLEdJgZqxh6GJi62PVRPA+2
	qfWbd34o/0x7EIr/v/mmJjpyUy
X-Received: by 2002:a05:600c:888e:b0:489:1c1f:35e6 with SMTP id 5b1f17b1804b1-48a83d6a8dcmr36394175e9.6.1777553619863;
        Thu, 30 Apr 2026 05:53:39 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf6d315sm7161270eec.1.2026.04.30.05.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:38 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:17 -0300
Subject: [PATCH bpf-next v10 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-5-cd302a31af16@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=2402;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aqXG984YlUxMtsZ+i7vquyVJaGX8IceA6DEnTDh+TX4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMfNfx0uSTz+XT2LVbDrne0xam7XwpfbbAQ5V7F5ctX2+k09VLAnSHIE2sFqnwGIlHQTqmWtNZO
 gFSqvfQX/FA8=
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

