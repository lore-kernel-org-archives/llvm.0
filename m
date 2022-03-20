Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB429AD
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 10:42:44 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by gnuweeb.org (Postfix) with ESMTPSA id 014C77E2BC
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 10:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1647772964;
	bh=cslQqgZ7BRLt7KwLkN6alHsy0RvZ6fR/hvzrpU/IQcw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bFDGdfBQ3owjAm/4oBfunZS+DrEyK0awO7Qz5oGktEcPCnImR0wZgBv+LNd7aIC1i
	 fGyvC6p4/FN/DDQPq228Zj2yJixTbwoCcoKkpJ0/AzFbX0uMA43D+mh2L252TLLN5B
	 /ncMD+AGOhrx61gIsxzAKanZnCRzwtqnmuL1M091E9UV2Aeznl/4I3VTVCcEfGwE/I
	 C1+DL4Si5HQ6+QxLauMO6t+W60QB8B0vo+6an6k8Y4FJUMgbHM+dG2rH91/RIHUJxJ
	 9Bch068lVennn7YcAryshledQyBPUmKNHe1fzSmjiEwXmFaZsJpbiDozN9PbcIA1fW
	 fKf+RyhIyrJhA==
Received: by mail-lj1-f175.google.com with SMTP id q5so16497006ljb.11
        for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 03:42:43 -0700 (PDT)
X-Gm-Message-State: AOAM531SD/7ICHK3x4fUJdHbzB0tAa1lKwpr9o2tRHidVODZspLE150x
	rPSKDXzWOjiqWOmmBUbrjW/HoSld3l9on59s3rA=
X-Google-Smtp-Source: ABdhPJz2Mt7MudHlBHTgwknr9S1NVKeLSs8DnEm5oR+qe5t2az/z3e9HK824k1yGmqCzAFBlGv5uyg0SUiaDNrsvLlQ=
X-Received: by 2002:a2e:7d05:0:b0:247:ed41:690d with SMTP id
 y5-20020a2e7d05000000b00247ed41690dmr12102096ljc.92.1647772962093; Sun, 20
 Mar 2022 03:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220320093750.159991-1-ammarfaizi2@gnuweeb.org>
 <20220320093750.159991-4-ammarfaizi2@gnuweeb.org> <CAOG64qO5b30GjyYxoRj9QLJpfaa-o40W1oYL0XuZ8C5QX17bww@mail.gmail.com>
In-Reply-To: <CAOG64qO5b30GjyYxoRj9QLJpfaa-o40W1oYL0XuZ8C5QX17bww@mail.gmail.com>
From: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Date: Sun, 20 Mar 2022 17:42:30 +0700
X-Gmail-Original-Message-ID: <CAOG64qPyXS-NVE6wV2fs8ho5B88ziZrO9mL3cgZrLRqf6tmmQA@mail.gmail.com>
Message-ID: <CAOG64qPyXS-NVE6wV2fs8ho5B88ziZrO9mL3cgZrLRqf6tmmQA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/6] tools/nolibc: i386: Implement syscall with 6 arguments
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, Nugraha <richiisei@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, x86@kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 20, 2022 at 5:33 PM Alviro Iskandar Setiawan wrote:
> On Sun, Mar 20, 2022 at 4:37 PM Ammar Faizi wrote:
> > In i386, the 6th argument of syscall goes in %ebp. However, both Clang
> > and GCC cannot use %ebp in the clobber list and in the "r" constraint
> > without using -fomit-frame-pointer. To make it always available for any
> > kind of compilation, the below workaround is implemented.
> >
> > For clang (the Assembly statement can't clobber %ebp):
> >   1) Save the %ebp value to the redzone area -4(%esp).
> >   2) Load the 6-th argument from memory to %ebp.
> >   3) Subtract the %esp by 4.
> >   4) Do the syscall (int $0x80).
> >   5) Pop %ebp.
>
> I don't think you can safely use redzone from inline Assembly. The
> compiler may also use redzone for a leaf function. In case the syscall
> is done at the same time, your %ebp saving will clobber the redzone
> that the compiler uses.
>
> > For GCC, fortunately it has a #pragma that can force a specific function
> > to be compiled with -fomit-frame-pointer, so it can always use "r"(var)
> > where `var` is a variable bound to %ebp.
> >
> > Cc: x86@kernel.org
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
> [...]
> > +#if defined(__clang__)
> > +static inline long ____do_syscall6(long eax, long ebx, long ecx, long edx,
> > +                                  long esi, long edi, long ebp)
> > +{
> > +       __asm__ volatile (
> > +               "movl   %%ebp, -4(%%esp)\n\t"
> > +               "movl   %[arg6], %%ebp\n\t"
> > +               "subl   $4, %%esp\n\t"
> > +               "int    $0x80\n\t"
> > +               "popl   %%ebp\n\t"
> > +               : "=a"(eax)
> > +               : "a"(eax), "b"(ebx), "c"(ecx), "d"(edx), "S"(esi), "D"(edi),
> > +                 [arg6]"m"(ebp)
> > +               : "memory", "cc"
> > +       );
> > +       return eax;
> > +}
> > +
>
> -4(%esp) may be used by the compiler on a leaf call, you can't clobber that.

Using xchgl to preserve %ebp in the same place where the arg6 is
stored in memory is a better solution and doesn't clobber anything.

    xchgl %ebp, %[arg6]
    int    $0x80
    xchgl %ebp, %[arg6]

-- Viro
