Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1455F1E5721
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729512034; cv=none; b=W1xiE1FSsYJKTzGbWJv+bk09fegEBDx1VLM8ayj4UcRsjr1dDGmP9fhVRtiverqQHeedySdl8SQwBFQll2FZSxzzPIs/bSMLNTosIRcDYgEgWUxtu7tdzbrdO8ROQgQ0vfOggb08eu42onmWRNLaR7cyeNQqMvQuw7oZs9OrHs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729512034; c=relaxed/simple;
	bh=hKZjavByO1oruI1RUjFozDNzOMjKJafPYJzUybLsS+I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZXDzP7wb2fLhm2WzP25i3lV+aNSZTs0+RTz74MAFl99umqggH5+s95gHg9nEHtvTTteOB/kumX97k/4gTk5NEGdO/AEv8qRh2hK7h4Zv+zQN286PjeGo+eaAFrvWSrxXo7h0SPtoVhGjN/b3XJkEUo1gp7nbaSKIwcbER4YrfHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iHFK9j1A; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iHFK9j1A"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5c935cc6a96so2742181a12.1
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 05:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729512030; x=1730116830; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lpdvHkmKazBU3FnaALiA1RaWjop5m9wz4SmJnth5vPg=;
        b=iHFK9j1Ay6xCGO4jWRLEHFjPV2bR36M9VPer2YhUcbUzSOWEOzkNcTH8WlhbiZku9j
         yNBiYQUbCdW0dIvKaHaAQGFozCbTQSZd2/qInMmtuiMHgVeXzEo3CFw4MMB0KOj2/Y+D
         NqR9e1f2gqB8mkRZSrHKP4upeGnEb4YmbJlRMd2XdxQDw5Wdn+icElr7uPfw71xVNCI5
         i6C5lxIIPgWpGsgK/KCE/V0TJuT92g0oZLYf+npEnhC+mJFs3309Wz2n3GL/BPr7SMnn
         2XVF+iOCLEtEwGR/6kg0D0E0lVpoeM7dlsRp2slLJlmmVFeuwqu/Vwh9LwMwRaFhnSVx
         9nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729512030; x=1730116830;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpdvHkmKazBU3FnaALiA1RaWjop5m9wz4SmJnth5vPg=;
        b=YiNGL48cGIJqc/k5/QpzLTDvqbXdOs8LjOk0w5ECLOpBUIRBl23WU0WqzrWPoqMfHH
         /qJKUphqMfqIwuqmxO6xDCtvgVOQ8aMOEwc5U0HEcsN7Xf+0p0i4gwFDF4pwBxR7Yy+M
         f1qDNf2wIJZbrEcMwAQPw+kmBajH2cLLyE9gHTzkIDrROFG76pDI2EWPKSbMffo7PZoe
         riiumbAapuk22dueKImlFcZyLaZ8skrmbzuJU/P2NngLMjk3wDxCTsBUyFJb6vMlq7aA
         XWMn7F2Wz8YqvNm+/CikhLcypMOVY2oavtyHr9mESFiyfvMknsg9aLfp70378qsXzhaq
         lp3g==
X-Forwarded-Encrypted: i=1; AJvYcCXiJUEpQhEnrEa8FSJ12QqgvuAE7OqFBRYc8daKow3gYqErOHmrNFoBnd4yF08Bub75DYR7@lists.linux.dev
X-Gm-Message-State: AOJu0YwCMY36Ko1qOa2eLljddUUJWGpwLHq2GeZgFMZBeu+aLRUcmdx8
	aywRjWZNrW7v9k0OWcQLQFzarVjR1QpQdV/t01QV3E5hshE5vOopw+NLMSQym77Lk1B/wigBmw=
	=
X-Google-Smtp-Source: AGHT+IFJm5SlwG3vf3FvXgvvro+V8pc3lkXThohPvqp5mcrTewUwVKQhuOWQVVonKB8vxoeOJx+BbgDYBg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:3103:a9bb:c02c:c514])
 (user=elver job=sendgmr) by 2002:a05:6402:3585:b0:5c5:bcaf:43f3 with SMTP id
 4fb4d7f45d1cf-5ca0ae87bd1mr3010a12.5.1729512029802; Mon, 21 Oct 2024 05:00:29
 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:00:10 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241021120013.3209481-1-elver@google.com>
Subject: [PATCH 1/2] kasan: Fix Software Tag-Based KASAN with GCC
From: Marco Elver <elver@google.com>
To: elver@google.com, Will Deacon <will@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, syzbot+908886656a02769af987@syzkaller.appspotmail.com, 
	Andrew Pinski <pinskia@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Per [1], -fsanitize=kernel-hwaddress with GCC currently does not disable
instrumentation in functions with __attribute__((no_sanitize_address)).

However, __attribute__((no_sanitize("hwaddress"))) does correctly
disable instrumentation. Use it instead.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117196 [1]
Link: https://lore.kernel.org/r/000000000000f362e80620e27859@google.com
Link: https://lore.kernel.org/r/ZvFGwKfoC4yVjN_X@J2N7QTR9R3
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218854
Reported-by: syzbot+908886656a02769af987@syzkaller.appspotmail.com
Tested-by: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrew Pinski <pinskia@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/compiler-gcc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index f805adaa316e..cd6f9aae311f 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -80,7 +80,11 @@
 #define __noscs __attribute__((__no_sanitize__("shadow-call-stack")))
 #endif
 
+#ifdef __SANITIZE_HWADDRESS__
+#define __no_sanitize_address __attribute__((__no_sanitize__("hwaddress")))
+#else
 #define __no_sanitize_address __attribute__((__no_sanitize_address__))
+#endif
 
 #if defined(__SANITIZE_THREAD__)
 #define __no_sanitize_thread __attribute__((__no_sanitize_thread__))
-- 
2.47.0.rc1.288.g06298d1525-goog

