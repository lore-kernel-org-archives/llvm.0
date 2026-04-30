Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0230E466B6A
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564953; cv=none; b=XZm7mKdBAx8pnA+aSai+hRGF7LAJosUXKc1/GtKAwJozFivbgDv1jvylTFRF4JBlo5/1HhdQwZ6nWDk5sh2WuSGLDFL3KPrIn4DeVMzmG9ZOem835iq73dtho4PySAyTs58ah1u7fLcoZ5tkbNmZUboRHYYvZhX0Dwsy5ibE1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564953; c=relaxed/simple;
	bh=aqXG984YlUxMtsZ+i7vquyVJaGX8IceA6DEnTDh+TX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3dsd+xcOIRaPori+odSvCSi+h4PGrxEoeqsLJCYBl5TE8aFrFArT9yLoygpwnUKp0WETtSGE2boIRl9/fZ8G1k2rTFyXFomV1i8UBHyN9ic1cWfu+fz+64OUJWOjelXyn3e9uYCOZJOiszT5x32er7HcH7D7GvZpXbqBtqqeTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DNeCJo44; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DNeCJo44"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bad54961385so179070266b.2
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 09:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564950; x=1778169750; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysP9AGtPxCAbfR+Tj7mfuITrZ+N0ZILV2wyZ0Jzr9sk=;
        b=DNeCJo44a67dRL8dD7iBsqr4IePYIsyWMx/v3h9KRunZsHXM1bEWXTl0VwGFWjjpCc
         CRCMZq/sIm7cB0hHGnZ9uKmG6rpKvHN6jDaZATwILQtZWzFgkSNEjpHuue2hncOw5CzH
         AKxhegXw7nTeLj1CcYbSscu5FJ3UKcaF3BA8MEusS9skFOmNR8wXOielTnECrML0NH5K
         s0dggZe0mItpLsVcBLIYGKk4mzLkACsyUfY1sYuwtWmEgUY9U20kAABX9Dw1WwFm7/FU
         4os9M1ZNbSdkZAo0T19961Pg41528w42pUAziqrQ3Ui8uyV3SRXzpIjvid3cI3wSfVGq
         IGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564950; x=1778169750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ysP9AGtPxCAbfR+Tj7mfuITrZ+N0ZILV2wyZ0Jzr9sk=;
        b=WSQBUTC5CFchpTqIPNAiijia8ZZBLQxxvVCvFWh2Naw8j3Kz2l0f1SFLp2c83kjVju
         rgwIIqL0y9c7KWerp4iG0zY5o4EV7no98redPZyXoLRDX3EWay0HoaoudqLM7KQRctow
         Im/V6EB2kab8EKXDclVbeBJwyidTVRMTp7aAjr+r0ivd5KCr2gpjDIYIPyqL8zjxB6EP
         w4CnFicd5uTdnJY1Jk0SlL/OidclZXc3a0hxZ/+XC1nrDcoNPJh0Lff0r9L7ixpWo/DE
         2Qp1vIQThbMnfXsqXd6qZjNfMFIaYqeDRWWaESMU2K+cwSWvSo267Hfrmu6sZjP8QdEp
         zJag==
X-Forwarded-Encrypted: i=1; AFNElJ/LM8sd+lxI0UWmhnXKMFIbKxyTz5btpffirnd+tCKckOtfYRkKIO/vOOOJjZOKHFx7f3N/@lists.linux.dev
X-Gm-Message-State: AOJu0YznrDs234ooE9+cS13jf1qWsEbggLSe9xmWWZCulwowxvz2O7QD
	BfleMjZmu38FtDYAVWgyus3XM5azP9OzoDZxFelV84Indf6fbmTab2BLN4m0OkwDBTA=
X-Gm-Gg: AeBDieufPkZqD4j8cY7JoUgVbhwLnzd2nx9Xa9k83BrbWszwMU0TEaBt+VpvcCC+6PE
	f0o/oDyyzxBYMK1nHYZ0w0tSqTt8lvWOi1tYKdp1ryNqd9asRWPHVTLyjM2RCQ7f1TEegSobrlf
	Uq/ZgMbrTmqr9r/GJL5d+P0gMBxm+7H8DRtZAQbgsmPooiNwYDjRfZMjyJhwwhqvJKYQ8luHIgH
	2VNUCB9+s8UEv1+GDDXozWam9E51uE+Zi3Zjrww+pFTygSvhJa+AlxQXXZHRmBF35WVMsiPPiut
	ZVGYOYcatouyYH2sAeUwtGJGFrAXNxH31Y2PP1BOnLEBx+1bLGXfaP8J9hGCH5/lEC+BZPe+Kn6
	y/beoGXqdgMAGIYi57qllvUEcR6WSb7y/yz8Yt2RN2+Lee4etxv9NWvHYyGIHcrgP3Tb5SFs5m8
	cliyXqa85GxjxUJ3WqKctqoY0H
X-Received: by 2002:a17:907:e152:b0:ba7:a94d:af83 with SMTP id a640c23a62f3a-bbac6ac5c01mr160316966b.31.1777564950276;
        Thu, 30 Apr 2026 09:02:30 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd54eeb248sm10160867b3.6.2026.04.30.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:29 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:06 -0300
Subject: [PATCH bpf-next v11 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-5-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=2402;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aqXG984YlUxMtsZ+i7vquyVJaGX8IceA6DEnTDh+TX4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCo6mLZWKSZcDdzagdfeT46AKZ9kv7Fqh2BX7R6mYzSammKbTE4ly9UfPlsCuDiEdbFVprW9rfG
 xim9o8BOE/gs=
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

