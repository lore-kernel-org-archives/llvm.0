Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419E12BD015
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 21:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180866; cv=none; b=fzaAD+f1eGeXMA82C2VTB67xZHUYavZ2jnvCFNwZcrwbMY76Gn3Bxo7bOlSQiwIk/lR8FRmxYW4o6oq8/tweQBr+3EsA5LbqbNTIE5JziQR0fDNxQkXW35fjRLeTaqZc/LahGb/UAHVy2Hw1FZyMa6kVSGDjlPywfTnhfKLFX8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180866; c=relaxed/simple;
	bh=Ms51wSRYcNMLU08U6XlitTxavoeEVdn7PylZ66BFoeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPbRI3lwJUc7dVbRkKOqFu9H9ctN6OjrDJhUQd6sDJdYCKrReeTw7etRL5nGG8c0zd4vJQxuCaKvYAI7vpZGT1MzwGzrSVjpGTUDWaHq8IjZt/UckHpR3MKCfbixV7Wx43JcYyzit/p5lj+6Ij6WDKuhVHkh3VDH4QpUuqsyMSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TkdJ4WGe; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TkdJ4WGe"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c03ec27c42eso1256978a12.1
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 13:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766180864; x=1766785664; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms51wSRYcNMLU08U6XlitTxavoeEVdn7PylZ66BFoeI=;
        b=TkdJ4WGetL3iOZO5IYjLU/N+qW+7fJBXGGnsVndg5t7MW5X+J09q922mtf3kEQMH7X
         jxxX/Hd/oEOXGcLfM/EQDamxgUewcrH5ghJEGM3wQtr+DCkKjDYlmVNZdzB3NnTphh2Q
         65cBnkmyTM8mBa5+8D4l6LuZyi4YclKgB2ffjG8u85mPOe/3PBnzowGrlGbk/uw278hS
         5yAY76wpnXimKdcVgaNxCMYJJvOs84+dbZTp1A3f1d7hO+Cz8+/OO0GI/1ntXdld3cb/
         oBly44hAyRNWy8+MQ5LqXInYpIn0KRaTKszbJqa+3xmW+gVPTHUJL8J8FFNbQaHOy6D7
         rxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180864; x=1766785664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ms51wSRYcNMLU08U6XlitTxavoeEVdn7PylZ66BFoeI=;
        b=XyHw/Am22AqhPg8ap4Wk7pUzurWVPcdQCto7UWE07QzL/s8cuZCicSFXiMgmbm2FUS
         1VOPYGsGJ7kRXV4lVMf4CbGq0Yp6xhuEq2vfAWnDGNPcGAmgyyxaqygDygjUH1NwH7ac
         K5W9ir8vc3E+NtQAOL6ODu4MaNQ0E19JJpMIKathj5Ej0tjd34FiRl+JG2CnK0jhqG+E
         U7B0P0/cET6BPW2Q9qsUbxHncWQjk7LC9HNHF676jnv/ay8+Ctq+WgBz7+f0MDsNbZv8
         OJdlH+jGvk+Lb9jOC5KiOqrVxlvgLNbJYjqSKOWPvHejuRZ4gGnQUlMcJRx9qFp2TkxU
         AZzg==
X-Forwarded-Encrypted: i=1; AJvYcCXcB6C3Z09MC39BBbuKOY2/++/3sGjYPf0KestnzJQXrBxeF11nEBMHjCknEjDjh1WrMHCp@lists.linux.dev
X-Gm-Message-State: AOJu0YwXXn+19DfmvBtlmgqf4EqspOqeaGfZgeWfu7M+wmXnI0H7nJN4
	Ay5E6b3/3jdpqW7QNBGYy+WhrY1Y2vcMZDbdFS9isvzIN6hJuXPMS0aaF4xpmmQ88vwUSBdvxmP
	a5yijPo/SotGaTdO5RyZ7y3eBpG3Vo0Q1xietJIwk
