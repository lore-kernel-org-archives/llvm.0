Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8202652A4
	for <llvm@lists.linux.dev>; Fri, 23 Jan 2026 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194723; cv=none; b=ghnOdZgNULAKFB/J2hZOYjLudCxRuTdbL4diGmsXR6YOugoBLSRGG7Df0d4mI1Zv4sio4N9+/M2fnvOG9k0J2+PumobOVvknxXRri/pYXmh5weKeTlMkqdDNNen1OkMtHVPcAJO3OEaEaWjt0yGVKYffA9liuiWg3eVdJ5RDC8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194723; c=relaxed/simple;
	bh=UxzNE9VpXiTvOsfMg5vnQPygP879sZAQRVv/7A8l4mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zy8slym2wq1gy3z5uVIP+OEguZnd7DlHClGvoUyGvyrIv9el9F+aaqxfYxqZC5NRhzjpIPi6S4bs93H/oDLCv6IGOQiGeX1TlaDW0tQUS87n69G2raRpapfp8o9P99u54EldYXPBKEPxRsicVtQz2vZmeQmwMxPoFd6s21WUU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=c2WaxYts; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="c2WaxYts"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4dyRzP5Wtlz1XMFjF;
	Fri, 23 Jan 2026 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1769194719; x=1771786720; bh=yom2drj6gKUrILQ8xeM4Obf3
	UfnngnS77OB9AKQzU+k=; b=c2WaxYts7Z/dnVid9ms3U0c0rTMqLIZFhxNqV5OS
	xDbYNTvD2x8JgRyrMosCWeaT1Gk4gx04aGkf7YRHshtWrADeJ2ZLyBw9G4QyykHq
	Yl51C6JRfrLQNErcEDxNKd5wcumIwH+B/dh9292U3b4r0/CY541C+NXR3gj1nevT
	LwXQhVrqboEVxunLjb8bjWmnQbE/+c03aYV1+NMG7JnUfFP13zio91lZN25Ck7/l
	OiqOXID6hYEgZSUnuCNpZ4XoBbTxxzxS+1mVA/K/uqc8EkgQNzkvnJOO1Y/m9kkW
	ftQZRLTm0orkNrhuUnBh5FsFCyEAh732tCxMo5nNHwSuwA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id HysN81UsvIJL; Fri, 23 Jan 2026 18:58:39 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4dyRzJ4Qxvz1XLwXj;
	Fri, 23 Jan 2026 18:58:36 +0000 (UTC)
Message-ID: <f4f688ba-8953-4cb6-a749-94dad74692ed@acm.org>
Date: Fri, 23 Jan 2026 10:58:35 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org,
 tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
 longman@redhat.com, hch@lst.de, rostedt@goodmis.org, llvm@lists.linux.dev
References: <20260121110704.221498346@infradead.org>
 <20260121192349.GM166857@noisy.programming.kicks-ass.net>
 <e1229c44-048b-4e42-b545-18a8c716b5eb@acm.org>
 <20260122090402.GD171111@noisy.programming.kicks-ass.net>
 <d399e354-6d42-488e-a0b7-fe8d08b9bf34@acm.org>
 <20260123111523.GO171111@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260123111523.GO171111@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/26 3:15 AM, Peter Zijlstra wrote:
> --- a/include/linux/rtmutex.h
> +++ b/include/linux/rtmutex.h
> @@ -41,7 +41,7 @@ struct rt_mutex_base {
>    */
>   static inline bool rt_mutex_base_is_locked(struct rt_mutex_base *lock)
>   {
> -	return READ_ONCE(lock->owner) != NULL;
> +	return data_race(READ_ONCE(lock->owner) != NULL);
>   }
>   
>   #ifdef CONFIG_RT_MUTEXES
> @@ -49,7 +49,7 @@ static inline bool rt_mutex_base_is_lock
>   
>   static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
>   {
> -	unsigned long owner = (unsigned long) READ_ONCE(lock->owner);
> +	unsigned long owner = (unsigned long) data_race(READ_ONCE(lock->owner));
>   
>   	return (struct task_struct *) (owner & ~RT_MUTEX_HAS_WAITERS);
>   }
Marco, shouldn't lock context analysis be disabled for all READ_ONCE()
invocations? I expect that all code that uses READ_ONCE() to read a
structure member annotated with __guarded_by() will have to be annotated
with data_race(). Shouldn't the data_race() invocation be moved into the
READ_ONCE() definition?

Thanks,

Bart.
