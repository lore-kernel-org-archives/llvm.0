Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32A8340285
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 18:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170325; cv=none; b=m1zqWg+l22A3X6/mWv0zN/uQovmGwydA2XjpZ37rSujKilCNlgqAx3kDO09kgGXeGf3DH8UkayvaAnuXtsX3kgMpYKpFNT5QsPwjPMACLBR0UBqndlGzhVkON/eNNiTRggfqlzJ8x0H7mZwJrKGAp3tMn1TZQLlXP/qSNYzDNQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170325; c=relaxed/simple;
	bh=xXA0PeL3ZHVNEkpHhwp0UBIjbajCk6ydq2KatEKYDFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jXfj7Hfr5TxnWbcdoBaxCerIa8+a7PPOX0UY/dAxpH1becuJsFrgIb+Q/tKM4x46E3BPsR/0EnGh8VoWsqVKP/Q1+7W8PRVNpEzFoWJY9RRmXJFkeYvBDHkWEsCNUfvDI6ux6esAR1dti1xCWvMvAg4REQFpB6MQnRdcugDKSPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=DGiVeMQc; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="DGiVeMQc"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4dXxTY58fYzlvwp3;
	Fri, 19 Dec 2025 18:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1766170297; x=1768762298; bh=PA/EzXjpJ9iY5HMhsPBqLPtF
	iBx7PkN32m/6FP5Ts4o=; b=DGiVeMQc27vIAkTr+oE0kIyoezO0CIZ3uglO3WtJ
	LoZXPEXhJiVO1JCUrScuvS7qvU+uRn6X+Kb7xZwlKMOgn2npeoIYNVY5uS1UYRJo
	JW8DigHXgILJKnHf4xx2ecGeuZdmV7atZxPWuGHzCIoqbXehZUidk6kSuTLRGG3S
	pJoa006KPcCxUTMPNW/YnCdN6+/o/0KttYQAp3K5VGbcN/mo0mEEVqBVjWrKQJtc
	BS7kDQHYw1E9oFwjlOuyxGCgejvmHM9N8pdC+zeULsamrdEnTacXamB2bUhMpRVy
	eWIW6WA1xRvLCO7HjuQsVasNbMeuVKqCE2VqJhnIBAO9Qg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id VtZoOLR-Tx06; Fri, 19 Dec 2025 18:51:37 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4dXxTB01wHzlqg85;
	Fri, 19 Dec 2025 18:51:25 +0000 (UTC)
Message-ID: <3abc886c-aa3b-4816-9ea9-b1b2e7888225@acm.org>
Date: Fri, 19 Dec 2025 10:51:23 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/36] Documentation: Add documentation for
 Compiler-Based Context Analysis
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>,
 Eric Dumazet <edumazet@google.com>, Frederic Weisbecker
 <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>,
 Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Josh Triplett <josh@joshtriplett.org>, Justin Stitt
 <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-5-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251219154418.3592607-5-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 7:39 AM, Marco Elver wrote:
> +Context Analysis is a language extension, which enables statically checking
                                            ^
My grammar checker tells me that there shouldn't be a comma here.
However, I'm not sure whether the software that I'm using got this
right.

> +that required contexts are active (or inactive) by acquiring and releasing
> +user-definable "context locks". An obvious application is lock-safety checking

Please improve clarity of this text by adding a definition for "context
lock", e.g. the following: "Each context lock has a name. A state is 
associated with each context lock. Supported states are locked, 
unlocked, shared locked and exclusive locked. Functions can be annotated 
to declare what lock state is expected upon entry and what the lock 
state will be upon return. Members of data structures can be annotated
to indicate what context locks should be held upon access."

Thanks,

Bart.
