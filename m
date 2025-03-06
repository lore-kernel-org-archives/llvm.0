Received: from 001.mia.mailroute.net (001.mia.mailroute.net [199.89.3.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE035212D7B
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741277930; cv=none; b=K6PF9ZCZWG9R2zSR01hILKQ+AwuncBXBA8NeYR6H69VQKbkoT0BUgYkZR3oSVSFfSOohN3eYHCk+yO3rGo2R+wGw7scjIEge1qSSdD+6q+l48rk5Qxv3Aloc375yLgUHferPFaJAr3jsCEkpgaSAEqxgUmOrjcksN2d1zKf28WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741277930; c=relaxed/simple;
	bh=De55fhUtlN1iOahZLnXDNVZ2BDlC6iMvmMACeXLH9Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPWmBLAmFB0Daf+oLgjo4MHoFqNN+XMMBd1TH0ZXfnd3nwnFiNVS9kTnC3mJ9q1NaUYvvX3jargnjzSZ0xOyycUSvkS0fHPxATFuaDCtWD91WL94WE//NPoeytX4mtrhpdo7aTgyKUv0QRlSCjRSba/YgrTl+cTGJCRYffMB6/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=I4FBMRG3; arc=none smtp.client-ip=199.89.3.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="I4FBMRG3"
Received: from localhost (localhost [127.0.0.1])
	by 001.mia.mailroute.net (Postfix) with ESMTP id 4Z7vjz4Hr7z1XW3S8;
	Thu,  6 Mar 2025 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1741277925; x=1743869926; bh=k2NEf3suzkcyKFAWjpxxJAaH
	qHgKI7A6QZ+72AmJSaU=; b=I4FBMRG3OLsTyOK2s4X0iYo1jtMhik7Y2s/EhTh+
	wUseoYiY9gE+iDXOBFC6Y8QfKl7yri9zjTFGRE+bFB11TbX4PfRTA8u9B4mc1TSt
	ILpxo6BCTCrxUoFQ4Jkn7PQ7KOYWYu0wEQ/5vE9OocvWAvL32sq0TB/rP7oc6EC3
	C2LZqzMhDkw3Ucje2l/EneqUzdUMZWSE4udHelrTUeE5rCD+/IWD/oTxQsPDzibq
	m51B44mgoon2q9vbODctZqLYb02ffpu3ufgtCxxoROTk2PU7qR2VPAlRTz60Ofhy
	b7LtFUL+9d4AFGdIDguOgmQOneR9CJWrAwLjFBLgb8wbaQ==
X-Virus-Scanned: by MailRoute
Received: from 001.mia.mailroute.net ([127.0.0.1])
 by localhost (001.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SMmZO3HfW55M; Thu,  6 Mar 2025 16:18:45 +0000 (UTC)
Received: from [172.20.1.83] (unknown [192.80.0.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 001.mia.mailroute.net (Postfix) with ESMTPSA id 4Z7vjr4RbYz1XW0Qm;
	Thu,  6 Mar 2025 16:18:39 +0000 (UTC)
Message-ID: <c5e6c203-aa4e-4208-9783-83146c9d49e9@acm.org>
Date: Thu, 6 Mar 2025 08:18:37 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread Safety Analysis and the Linux kernel
To: Peter Zijlstra <peterz@infradead.org>,
 "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
 "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306094752.GC16878@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250306094752.GC16878@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/25 1:47 AM, Peter Zijlstra wrote:
> That no longer works for the case of:
> 
> DEFINE_GUARD_COND(mutex, _try, mutex_trylock(_T))
> 
> which expands to have a constructor like:
> 
> static inline struct mutex * class_mutex_try_constructor(struct mutex *_T)
> {
> 	struct mutex * t = ({ void *_t = _T; if (_T && !(mutex_trylock(_T))) _t = NULL; _t; });
> 	return t;
> }

Hi Peter,

Would it be acceptable to introduce variants of the conditional locking
functions that return the mutex pointer instead of a boolean to indicate
whether or not locking succeeded? Would that be sufficient to change the
type of 't' above from 'struct mutex *' into 'struct mutex *const'? Two
examples of what such functions could look like:

struct mutex *mutex_trylock_ptr(struct mutex *mutex)
	__cond_acquires(nonnull, mutex)
{
	return mutex_trylock(mutex) ? mutex : NULL;
}

struct mutex *mutex_lock_interruptible_ptr(struct mutex *mutex, int *res)
	__cond_acquires(nonnull, mutex)
{
	int ret = mutex_lock_interruptible(mutex);

	if (res)
		*res = ret;

	return ret == 0 ? mutex : NULL;
}

Thanks,

Bart.
