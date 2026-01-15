Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F33A1E86
	for <llvm@lists.linux.dev>; Thu, 15 Jan 2026 17:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768497776; cv=none; b=PXA0ceB7K7rv0+AJlULDzUV0WN/ueyqbG2rO5XjQopaWjd2vU7RI7mO1uSAMX46JQiSkR84owl1god8qiFIk52diwOQ1HgKea/h8bvrDBrftUJ+63GSCauoy4W716B7aH8v/Vu0jvY/T/0Pz1rVa5o5vWWFdFFbMBHFHzGe/AtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768497776; c=relaxed/simple;
	bh=Dk57vWXhj7hAZy/ErMoo6C6zg50pGLe9O2TB2mFcY8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sylqScWpBg4l4Dv9ClaBO8He26J7sNhRYLXL/bO1WFQMx1mqUmnvjhExxM4onU8dr7rNaOi2BBwYz1xfVV71/Iek0UigZUhlzypkwBZmCN01TFKRHLhwISsiW2QdBuB3BeXdP3vM9xnQBGlxMuFiEReUePu11kSQm1d5xawM9L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=pJ76wDhs; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="pJ76wDhs"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4dsVDZ5Xlzz1XLwWq;
	Thu, 15 Jan 2026 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1768497772; x=1771089773; bh=IW7Utb06OyAy3GqiohZ5lJqr
	slKWyKIOPKjoxfymhgs=; b=pJ76wDhs7CODvqEjNPO5E5jGpnT0J5V3hMx9OaKc
	Xp4NxGypIoVcDTUtAUnU5UHhIUHojitPY+92t8jjYIYR0TsshaPDfLxiAaQziZpO
	qxRG940QCLAWMT6lqp6hhWsRHdU+JiqyfK2AYJrq5WV0S+o0XcT3CLDFu7PLgQEr
	Qz2IaYdGr+QPICgfz8wLJUwjnthGNpMh8bx0Q/+D6Cpj/1VdhBwO4YyyyuB9ymnL
	dm8BxvneK2Pm6u4pOq9MkFgtY2m6ELg9YCgsRKN5D5KJT1qIiKNdQpK5VujOsmQp
	gdN/buDb+xrPf/lcO4qfpU4RXAQR8MNXCimG7fqqgkh1hQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 6-pyFJ88SuMf; Thu, 15 Jan 2026 17:22:52 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2e7c:9:1de3:5bc8:3be1:d169] (unknown [104.135.180.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4dsVDV6xfjz1XM6JB;
	Thu, 15 Jan 2026 17:22:50 +0000 (UTC)
Message-ID: <c708b1c5-1165-47e6-a93c-54b2928716b6@acm.org>
Date: Thu, 15 Jan 2026 09:22:49 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260115005231.1211866-1-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260115005231.1211866-1-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/26 4:51 PM, Marco Elver wrote:
> To do so *only* within the initialization scope, we can cast the lock
> pointer to any reentrant type for the init assume/assert. Introduce a
> generic reentrant context lock type `struct __ctx_lock_init` and add
> `__inits_ctx_lock()` that casts the lock pointer to this type before
> assuming/asserting it.
> 
> This ensures that the initial "held" state is reentrant, allowing
> patterns like:
> 
>    mutex_init(&lock);
>    ...
>    mutex_lock(&lock);
> 
> to compile without false positives, and avoids having to make all
> context lock types reentrant outside an initialization scope.
> 
> The caveat here is missing real double-lock bugs right after init scope.
> However, this is a classic trade-off of avoiding false positives against
> (unlikely) false negatives.

The goal of lock context analysis is to detect as many locking bugs at
compile time as possible. As mentioned above, with this patch applied, a
class of real bugs won't be detected: recursive locking in the context
of the initialization of the synchronization object. Hence, I think this
patch is a step in the wrong direction.

Even without this patch there is a class of locking bugs that is not
detected, namely unpaired synchronization object release calls in the
context of synchronization object initialization. An example for struct
mutex of this type of incorrect use of the mutex API that won't be
detected even without this patch:

	mutex_init(&mutex);
	...
	mutex_unlock(&mutex);

My preference is to remove __assume_ctx_lock() from mutex_init() and
similar macros in .h files and to add __assume_ctx_lock() explicitly in
the .c code that needs it. This will reduce significantly the chance
that the locking bug mentioned above is not detected at compile time.

Bart.
