Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEDA7C
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 00:17:05 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so134344pjn.1
        for <llvm@lists.linux.dev>; Mon, 06 Mar 2023 16:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678148224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vkKpFoGZ+5lhaySQp4dtxoanu41mkOChhlNDvdqeo0=;
        b=T9inNMKTJQ+PiMEjBeNsr0hD3vUy8au1y5CA8L3HVn4W2lW3ez/s8EewH0RswQ0SCp
         kR0/13VWXzthjz4nRnXG9qXEwVhnO83kC+77sXOp96rEzfhBwbEbDuTBzoIQEYssSVLy
         KonQxN2a823Ha1S1Uw5oYDUYYWcP2T8tNLNMYtKSUCj78DwYbspevgJbINJWjFLwKJKl
         nvcA2YahedT8NI1l9AKWvO2iwiCiOUJKkPG3g+KuMlt1pNw+fvTyjaRQF2nOGtTBXR2h
         jpD2HQXzvTfxYeW5XQrd8hUbl2UZuncJWnjEQ+Jzs3AwTtz8nzmRm3t4guh6POnwZyvc
         twLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678148224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vkKpFoGZ+5lhaySQp4dtxoanu41mkOChhlNDvdqeo0=;
        b=XqAOjhHmszf2pb0VOIcG82kGhVsV8BNE3va8VJKJrDmjo9lHOcbJgDi7s/1YyGMU/B
         +chqEWMWaEjgVZVu81nPAAjH3CfjyrkXYHKM5tMgPosMHg5KpEj1OrYfxPAvcSzPMug/
         YNeMhQVmiehy1RbemHoloHXuVVnvMdi3KkL29KwEfdyvhsW+qs2MjWUyLcntoNvhuOTx
         dkNshJXMMzfFjaidLACze1pE/ZT0UbpRFfpqgC2mWD4iouiXCQ95xchf7ooaYeMtzdg1
         2ZjJ0AB3EmaLgLWx0eAyqr+5HHyTzL2ZIO48+fO8ufuN/jbGyVGakZB2L4ob9fDsbn2A
         8F1Q==
X-Gm-Message-State: AO0yUKUWyCdNga7EmooSuuIA51y8N5VWEqTZ5oe7zMWjbuBKY3e0Okqv
	8wMib+hEZCpdniIpy5uKOvsfw9QgH0Ga7OPrS1p+DA==
X-Google-Smtp-Source: AK7set+GtYDMQ7ycRITNAmRQeXNwwJCWTU5HqQKdv2jt8XcCpJs6QDostciaUhOxSlbV5IVUo32AuMDoLZbOdmhEpZU=
X-Received: by 2002:a17:902:ab4f:b0:19b:5233:51c6 with SMTP id
 ij15-20020a170902ab4f00b0019b523351c6mr4890025plb.0.1678148223882; Mon, 06
 Mar 2023 16:17:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303231133.1486085-1-eranian@google.com> <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
In-Reply-To: <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 6 Mar 2023 16:16:52 -0800
Message-ID: <CAKwvOdnRvd5KK01awAyeyt5S36TPPW4_8Z6YL1r4gB-pBrHTbg@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, tony.luck@intel.com, 
	reinette.chatre@intel.com, fenghua.yu@intel.com, peternewman@google.com, 
	james.morse@arm.com, babu.moger@amd.com, ananth.narayan@amd.com, 
	vschneid@redhat.com, Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Start of Lore thread:
https://lore.kernel.org/lkml/20230303231133.1486085-1-eranian@google.com/

On Mon, Mar 6, 2023 at 4:01=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Fri, Mar 03, 2023 at 03:11:33PM -0800, Stephane Eranian wrote:
>
> > The problem is located in the __resctrl_sched_in() routine which rewrit=
es
> > the active closid via the PQR_ASSOC register. Because this is an expens=
ive
> > operation, the kernel only does it when the context switch involves tas=
ks
> > with different CLOSID. And to check that, it needs to access the curren=
t
> > task's closid field using current->closid. current is actually a macro
> > that reads the per-cpu variable pcpu_hot.current_task.
> >
> > After an investigation by compiler experts, the problem has been tracke=
d down
> > to the usage of the get_current() macro in the __resctrl_sched_in() cod=
e and
> > in particular the per-cpu macro:
> >
> > static __always_inline struct task_struct *get_current(void)
> > {
> >         return this_cpu_read_stable(pcpu_hot.current_task);
> > }
> >
> > And as per percpu.h:
> >
> > /*
> >  * this_cpu_read() makes gcc load the percpu variable every time it is
> >  * accessed while this_cpu_read_stable() allows the value to be cached.
> >  * this_cpu_read_stable() is more efficient and can be used if its valu=
e
> >  * is guaranteed to be valid across cpus.  The current users include
> >  * get_current() and get_thread_info() both of which are actually
> >  * per-thread variables implemented as per-cpu variables and thus
> >  * stable for the duration of the respective task.
> >  */
> >
> > The _stable version of the macro allows the value to be cached, meaning=
 it
> > does not force a reload.
>
> Right, so afaict the difference between this_cpu_read() and
> this_cpu_read_stable() is the volatile qualifier.
>
> this_cpu_read() is asm volatile(), while this_cpu_read_stable() and
> raw_cpu_read() are both an unqualified asm().
>
> Now, afaiu we're inlining all of this into __switch_to(), which has
> raw_cpu_write(pcpu_hot.current_task, next_p).
>
> And I suppose what the compiler is doing is lifting the 'current' load
> over that store, but how is it allowed that? I thought C was supposed to
> have PO consistency, That raw_cpu_write() should be seen as a store to
> to pcpu_hot.current_task, why can it lift a load over the store?
>
> Specifically, percpu_to_op() has a "+m" output constaint while
> percpu_stable_op() has a "p" input constraint on the same address.

I definitely think the issue is specific to "p" constraints.
https://godbolt.org/z/34YeG6WbY is the test case I reduced which I
think demonstrates the issue.

https://reviews.llvm.org/D145416
-> click "Show Older Changes" for the ongoing discussion.

I don't have a satisfactory answer yet, but am looking into this.

>
> Compiler folks help?



--=20
Thanks,
~Nick Desaulniers
