Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F33939B4
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 23:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419942; cv=none; b=K+7mgIFB5NGzcqYjrF3Y0U14gX+ncOC8KRUCjVHHPn4A1kfWUnR5LhH6/ZZTpAaXmCGPcRZRPoRXsAmSXoTK1+TdTu/ivemNYtR00WXBcqXD72/PMG6A/yCdHpz4cdm7Kq0fNdqUKpN88opdYpFesvuur/5x3lyxfoLpxNo0Q60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419942; c=relaxed/simple;
	bh=95satU9q5Agv8MCheK9ldPmy80aoR7ITuWu90cxm+F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/564j/P4z9sco3y0nWgXr8O/Wx4v7d6Cs1W3Wrsjb96KYemojUkfYTuEOkGBKY4wSj4LQX0KyokrtYRUSJlhMpe0wT9H+VRz6WaTOJU9YhoHDx4tsw8aY5kRaHHXvuiDNNC9IWdUmzlJLE+y1Zcm8N4FjiNQaTueTP6ovdAIe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gFhsKNO9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gFhsKNO9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so146588525e9.2
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 16:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419938; x=1778024738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCFQo4Aru/JTwsEjOuajhbqjGOTLFNs9niLacwe8mnA=;
        b=gFhsKNO9u6UAUsGhre5rnIVtC2YxrArYbPFkdE9Srlro9murW+tOm21iTuTH1OyT+x
         GT5yrmc+xNDqRYEzTaR1j2kluyiCuY/qa7lOXUWgmlayU0PvaWZqb8u/NA8Df4C10J4M
         nNIUsLAlB5ynLXqQeqA0cQ/q47i2mAFtIWUKL4+uRQpP79r/b/qrj6AVkSu/OHoRgSfO
         BowmlOSz/4Sl4kJAPxpHLmGWMoLopyboQs6RYq3/7/KL+HhKkM7QD8rBDmDtPxfXg2Qx
         IHId29MpNFyei9ZnC8osuz9WNxSUnxvoIVJlsyBYgH5OqdU8rzfiVETPHlgJDMMk9kfx
         Hz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419938; x=1778024738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PCFQo4Aru/JTwsEjOuajhbqjGOTLFNs9niLacwe8mnA=;
        b=fcovZCzsawQ70OBecb2mOvvFZpt9dPsvRkkTDktZr1jdtpNXtIjdnNs0nt5WQs6sd2
         Y26Zt7hp+hd53pTB3AS/7eRRNAxKvZWSV7D2Fo3TKLnSCRSNdjGl5uHFi21IcOIHd7kZ
         aMiK2XIYYnLyKAK9SsZLlNGL6m7TmJl6qA8hJEa2t/kLEYVLzyscA49HosBvlng+6Tty
         O46Dogpgi6IOXa191xhmG4dVq90GFbDR46TZhpoENlCzOk1rpgRZgXcWUmWfWLhxVjAs
         jvi2xkHtAkfnMEKIsERbnVDcvMt4vg0pO8PAXJ7NzlES4cXvBsoT/Is3vv+OEPI5SWji
         uiJA==
X-Forwarded-Encrypted: i=1; AFNElJ9g/qIyuoOz6VHJqLDYkZLnyun1HQfhPXeWWpOkxKu03QTFkI/cMkIMBkVhCqpmTyUT6J0U@lists.linux.dev
X-Gm-Message-State: AOJu0YyoSGULOFJDQFlnURwgzxFUXQ87a71fiwqISAqDrcneL+5FxuB4
	RowZR51mRz1FiHK9thn2HijU6J7+djraTGkMRwqeSdI8KG1SEz8GlzfiE6pkPbnh5BI=
X-Gm-Gg: AeBDietONv4UojZDadXraT7lJyfO9zUCtaFUUrZFLNuDLPSpIZOXzfKCPgI3zcKFeHh
	PK7oEe1h/1u4Jaz5qt8hNNb55YYuC9/5sQ2aiDU1c9aQ9jBnDs78eB0vslnQlDqs8SHw2MFu/Yp
	+VklH2cJcqUKBQLyFiDj4QH9T0CZzMQeN8cJim19qe/SAWQFK8FoE8ilHDaWb7WJ1pHiwYyFWxb
	hSyMkMxAeip2d+MfEzPJ6HeFyZTC693gand3Fhy/ip37FBy0jwmL4Qk/sOwNy0xF6ipEu0FPtU+
	xKJpJ/k0Z2sO9ZI39wURbg1P0paoU0t27WBR+Oc7js79dkLiDO/Q243qHAE4MxrKMlhq3Lm8LDR
	rYLWIx4grCMeShKN2T0M8j+3Czcr+QdtCAQ4HkGjMyEgAexYJCB3+IADPboQ1VoK16kdHiYFQM5
	0Lnvnxmo9WQIsz6TtcJ1YS9rBq
X-Received: by 2002:a05:600c:5494:b0:488:ffad:6728 with SMTP id 5b1f17b1804b1-48a77b05c77mr86131225e9.19.1777419938146;
        Tue, 28 Apr 2026 16:45:38 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7765acasm135209241.8.2026.04.28.16.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:37 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:06 -0300
Subject: [PATCH bpf-next v8 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-5-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=2200;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=95satU9q5Agv8MCheK9ldPmy80aoR7ITuWu90cxm+F4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QD+jepyNJMWD40lOW5GvIdeaEl5O4OF/51LYPAKc8TQEKsNlSTvnUZVCp681bxFrGne7JnKymWr
 Z4n/nlSmKBwQ=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Make skeletons and BPFOBJ order-only prerequisites of .test.d so that a
missing or skipped skeleton does not prevent .test.d generation, and
regenerating a skeleton or rebuilding libbpf.a does not force .test.d to be
recreated. This avoids unnecessary recompilation and, more importantly,
avoids build errors when a skeleton was intentionally skipped due to a BPF
compilation failure.

Note that adding a new BPF skeleton via a modified existing local header
still works correctly: GNU make builds order-only prerequisites that do not
exist (the order-only qualifier only suppresses timestamp-driven rebuilds,
not existence-driven builds), so a brand-new .skel.h listed in
TRUNNER_BPF_SKELS is generated even when .test.d is otherwise up to date.
The modified local header invalidates .test.o through the previously
included .d content, forcing a recompile that regenerates .test.d with the
new .skel.h dependency captured by gcc -MMD.

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

