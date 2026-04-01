Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D2747AF63
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060154; cv=none; b=UqEdnBZxL+kJlR4pocZdMFEyXhs5l3L56SVQUdvAf0zkVKnIovpmkj/A1k0KZ75ywhM6F3IXSL37dldGY0K1F6rMxdq/2oflLAluWXAtbqeG5qlIfza4acPScBa4rErPJYtMBSmW4cAjnlbbzc3MAcm5VXwdQOuGki+nHcn6cco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060154; c=relaxed/simple;
	bh=5Cadb80gWkZ0gleJDaQiHCYtLQOCdz43lmTsJFbr0dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0ROumxwTqEAyWgcrxfN0UWBp9J+X/Cc8HKJZ/jmfEBIz4QdB6UtK6FNkiUsJsexRzJcOq8rLp+t2TV16jIe97OQEsdGSF9AKGBZP58ZemfwqYbfjaVfVBZezNnoI6FfMZkV0z6+2mOP2rhWf1AfcQzMcF8D/aiOXCS4V3OZm5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pwz6Pf0v; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pwz6Pf0v"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fb439299so66494855e9.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060149; x=1775664949; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlnZjdecNF/JqDBN7Kmrnk0aaNOEXID4WQmoE0dJxmY=;
        b=Pwz6Pf0vRudXdU5fZsS348dqHZolcbOl8YFeMCx3I3l80elRPMdCAHuWh/Uv5OjXJR
         +99YzVAfxbHVZm/9JvZ24k78RxcRkri4d9l1cBf2oV9L0oMtPixWV9zSseT6bOTMpNPt
         pVV7ke39Q6tj0pVYwxwjCzH0uGbYo4CqfbIZEdbKiQSyEbTgvQbrRI+FDCnM1ivBsDkS
         rgOUUJfk+9T0ezxP3iTGr6eGs+y4GKWGaSJGr3U4uiCUx6V6bt0L4GVCPMtFjgIIqGCw
         1/RyDKDq2EEN2Z7jghMRkeAGsT2e+Hjg6UVModjRxBxmgi1h/0ToR2U/NUUgZ7tbM/mm
         GDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060149; x=1775664949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QlnZjdecNF/JqDBN7Kmrnk0aaNOEXID4WQmoE0dJxmY=;
        b=fDKo4ZmSlDdgE/tr343EtzR+4wH+evE1UmnqEK0ZKoof6VElhRIi2RnSN+tYbeUHUy
         R9NIBC3bP6gYjcFNkZ9Su61b66vogW1QEtysVeioZRfwv7BRXA5RtrVPE9kcyuglsn56
         PCng+62ArlW2UTBcaza0OBSCQKmP5ahY9MoqUYo4+USSCV5vvNhIg4Vyu4ZgDlmBm/R/
         L1UpuFgdfiNANssIRxLwYNJ0hT/cJVB3YXMl7ga1bOb1AtJTGVAhH7wFdJii8gGpP1mQ
         MCFmSV7LjOOfdpUEmR7qqCZXLK6oTcN6uCyR8JmOFJjFJQQ6GqF3DY0vR0vh+UKCPhnG
         j+zg==
X-Forwarded-Encrypted: i=1; AJvYcCXQo1CPIu2pfkTuvu3LGDoYvWbC2+ns/LKlgaDnl4Z7XyVGc1CBx91ZzXtiKuU36NFrTff7@lists.linux.dev
X-Gm-Message-State: AOJu0YxSue5PjpbDjmcdKvpSmMiOVLzyrrWCsacC9fNsoXuWg4SS8xPp
	F1TTp9A6VXBnYyRsZdbk2YqeNRSx8FGvbtx8Q/Go3z0PY6dq2UWEFupEQDY6o+ZnBHg=
X-Gm-Gg: ATEYQzxew+GnxyKcARDwJ8L+z8+/7alYSMaftwr1ytDGGI9RJm7c0cDz0pttr+K4Z4X
	FkUfw9OhmO24QInba9ycxBhvyJoWOsAbVUdlCl9kS7UyFzXqOFfyHd2dqkrnOrI9wnOn7I1LPlk
	XmzgAsTF6E0W3uSYXIiS+U8TjOs3ryJAEc3X4rNzudxwbVi6Fu41iV6UsjK3y5BPid1Es/OhHXV
	riFidS6m6hvcG3w30jn2CT5Fyaev6JgA8JmED8ZhWzPFPRylOCUKUXIT6Z8/nE3emwlfbHMkxWx
	7LGXJY7ITe1RPQpSbZ5LsknENsiKENuhwA/BqgdpS/LsaqZJgAyEO7/yqjujeQxmlAsp4vlRuK5
	jE8ASdAGvcVFkN2wzhRW093eBddJ76ecVgz3rCFWn5E2o0EejhraeTY5a6ED2lIl6aTjmQfsBa8
	LAZLph7ZzG
X-Received: by 2002:a05:600c:c87:b0:487:13d:4e77 with SMTP id 5b1f17b1804b1-488835b790cmr66574175e9.27.1775060149503;
        Wed, 01 Apr 2026 09:15:49 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6058304af93sm201322137.7.2026.04.01.09.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:48 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:11 -0300
Subject: [PATCH 04/10] selftests/bpf: Make skeleton headers order-only
 prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-4-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1534;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=5Cadb80gWkZ0gleJDaQiHCYtLQOCdz43lmTsJFbr0dk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI2ZhEFe22dW9QeVxHpYwL2xI2ZQbvN9TAnbyhqspFCgOTyLZN++3o4pyl9jWddsdpZIIcnvA8o
 DNDqK7SvYCw8=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C pre-processor and list
actual #include dependencies. Skeleton headers are not #included directly;
they are merely needed before compilation starts so that the compiler can
find them.

Making them order-only prerequisites of .test.d means that a missing or
newly-generated skeleton does not invalidate the .test.d timestamp,
avoiding unnecessary recompilation and, more importantly, avoiding build
errors when a skeleton was intentionally skipped due to a BPF compilation
failure.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 781238152c4f..72f576a8236a 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -697,11 +697,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
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

