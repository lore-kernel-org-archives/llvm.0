Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897FE10792
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 21:57:11 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id m6-20020a17090a668600b002375cbab773so24947pjj.9
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 13:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678226231;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :precedence:mime-version:list-id:in-reply-to:dkim-signature:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIJseO2O4k59tEm7bHuU0xi/LTkj56mnW08T1PH+sQo=;
        b=oW7qbY1PcpuwFCLcuWVMfwVK1ucIeK3WMEJ5l4lOxhllDpLrv0XLSDsKkPkagCJ3M9
         URbnqVNJIu4FNyFivdexrrlUhScUQ3CRl6FuEZSY5jVrDhT8vHwlR8Kp5UXij1ATP/Xs
         N+KEvlbQb95d5J7jl1TmMWGo3mA95B32kX6fliqr93aGRyQ7nWjQn5rHHvSfN1VyEQJI
         KLdvkJprJvXEvzWl7KitxoNdvsgvL8/rkEiZwBaerzfs7nI/UaycGaK68zwUu+4Vwm1B
         TSVtA9CvFOFU0g4Z8h62SaURLmRTCAD+EyoLvimiqIyU5aLehTEfUW9BsgUc8weojHji
         VqxA==
X-Gm-Message-State: AO0yUKWCaGdsNjAtIus9ARZctvfo8vvCe/uVC7AjWELZ5nwd/IW/2urr
	Nuq4V2mOAY+1HTJamPqHkIwynaNI
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a63:291b:0:b0:502:e6c0:88a4 with SMTP id
 bt27-20020a63291b000000b00502e6c088a4mr5845015pgb.5.1678226230867; Tue, 07
 Mar 2023 13:57:10 -0800 (PST)
Date: Tue,  7 Mar 2023 21:56:57 +0000
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=20210112; t=1678148224; h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to; bh=+vkKpFoGZ+5lhaySQp4dtxoanu41mkOChhlNDvdqeo0=;
 b=T9inNMKTJQ+PiMEjBeNsr0hD3vUy8au1y5CA8L3HVn4W2lW3ez/s8EewH0RswQ0SCp
 kR0/13VWXzthjz4nRnXG9qXEwVhnO83kC+77sXOp96rEzfhBwbEbDuTBzoIQEYssSVLy
 KonQxN2a823Ha1S1Uw5oYDUYYWcP2T8tNLNMYtKSUCj78DwYbspevgJbINJWjFLwKJKl
 nvcA2YahedT8NI1l9AKWvO2iwiCiOUJKkPG3g+KuMlt1pNw+fvTyjaRQF2nOGtTBXR2h
 jpD2HQXzvTfxYeW5XQrd8hUbl2UZuncJWnjEQ+Jzs3AwTtz8nzmRm3t4guh6POnwZyvc twLg==
In-Reply-To: <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
List-Id: <linux-kernel.vger.kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Precedence: bulk
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18]) by
 smtp.lore.kernel.org (Postfix) with ESMTP id BBFD2C64EC4 for
 <linux-kernel@archiver.kernel.org>; Tue,  7 Mar 2023 00:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S229743AbjCGARI (ORCPT <rfc822;linux-kernel@archiver.kernel.org>); Mon, 6 Mar
 2023 19:17:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
 lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S229483AbjCGARG (ORCPT <rfc822;linux-kernel@vger.kernel.org>); Mon,
 6 Mar 2023 19:17:06 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631]) by lindbergh.monkeyblade.net (Postfix) with
 ESMTPS id 156BC567AA for <linux-kernel@vger.kernel.org>; Mon,  6 Mar 2023
 16:17:05 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id p20so12347624plw.13 for
 <linux-kernel@vger.kernel.org>; Mon, 06 Mar 2023 16:17:05 -0800 (PST)
References: <20230303231133.1486085-1-eranian@google.com> <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
X-Google-Smtp-Source: AK7set+GtYDMQ7ycRITNAmRQeXNwwJCWTU5HqQKdv2jt8XcCpJs6QDostciaUhOxSlbV5IVUo32AuMDoLZbOdmhEpZU=
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
X-Mailing-List: linux-kernel@vger.kernel.org
X-Received: by 2002:a17:902:ab4f:b0:19b:5233:51c6 with SMTP id
 ij15-20020a170902ab4f00b0019b523351c6mr4890025plb.0.1678148223882; Mon, 06
 Mar 2023 16:17:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <CAKwvOdnRvd5KK01awAyeyt5S36TPPW4_8Z6YL1r4gB-pBrHTbg@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
From: Bill Wendling <morbo@google.com>
To: ndesaulniers@google.com, Peter Zijlstra <peterz@infradead.org>
Cc: ananth.narayan@amd.com, babu.moger@amd.com, bp@alien8.de, 
	eranian@google.com, fenghua.yu@intel.com, james.morse@arm.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	peternewman@google.com, reinette.chatre@intel.com, tony.luck@intel.com, 
	vschneid@redhat.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <20230307215657.UrXYV0dIzIGb2yNs6wufh7B4QV7z4MnNMmZB9fCa4SM@z>

From: Nick Desaulniers <ndesaulniers@google.com>

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
>
> Compiler folks help?

What I think part of the problem is that the ASM that's reading the global =
is
dependent upon the address of the global (current_task):

    asm("movq %%gs:%P[var], %[val]"
        : [val] "=3Dr" (pfo_val__)
        : [var] "p" (&current_task));

while the ASM that writes is dependent upont the global itself:

    asm volatile ("movq %[var], %%gs:%[val]"
                  : [var] "+m" (current_task)
                  : [val] "re" (pto_val));

If the compiler doesn't recognize the "p" constraint as accessing memory, t=
hen
the compiler determines that the address of the global "current_task" doesn=
't
change, and thus may optimizat it away (when there's no "volatile" on the a=
sm
statement). This, as far as I can tell, is what's happening in clang.

-bw
