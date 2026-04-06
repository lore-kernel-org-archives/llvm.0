Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA86394786
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499773; cv=none; b=LBJLtC3M9cyjm3cLWXNQ1a5cbU/2kDpxMGfcLbU8JiPuDJztl4qr7sLgMOMmEjtcvIcFP0fSNGa8ekJf5Hnwc+yOFc6pL1EncPMOsVVCOwXpLrbUkmLy/Tnfgrfu7HTyttUJUnDb6qTNUoTA7UiE7MFaNPelfu7E2Utf64l8obc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499773; c=relaxed/simple;
	bh=NO40hlT3q/UQLTKYN24Xfp26cxU/OmT6kvT04yakHR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8xNzads5gEpo2izQAo8kzzqQ813uWlhVvshFA0G1IHk28O+CKp1uiIj4Y1fHzIfGQ4bQFWw2BGDP6LkwInI6CcEwFWPiKWyFByDSobQ7vsnaQShaBV3lpX2vluzwOrtfdxT8ihUQmQlJT9uvw6vywYcqeGJY+pH269cMsCzYko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FjecDu4z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FjecDu4z"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso18257395e9.2
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499769; x=1776104569; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atRPErzIDwCuTw8U4bY1TIrRJ7Ayq0ANPp/cVJlRlp8=;
        b=FjecDu4z5Lkl2kqkkJmz8MPDY+Jc3ZOH+KlSjgxHuNveuXO+au/xYuDaiY9K8DeXXm
         sULcH2J2x8Ypho9at67ltt5zK022MC+4CgZnbF5Vy88VKB7Umute9ui5sAHvzi1MQKPp
         GtGDgoqyO8LgsPQf5qtQbjw7RGU9yvyyKVrZf0qNK7bpsjz9kdWGPSLMi6Joeg8KsyZT
         hPx0FkEi61exynnxXMGcvASTAI/J6BaP3Dcey3wwogADf1FItlw49zGYkBRw3O5ox6bG
         tPUHSCIagwO2CGsxO5xOTZgKRgr6Orwjz9jAhPTQ/FNEUYy5+XXqXsRl5gVwxuhdH167
         DRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499769; x=1776104569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=atRPErzIDwCuTw8U4bY1TIrRJ7Ayq0ANPp/cVJlRlp8=;
        b=VECl3tHe3KXyxfdOvh4bQOSTy9hWpE7Urt1tYPl7hxFzhCKMPfuZPJpxFTn9I5brSd
         iKEaXhUFfievyCebS5TBsykfEVQJ6y1a4p6ylVahfRSH8hI8LHoQstkxwINGKk87ArXi
         +V0BUKax33kaULtiAbfbcN8RO4qZdiNEpkGLXnIZd0dkADnx2OroxLod+h4w5EovM32y
         8cHNv0vnt9dZGvK6pB/1YSTf6/wSdcm9dn23ORhM3mjHFuatesnFd4ANk+5IEchwIV0Q
         pgr9j0U2Rt2tZkAFnJmGaPHHOpAVo+JubEddh265RjhuVdrAkknCmckuVzPjofGcAmYq
         yttg==
X-Forwarded-Encrypted: i=1; AJvYcCX+QPSN8lqMjH3XnTxt84N/3lcjYZXW5lX/x05v3Ax6sOaZ3FRimZsLX7NXSm1wHAmfZovz@lists.linux.dev
X-Gm-Message-State: AOJu0YxEfr6OX0WnDjlGV52xIHVqvFwachOX6pkeosqEj6oGqTmLPcaa
	Pry9388TWj4vvsys6YL2C4fGQRd7RnLS3hGIG2nML/WnjtKtNwpNLfVbKl9j7esQSoI=
X-Gm-Gg: AeBDievwN8nYZTI8+qn51doIhLcIgSSqqKhiCKS3h3/MDFWYg9hW2CQhkY7x/VQVwVP
	F0CDyeS3OfsT8aitJ8h474t9HY3m1lYwk6rxoUOsh7cd7F0npI9QKj8W091uPS131g1QyTOFVL0
	9jIXGaLeqZXcwDnKC3J8EBHJpHgimQXOBwyq9BJHxOd9f4Eh5dHxf1AHOrmPUIAiDcE4+Jk50A4
	Y41/mC9cwIZ/B4yRGKVxCdz1+ELYJLWW+2XFcgtWm8r2r3lPYeEN+v5vi+thokap9bAwz62ibHE
	pdvqZdt77F6YjgRllNqKx8R85+xWsDKdFHwJrSN2+x0ClBW1C+coAqM9yPFkFzFE5cyNC0OsN4v
	Nm040TEUsnzG3PkAOHd6T1G6vQW5Vufh1mkmO2Ea348nfFNcTbSUU+aNXYJlFvUtJB7nFs1uUY5
	gCbpymI1wn+ItU
X-Received: by 2002:a05:600c:6986:b0:485:445a:87d1 with SMTP id 5b1f17b1804b1-488996ecae3mr175406675e9.8.1775499769101;
        Mon, 06 Apr 2026 11:22:49 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1d1edsm17639880137.1.2026.04.06.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:48 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:21 -0300
Subject: [PATCH v4 09/10] selftests/bpf: Skip tests whose objects were not
 built
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-9-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=1740;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=NO40hlT3q/UQLTKYN24Xfp26cxU/OmT6kvT04yakHR8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJLZSqyIII0z7HGBBkZHOTxm0gTNEchdkW7FTR5AQiBKJz9SUvEUe+NAlCp5ZNF3Vg1QK5eqlsT
 Xcp8u98gwBAY=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When Kconfig options or missing headers cause a .test.o not to be
compiled, the corresponding prog_test_def entry in tests.h has NULL
for both run_test and run_serial_test. The existing infrastructure
check treats this case as a fatal coding error and calls exit().

Separate the two failure modes: having both function pointers non-NULL
is a genuine coding error and remains fatal. Having both NULL means
the test object was intentionally omitted from the build; mark it
should_run=false and continue so that the remaining tests are
unaffected.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_progs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index 0929f4a7bda4..85ac25a51a8d 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -2022,12 +2022,15 @@ int main(int argc, char **argv)
 		test->should_run = should_run(&env.test_selector,
 					      test->test_num, test->test_name);
 
-		if ((test->run_test == NULL && test->run_serial_test == NULL) ||
-		    (test->run_test != NULL && test->run_serial_test != NULL)) {
+		if (test->run_test && test->run_serial_test) {
 			fprintf(stderr, "Test %d:%s must have either test_%s() or serial_test_%sl() defined.\n",
 				test->test_num, test->test_name, test->test_name, test->test_name);
 			exit(EXIT_ERR_SETUP_INFRA);
 		}
+		if (!test->run_test && !test->run_serial_test) {
+			test->should_run = false;
+			continue;
+		}
 		if (test->should_run)
 			test->should_tmon = should_tmon(&env.tmon_selector, test->test_name);
 	}

-- 
2.53.0

