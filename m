Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CE6358D0B
	for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815662; cv=none; b=iLnFuexkTXkpeIXIgrtTB7AWTDBdQckxejJtjmoRUI/FH1alF4ZCFPjgidlhe33KESQuS9Dcfl4a+hBKhLWl9f4/RJLGTSqTxd9cH0UBLI2bHkZ0BrVQWmxY4bRjnYp+dcQ7lvijZhrUINmHWuxcfLIlFEMVtz+Ln9xncGU+ZNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815662; c=relaxed/simple;
	bh=fI1glmYoH1DqxqK83xKlTtx/Ar+iZrLYeSgCJ+MEbqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qz2Nbpe88Ks9SdhDzj2/AofKpVJgJl8vw8bDqUz/+34m1psrOqWcylY7k4AqRjAZXGY1WDE62QVSN0bVUD2BEkb7kzgqVTx78fiE/nxsn0GUM98X61Cm5NaBZXPKU+vd43qVKoRIiZnux5XjomT6CIiV7j0fPL/SuMBl44QEb34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E5lOXEiJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E5lOXEiJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4801ad6e51cso33506735e9.2
        for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768815660; x=1769420460; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5O5shuIyt2OF6tzGpJJeUtztHqWv8B89x7ZKRetoFcY=;
        b=E5lOXEiJDxTqSsLN35Bjq6zbp7v60USBe/0gx8FfMxKjAoeAFTAjnEqJp3a5rk5vef
         JdQWSMItfhSMci1OWeMr6vjIAhDh39ryD0p9ScH+kZ9n/5dodIrNp9Uhs/HFgO5BLfYM
         HhywAQ6KEhf3b91SE+4HAtn8Sq0/wazk51Y2V8bdbONMZqISHWatR/2Aon45iBrYeal2
         Kd6LVc425sXXxu7tk3y5OXVXgp0SdmGPtzK6cXWyKwexWllbNUrZm/nJHhAPgi8vgb3z
         4Hq1AZLQo8SAjAXVic/Dp6c2pf8eM7BFnOjiwLp9aahtot9z1aMHaOnig4FpW/XJJgIC
         m//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815660; x=1769420460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5O5shuIyt2OF6tzGpJJeUtztHqWv8B89x7ZKRetoFcY=;
        b=oW5uLJs/F14rjpb2QoPAafAUvliSQ2l+YhmFaJkz+GZ7gsIRWbfHgc0anRqi+Q55Un
         FpX7LzkBxSqqpizWujKIJHwGFwWw2z/MSQ6nzCL/OpVDZaLnqZXOBgleuovbf1pzhdme
         XcF6HzMITY9+hbGObdHHxGXgpkm0oVBURDotf2wqUBvl0MTsF4nKp3IpoNxfH0orzlIH
         tELNuULlRTbUO1TyNpw7u6AVwex8Oeii/RYrll6kv3fO/NpOaijwT1rzJCKmIGN2nKQo
         LQIFyiyIlERzkgcIrJAi32JuKa1dVF07UbN897qObKZVzkri4OXwZ6zG7Rz95plMfhzh
         bRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ74T6o/CoCuxnk7PRTyYhHKInLsSLket07GOkncBqtyZDn+avC8KT6rWFce5e7F5I+Vlx@lists.linux.dev
X-Gm-Message-State: AOJu0YwoqMURcFfuKi3kpykzy7Cmx1qwO3LNwS1FfFZSJ2UOhH0kwn5C
	3vZbfgm8g6dm0bpikWvjz9Rp+ApaQXuZQfYWevTdpWvk6DfVqUna54/0TNnA5L46vVy1Qzzym8l
	RLg==
X-Received: from wmbhb2.prod.google.com ([2002:a05:600c:8682:b0:480:3842:3532])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b81:b0:480:32da:f338
 with SMTP id 5b1f17b1804b1-48032daf48bmr41618245e9.14.1768815659820; Mon, 19
 Jan 2026 01:40:59 -0800 (PST)
Date: Mon, 19 Jan 2026 10:05:55 +0100
In-Reply-To: <20260119094029.1344361-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260119094029.1344361-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119094029.1344361-6-elver@google.com>
Subject: [PATCH tip/locking/core 5/6] tomoyo: Use scoped init guard
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Christoph Hellwig <hch@lst.de>, Steven Rostedt <rostedt@goodmis.org>, Bart Van Assche <bvanassche@acm.org>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert lock initialization to scoped guarded initialization where
lock-guarded members are initialized in the same scope.

This ensures the context analysis treats the context as active during member
initialization. This is required to avoid errors once implicit context
assertion is removed.

Signed-off-by: Marco Elver <elver@google.com>
---
 security/tomoyo/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c
index 86ce56c32d37..7e1f825d903b 100644
--- a/security/tomoyo/common.c
+++ b/security/tomoyo/common.c
@@ -2557,7 +2557,7 @@ int tomoyo_open_control(const u8 type, struct file *file)
 
 	if (!head)
 		return -ENOMEM;
-	mutex_init(&head->io_sem);
+	guard(mutex_init)(&head->io_sem);
 	head->type = type;
 	switch (type) {
 	case TOMOYO_DOMAINPOLICY:
-- 
2.52.0.457.g6b5491de43-goog

