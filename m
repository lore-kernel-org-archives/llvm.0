Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F3047CC99
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060168; cv=none; b=pJ+c0wncaMHAtcQ39Om2U3YSiHwnXqfr9PEWLbqk/Hwo4a+7jebkW2R6g5vGZAzkmSKx01lW3148XwV1EMlbeXtkCpX7Z5ThSeq9oFcdIPY4/9oJl7Z7Jan+yhycdWhx5KJAksXzKCF6Y0LWtO+gnM3iB/XHi+TIxCpMdqcMnpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060168; c=relaxed/simple;
	bh=yWoxoiBo89oC2LhotltqgA/PGRaDAqLvdHMOdKk7L1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHBSnot5TZGD0OUbdsLa6DXs1CpQo/8mHN5j6EXM413xjMuaWARIZ3rGeaRs72eBZU8UF6wDHQG01L0mJHFGF2JHkbZkXvmGywSzoRSna4BYBg9v1hpW52sS6m6wZyBDy4ttuucGYeOfWA7guGqAZvRG7jjMdmoYtPRzuiYg/Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I4bjUKgu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I4bjUKgu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488879b2e6aso6351415e9.1
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060163; x=1775664963; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXAbCHZXNBx8S2/Zadecwk5HUc11KM0fgEMsoxETngQ=;
        b=I4bjUKguhni17ELivHhzMnbcVQ8LkPv9uA134oSPOdn2H4/mZeJ2Wq3Gbjbh34MC4Q
         bsj0UH2y5pDJCMqoAIfRXDtCRe/o44hnoxjQULgEZc7e71nziNGv6ydRjbO+Zhjsv/TF
         BKwTLwWf1ppqzY17l1KBZV/rs7HX6SCOFura/N+ZI598fpHT0zCk3GmnIwqZ8i/btOBy
         OhCvWx7qvBL1X4S3r/9/ASlACs/ojutA+moi1ZrZkxHUREx5Kq3ScprmjNX6e3/kdfRu
         PgpX4AxNprscTtk+632CfJEgeFcEIf/262QdUCUXPK8nhy6+rwunsvb1uBNWz/nQ+P/5
         3Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060163; x=1775664963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EXAbCHZXNBx8S2/Zadecwk5HUc11KM0fgEMsoxETngQ=;
        b=Gd+17biDdauAUOug8HLevNtn00+HU4f1fkwTP7XSLTlxavv8R69ek1dIfP9a9SOlY0
         8X/V4zMEqwUU531z9LH3366K1eIdfxwgymEEAElChC46kXSkLnhm3KbUumIZI3dUkZMk
         G7PVN9x4PIVFGT+S/Ns7KGWcceNAtZHOp1usOBbujs/syFm2QxIRKEJ1yY5S5osoTxQv
         ApfnAE2wRFAUKaTO+5pVcCjVl3IvrvBzL7SyhNmj6tHIg5gNgQXlqvIiCVcztOrSTgRI
         TpIwrRxN6BF6elnG1RTGGlZ8lXoB7RgPIRolhbvWlMoKaqNHNgL52FdIX2GvtJDm8mQp
         nsyA==
X-Forwarded-Encrypted: i=1; AJvYcCWFuX2uxHMllrpfANF57eFKO7Ma09uoACQjaAXDZ4V9ibKsTQihf1sqJlFIZeLIsgfU2f/M@lists.linux.dev
X-Gm-Message-State: AOJu0YweA3gkW2RD7o29X9tUyeLpsoBM3RjNe1ri5Eo+lBIjlmJ/j4uu
	zFZeGX+4awhCsAExT0CRou/lf0EoylQvG1mp1q/qQm/LTrFp0QmLNO8nh1nsaQrqXHk=
X-Gm-Gg: ATEYQzzYS/vn83uwXYD1g9pUHXJnzgGqzT/TqKpEQ954eQbZkLLk62T6Pg1aVLf5vkO
	D45JVs43jWj/hp1yyzvZxqBZU2aA3iykZkJgAuU7L8TesqVkcSN1+WGa1x2dtZkQUGYi5e4WIbu
	XykHEI+lfW/Chj96ov7gOMJDK/OWUulA1NdKgYOvkxASg24RruFk11eYlY8UaMNxhJqABNn6Yjo
	UASe18H48ObZTuNyMmd1KPrBp54OISRH9GKme0NnvI+hk16ZS4vWnYzqxFa8HTzDhphWIlEGOtI
	83xE1TEi4DJRVs0GndJgFxtudc/0LYqFow0r+ma9FogU8aW5JDR8DYuD5Q58DD5eXot3oMhAb/c
	BRHv3BwCS7vRqkMo/u8FVWhy2e4560xYtmEq1EsG4IPN0AcwTgUOvc/8BlUT0H4DnVjEB415Z65
	nPPwlFOtsZorg8DiSVblA=
X-Received: by 2002:a05:600c:4e4b:b0:485:439b:683f with SMTP id 5b1f17b1804b1-48883595da7mr83858565e9.20.1775060162775;
        Wed, 01 Apr 2026 09:16:02 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1d1edsm249913137.1.2026.04.01.09.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:16:01 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:15 -0300
Subject: [PATCH 08/10] selftests/bpf: Provide weak definitions for
 cross-test uprobe functions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-8-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1575;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=yWoxoiBo89oC2LhotltqgA/PGRaDAqLvdHMOdKk7L1I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDNs03eVt3q2x4rs/lkb8sVn3NoxfdXggfjUMOSqo4BVJUx5+tTW3qaI4qr1t0JUqe1QddnBU6m
 EKk2iwqI2XwQ=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

bpf_cookie.c references uprobe_multi_func_{1,2,3}() which are defined in
uprobe_multi_test.c. When uprobe_multi_test.c is not compiled (e.g. because
its BPF skeleton could not be generated), the link step fails with
undefined reference errors.

Replace the forward declarations with weak noinline stub definitions. The
linker will prefer the strong definitions from uprobe_multi_test.o when
that object is present, and fall back to the stubs otherwise.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/prog_tests/bpf_cookie.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 35adc3f6d443..a1503e8e07c8 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
@@ -252,10 +252,13 @@ static void kprobe_multi_attach_api_subtest(void)
 	kprobe_multi__destroy(skel);
 }
 
-/* defined in prog_tests/uprobe_multi_test.c */
-void uprobe_multi_func_1(void);
-void uprobe_multi_func_2(void);
-void uprobe_multi_func_3(void);
+/*
+ * Weak stubs; the noinline definitions in uprobe_multi_test.c take
+ * precedence when that translation unit is compiled and linked.
+ */
+noinline __weak void uprobe_multi_func_1(void) {}
+noinline __weak void uprobe_multi_func_2(void) {}
+noinline __weak void uprobe_multi_func_3(void) {}
 
 static void uprobe_multi_test_run(struct uprobe_multi *skel)
 {

-- 
2.53.0

