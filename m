Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5123E3140
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405422; cv=none; b=lCn4Q1RgR+AiFXhQL0Ebv007xoSr7Fpi5Brq86/TF/z5saQtOHy9TzL6aeC+ld2oY0H15kXzEKwvXPwZ5tCYndk1Zi53VvaPjv+aiBZparii6wvjCCuoCvCCgV1YXAdZgQhJCpMU/j527qYbGLhQ/W5A7kG3y7kodODTKb0MLtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405422; c=relaxed/simple;
	bh=h9YPiCy3D78JKFK96WbgjB0Gv9K8gRrn758T4BLo7I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rtVqp2f8ga94P2vCSMX8Fy+Ipu0dsCWk7ss8MHcvUbpMema9HQnwQOZ8l8tyUTVddK1CTFFui9+5peDXOkYTUIACafFaFcgdsULswMl5Xk6iQIyNLsi9Cg0XS1MMbGIX3nquPLxG6Zmo/hs7C4IZ3scdEPbKaAZl4neh/d9jwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=biv64uG4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="biv64uG4"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so5820393a12.1
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405419; x=1781010219; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SleKcaJS2ZrPKi8iOetVvP9OF/8OPZ5a/bR4NWlSpno=;
        b=biv64uG4JwLh34vHg6aGAg/dKst/b1XqdGO/o8fLae1+z3VqSKFUW1oBScVzHg0RSq
         S5zurHReAQfSkL5TwO95N/3DwzD/IZd70S1fZoc6X06onisWWS4O8+goPLqP35+TBn33
         odVAzgRwbP7ojPH1W1LV8RmKCxzlB6xEWxIDE+qz3YQuKerSJq1BVO1EmNu5vPijU7IG
         uWfoWC6XdC00MNBrwDTGdL9w5gAWQG4nq99Em6FR7YFVLQPOG3QxG48EXOULXWemCM18
         7BrR8B0j3mKViNxT0OMewSQoobSGoTZCaN1+hUc+qttpZi3rY+I2oz3//iiak2VTC7Qk
         +zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405419; x=1781010219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SleKcaJS2ZrPKi8iOetVvP9OF/8OPZ5a/bR4NWlSpno=;
        b=pyCNqq9are0Qt3didopAfQqtnebHvvDgII06+eHnlSUBZjheEtQA+Zfo82PKdFT2CI
         HB+G1oZNQ9ny3/lIvqKzaRyTXEC1rGfAJfe8Z7HphTjxDR/XOU0J4L/QtWWwiIaiudLi
         AUVBypE8UY7Sj0V84mqdye8AUjy5KPlGrNJdzEQ7dwKyEWLHZloBRY9GhscSb0Za2QwC
         asc+FcPqT4IDoxBl2YLx0SdYJwu6K6DnU4WJqv5k6LFD2ckOGIZSqgsfjR1XiGZjm8ph
         l1vbTaXRgIj0KNmQT2HWfomsclQHbkBHIehuSwIoP2oPr9qsAs8MV6m28P7toaJHDCdd
         6Jjw==
X-Forwarded-Encrypted: i=1; AFNElJ+D60hE19GpWG/VChDi6GHJkkw8Kx0iDeK5bPttfcNd7/wmXXeZaBeCUTzBvYVf2ntocr2u@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4ij0NNTqmQZ+k7QwMaJWozhrKbW1z2HwwF86rXOzSKYhlWko0
	fEwdin6hyJ0X96B04Yaznh+KyuykUqh+YYlA5URaRl6rzewCu5kRmeXxka/YU+QW7yA=
X-Gm-Gg: Acq92OH0gHGLYPYmx33yoBJtyiW2cD+SZ6qUCcFgCoipswdVZIyF7dTOs71RTFT37Sf
	j3fQBOSVRZZUxrjXCi/vkKIMEmgQVkE0GiLlE89BUI3pAZhyMVJOaOb7kXoiG6H+cYKHhmJzP3Q
	mGsO2ZashDVzHPBvgfMg/0I+rc4//zPguzHVMcVMxmcBY4j40tXSjthsrJaTfqWRTfrIQ7FZA/m
	fPfBqaggYInGUXoR6PajfYMXJCxDMYrz+URePKyPxoOfaBoH7UTKLBLiqkR+LfTkULqzpq71VVg
	RMcV8oUl/N/vCRcJlKmKJZhpbxM1NcMBAB+HyS3lhfp4BH3f11Jd3UCwsyQzxsx6VwSvUMBn+hk
	VpPyVS4BdJnUKeB+ry7LHJzSXKiCXzpMStejdqY793bC+Rx/v1hUDLv1fytSg2peyXz68sgwIX1
	ZLeWf2hg9FM0AUuC8Bw9xDzA==
X-Received: by 2002:a17:907:d11:b0:bee:7c9b:fbcb with SMTP id a640c23a62f3a-beef9fc49cemr247115566b.5.1780405417123;
        Tue, 02 Jun 2026 06:03:37 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb85359bsm3373260a12.22.2026.06.02.06.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:36 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:54 -0300
Subject: [PATCH bpf-next RESEND v12 05/11] selftests/bpf: Make skeleton
 headers order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-5-27f898b3ba26@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=2402;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=h9YPiCy3D78JKFK96WbgjB0Gv9K8gRrn758T4BLo7I4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKabAdhXGu9n7wxD04JnGNenevlMwzntkoujlqFOAcVLNfePEOFjOxkzc/tTq4K7yqGPiLQGs/N
 FWoW72knPDwY=
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
index 49f6a5503e84..09de69a81112 100644
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

