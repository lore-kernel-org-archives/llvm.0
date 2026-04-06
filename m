Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD80388E63
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491928; cv=none; b=NQ4ESMWt5U19miGWnV8RzAw+G/Jb1zC6QFpyfiBKskIw9Bz9QK53t7Z2GPICWWm6tvHnj3Mmp3knzDwKKMboFrR0JXQWQVBlYn8yZWV7OikLX3AogLMcp30HAeJlEsF2rOY93p25AawjqUOWEaptYaNCC7CncgWt5Zk5X0q+6+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491928; c=relaxed/simple;
	bh=NO40hlT3q/UQLTKYN24Xfp26cxU/OmT6kvT04yakHR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sw3beS63FIk7wWJQpV1FqiYfQ9PLf+bA7tps8mBx7TLA75R8iuV7NI/MfKOa04BJOiCpRlKoPPf+bj01M8KBpVz8GWrrmKcWH2eTbuZ2cVQeTNUv2RQbaLcZ8wv9GV96f2Jud0XRDJcvFkZ/CLsvU9U3aCXlAuwHiL3xnz7KDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X3hZnKfX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X3hZnKfX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso19824925e9.3
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491925; x=1776096725; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atRPErzIDwCuTw8U4bY1TIrRJ7Ayq0ANPp/cVJlRlp8=;
        b=X3hZnKfXXSouZ8nuZ7WJve4d9rjtU+GirsKJA0Skx0rfPGC9Y8gBzEEiCubIxd3aP/
         h3F+bEVPaNBgQICBeVBNgsZPhHqGl2FTyWLaSZlYNRAOdBaI322VcfQpsv5fQaisWQmz
         niHTrR6D36MmFRG2zr5F+Kzz+uxSNG5Xsbwv+N+97IbS5QSS01GQk3rAVR2HsrxeldSu
         rE4DCFxEzJkgB875O4B4MePDcmrF5S5yycpT2TJXMG38hNJ0N8ACcgbh+ozTpRC4N/CS
         mNxEQBO1dTag5j0NY6IOtaMilB6TJQwqyvMTLAGwmWd3hlRgjaOr+vTYEB4u8v7S/1oW
         3t8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491925; x=1776096725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=atRPErzIDwCuTw8U4bY1TIrRJ7Ayq0ANPp/cVJlRlp8=;
        b=JI3EnZkTchOv/qu1hOB4m4OKroZ7MkwQPOTg9rSKCATg+K8QCwbnVhU0xiIo0iGJ+r
         kfnQNmtLDpsCjqa7eQAvrLZ3KRUkzuXfnwg11sLVVhQ3YOjWq1IiQm+N/SNYYyVxSsi+
         65qHP9RNfQvFdQCW2UsosxV6Ag5D037vwjQCyF052BIlAzfRh4Ye9tP/cM+mhkFGV+Bx
         2KG6Vy/Xg2uXPUwTfCWe2ip/1RAE5K9eOBgq1XTscFE+8OcWI7XDPO4v/8J9w7+jy/Vy
         C+oqiZPMW8MkzBVdnUGh/jCtUOixu60UHpSQv3LOIPyUVJjQ1XZcgEZf4dpLit36QOxU
         Km3A==
X-Forwarded-Encrypted: i=1; AJvYcCXmfRNI5OOGtZn+VgFaTbHIr3VuO82pYj27WQrG3PIluTUYjyMXauChWI9Rv5kQB/6rCaev@lists.linux.dev
X-Gm-Message-State: AOJu0YwklhZwlA1qp9kRMBr9aMTz0HFxP1d8xfL+pleMw21N6sEDrlA/
	qHTJrU2I0RXsr1DhkB2+kXpsAgOblFLrwxiooSwYAQrP/487V4oO0bSfjZpaMAwHVjs=
X-Gm-Gg: AeBDievkvbqRidNogPcTaHkxz8ZTDCim7FQ41I7rEul87cLMOLyzEdrB+e9BqcI2cAg
	D0TM6Xhx5MtTdb1YX2YmKKLKdOfaltr/wMF6IaZlC8ADuPTqo6c0cQJ/p2A5CkT+LgNIIcSBVae
	dxD5PmQZuuELlyRETElpLU6K+Hi4r+VNbiWbkJXJhQlKlJrrh72K8js1DqqEqlem3L0oK66aKJs
	UYQgqB/8cASnjN7omcFW+imXMuo2c50I6ZlQ4njmCo3eHQAGVAL5I/xAnbh9PMAS6bH+1dsTKNj
	rYi8b4P3KGKmaoF2oSh8togmo1uQ3W5yaYmwpAQ4WVcwYOLV6oPxfqOwZbGj/UyDDT8NZKinTZj
	FvBbi7L+g+A0MjisRRF1CrHzE5vLE2A8yFOxz0N8zCBFMR8UsHbC4vQbcbWnhNs9ANrhCpYacbI
	mVtEptcQN7ht6W
X-Received: by 2002:a05:600c:3acb:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-4889972b76amr197342355e9.13.1775491924916;
        Mon, 06 Apr 2026 09:12:04 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e730e9sm17177979137.6.2026.04.06.09.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:12:04 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:32 -0300
Subject: [PATCH v3 10/11] selftests/bpf: Skip tests whose objects were not
 built
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-10-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=1740;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=NO40hlT3q/UQLTKYN24Xfp26cxU/OmT6kvT04yakHR8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBcPqnkEcBf86Dx9YUH5f7oorhjFt+yo7AGaRuOZT+r9Mmky2DTUhYKYG5fJM6/muLiwdhDW948
 UdoUfl6iz/g8=
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

