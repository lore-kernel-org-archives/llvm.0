Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE23626C6
	for <llvm@lists.linux.dev>; Mon,  4 Mar 2024 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709575919; cv=none; b=VfPOvIbVyBELjzXrXfuC+KVkWd7LJwrIbqwew+CaC2b0rraiDZiae8UoDx7sf3O2I99/z0/1K0xi2+dwYJ/iUql4rGiW9kLKEKkqe1Xeq+BBIjN6u5yy8z1FCm5ay3CjdH5B0puVQwxZrEXhof6iLgyYmchiKcjJfrVpiHI1/p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709575919; c=relaxed/simple;
	bh=FqLV9lNiSU7gSVzmh0RUNwWYr0jxygkZHnJe2yCKIHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EnY+e2Np1EepXK2W+IAcl4DnQENcd/gVFBe0l9DNvXQj8xUmF2P9ysvFCoQk0oxRSYe8lfd8eQ0Dpzdl+0WDeDQj7pEfmGVI18QRPWkgEN3EGgthLRJ00NMpHSXsoWVyggeUbWB2Ot2k+cNn1oomFB0Mt35hlKmLx1ItiQB0Msg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aw07ywZx; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aw07ywZx"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6e558491ca6so4226168b3a.2
        for <llvm@lists.linux.dev>; Mon, 04 Mar 2024 10:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709575917; x=1710180717; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+K8qGGJZU0dVFlAnq42rJW59Laz5svfdA3lu6VKJprE=;
        b=aw07ywZxFlL+sRC6jpaySReZ8oQz0bG+lsE27YmVKnNuf08w1zvv0KxolhZJJjbYTe
         os84kBwcVsmupcDUNOC27bq/clOyB2xSGNIWinldSIcsZwzCtD4WgHeuuoeBJCKDujj6
         qwitOz9BMI8Uvydo2Xz06mNXCLniSy5Gu/QwZQvOCevK2OTBH9PZg3E/u/bHac6L5BfJ
         HK6X1q6xIM3RvkisDMY30UgblbdE+c7ExfVzxtHdrjqG2GJoyyI7ZAisr5kX5snHD2IM
         p5fP8omWKr2fxjWjVc4N6Fl4gDY2lSVHcYpokERoqlba3DUz4L8zGj9niSeoot+U+Zz8
         6P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709575917; x=1710180717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+K8qGGJZU0dVFlAnq42rJW59Laz5svfdA3lu6VKJprE=;
        b=Ggen3TfJKfg6xFOImbYFw6HYSKHgKRt5+wcbRRnnK4BKZ7LCQOGlWKj/NS/qqaNfdv
         WBFkXKJsPGqmUu0o1ixCNu2EwLWkMAD6Cv4ItvQ/XAzdcMPt3v3DAoQFgvR31ZhV/YM1
         N2p0rsLrDhyjDIsyD9gwyFnXZ5nR51uaPTLL3NlIW/t3ExHG8eJ+e9h3bwzXbV1QUwP3
         0VVefowLJGOYeSnmqSeg/2zXOn9QYHWYCc8GIaw837Fr5bsE74s0dIvKlv/orU346xpG
         NjqLncT0O+R/TOGCH7HTkwdtnDA/5i7/cuaozUKMck3jxxHdB2xFfyy8R4VvKF0xtNuK
         eWBw==
X-Forwarded-Encrypted: i=1; AJvYcCVLgf/7VAhSGaxz5uULPStD+wovyOVp81g/y5uyXpE3inIL7vNaOFqFxvxso5e8RrOB5WALziyXHYm76LuOqgYy7lRPKw==
X-Gm-Message-State: AOJu0Yz+lqFU9n5E9HYgh7S4jN7AR7rebsfg04l1IPI5yo/WiELajrjV
	g5g7X77BN+KVEyJQWtvjql/rYdMkBF5rwVMrKw7rBkZweEhcm0HMjsQsnDRr5CY6a+fHM29Q4Zn
	nwQ==
X-Google-Smtp-Source: AGHT+IEBwRfcpn5x9AGNzJLGA/hp7XJkS1FIgFGPUMaa1opevJ7wVveO9HifQjBfzJMQbCakv4yNwPEcBGY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:27a0:b0:6e5:8053:af92 with SMTP id
 bd32-20020a056a0027a000b006e58053af92mr788006pfb.4.1709575917445; Mon, 04 Mar
 2024 10:11:57 -0800 (PST)
Date: Mon,  4 Mar 2024 18:11:34 +0000
In-Reply-To: <20240304181140.644212-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240304181140.644212-1-edliaw@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240304181140.644212-4-edliaw@google.com>
Subject: [PATCH v1 3/3] selftests/timers/posix_timers: Use llabs for long long
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fixes clang warning: absolute value function 'abs' given an argument of
type 'long long' but has parameter of type 'int' which may cause
truncation of value.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/timers/posix_timers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 0f550fc9e879..78b4b2d3dc44 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -82,7 +82,7 @@ static int check_diff(struct timeval start, struct timeval end)
 	diff = end.tv_usec - start.tv_usec;
 	diff += (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
 
-	if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2)
+	if (llabs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2)
 		return -1;
 
 	return 0;
-- 
2.44.0.rc1.240.g4c46232300-goog

