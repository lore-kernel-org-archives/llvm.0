Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641DA3016E9
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015762; cv=none; b=tGVWLnhEkJRWdpqmw2tfViyhmpeWAgbfiIfkkQErYunGdh7GTEXKWaBv2qzDW+4IB+Fi83xEu1Gmu1T16dZ1B8noF1kZEPvB23h/xp1QYGJ4Sg0dYsGUQveFz8wyVxGBP3/DQr8YCGXNnqdX46TSD5MekWiKozDYfOoHwQ/VYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015762; c=relaxed/simple;
	bh=7xAUDtli+xnu/oy1ge8WaiAv5ILA/M3iKlpKKYdkoj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKtJFpM6hF4Idj1BWc4UvpstIitn1X+iZKqs9o9TR1U5i3PRQy0AmqIEOqTzB7GOMP7EaZEuPLc17NQFk3hs9NpH5mwbskL0G6i5OEy4NeYxN0LzHImmKvMNCzhcgUzI34q8A/RsegkFrIqur32Rm3HCGl6RYh1fFEZJlTvb79s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=GygGOyR5; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="GygGOyR5"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4dx9nq72cJz1XM6JS;
	Wed, 21 Jan 2026 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1769015757; x=1771607758; bh=uvnApeVfnqdnGIrgdMQmgrIH
	qC8D9PRGY9e8cx4z1H0=; b=GygGOyR5HWpFgOm7DRtcu08Yv1U3ABjngjqlV8gp
	Lxbgp5NADcBU8QHTGfZM659OjJJjyKQ1Cwb8RiMS0naTNRfTLoV4IorQAy99MaGu
	F1s68OZHcXRekIm+eew9sKHkRAQFEvZ+UoB+ugbvomoD55HThlqlud1K8H50RjMv
	XCKGTi5GxHmkRt/PB3Wrbk2T9GLDgdlNUON1gWj8Iaac0LJNjs620T7QZHqXQVZw
	4ZcNXzm+G6nebfs2o0WQBQdkQ+x/92XXDSQjzEMW2khngM5nWAp95WOPgkB/+JZy
	82Vgw6HZLSUMKgB//n9GKLV6FdLVgDRutvgXLuksDT1gbg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SHwtsCJmLo32; Wed, 21 Jan 2026 17:15:57 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4dx9nk633mz1XM5jn;
	Wed, 21 Jan 2026 17:15:54 +0000 (UTC)
Message-ID: <377d5833-6876-4fea-b17f-19d4b03d8583@acm.org>
Date: Wed, 21 Jan 2026 09:15:53 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 3/4] locking/rtmutex: Add context analysis
To: Peter Zijlstra <peterz@infradead.org>, elver@google.com
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org,
 tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
 longman@redhat.com, hch@lst.de, rostedt@goodmis.org, llvm@lists.linux.dev
References: <20260121110704.221498346@infradead.org>
 <20260121111213.851599178@infradead.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260121111213.851599178@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/26 3:07 AM, Peter Zijlstra wrote:
> Add compiler context analysis annotations.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>   include/linux/mutex.h           |    2 +-
>   include/linux/rtmutex.h         |    4 ++--
>   kernel/locking/Makefile         |    2 ++
>   kernel/locking/mutex.c          |    2 --
>   kernel/locking/rtmutex.c        |   18 +++++++++++++++++-
>   kernel/locking/rtmutex_api.c    |    3 +++
>   kernel/locking/rtmutex_common.h |   22 ++++++++++++++++------
>   kernel/locking/ww_mutex.h       |   18 +++++++++++++-----
>   kernel/locking/ww_rt_mutex.c    |    1 +
>   9 files changed, 55 insertions(+), 17 deletions(-)

The patch subject says "rtmutex" but this patch includes a change for
the header file include/linux/mutex.h. Shouldn't that change be moved
into the mutex patch?

> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -848,7 +848,6 @@ EXPORT_SYMBOL_GPL(mutex_lock_nested);
>   
>   void __sched
>   _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest)
> -	__acquires(lock)
>   {
>   	__mutex_lock(lock, TASK_UNINTERRUPTIBLE, 0, nest, _RET_IP_);
>   	__acquire(lock);

Shouldn't the "__acquires()" annotation be moved to the declaration in
<linux/mutex.h>?

>   #define MUTEX		mutex
>   #define MUTEX_WAITER	mutex_waiter
> +#define MUST_HOLD_WAIT_LOCK	__must_hold(&lock->wait_lock)
>   
>   static inline struct mutex_waiter *
>   __ww_waiter_first(struct mutex *lock)
> @@ -97,9 +98,11 @@ static inline void lockdep_assert_wait_l
>   
>   #define MUTEX		rt_mutex
>   #define MUTEX_WAITER	rt_mutex_waiter
> +#define MUST_HOLD_WAIT_LOCK	__must_hold(&lock->rtmutex.wait_lock)

Is it really necessary to introduce these two macros? I prefer to see
the __must_hold() annotations instead of the macro names.

Thanks,

Bart.
