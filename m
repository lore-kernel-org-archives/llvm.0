Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5C47B40D
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060158; cv=none; b=srKY/BvBW/8UqgPjNNJAjiPJFm4tTD3tj8T9ipm3wUHMQVJYeiYkPSM/VzIF2PAzC1xudafrcnE2IcsLzzv5pQDQ8ZDDZ8uY1Hm1ey6at5JFuU6Q5WVgfeAZ1BDv3PqiqjfLsBCT6E8RaSaHIDwkpvs/qBVzP1lszMpFE41TCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060158; c=relaxed/simple;
	bh=9kRc2srfCyWc8uD9Bu47+DiUt+TkrpdHbGXfZQycNQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cK3p6dBX7NKWmWIDK4x+ptWPg2q2A5fE9FFsAnvYPukpGQfSpLXqeE2c7cWKIOmCYGV9LLm9457ahhcpv8e84KzL9MR6UezfBISqzcryLSpvGdM4GcInSvQ3uezj58//v0V7ZAbJEhTHrwM04oKPCV67feEFP8/mZXT5x5lDliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Dp75p1VG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Dp75p1VG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so820489f8f.1
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060153; x=1775664953; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HR5D/DWM5Dfc7y7QbYtyXQZBV4EpcqSV4OtU9XGADfg=;
        b=Dp75p1VG8RlJgh7JtnpgfLC7cvor9CbimUIpCktQjJLiBhcanqZ6aA4IHdj2JBgkTZ
         SQBE1qsYkwZXHeGaNWPp0s7jLtMSjetx3wC4Lo5EPcBcHvuXmGyqngnBt4gwLnE7gGW3
         EYZgLyJuT5bdpQrzJwiWR2fze2JPePdH8bSZM7z8jQ+lAHYgA/dE411J28W5SlbWgGYc
         I3DKFTs89p5bsLYxV52VjOLeBKrsTuNWPbsfx+SdukszPuyAwDjAtaofLxcuFwmtQBXh
         GWyzPKVn9WyXKgrr5XMf91nxiH7GjdfkoyeUE33E3t1QxWjTVx7Zu1LAWqIiHjdWGVrC
         f/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060153; x=1775664953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HR5D/DWM5Dfc7y7QbYtyXQZBV4EpcqSV4OtU9XGADfg=;
        b=VMwJth4F+w0hwxnxz1zi8WjuoYCmsgHTBs72EmoE10MYym2mBHYn8DgWKjtUwZ4c+9
         ga1LD4z72bzueE9gRVlp/SB7jcPhCb/EldFbwCA+yYUCbhuLu5N9hkh1tt9cnf86uwEM
         3OP9FJErPiaMSCYdQpDOoS39IAomfgQGZuymSBYUUxm8dUg5nZ90ADKlkypH/CzfZUHD
         qBm8UzlJ6ceI/6xndup4VkybhsiEmd/Rd4/71gwq+6x6Yx0K0x+TXvyDOy62RlVv0OJW
         HH0QA9Tf/+eOw9zRWsaZNoapRI1a1qNbDMm07IAYymFLJDgcd/bP7cRv+j16CX8HnpwE
         dHgw==
X-Forwarded-Encrypted: i=1; AJvYcCXzFVRSUMeYqGdgG7O90H3Orcq3gmeTQH8fLM8LODbo/3mvGi8SIwCNty7pw0Zq5BdFfWgX@lists.linux.dev
X-Gm-Message-State: AOJu0YyQcm1EfmhPuaGFv/6SD1sLw1xOZ65bjzuakcRhUAbc9Jm3kcJN
	uJtS/5EZRgHuGMjPxIHX3v55BXcIYcJrXeWXaGvLJD7HvKPfQT4NfNkB1kdoXy209Tg=
X-Gm-Gg: ATEYQzy5qG7yXiIgIEJaO0Z4p7lUrgkBZKL3fpsZ1+vHIeLfAqMxu4vOyIg+gJ+v7jp
	eKPHUw9fqyMeBN1tFm2ls6OWs0Stdmm8RuK5mewWvTrxfL+f4JEvZmrRxcOPPnEQFbiFDRnc7p6
	cV6zsaYgD25uX5pkvo85p3g7ivK10PGbDOg/ZhcCgzvoW9H+9O37tVIvevU9BKzDG+pqRSu3HNW
	FIojaJ3sgjQGABRmvC+zTkPDuC0lAyYCVNBkQYt3iR0LXliWDAVWqv4RAnTP2loQ8q7GfFDtsWy
	vMM6gOCHYNePjAdI0DOtb/2sAO4QMj/GGifPYm6lcUi4FODMOdQML7TO/z04MMbcKln4+Z3czdj
	DlTtie3Y8hJnLIOrc41y9B1SWoasVLbUNtjRADEJQFppgkT7SHaFgdli1qO7U9u2Jis5THJY0mS
	7sW8Dmj9+w
X-Received: by 2002:a05:600c:6488:b0:488:7d01:f67b with SMTP id 5b1f17b1804b1-4887d01f7a6mr161299175e9.6.1775060152860;
        Wed, 01 Apr 2026 09:15:52 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1cc7dsm247993137.2.2026.04.01.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:51 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:12 -0300
Subject: [PATCH 05/10] selftests/bpf: Tolerate test file compilation
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-5-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1385;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=9kRc2srfCyWc8uD9Bu47+DiUt+TkrpdHbGXfZQycNQk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKthGeEAG8EHXczvyXvgIKDqYMGnyIJLHnRFqu4+9xR1Xi5pXrksKJ3A+h9fgUISNjlGo8YDDVj
 lPiOve55Khwo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. The linker step will later
ignore absent objects, allowing the remaining tests to build and run.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 72f576a8236a..37a454e4cc3e 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -688,7 +688,8 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 		      $(TRUNNER_TESTS_DIR)/%.c				\
 		      | $(TRUNNER_OUTPUT)/%.test.d
 	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
-	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)
+	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F) || \
+		($(RM) $$(@F); printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2)
 	$$(if $$(TEST_NEEDS_BTFIDS),						\
 		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\

-- 
2.53.0

