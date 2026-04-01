Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CAD47AF4D
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060151; cv=none; b=d4w9ArKWPcppd79Z/EDdOC4yHVnAzRbLBEZ4AsGT3UZYPdeY3oGwJ/twpxS3Ip0rdW9WiKtakkRmOcWJZcwTGoC87yruSj2h9aEYmhvNd26OJCEcCvQb2mpdC1x8JKoHDWGw/oLrloW6cgcg4vqTywkqlYOeHk8TJ5DhykAiPuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060151; c=relaxed/simple;
	bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ge5iRhw3jKWrfLNM6kkW5LLgUfRx7ADktb90QPxeEt3lEjekLyJnhj+/UJfAXl3Xxe0O6KjBFWOosoldrYLZzPQLqOYR8yBeM4p+hbD+IBRvkSra6+m3Eg6EsuKQVGiTzsUwEMBJydlp+NcEKzkK4zq+zNXRP+wW+24OvGwV/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TEZf39k5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TEZf39k5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso71640015e9.3
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060146; x=1775664946; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=TEZf39k5QFTkYFU9gwq00RfnglOw9BLmiUReVvgaBtKXDuYpKs6+Xb/0wqSwLAHqB2
         JWJKTKzci5NXZgNT/he0rM51BOtNJsUvB3vsFoBgJ5VkVMhJwFi/pEEsptQT+wQmHHa2
         hK7D0xQerrd3MuEa0NeGebioSLYYqVE4VRi71T5Z4yNl12Yva1lNoyobJKHPxkUXKShZ
         9vQmwYn3RLkixGOHmLJd9HGu5uRf214vw6Py2FADnMGC3rXzwfxnJBZjrro0aYwrKJY/
         hmMEZjMuqgitsck1jmEB7yhIX4q0GX9aNROSqcKe88D2N2HJV7ceZ+EgedDK1mxFw83m
         d52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060146; x=1775664946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=CVthwyWlVPo8WG4NQb3X9zxSUQcTKgASwchEiWLRHWUc/kCk4euzVZ7Kv19Vqb6SRK
         gekA417tnu2AKhUcyAFILdnrgc4bpqOtSUWVGFkHV45HQ+8yd/AgvLGMtlKYTJh9tf8E
         8W1o0TQdg8A4mgRloQGUk3B9DY3FYUNZT3ZAQIoOxc0PX/6Ta3jK0MJ1s3wamOl6/OXX
         P/fmYDvr70xe/Z1leOfOWXCTyZEb6i92KYu+Qwd+n6iZTGrC0dhnWLkKi3RrC1cEGUZf
         yu+BvXZN0gdk2xU/HkAwywnu0jrYagJ1vfj61OZUM4zQjxhlpfjSfSv42OsTnFQCzDLJ
         gKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkLc75DguRHeQJr9PfurEqesqvchM6ZHH/n+zmAXSQu985j2mc/2I5Z03LTeRw3smnhUbg@lists.linux.dev
X-Gm-Message-State: AOJu0YxvspzrnbCbaJpBzA4arZDTnl2SaMrRFERjVnHtBCaxWUmfCvgb
	eAhzHD4wEXEwm1IhfxWQq/hXCUDvKSfxED52dYU24xr0vVKA4yLDmdVGtQJNCBQrmvo=
X-Gm-Gg: ATEYQzwudb1fjE/PdMDygHveYHvp7Cf2dgpFr1mAFUnBfhHy5395qH1iEzfzhl6TyTA
	rI+DYubn1RLPMvFBGqQ3l5gl2Fj4CFRSayYmJ4lHcPxxIaV3Dwn6+aYhDjJr47Q7n94Ey1vHiV8
	TdzLB5l+DPteYtsaVt9YeID8yDbSSb+Wam2GZ+W6HyYw5d2FFL03qHetQFWlHMnwXrVQuW6MsAZ
	eZVflzhjUIYKoy82KNaM6aK+NUynBxrUeDoJiV/Av3fHPb84+XuRrIo+iJhlkgrPMlIeIAtHZRk
	vpKSjME3ENaiFcYJicZIrLjWdOZHztvT+KKMro9V5D2iAtkiHv1pd1XJRlKOg97KmbMGX7CnPub
	7rnfOUEI9bppEjHj8ADnrS/WNobEyV1THO9uVjTgKoAYnd4gH/vsuqtvxxSohJa007r2ACjhiv2
	BCwrUUiLFX
X-Received: by 2002:a05:600c:848d:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-488835b78f1mr78263475e9.29.1775060145641;
        Wed, 01 Apr 2026 09:15:45 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb8515f9sm480658241.6.2026.04.01.09.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:44 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:10 -0300
Subject: [PATCH 03/10] selftests/bpf: Avoid rebuilds when running
 emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-3-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1031;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMsJ69itcpfkywotPoUEtnEUJMnBYAIgSDZL85c3MrgvDq7t1aLeZLcV61FfzyM/1a0vB/wWLMM
 37EVYpHuMKgY=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

emit_tests is used while installing selftests to generate the kselftest
list. Pulling in .d files for this goal can trigger BPF rebuild rules and
mix build output into list generation.

Skip dependency file inclusion for emit_tests, like clean goals, so list
generation stays side-effect free.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 6052bba2c157..781238152c4f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -703,7 +703,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.53.0

