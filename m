Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4225E3C6A47
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228383; cv=none; b=kGMD4xaHnfE66InKsTxP2O8ZYPgEcwe0BkRDPv5yThQdAYSUHeEuTBPYjSZEtNY+hK5rEZuTJ/OmG3TbWtgMCHyg/rL0VdUPZISVVSnKkMn3uY0ICLmfC9A+wLB70yZXFpMQewUhSi8ygzqcWtKuDWni5cSl5bjWJld5MwKUzxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228383; c=relaxed/simple;
	bh=2f5aVKepAPVQ6QAMkIjSa6F59NytLhs5Yj9FO1U5vIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lt98pStB6JiIiNelm/kFiVwQwujJjdEI0SgbRft5PqEddFZYGR7tVpLZTbKIot1BpZrTl2lt0KLB9vsJizXOhDgAnG80ymXOJtEBik8ldiRPa5Hy7W37zckc/q8ImXKG3isWM95Hqsde4pV9VdPq+d3+hX4ZnVzMKAVyaMgkE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SJElv4Q4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SJElv4Q4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso20035055e9.2
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228381; x=1775833181; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKDIAWuRtDFHvkwbDQCWFyTrBdJA4yobh9R3wJFKPAY=;
        b=SJElv4Q4MK0RKC933DZxA8REg3VEcwhbz7jI4m/MFoUpoEC3LQO+zrmTfd7K2/p9Jc
         DKMacsBNrVqIVdd777QcC/Nd0y94XvAelTXa+AR3pRhEjad3a2qxWhAys7CPrCO3ZB/p
         3BoEGPSDNQC25egC47BxyBL/S8W70hAPDXvC6T0mOu9CBzJahzTD2m8g+YqO6+OfpmGA
         d9Dy//hmed115/BIRLYmx9AV0HLpJ4EYKk1OHa1QXpriqZJhmnWItb9qdmZvLD+Y98+H
         WueE1JEIDZJisxa1OOgWV6fb/hA4snMCyFqy8t9x58BH8FA1GFrSS9C2i9IB4NUDdcXT
         9vMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228381; x=1775833181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKDIAWuRtDFHvkwbDQCWFyTrBdJA4yobh9R3wJFKPAY=;
        b=bVinrn4bG9koFj2RB0y6trPjAGO2Y26F2UDctkaNBQ9CYw4D2I5dJCWuOG1GydHL9Q
         GhaeDCZ+ZAtXRaKgUkyVoUP+7EdymA9//0FP4fvKF60X9j3mJtkueDgAQgKIG9rY5Usn
         63D6shU5uGE4r4zdjj0nnMmhJ3B8Q90yLdua5/VkGQ73rkPf6hXeWoNnhmpT8YzGHanq
         TcREzx0oGtS+Uq17zfHZWv6dxxrvhXSdaZTgrqAy8sUj0/6MiLE9xCRTbqO9r1Rkwo/B
         mQYBk1gGFZhI/1ZnzRSf/PAXPHIbSyiOOQ3WwWsB0IaSkv3AmFafX6WgutKHbhjbjowO
         yMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtiLltn+fSdAMZm8Ivi6qNCIWe6gk6LDox3Tq/3dYPlRL005be8fCWXj6JnRs/nw7mWF8H@lists.linux.dev
X-Gm-Message-State: AOJu0YzU2szpaxHDdURvKiFqslkNPfV4byh6A0X4g9tRmbAI9SM3UEhj
	baXQhnnjFO3jSlW+5YTCRHJ9cZ00eWvCiGDxlaPPUDJvOAsLcpkjtKE3P5awuw488Oc=
X-Gm-Gg: ATEYQzyhI0idTjyYx7nN+o57aCMO5JOJMFE3g9WHtUt09FqwBotiosgAiTswqCb579A
	yQEDhCdWRVQuCx7IXOAa1SOO62pZuFDiWQ0Ahtsbz1C5o3jWv2kBQ0H9RM5OssP5GTyadB45iio
	4zWG7rAKqPxuERkGGRL5mVqx7ttziskpIpk0j9/18MKRn/yJX6Fmk5VAUNeiFZLM4fFReEbAkzD
	b4J9pHeJl4py1ZJFxxkV5YSC/LEqmHE7atIpHymZ7u4pFoJso7yasc4XiK+bSgf08xsgnm2yMdT
	upiv3J0isRkmgbIjGyS7TU1NB6Tb7mkl96cTm6vL11hlZ345JZ6TuBenWZe1582VtDB64n2xS9U
	mXmo7pIw/4KEwzICG/iusLY2Vc5LxJN7oux4AcrFFKPU+A3pXql5fthaykkGzg690unnVjChKa4
	6mpIL1Hurj
X-Received: by 2002:a05:600c:6092:b0:487:288:1199 with SMTP id 5b1f17b1804b1-488997dfb41mr60010355e9.28.1775228380694;
        Fri, 03 Apr 2026 07:59:40 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9cbbasm7312493e0c.9.2026.04.03.07.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:39 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:59:02 -0300
Subject: [PATCH v2 09/10] selftests/bpf: Skip tests whose objects were not
 built
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-9-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1739;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=2f5aVKepAPVQ6QAMkIjSa6F59NytLhs5Yj9FO1U5vIg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAv+Ss+JdaUOsPfoNWBRS+cKg3MWINgTH7ahWzB/w2k2cSu+EqYkRVlvI0zjzESS22puaq6LMRH
 B1yX8kJ5QIQ0=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When Kconfig options or missing headers cause a .test.o not to be compiled,
the corresponding prog_test_def entry in tests.h has NULL for both run_test
and run_serial_test. The existing infrastructure check treats this case as
a fatal coding error and calls exit().

Separate the two failure modes: having both function pointers non-NULL is a
genuine coding error and remains fatal. Having both NULL means the test
object was intentionally omitted from the build; mark it should_run=false
and continue so that the remaining tests are unaffected.

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

