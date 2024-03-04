Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3566168A
	for <llvm@lists.linux.dev>; Mon,  4 Mar 2024 18:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709575911; cv=none; b=E9tTHubrB/HG+7zDtH6SJrb7J6k7nvtRwryepGAAxv7YKX6wVlycsnjX3Nc/gv6XgabfhZJV6KYalnD1v6AKwJ5NtVGhSPBAxladi+dZLJ0+HaipGJO0bZRpEy/h5tInXm2MgiyhJAFqIDxTDa3DMttClmzcbhAFHW/0d0rZg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709575911; c=relaxed/simple;
	bh=tcDiqbccYHi4AinqQLgnM+VghsYJV2IrozkELxqhwLE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SDjVRj/3y8nITUxEYB2a4k0F54J/tXSZDbSypjjeFm+UDoUzD04d9GbYe+QIivRCLUlnD6JxTzWMbBEBIVt8eZf4M++hFBJHl2l8fYMOsukPWiwmdTp946Z3l7VQelcbn6/xFmpDVw0qzAl8+PCFb5ms5vpfsTJ9G34pruwVWzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hr6kICOH; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hr6kICOH"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6dbdcfd39so9238831276.2
        for <llvm@lists.linux.dev>; Mon, 04 Mar 2024 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709575909; x=1710180709; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4kLD90+hXSvFb0+fALtfseiTDbKyQ30y8gjmVqCojkg=;
        b=hr6kICOHjcZAflCbCY6eUYELbHP9ty1rZlOUgt8uTplquI4oZcLwf8vW3jgtaBrtam
         V0DhJpafbaJ7BoW1jbJKUOGvCFSkeAZRGKcaZcK33ZSFBo4XJ6MkoSEvrJHAQnkM+wMl
         I/e2Rq7OMGSjuAOR02T/0Ad3+IR7Q1N+Aq5lS+C2Xzsa1lXpu5HkkHDN2zl16AoAtQHz
         az8CXROgzIhk2DWe1iua7U9oLydRUHpZqnBsNnsJ26VMSBm4yQg8HEBDINYXRNdJqj0x
         HH1VFj+HOzKu8i0KzWWJ8mecgK/QXSG3ff6NjAULK8KvASC0U78bGY6JkqWK8D9miFx4
         gg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709575909; x=1710180709;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4kLD90+hXSvFb0+fALtfseiTDbKyQ30y8gjmVqCojkg=;
        b=MbL+nN+7fELklZRiCL6mDg+5I4C7W72sl+IaMcuM4fai+Zjro0Ken5KCGyO4e4bX+J
         cVacwaZEAj+eGDTFdLBCqT3RC/+BLYKomStiasTK8q5jEZCH5v7FUreRgDbbRXWUfT3M
         KAI82H4zgD4cz98/irHk5Gc9MmGj6TVWcTiKqcHJsRb6ZIZEV8ypW0OQFMUcioMD/rjV
         zxmkNOHK5qLU7YobTNiLOa/50pzG9WJX7wbU63oCqopENNk4UigvGyfYSXgoxZ92KhJe
         lt/dfCq3yyDa3inRXQzNrtEhpClcRijfiCPCa+Q3SvTkEfS3UEJz6sXbBePuozdaBkuO
         dm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4FGe9RnEPyxEKlaRg6UpwBYQoP2WdPO66sLgyZWEs2Y1kAXtzi/lDMcWFRgHd1zou9nKT30ZOSDalrfvHUmJ+ME346Q==
X-Gm-Message-State: AOJu0YwM0JU7lM4pMUK1laEQCV02tdr99/HJDxmKNSSe0XXWuj2fYnH6
	HoAm8F8CV/Xy+YCcLMUb/WVvQ2BiOpitvOt4ryEwcFkzuimUJXcH1kzy1SaZ3Lyj/yjJ5N9ChuS
	rsw==
X-Google-Smtp-Source: AGHT+IHxwF/zU5cb5Vfvw5bR+wuloHPq0SidEq3LQN1W2vemc6jjWhYsFXPGqLxGNUu4w4mRsgdxwWFh/pQ=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:c786:0:b0:dc2:466a:23c4 with SMTP id
 w128-20020a25c786000000b00dc2466a23c4mr2575853ybe.4.1709575908874; Mon, 04
 Mar 2024 10:11:48 -0800 (PST)
Date: Mon,  4 Mar 2024 18:11:31 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240304181140.644212-1-edliaw@google.com>
Subject: [PATCH v1 0/3] selftests/timers/posix_timers: various cleanups
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I'm sending some patches that were orignally in
https://lore.kernel.org/lkml/20230606132949.068951363@linutronix.de/
to prevent the timer_distribution test from hanging and also fix some
format inconsistencies.

Edward Liaw (3):
  selftests/timers/posix_timers: Make signal distribution test less
    fragile
  selftests/timers/posix_timers: Use TAP reporting format
  selftests/timers/posix_timers: Use llabs for long long

 tools/testing/selftests/timers/posix_timers.c | 196 ++++++++----------
 1 file changed, 89 insertions(+), 107 deletions(-)

--
2.44.0.rc1.240.g4c46232300-goog

