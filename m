Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D612DAFD7
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491918; cv=none; b=TE0KwP5OrNGHEVzwhUH5+GBvEwDL3AUSjuyyqEgandeQehgw2GTJLzAIvvkQDFLYQebpjMGQm88piX7xq2QUH69Wl3bBpXeNjJkkJrDbuSeJOSXP3oxUFo1rKBajMwSLz5GHX7bEq2/pdzYGBMtdix/w8AKNrK0a63onrpGXb9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491918; c=relaxed/simple;
	bh=THQvdXVv31TpQ7mxGEsKklR/hWrRMotZuvkB5HuFY5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PcxCGRBg1Okl1/4LKhNbWH+RiJN1lvVTQiaZjdngy5IBC9VJhNytr9faHiI+ae13v1Ur5WRTtSJtAgWxYE891udPEef7nSRYPZeWMy8MFDjYYE+uNTToJrPMotkxCeFabgpZuXBb+Oi4gEPo/FbPPO2Aa+p1D3kEKnT1zc203FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GxaOIeQ/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GxaOIeQ/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso17089545e9.2
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491916; x=1776096716; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhJemnsUkZv11ibw/3C7vkexNe+w6VJ9//yKII3jtCI=;
        b=GxaOIeQ/fqpNqUM+ULSccvhdjDliJOCiyd5UWHDbdgFFLb9nTQfXfeIWMuOuGX61u7
         x2pFnSNViZ2xF9Wy7OCjjr2hcEMYmH5nNBoLaPiPm2V16Abl3P0qXuiwlqVQv4TuuKad
         ZSrfknX8cfxYqK1mYa1ch4va9vNU2nL+uxsfqV2oLse403t0AExtShbzXY9GQTqGP4yv
         5s5eq+HFXamzTpg8uLwEca+xzlIATLs9Eni9pTMCySBP7hTOBoODhza+xHkcRJIvHKNZ
         ZToyRckRjdrEal9miXCVUSxGUiF/XqUPRKedcBNw+KtFQq3fIQdnfO0HY8jhBaa7gAwH
         Ha0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491916; x=1776096716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UhJemnsUkZv11ibw/3C7vkexNe+w6VJ9//yKII3jtCI=;
        b=c/lAjonELwnyFoghV5l+j79anmZzXS5/mo69Gce8AUThzW1qPYXYZ18xZrFqAcyKlT
         RYu+NJp46BqGjUdcEb1Sm/Y9uJSqCeoBboCUTIfNf7efHZEOU18rm07yFwtYeBi6qxWH
         aVfjjS4CNWj5xALgib6fWxQ9C/NTdJNIOydkXa1yeCKp66jNK431xNfJjjp5P0JCJHWx
         0hIV9/uWE8wA2Q1tp7iQnDyX+VbP77YLsT7itQBgt96oMoqtqkPkOkuGAXadBPHuvFsT
         GOpqmml4KE+w83DvrvtJ6Vq2SW+HcrBkmEP+RkkHUUo/I3de3TKOJaLtnmYHKJuPwlSQ
         fQoA==
X-Forwarded-Encrypted: i=1; AJvYcCX7KQ2YdSUjOlLr7tpjer7LKgxxvwxVuw9qOt0i96ppDnDOQhmBeeTsHSZOo09A6dJPiRJY@lists.linux.dev
X-Gm-Message-State: AOJu0YyOMNbV3oe+Slaqw2a7d2yyeK0rRE9f9zBIs6oP4QxTqGmepqNq
	S0btRHF2MWxvzN6J1MUrMlrdfBPesHDreQTLHbtLDDea/lkhnZ5AlQzg2ChO/urpPCc=
X-Gm-Gg: AeBDievXaxkGE3MbbDOYCNF3Ie2B3vPuCTLrp/Ekb7TIW33FmOOQwcf6pBhBKdKBRdb
	B/Xv4z/qdj19TCIau+qCpdmT/1V2GL6g3PIBEQ5QHXhOP8xsHYYUxp2g1X40pYTow/cqz2MLuZu
	FeqdHTla+IYk+qw4B5hnKYl57p1iDnDYVXLXzuYv8BBrkinT9naHGl/l4nl66aRYoZExg7aFAXA
	iVNQ0jgRL6UjUWMs96Z8+3QJfdfgwqwIhMDnmFOYliPgSdTd2YCrmQjSTq0eRxpn+j4RTfkKdaR
	6L1n+MzBBq20Sg1ajicf0sfLbPijs8G7GzGLoUMprArngXOnfQyMu0/b2bDWKp3x09NhDXnIPMa
	63/YWXiOFsOemlsLTtHuWTLdeunD8fb8ni1OU5Fw39ptkz36l2N+vyV7lEjrrY21Nrs5VRLBORg
	sxMB3s/YTQLM5A
X-Received: by 2002:a05:600c:4512:b0:488:9324:3ab8 with SMTP id 5b1f17b1804b1-4889977604emr189339735e9.18.1775491915600;
        Mon, 06 Apr 2026 09:11:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6abbcsm13665264241.9.2026.04.06.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:54 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:29 -0300
Subject: [PATCH v3 07/11] selftests/bpf: Allow test_progs to link with a
 partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-7-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=2109;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=THQvdXVv31TpQ7mxGEsKklR/hWrRMotZuvkB5HuFY5g=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNnqnfZdGW7vaNVUnntgaLMuLsEhZuzIG++xaZXo9auz86OmMepb4i7aY3wF2d3bC6A5TkvYvxc
 EhZXeyhwnqAc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

Move TRUNNER_TEST_OBJS to the order-only prerequisite list so that their
absence does not prevent linking. Use $(wildcard ...) in the filter
expression passed to the linker so that only the objects that were actually
built are linked in.

Place the wildcard expansion before $^ in the filter to preserve the
original link order: test objects must precede libbpf.a so that GNU ld,
which scans static archives left-to-right, pulls in archive members that
are referenced exclusively by test objects (e.g. ring_buffer__new from
ringbuf.c).

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index e8e92ba9d5b4..bfdae212037b 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -734,14 +734,14 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
-			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
+$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(TRUNNER_TEST_OBJS)
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$(wildcard $(TRUNNER_TEST_OBJS)) $$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

