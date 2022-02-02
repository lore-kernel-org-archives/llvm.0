Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6752F24
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 03:26:40 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id i34so17589621lfv.2
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 19:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+SKILI7HGRrVf/hkaIAvXfAqMW5LQDJ9EGnfwOuZpgw=;
        b=pEwd8f9PeaSBB8Zj1gTlGnPqR8mR45BFmL4xqnUTWk0C7A+YFsMiFY1TLnv62qpG9/
         NY5q5Bwmix8tnK7IjShuSaoj6T37K45bZanxgdjfH3To44VbI2I9dQidVmqiEwFHKY2C
         Uy8DFo+waX+fzxKt4XOoAhq8WzeT5o9HbsvqdVUasRjXOUgLbzVEv+l74IGCxSOnYYnv
         27OpZa0is284mKbWKXE+3YqLjBHQmC1kdrq1a+lDr91hqd5wABJPcMG0q881pHlPQ+bd
         k0yEmxZTrYaJh/tDhPRd6iamiuT9bq5v2ED+TUCYqujERZ7KT+KNKzDxsPM9/G3Uadxy
         57QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+SKILI7HGRrVf/hkaIAvXfAqMW5LQDJ9EGnfwOuZpgw=;
        b=iBBnWLBBRQabPH2xkALAg7fpE4Lbsp9i/Z8u0zMbkQoA+bs2gGklxBtodNU0Q++3E8
         VfXdV1OaKm1pcVEzSQ1iF3zwRyLejmcAo1Bjs0MMj1NMzWx8ffY54RftSTac2KuKoAUY
         m2zYK9pGIOLpZdDcR3NbSgl3rYuD0/JqFOlV/l01CS7wwJVQCnLzTuhk7OLlPP1hRvbv
         8Hg3KJBrnY1RGJm/8ys8fSxn5dINxbTXIAmKnBKfwUgJXwBrfMRYOPOb9TrCPHJoUoT0
         UiBwVaUu35MmAQaRyGcdNfGOg3WpY2sZo9xZ1xDmEGdpUwC0rZiy1V9J12i+q3EnEoNC
         lQNg==
X-Gm-Message-State: AOAM530pZy0Woay1YH6ukjAFH52IMT07KjJZn9YJR5ytM3lGhNVtvLoU
	PuvVTn9XNoNmP2AVlQxoT+8SFhikdjOdXks1t0tyNg==
X-Google-Smtp-Source: ABdhPJzGCzxLyCiuASMGhG1nk+TgDdnzDKTuBGX5bUzbsZYiFbOtvOzGpw/xfC6/TIPrTSSNiEARR0XQqyI8sOvsKc0=
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr22367013lfr.444.1643772398308;
 Tue, 01 Feb 2022 19:26:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220131225250.409564-1-ndesaulniers@google.com>
 <CAMj1kXHz9psgjP7qQpusLOOL5Nm7TO+LauD_-mK=Fxe_g7mmsQ@mail.gmail.com>
 <CAKwvOdnkGfeBBE2NW_FKSzmZSjCJXc2801qvvOuyu+JL+m+VZQ@mail.gmail.com> <CAMj1kXFnUuWLyy5q-fAV1jwZobTCNHqhKSN3mF98frsJ4ai4Ow@mail.gmail.com>
In-Reply-To: <CAMj1kXFnUuWLyy5q-fAV1jwZobTCNHqhKSN3mF98frsJ4ai4Ow@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Feb 2022 19:26:25 -0800
Message-ID: <CAKwvOdn0C4Mt=Nb-HjLQtrsJ=X6zqgMssVHT_2QeZpnjb=-HhA@mail.gmail.com>
Subject: Re: [PATCH] docs/memory-barriers.txt: volatile is not a barrier() substitute
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Len Baker <len.baker@gmx.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 2:15 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 1 Feb 2022 at 20:40, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Tue, Feb 1, 2022 at 1:32 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Mon, 31 Jan 2022 at 23:53, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > > >
> > > > +     around an asm statement so long as clobbers are not violated. For example,
> > > > +
> > > > +       asm volatile ("");
> > > > +       flag = true;
> > > > +
> > > > +     May be modified by the compiler to:
> > > > +
> > > > +       flag = true;
> > > > +       asm volatile ("");
> > > > +
> > > > +     Marking an asm statement as volatile is not a substitute for barrier(),
> > > > +     and is implicit for asm goto statements and asm statements that do not
> > > > +     have outputs (like the above example). Prefer either:
> > > > +
> > > > +       asm ("":::"memory");
> > > > +       flag = true;
> > > > +
> > > > +     Or:
> > > > +
> > > > +       asm ("");
> > > > +       barrier();
> > > > +       flag = true;
> > > > +
> > >
> > > I would expect the memory clobber to only hazard against the
> > > assignment of flag if it results in a store, but looking at your
> > > Godbolt example, this appears to apply even if flag is kept in a
> > > register.
> > >
> > > Is that behavior documented/codified anywhere? Or are we relying on
> > > compiler implementation details here?
> >
> > https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Volatile
> > "Note that the compiler can move even volatile asm instructions
> > relative to other code, including across jump instructions."
> >
>
> That doesn't really answer my question. We are documenting here that
> asm volatile does not prevent reordering but non-volatile asm with a
> "memory" clobber does, and even prevents reordering of instructions
> that do not modify memory to begin with.
>
> Why is it justified to rely on this undocumented behavior?

I see your point.  You're right, I couldn't find anywhere where such
behavior was specified.  So the suggestion to use barrier() would rely
on unspecified behavior and should not be suggested.

Probably worth still mentioning that `volatile` qualifying an asm
statement doesn't prevent such reordering in this document somehow,
and perhaps that it's (currently) unspecified whether a barrier() can
prevent re-ordering with regards to non-memory-modifying instructions.
-- 
Thanks,
~Nick Desaulniers
