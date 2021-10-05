Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350DF2C81
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 20:29:15 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id s64so415316yba.11
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OcQv/s+1PQ0ZjDCw+SRTOFCxUQmvWoG+IaGmgRCu54s=;
        b=MW14OSQ1gFA4P7702EgFpqM3qR3T4ysOSPqEqQduRialXr2rl+z6u1qfBew5gCMwxP
         He0OejT6iuY2z8ccXO2nJN2cvrfEb3xsVI2LTu9Dq+HbqvZLLzKClVUbl2lCw2cxayay
         bjMlUpJL4oXj88XjInk7lSQBsjgghYRFeZq66op4EtfF4MEf07gQqOJGAKnMo6LR6R9r
         agZjlErLE9uBq3uzftWy/5vlpMpuF6hapb8jPGMhmMdwnb9oLoHxfLKXAfGCQnV/ckZO
         tIyrfw0Q9PYNgG8xvztQ+v6/B+DG1lxyTv5RrdFo4HqZ5OApN9bxwaDHd6NWUiP+MZEp
         wSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OcQv/s+1PQ0ZjDCw+SRTOFCxUQmvWoG+IaGmgRCu54s=;
        b=rrEQW52RhYbG+OF/iqRnjl2/sRk2ORzSRIpZ9RTCaXv8P7bqy91o7oPiQsEG6iMkJ+
         JjbEQk7r0X0zzHD5cwkIT071UCxJfja6+cy6EOBiQ/YWCV0rldT5cUrevC6xIwBMWwZc
         YxTF3LaoPWc4xp1uzS78okkAxaX8YtO3wsam7U9DKY1u3NYz3Kk7Ad10qG+7FAAaou8x
         oij2Iq09r/9qflBiZWiaicJrGqbhhY1VL/tCxKe6bPo63k1Xkrbpn5+llvNkjR9HwUKw
         7384X9Rpq0F60Be7O3RmsjVV8WwJoleIpEpy6N90DO83fa8b7CZ14i00mXwMrWr+8zDR
         fzLg==
X-Gm-Message-State: AOAM5301/sXZitfxU8dmVwjj62c9QFd+cDBJI1awNyENDG9d6XBeyV4b
	jP7oYbZegu1CoFYvwne3U016CGAjCvxGvaFiLscVFg==
X-Google-Smtp-Source: ABdhPJzJsAm0jIvkO40dr+sZFTs2tR+7kzjFwmvCvA4ilABfEgSVApT0Rz05CRz9lseERDmx31G5dQQz6jq8IE2Ituw=
X-Received: by 2002:a25:cf8f:: with SMTP id f137mr26144522ybg.338.1633465753946;
 Tue, 05 Oct 2021 13:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-5-samitolvanen@google.com> <YVsGoJ+NN6wRFi22@hirez.programming.kicks-ass.net>
 <CABCJKudBrHfwR=gQc=9=cfBjR9p5jm65ovSNwzLLEpDUdo6ZPQ@mail.gmail.com> <20211005065923.GH4323@worktop.programming.kicks-ass.net>
In-Reply-To: <20211005065923.GH4323@worktop.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 5 Oct 2021 13:29:02 -0700
Message-ID: <CABCJKud1Gm0ouROKLAw9t03qbs+_EASky053=SqijPJahqogng@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] cfi: Add DEFINE_CFI_IMMEDIATE_RETURN_STUB
To: Peter Zijlstra <peterz@infradead.org>
Cc: X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 4, 2021 at 11:59 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Oct 04, 2021 at 12:10:46PM -0700, Sami Tolvanen wrote:
> > On Mon, Oct 4, 2021 at 6:50 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> > > Why DEFINE_CFI_IMMEDIATE_RETURN_STUB() vs __no_cfi attribute that we can
> > > stick on the relvant functions?
> >
> > To avoid accidentally creating useful gadgets for attackers. For
> > example, while excluding an empty stub isn't necessarily ideal,
> > allowing calls to a function that always returns zero would be worse.
>
> I was afraid you'd say something like that...
>
> > > Because I've got at least one more variant for you :-) See
> > > kernel/static_call.c:__static_call_return0
> >
> > Does __static_call_return0 ever get called indirectly on architectures
> > that support static calls? If it's always patched into a direct call,
> > the type mismatch isn't an issue.
>
> For x86_64 it should indeed never get called, however if you plan on
> supporting i386 then you need the annotation. Also, it might get called
> on arm64 which is about to grow basic HAVE_STATIC_CALL support.

Good point. I read through the latest arm64 static call proposal and
while it can fall back to an indirect call, it doesn't look like that
would cause issues with CFI.

> (and just in case you care about CFI on PPC32, they too grew basic
> static_call support)

We are currently targeting only x86_64 and arm64, but I'll keep that
in mind in case we want to add more platforms.

Sami
