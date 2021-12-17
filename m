Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2936E2CAA
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 19:39:56 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639769987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lMoouhykfVfJDl5sZJhCVdZA9ieCcvUqFvIwv5UecYE=;
	b=H4pSoXGCJPahnKGGfJxGXMh7FLemTtcdUmr5xjEQI0TIsGmRBMFSb1MLokm4VU/tafg5TW
	SfeKu5x9oY8boid/0HRP9oNCLFUptBbwmnnsz/PajMldiAjcgTWJC41Yu/H3JHqacmMvF2
	zfFTXCUODen4Oq9Sf/jwJrnEC6Ghr3N+ylxb/aPcY/SMLbq9f32EwK/mP6fWRp7ODDzC1P
	QL591eRfc59V8kltV4QgRhwWIs1DkAJ1hH22fRvxtqTv6CQVf8wdtwqYzoJDyEzZIkKwI+
	yv5f/OwwxpfkjVyWRRJck3ku1IOisrk4lO7dxXE9Jn2BqOC6y+NMQ7393Q0TIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639769987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lMoouhykfVfJDl5sZJhCVdZA9ieCcvUqFvIwv5UecYE=;
	b=OQmraGIkv5P/wktQ+QliiKi7xL+YiExNLBYDPaGYpX+0W5MYiKLHpN2vf4u3S3lNmPeLPQ
	pKYUo/avDW2+JNCQ==
To: Bill Wendling <morbo@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin"
 <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Juergen Gross <jgross@suse.com>, Peter Zijlstra
 <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86: use builtins to read eflags
In-Reply-To: <CAGG=3QV2sw1w+j2NDqPVAbobGj04QXfOF0VcSCebRbs6y-L5WA@mail.gmail.com>
References: <20211215211847.206208-1-morbo@google.com> <87mtl1l63m.ffs@tglx>
 <CAGG=3QV2sw1w+j2NDqPVAbobGj04QXfOF0VcSCebRbs6y-L5WA@mail.gmail.com>
Date: Fri, 17 Dec 2021 20:39:46 +0100
Message-ID: <87o85faum5.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Bill,

On Thu, Dec 16 2021 at 11:55, Bill Wendling wrote:
> On Wed, Dec 15, 2021 at 4:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> Emphasis on *can*. Just claiming that this might improve things does not
>> cut it. Where is the prove?
>>
> There are a few proofs. First, clang generates better code with the
> builtin.

which is best demonstrated by showing the before and after.

> Yes, that's because clang doesn't handle the "=rm" constraint
> in the same way that GCC does, but that's not really relevant (sure,
> clang should correct this, but that shouldn't prevent this patch from
> going, because builtins are generally better than inline assembly).
> Builtins exist for a reason. The compiler's able to understand what's
> going on and generate the appropriate code for it. It also gives the
> compiler more freedom for optimizations.
>
> Secondly, this one small function has had multiple changes since its
> creation, basically pinging back and forth trying to determine the
> best constraints to use:
>
>   6abcd98f x86: irqflags consolidation
>   f1f029c7 x86: fix assembly constraints in native_save_fl()
>   ab94fcf5 x86: allow "=rm" in native_save_fl()
>
> The information on which form to use already exists in the compiler.
> Using the builtin will save future churning and thus developers' time.

Why is the above and this

> The minimal version of GCC is now 5.1, which supports these builtins.
> That wasn't the case before.

not part of the change log to avoid maintainers having to ask exactly
these questions?

Thanks,

        tglx




