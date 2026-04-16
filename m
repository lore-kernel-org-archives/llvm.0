Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3123B8955
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367885; cv=none; b=FKDasNTVYUJCyR/M3jlOv6NbqdSrb1Xx6dj79XqfNQoy8EwIn+wKkYVJUcT1FozzKaK6LelY6i8x4nHWcVthNa9cz6wKsd46QVtBL91nUChyJxxGIRTXVrJRCOIHqoWh99/hi6soSfXXER7VpdH10Ci9xCmNUbO3I13P+9K24kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367885; c=relaxed/simple;
	bh=XgVya1wOhlmwdTfwic9NIwBF44z1ohItenbrD/1EmJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWErR38zfnR0zBV7ZTk8M+FQ4k31eYuzclHRn1hFf2uxzouH77b8GEEr5Ctv167kKM+gpWeJT1ne6Ir1HPivgJiYGfovIW0aespnh0fd/yAzYx32AiwKfTKfc5lHyCEUMCTmhA1qK+W3nVRs2Yn1Rrl9F1GV5F9BD5EmUWTXWlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CBwwcv9z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CBwwcv9z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so57792775e9.2
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367876; x=1776972676; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFAhrEcbWUNGkUNeZMznGeM5elrK7tHUIUxprsV4V9k=;
        b=CBwwcv9zK9ngG7S9+pSqgyrO4tScgvekx2xOCm1AQN0lykAy+uasT3pwlnmX/yIxts
         znDhgJg9OVIuvGhXcMi3JKzfylwdvApe/WYDyLaYBajtXznkZcf3w4YV79e0rzgDl34r
         ZWwL1MEfhbwDXkqWqFLDL14HNaqGG0gsmwZTbYlYvNlkoCqRySJImFc2xujYOYlgY2L/
         P71MMKYsSTVR4eu7W0y5qU0B5V0G1f8rzdL+aPsCfbfR5pOS1RNzX9njwkQwiLXDDo1i
         2xfiViGLtMTfxdikZjCnvcBMd2zx8yWqajDMoi0/QtCr4klokbYWV1blqUn0i/p+Rc+M
         gZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367876; x=1776972676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFAhrEcbWUNGkUNeZMznGeM5elrK7tHUIUxprsV4V9k=;
        b=KEnemI4wkdcJVdeohncWEZ65ZFdctR+GVKy0gcVlePfdnqwGSY92IkdZZ0xCOpnk/E
         GWB8TDQ8A3qFJDdaFwTmQG8JdtPekw4S6RwDit4GKzoPZJWnnC+tiP644NwYC1kTzGEQ
         wPexzrRr8WqtQNA7ZMTiAWBEbs6D2oPxTBrUD2AjgcUnc8+M2IcY4NyR1m4hNBDvAeQc
         ECqFmPdWqJDOKh2C567h6l740HPxiHU4Or/uY57e2yca2g4XZYAOBU+UaV50//wR8OIi
         xEF5S8oag8hlg2aiD/T6vsAb9k+2W8Xyw+MDlEXOziVr2vpUVHWbbSgY7HZnXs/Aq2Cq
         6aZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aR4/B5K+pjG0BViUA4aDuieO4vx8wkmUrpOYgt10Od7LnIkt9nfCFPwZYHY88V7i0rLeD@lists.linux.dev
X-Gm-Message-State: AOJu0YyAYdLrJ4syMjHFFwPU25WfERqwADLC+x6bT7CuoyayNFclEQej
	fJDlkSiIBYyFtdCXCCLlG6K0wCwZ21bVcpgGvBYskOGJwTPdsOItVgszluPR4sqHrcQ=
X-Gm-Gg: AeBDieuHTmem6k6tK9saAjzNtA1+YqvJqZLMBaJ3/T/oN5DFXfBoy8VEJ+LAUvEzBVT
	9+15gMdGc5Yho9oWeEkadvcg7bc167rs78IJCqY6s1fP3wsZoHfC5kUr0itVLDtxWfOUDkFkEm3
	a91x25t0lI7DVNPiqtBpk607v0i3iI228zFJgm5jncqAN0ANAHO8nlqzXaMghp4a4QeXgW9EfVj
	wWLZjvo4MsFQmPJccyktXoF13ODXtlea1NReabGcP+KaC0Wt/u1Faq1TZsJpKn6ydyj1qGKf4JT
	jBXhNL2/zFKPwcYMztgQmT5JAMtVNHjvqqQ4ZHRrzhCZcoHWk54/D83l3iwcmYl+buXNXzz6Hrs
	x2aTdKxRyIiN52C4jK3gMClPUaO8j3LqOPNwS+uKOywZWsl0ZoJtqYa7HbzTpObKfxP51PUq3XK
	Zp+/zrh4ktbf04/KokGmJc552o+PIr94Vwng==
X-Received: by 2002:a05:600c:c094:b0:488:c530:48a0 with SMTP id 5b1f17b1804b1-488fb29afaamr2206105e9.24.1776367876414;
        Thu, 16 Apr 2026 12:31:16 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c10a9a3sm10199034eec.2.2026.04.16.12.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:15 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:54 -0300
Subject: [PATCH bpf-next v7 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-5-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
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
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=1610;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=XgVya1wOhlmwdTfwic9NIwBF44z1ohItenbrD/1EmJk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA8gh3dRHBMtwujYN77ELK1Q2y3lgLFLhXwEdccEQHfAMu9omeUR05M2rBWqvjkJko8y9zwINYL
 QnWPHjqrffwg=
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

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 7d1e5d6c30ec..b3eaa4a93707 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -717,11 +717,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
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
2.53.0

