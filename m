Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDA28E8;
	Fri,  7 Mar 2025 08:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741334838; cv=none; b=UuaW4N9oWSuHCeDVDc0lr+rby5IsFjdAPpLaNqU512tXsdHapgqa1/DZvWXylWisKTYX430foDMLW9FZ4xrIlfPZp8tbK6QXU9HYNQvxevmrfZbkjQLPx3dgdRRJ+lq2chzz1XJy3JblVHSy5ay4+rS7mPPLROrEfZeJt5C16Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741334838; c=relaxed/simple;
	bh=I+V9fLLXDMS8aowc+Jr+kVohNmy0n1DbYN2ni0V4S/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzQSSpG1xCLRqFdbTtB+ae0QWkwEbrjREHHZ4Tpbs5jZpI3cPVuYInfyRHMkIOBg3b/coQDbQP5XoRPcY9sv8PH8vuamkH0IX1CBMJkcYlR2dS8VMFRW5zbTHskUb4K6HHnx2IieqbaUuoZS4y7gO4FuCBN7V5L0mb3RDFXSH4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lSBIxPn2; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lSBIxPn2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qn9OQ34QAYJ/ZFbig5athyzvQ8qn90kxeRhyV6lBL1M=; b=lSBIxPn2VgwEngwBMBgk5O4NQ1
	0s07sSNYjFUB0b0raVQ0BmZ4DVrvAWUz6MXzf5BPT7jerssp2kmsL+6SPL63Uo4/pbHqmtxn7dQI9
	CMU33Ko0i7Na4BByJCoM5dscpDcHvCJ4FYYYXyTg/wrBqSGHL1zhwQI+bZwrjvBNjZpZfygl5gqiu
	gCeZNr6Vjpzr3j1UBC1nQV1IrNpCdUIjRhepXscaGy20/m9puHjccjX5Dt82OGBTYk3fUBQpGQjiy
	9BLrThhIicIl1LBVuO/6Xo+MwD+9O9mJvBBSkXf546mgYDcT0WTvZThfsRoRRJrcmpSdwnTcseQcz
	IyOwVinw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSjc-00000001Il3-3yKf;
	Fri, 07 Mar 2025 08:07:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1BD2C300269; Fri,  7 Mar 2025 09:07:08 +0100 (CET)
Date: Fri, 7 Mar 2025 09:07:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Puchert, Aaron" <aaron.puchert@sap.com>,
	Marco Elver <elver@google.com>,
	Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250307080708.GI16878@noisy.programming.kicks-ass.net>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306094752.GC16878@noisy.programming.kicks-ass.net>
 <c5e6c203-aa4e-4208-9783-83146c9d49e9@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5e6c203-aa4e-4208-9783-83146c9d49e9@acm.org>

On Thu, Mar 06, 2025 at 08:18:37AM -0800, Bart Van Assche wrote:
> On 3/6/25 1:47 AM, Peter Zijlstra wrote:
> > That no longer works for the case of:
> > 
> > DEFINE_GUARD_COND(mutex, _try, mutex_trylock(_T))
> > 
> > which expands to have a constructor like:
> > 
> > static inline struct mutex * class_mutex_try_constructor(struct mutex *_T)
> > {
> > 	struct mutex * t = ({ void *_t = _T; if (_T && !(mutex_trylock(_T))) _t = NULL; _t; });
> > 	return t;
> > }
> 
> Hi Peter,
> 
> Would it be acceptable to introduce variants of the conditional locking
> functions that return the mutex pointer instead of a boolean to indicate
> whether or not locking succeeded? 

So I don't think we need to do that. All that is important is that the
thing can track the return value of the constructor to the argument of
the destructor. What actually happens inside those functions is
immaterial.

(I got myself slightly confused when writing that earlier email).

Anyway, for DEFINE_GUARD_COND() we can do:

        EXTEND_CLASS(_name, _ext, \
-                    ({ void *_t = _T; if (_T && !(_condlock)) _t = NULL; _t; }), \
+                    ({ void *_t = (_condlock) ? _T : NULL; _t; }), \
                     class_##_name##_t _T) \

But it becomes a little more tricky for DEFINE_LOCK_GUARD_1_COND().

Still, like I argued above, I don't think it matters.
