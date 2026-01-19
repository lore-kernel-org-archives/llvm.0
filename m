Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6C357A20
	for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815658; cv=none; b=kK7p1fZ2wIS+1KX/EzL+26A4BS3c/7ftwq8IST9UZ2SJqDLvWFg5Uk7gN0/VKzp8OcR4kIFTQq9CCvke8VOX1wG88J6BFKNDcl6Rq/dF14exT+45MVjFR2zkqLrpzaZpHb79g7oGLxJuSyvyTyCNo/GAuvNQySgh6bSkIvxaJV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815658; c=relaxed/simple;
	bh=imqmTq6qC6AvvOLRifzHIuTmTh3LUGINsRwO5tNrj/Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uqQW11LKnG8Kp42geI0HDHpopSOJmYQcpRg3qeppw5DCnpdBQiHCMFzV9opVBXQN2Xd905cRd9UqF09xtTbR+ga7RomOq5s7jLNQDJlu0/fKBnj0nYbR70mSmRNWbrs+FPDj170F1pm1WVaQ+4J2W7YrFVEp8IBSOX3imEmLVTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e77EmPIl; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e77EmPIl"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-434302283dcso3190630f8f.0
        for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 01:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768815654; x=1769420454; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ewHt49qLKu+2CyU8hq2cJxrH6CXFZn4CCknA2bnTf50=;
        b=e77EmPIlymKkxXlmSLzwCWXOyL5k7QfPghE1tMKlTWzamoqYmFrOx2zqgPFFaHpoJT
         CR2JB3B125i0W7y0VBmM0/0yNN1Xk1rbtSDeTwQdrXYWrGkZHprOqW6i37boZquw+Mmx
         W/UR2Ke/xvFiIAAkC40P6tRhn68pRxq4LpCIpeUbyc639m3NqZ5PEor6C6xMHTuzMixF
         0nw1eLJXsscZ206dVte5yIUE+O84vw42UvQtGAgzR48NksJ/enk6HDb7TX3P+UZd5Kkk
         0onCvt5jdCdDdXrm927+7h3jhJXrjkraHNdHvNBkAofY7LrkBMAx/tGgYrHpt2Xukw+C
         MuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815654; x=1769420454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewHt49qLKu+2CyU8hq2cJxrH6CXFZn4CCknA2bnTf50=;
        b=IsRlxSiD/kkyhKq9H0cYWPNwC7c3pDnLvYurSI03UyfcwzLSZ5Q/yX0zP5d/f5O9uQ
         /Q2olQPpLkaH6dFYTTVSu4IhfvKqXQ1dGCdd/YT48Bqhy/8nKs/VU1CSLhv8OFr3D3Oe
         DVx/Y5zNPo0DzDfFoINOoDg4wGPwwW9xO0xXHp3Dhkwiqw8wyLhxl2WU2PoABeTyfWnV
         iUiADAbh9rC5DENn00RrODrjEhy+drK329IBNntZQwnmIaFYmAZ4tfRMFeZyRfUltMuO
         R3RJRaxaCBPByYDngOGW67ykiGUm5xJjwWZwJ9whlmb+/CXwNx8VFmfr8AEbcU/eCA1e
         bR1A==
X-Forwarded-Encrypted: i=1; AJvYcCVLTTqIvVwDBmcpsa7EzX7xccx/2lDDZMkyUs6KJVKZIdxZPxhyUe0xcMqS9qQT/wqiHzr8@lists.linux.dev
X-Gm-Message-State: AOJu0YwWMUn9u7JCb4CW3cyJCpThcljP0+CNRs+GUziQA0Tp9bWti34M
	q3BuH716mfPxVqyvUrfbarSmhEo3fOLOZEqH77/XRRozSFrsS5+UbXINm30PeUSxs9ZqwBECrEN
	jpg==
X-Received: from wrsz3.prod.google.com ([2002:a5d:4c83:0:b0:430:fcb8:38c0])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64e9:0:b0:432:5bf9:cf22
 with SMTP id ffacd0b85a97d-435699709f8mr14538540f8f.3.1768815653726; Mon, 19
 Jan 2026 01:40:53 -0800 (PST)
Date: Mon, 19 Jan 2026 10:05:53 +0100
In-Reply-To: <20260119094029.1344361-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260119094029.1344361-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119094029.1344361-4-elver@google.com>
Subject: [PATCH tip/locking/core 3/6] kcov: Use scoped init guard
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

This ensures the context analysis treats the context as active during
member initialization. This is required to avoid errors once implicit
context assertion is removed.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 6cbc6e2d8aee..5397d0c14127 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -530,7 +530,7 @@ static int kcov_open(struct inode *inode, struct file *filep)
 	kcov = kzalloc(sizeof(*kcov), GFP_KERNEL);
 	if (!kcov)
 		return -ENOMEM;
-	spin_lock_init(&kcov->lock);
+	guard(spinlock_init)(&kcov->lock);
 	kcov->mode = KCOV_MODE_DISABLED;
 	kcov->sequence = 1;
 	refcount_set(&kcov->refcount, 1);
-- 
2.52.0.457.g6b5491de43-goog

