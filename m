Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6501D47D941
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060173; cv=none; b=nFFaxAwQnpyBnTLzVmllhX42u93dDwkRsyjwRj2BO1WsscggNIuJf0yWGb5/odqf0763fi2o0SD7iBC/v0YQaGlVAE9lGhsVh7fGnttHU/c/64ZLNXBaBDgKflwxU34bo8vkYl6EZxyjUD4HBqDv80YTWAZRxUQiFdsDg4K2kKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060173; c=relaxed/simple;
	bh=2f5aVKepAPVQ6QAMkIjSa6F59NytLhs5Yj9FO1U5vIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKoLdv5VN5v8lQco6/2Qr/dx7Po30dqVdcG20Xf//AKmFaRR8hm9Yfh4QUkK6ePhb2savkAMh6q6obSOmCZ8ckXGLVU/D53HA7RuMXR1a1xjHXWJVcL+rjOLNzhH4P5q3HlWL+XOHI8ASnd4bbLK9zv1nLfQR5LrTPfJeCYZJcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Um+Swa6n; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Um+Swa6n"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso64180125e9.1
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060167; x=1775664967; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKDIAWuRtDFHvkwbDQCWFyTrBdJA4yobh9R3wJFKPAY=;
        b=Um+Swa6nv8grotGzuD67sxw08zg1/6N60sQMqXUpqAVbmSaZ/P9M6SwhteaHptshUE
         yDwwKi6E8RHs2gQrwBKJEfc7wuoMIOZd9LVD+stEsAtC2C3zAtOoHcQ0sjWOR6ZfsICF
         1WOtNAYfGyGk/WstgM4DVz7i3SXA93JckUU4E/Rd3YvgduQJy2IzSKlYUK1tnjE1lNCZ
         Em279+NQ/lv0MkkR3K3csxChzQoOcC8mn48vuZbYk3TeN1pLAGR09rUNrTOlHEcAQiAg
         vxaRgG1Z+YwT1dL9MReaksAKnkTiN8+nLIqV9ZNnFwp6LR1mrxJOLyCJJcNXQuRnoaQL
         oA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060167; x=1775664967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKDIAWuRtDFHvkwbDQCWFyTrBdJA4yobh9R3wJFKPAY=;
        b=ZC0TPCqjFVBNAy/TJaaBo2kKmchPDBfn2jPCSbRWpsqAxeaTuOm6NxtoOYiXWPfV5b
         Yiwqsz5zkuwY7fij8ivG+60/ptXEi2F2nSHRWpRCEGJgQEEOywD+YYKcSPX8j4p26xSp
         J8vawsQbXdhhbKb6FJWW8G3YNYiVUTgEhvxcDVIk9iumNA0uRjyT3hLhi9XKrlkgHSn7
         AyvTgPZI+tr9R3AVetMHqlMFsbvUqJUQDhFQ/QS0cv6G6jn3sduMAqa3zD2DWo6AzFYy
         PQLQHQFs3/JAYkyimmuhVxiMhVcfeJYrt2S+U5mKuDQbirZRMyDBVaNYOOuK44vT8idO
         o8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZXyRQk7m/rlU0GpEwYKcWI3iJ5fvDNukCTJNPg6xnfcklRjSH0tJxGDIXR6adgYchiJzm@lists.linux.dev
X-Gm-Message-State: AOJu0YypTAdKEgMAqkOydY64y7V12ehvYewmiUApGEXEAxjOpOafI/0o
	zhJYXI+MubwIJ7CPFZuCTAWd9NMgwOhZSIm6vaWK3//ZEuYyqnvmi8KuH9bUbQNMZYg=
X-Gm-Gg: ATEYQzz8XlMhOoHK/AX0b/0M8eDPsnfKz4/YSiPph/dGiCwpY3IeLyI3HfHubxgzqfy
	W7sQ4T9qYjIcRTjvXUM4UPuxfPLlNFCPJKd1Fn1vt6mwnlL5mUUD4/aGF1+JMvC+eeOluKBjxJY
	CDAJRqnlwa4nCJLp6YzuAesyUDaENG3GNhA7BqyCFeSHTYEixMsycTu4ZF1Z0T6CnOzgthwmIK7
	M5zNG78ghWztDE23SBXGVJOL7a4Rp7Hx8JXfR1rVdV9M5vUF2u9FC+hsSrGCJmn5C/1ysYSewZf
	wuHu+bRpbGJ+3LYs1tTKXxw5FXE2+2jvFzm8rJ7xf+O24XY6DYswVwmsQbNZBM6RgyvrYeRUI7P
	WRKvdqavoE1yvTKB1kVVXAmdeQZF97e5tCpALMgoT+fqRcdKhJfaGCOWBse/bJkiTmyos7v5nUQ
	wZTc4WXqCV
X-Received: by 2002:a05:600c:a016:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-4888359d87amr72407385e9.20.1775060166677;
        Wed, 01 Apr 2026 09:16:06 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1cc7dsm248896137.2.2026.04.01.09.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:16:05 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:16 -0300
Subject: [PATCH 09/10] selftests/bpf: Skip tests whose objects were not
 built
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-9-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1739;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=2f5aVKepAPVQ6QAMkIjSa6F59NytLhs5Yj9FO1U5vIg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QESQ8jQYRTSBwqtN8EitrNVoaqkz400h/f5Q/b0EPyzDIcsKlqjHpAExkAHN4X0lp2TmRmgC7E0
 kwIDQWtvo3A0=
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

