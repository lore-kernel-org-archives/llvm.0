Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC921FB4
	for <llvm@lists.linux.dev>; Thu,  3 Oct 2024 00:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727914128; cv=none; b=uLFwjVzXBPlgsHRlIf3QLCwX9nYgr5bRMtZ8mtlgAmuR5ttVNRqwGZcbyBBPd7ScxxfQEaxKhVltm9HIWpuApkGSVvHdCqg/XkJlIk3OIOLJsy2SCj9jtwVTuX7F5PFUI2J7zFgKCv4akM/CG2C8DDLn7IB0FeIWHqcbqpOFWg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727914128; c=relaxed/simple;
	bh=KUrfk+eq3257BUq5EaY4utlmEACyrb2EHZYgj/5cUlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKi8pJ+NGeMs66/uqKjvcMb3au7mFK2r00nMSiGprMN9Vu6U7PXmJgTp+elTwbwcHYJVj29am8nUS4/AUBTlt315Om0bqEb0u2oZtGKriwe3j0Z0oxP27fxkQ3JoVHQhqnWq3NG5qGySP/Uic4auMof7r+lBOsgP+wjPYy5FzRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=FcPJMPyh; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="FcPJMPyh"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a9ae0e116cso38073985a.1
        for <llvm@lists.linux.dev>; Wed, 02 Oct 2024 17:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1727914124; x=1728518924; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d3cwmVH4T8IqaLZrJPf4dN6HB0iRJ3ayFzGdEtNHxoA=;
        b=FcPJMPyhq5Y7DkuOCSJOGdEms8WTSmAr3+EYeLQ5tIgWnwtgOCU0UL7y2z227TaitF
         HsznbtY5WkMz3S8C4tRGsRL2dG9I0Xijsgf9VjE8tgOegLK3r34IOHZ06ljjIYlmsHaw
         fu0E8JoarQBIIG2oyD8YM0Ruk5NyDeCYiDotI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727914124; x=1728518924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3cwmVH4T8IqaLZrJPf4dN6HB0iRJ3ayFzGdEtNHxoA=;
        b=mo6CJqaKbZXC0Ofvd8OkIZdM6D2VQowImp8h+Oo+ZOum0pTXxXlbirfQt1/xSTLbH3
         moeSW/vWSa3r5rfQuoP9PrQRiugr308v9wSYEcsJHGB5F0DrhxCj6AMPWSbB2RmrVbFQ
         7YsaAzYAdcfLZZafBKFe0dML3izT+JGgsFHJDvx564eqmpsDgCebBT1U1VMXc6Ds6UGO
         njo19BmKNBG6OpHX2R3cvEKbMPS+BkZrSjVmnnUJcrP4NBmDuC4wuWfrDV8ecydaaVG/
         3wcDBFkVvoZtwEjJQL5ITb2LJYVPEAu66K2Pk9MAEbtSNqGTblbKmytyQnbZqsRWO7iC
         a38g==
X-Forwarded-Encrypted: i=1; AJvYcCVu0zqhUka9+ujhQMyowQGDhzdE83Sp2NEBCNETQ5r8QwbT88OscFL5AIKSa+VR9RwlTmoY@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8LZefKrARaMial2ZhsYtWs7xfKv6algoeOdoK+055UK/BfuPU
	g1KM+qj/iF5yBFe+cOyTZa6/LfKqUL+gP1Q/VE8QDwBOXcs/cVGvCu0o/f6+J5Y=
X-Google-Smtp-Source: AGHT+IFyyGM2DUoFUWQ5HNQaWWB8/IaPvClgER78DCcGgoTY7+i7cDT8H5iX51KO9rlUJfwMgd+NTQ==
X-Received: by 2002:a05:620a:2697:b0:7ac:dd3a:6787 with SMTP id af79cd13be357-7ae62732decmr738226785a.52.1727914124476;
        Wed, 02 Oct 2024 17:08:44 -0700 (PDT)
Received: from localhost (129.177.85.34.bc.googleusercontent.com. [34.85.177.129])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3783f80bsm669783585a.123.2024.10.02.17.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 17:08:43 -0700 (PDT)
Date: Thu, 3 Oct 2024 00:08:43 +0000
From: Joel Fernandes <joel@joelfernandes.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	John Stultz <jstultz@google.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
	Mateusz Guzik <mjguzik@gmail.com>,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev,
	Gary Guo <gary@garyguo.net>, Nikita Popov <github@npopov.com>,
	llvm@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