X-Gm-Gg: AY/fxX4u5UolinJhq+qoPPlTtwj4C+bBz650+E87XRsjQjvB4LwXC3/kxMWIN1U2D7C
	whFV+VZsFNFfOpPUtWAeuQRJwcCsKAwLOzmSBnrLIfKifd4jOKZvNhuYb33RyiVRAGwXNrzuJAx
	XID2frZA4db+ARrShn8usLWmibxgDbsaDDiUQ9+95TVxfIEFnZ0QQY5ajwqXqJaLH9/FneMzGei
	KP/bY9Sg1+yGSIo/7y3zqQs5tjhfwmZ9HVWau0pojre6gvRZsyGtiFpksNJqzUbwZiBlDEZM9gx
	Cz268VBhYD+byjKlkFTOYN/lXas=
X-Google-Smtp-Source: AGHT+IFIxJn1IGPy0nHsxYCQasesjc20OB/If1nT0iJGZS/3DeBiPOVvBE4Lni1iekMVipiY5AEcIb2ButU5L5/gdvQ=
X-Received: by 2002:a05:7022:5f0b:b0:11b:9d52:9102 with SMTP id
 a92af1059eb24-121721aaff1mr2914480c88.6.1766180863274; Fri, 19 Dec 2025
 13:47:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-8-elver@google.com>
 <cdde6c60-7f6f-4715-a249-5aab39438b57@acm.org> <CANpmjNPJXVtZgT96PP--eNAkHNOvw1MrYzWt5f2aA0LUeK8iGA@mail.gmail.com>
 <ecb35204-ea13-488b-8d60-e21d4812902a@gmail.com>
In-Reply-To: <ecb35204-ea13-488b-8d60-e21d4812902a@gmail.com>
From: Marco Elver <elver@google.com>
Date: Fri, 19 Dec 2025 22:47:06 +0100
X-Gm-Features: AQt7F2oOvMMB1QIst16kG-Ehhh_fmZRMYn3rIRXwuCNiu1TQ-QKGkuW-c2bqFwM
Message-ID: <CANpmjNPp6Gkz3rdaD0V7EkPrm60sA5tPpw+m8Xg3u8MTXuc2mg@mail.gmail.com>
Subject: Re: [PATCH v5 07/36] lockdep: Annotate lockdep assertions for context analysis
To: Bart Van Assche <bart.vanassche@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Dec 2025 at 22:28, Bart Van Assche <bart.vanassche@gmail.com> wrote:
>
> On 12/19/25 2:16 PM, Marco Elver wrote:
> > It's basically an escape hatch to defer to dynamic analysis where the
> > limits of the static analysis are reached.
>
> That's not how lockdep_assert_held() is used in the kernel.

Because there had not been any static analysis like this, and dynamic
analysis is the only reasonable option.

> This macro
> is more often than not used to document assumptions that can be verified
> at compile time.

In that case the lockdep_assert can be dropped.

> This patch seems like a step in the wrong direction to me because it
> *suppresses* compile time analysis compile-time analysis is useful. I
> think that this patch either should be dropped or that the __assume()
> annotations should be changed into __must_hold() annotations.

If we drop this patch, e.g. the "sched: Enable context analysis for
core.c and fair.c" will no longer compile.

It's a trade-off: more false positives vs. more complete analysis. For
an analysis to be useful, these trade-offs make or break the analysis
depending on the system they are applied to.

In the kernel, our experience with developer tooling has been that any
efforts to reduce false positives will help a tool succeed at scale.
Later you can claw back some completeness, but focusing on
completeness first will kill the tool if false positives cannot
reasonably be dealt with.

From the user space world we know that "assert lock held" [1] as this
kind of escape hatch is valuable to deal with cases the static
analysis just can't deal with. Sure, here we can make our own rules,
but I'd argue we're in a worse position than most user space code, in
that kernel code is significantly more complex (which is the reason I
spent over half a year banging my head to make Clang's analysis
significantly more capable).

[1] https://github.com/abseil/abseil-cpp/blob/a8960c053bf4adadac097c1101d0028742d8042f/absl/synchronization/mutex.h#L210
(ASSERT_EXCLUSIVE_LOCK() == __assume_ctx_lock())
