Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B281E9B12
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048600; cv=none; b=ns819oRjPqc3ZP10GsGSDyD2gNPhHu5PeFPBmMRNIoCInnS7ANFyVInkj5ZcNANY06croHMTTsxtdI0mXjIjp49qoak3LZgEQCTvYNg1Ux0m4WV5kc6ZDqtiMd6n7IAkAwi6p8Ftft3HHEgHkb2qoClxIq5okvKPmC6oB+AVOHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048600; c=relaxed/simple;
	bh=aeYoCOYIi3+P5KIBHHFXDn7aAVa7SVhn6e3fXFtEleU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Is1sOAU/j7LaNhbbz79MhPLvQ6l0PJgSA71NGMW+gVRh2mMnDqJwU/alFAR52gHQh9HrQVAfadKunfoQhke5AgWQ9PGl4541aeJRXyfMK8G736r4q1fjlE99wGr3VmnpCFm6bSclSRsq6lvkntGJHIcbpR7Mn2cZooSiM7UCCGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHZDIXye; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHZDIXye"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42e2e77f519so206904f8f.2
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 01:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766048597; x=1766653397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDxH7qSfMcvkHLsC5apj9tDI0YXojM/cFgm0fm580dk=;
        b=QHZDIXyeCSKUKcXj7rJ6dRRpz8uv+iKxFCxqzMbDDYNzXsqVzCNKoOgUtTaj25ubhN
         a19er7b21fPwTaJoBhKfST9v8RAJ71sB9kcJtIdQmZam9XEBGF1AUuO5XWNUek8V7p0J
         U+2t9CNHxzbyeidP234mQGxoOjyKJWI9utvCmqDSXdH9XVYJKOQRuRUwcJjBcFjt0gyK
         IjtYFCySBIC8WK3oz9ud4ZOQ4VfXc1pJ5ffqn4yyQxmdmznUS/93pmnljX8TKLWMklIp
         VxWdEim64fQdjx2ieLyAeMOlGqMSJl+XBjM8k93yBGplcu3rFvYL4Qv1/WlEabCbmrIA
         8PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766048597; x=1766653397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RDxH7qSfMcvkHLsC5apj9tDI0YXojM/cFgm0fm580dk=;
        b=Yc2EcCdK9HFHsTEfXxCIvlWXunKMoxo2zwPwmSd0/Kst3Hmq5BpbccQgYwY6kZGUqL
         0+6oDSuf7erxnBcDhlPT0hpUAkJW7ugOAT//uDhQ+sgK/msnw3N72Ai3EJBELtUBPiWl
         jjyDdu0aiZw/1rCGMYyJd5lKo/yzJD+UzITF84hNoam+SV7oEUZ5RzOHPQI9+cBjqhbX
         bOehM30jhnQKc59Ylg7xQ9O6g042a6F05VWMV5rt+yGfiJvANHeyu1XCTNugHdwbFGSf
         yRN8gNt5S+kUvlNcxOBfFN31nWbSBWY1K1/7DCk2SM/XAwqwBe3aIduNRa5v7nwfZSH9
         gH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrFqpeNHT1MaLAcnaaDHzhYFNSvgVXJas+yd8prq/+NybTi7VxTRV4Dqp/XTPF2aR45rU4@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/NrH7tF3ZTh1Nc34aB+rdzJ23Q5eR7LWV8FWQ0xEkmnbNs9MA
	d0yjqF1b3cZG6Cz380EXt2ldWsoh8JZT42dGqhtVpgNNYIBU6HQyEQU6
X-Gm-Gg: AY/fxX7zQm0UjnmMlNuFUlSr9wIuqNXCrxsbt4KDSShRMQqHxhrQq1rPw9AtYa0BZio
	3Jqvad3IOSqzEU1kkAN/Pu8TACXFdWiIh0+IfVbKiHO748RPp8czE4u5IDvO/EPxXiEnNzrQve/
	jsS/c2JQr49wQw19ZmvI2ZCdzDiDmOUeLMPU/MzDDvAvRqAJF6ZXftBUVaFPa+fuzaUIRIa5Y0F
	HCNpr0ntCzbgvJKh8xOr6waJzIXWbbsiqmh60ajXoFW3DIbsEo4s49DEFdHQJCNifbYQdGVZepf
	1z0hNWqiZobxOQtnmCPCYUxBB7c9jffeQ8feOF0pQ36GgBo/kH0v0f0XF2IACnQI0y8oaZ+G65I
	9eWE5n24kAW9hnzBHbViIxCiyWbiUtw2FMuMWLH6gUkhqz7zegorlhNZFidGcHMDi1PGB7opVEA
	0zGVGCE+QG4Ibfyz5DFguGof7yBbfNQff8eEBV0QkxsmjtiRCFtxzO
X-Google-Smtp-Source: AGHT+IEbh0hfUiD9R3GvyhXdWOj5sIjfGCLoQ1ahL8e/00qynhJrsgNXG94C0F/okiDwtop3UZ3GBA==
X-Received: by 2002:a05:6000:1848:b0:430:f97a:6f43 with SMTP id ffacd0b85a97d-430f97a7049mr16299902f8f.53.1766048596303;
        Thu, 18 Dec 2025 01:03:16 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493fe27sm3770797f8f.12.2025.12.18.01.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:03:15 -0800 (PST)
Date: Thu, 18 Dec 2025 09:03:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes
 <joel@joelfernandes.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, John Stultz
 <jstultz@google.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Frederic Weisbecker <frederic@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil
 Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik
 <mjguzik@gmail.com>, Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev, Gary Guo
 <gary@garyguo.net>, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v4 1/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
Message-ID: <20251218090313.33923750@pumpkin>
In-Reply-To: <20251218014531.3793471-2-mathieu.desnoyers@efficios.com>
References: <20251218014531.3793471-1-mathieu.desnoyers@efficios.com>
	<20251218014531.3793471-2-mathieu.desnoyers@efficios.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Dec 2025 20:45:28 -0500
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

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
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Tested-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Acked-by: "Paul E. McKenney" <paulmck@kernel.org>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: John Stultz <jstultz@google.com>
> Cc: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Cc: Zqiang <qiang.zhang1211@gmail.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: maged.michael@gmail.com
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
> Cc: rcu@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: lkmm@lists.linux.dev
> Cc: Nikita Popov <github@npopov.com>
> Cc: llvm@lists.linux.dev
> ---
> Changes since v0:
> - Include feedback from Alan Stern.
> ---
>  include/linux/compiler.h | 63 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 5b45ea7dff3e..c5ca3b54c112 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -163,6 +163,69 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
>  	__asm__ ("" : "=r" (var) : "0" (var))
>  #endif
>  
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
> + * On weakly-ordered architectures, this lets CPU speculation use the
> + * result from the first load to speculate "ldr w0, [x1]" before
> + * "ldr x2, [x0]".
> + * Based on the RCU documentation, the control dependency does not
> + * prevent the CPU from speculating loads.

I'm not sure that example (of something that doesn't work) is really necessary.
The simple example of, given:
	return a == b ? *a : 0;
the generated code might speculatively dereference 'b' (not a) before returning
zero when the pointers are different.

	David

> + */
> +static __always_inline
> +int ptr_eq(const volatile void *a, const volatile void *b)
> +{
> +	OPTIMIZER_HIDE_VAR(a);
> +	OPTIMIZER_HIDE_VAR(b);
> +	return a == b;
> +}
> +
>  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>  
>  /**