Message-ID: <20241003000843.GA192403@google.com>
References: <20241002010205.1341915-1-mathieu.desnoyers@efficios.com>
 <20241002010205.1341915-2-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002010205.1341915-2-mathieu.desnoyers@efficios.com>

On Tue, Oct 01, 2024 at 09:02:02PM -0400, Mathieu Desnoyers wrote:
> Compiler CSE and SSA GVN optimizations can cause the address dependency
> of addresses returned by rcu_dereference to be lost when comparing those
> pointers with either constants or previously loaded pointers.
> 
> Introduce ptr_eq() to compare two addresses while preserving the address
> dependencies for later use of the address. It should be used when
> comparing an address returned by rcu_dereference().
> 
> This is needed to prevent the compiler CSE and SSA GVN optimizations
> from using @a (or @b) in places where the source refers to @b (or @a)
> based on the fact that after the comparison, the two are known to be
> equal, which does not preserve address dependencies and allows the
> following misordering speculations:
> 
> - If @b is a constant, the compiler can issue the loads which depend
>   on @a before loading @a.
> - If @b is a register populated by a prior load, weakly-ordered
>   CPUs can speculate loads which depend on @a before loading @a.
> 
> The same logic applies with @a and @b swapped.
> 
[...]
> +/*
> + * Compare two addresses while preserving the address dependencies for
> + * later use of the address. It should be used when comparing an address
> + * returned by rcu_dereference().
> + *
> + * This is needed to prevent the compiler CSE and SSA GVN optimizations
> + * from using @a (or @b) in places where the source refers to @b (or @a)
> + * based on the fact that after the comparison, the two are known to be
> + * equal, which does not preserve address dependencies and allows the
> + * following misordering speculations:
> + *
> + * - If @b is a constant, the compiler can issue the loads which depend
> + *   on @a before loading @a.
> + * - If @b is a register populated by a prior load, weakly-ordered
> + *   CPUs can speculate loads which depend on @a before loading @a.
> + *
> + * The same logic applies with @a and @b swapped.
> + *
> + * Return value: true if pointers are equal, false otherwise.
> + *
> + * The compiler barrier() is ineffective at fixing this issue. It does
> + * not prevent the compiler CSE from losing the address dependency:
> + *
> + * int fct_2_volatile_barriers(void)
> + * {
> + *     int *a, *b;
> + *
> + *     do {
> + *         a = READ_ONCE(p);
> + *         asm volatile ("" : : : "memory");
> + *         b = READ_ONCE(p);
> + *     } while (a != b);
> + *     asm volatile ("" : : : "memory");  <-- barrier()
> + *     return *b;
> + * }
> + *
> + * With gcc 14.2 (arm64):
> + *
> + * fct_2_volatile_barriers:
> + *         adrp    x0, .LANCHOR0
> + *         add     x0, x0, :lo12:.LANCHOR0
> + * .L2:
> + *         ldr     x1, [x0]  <-- x1 populated by first load.
> + *         ldr     x2, [x0]
> + *         cmp     x1, x2
> + *         bne     .L2
> + *         ldr     w0, [x1]  <-- x1 is used for access which should depend on b.
> + *         ret
> + *

I could reproduce this in compiler explorer, but I'm curious what flags are
you using? For me it does a bunch of usage of the stack for temporary storage
(still incorrectly returns *a though as you pointed).

Interestingly, if I just move the comparison into an an __always_inline__
function like below, but without the optimizer hide stuff, gcc 14.2 on arm64
does generate the correct code:

static inline __attribute__((__always_inline__)) int ptr_eq(const volatile void *a, const volatile void *b)
{
    /* No OPTIMIZER_HIDE_VAR */
    return a == b;
}

volatile int *p = 0;

int fct_2_volatile_barriers()
{
    int *a, *b;

    do {
        a = READ_ONCE(p);
        asm volatile ("" : : : "memory");
        b = READ_ONCE(p);
    } while (!ptr_eq(a, b));
    asm volatile ("" : : : "memory");  // barrier()
    return *b;
}

But not sure if it fixes the speculation issue you referred to.

Putting back the OPTIMIZER_HIDE_VAR() then just seems to pass the a and b
stored on the stack through a washing machine:

        ldr     x0, [sp, 8]
        str     x0, [sp, 8]
        ldr     x0, [sp]
        str     x0, [sp]

And here I thought the "" in OPTIMIZER_HIDE_VAR was not supposed to generate
any code but I guess it is still a NOOP.

Anyway, as such this LGTM since whether OPTIMIZER_HIDE_VAR() used or not, it
does fix the problem.

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel

