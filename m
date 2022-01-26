Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB53173
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 02:12:34 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id y15so51992432lfa.9
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 18:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bddl5zJdvIpRDv67hFhNPIFJF2EsWzz+rWzL2YtGbis=;
        b=WV88Mu2IYWreQ+WiCxBelZUJuTKAVWWEgH3YCtPtNnx6tnPxQgSzuSZobST9MpDmjb
         wA5DDI/36Kw0RyGu3tPuYilQX3CVnUSb5nR1+wo4Zmj3j4WY1jp2oD8kPuGpbW4llu4R
         UPbnBBSspuBe33Pq4EFjRQPpR6AcyqpQOXYyr3WK/aNitUSB5kl/oIWC0jyvPzLwcAiI
         mfSAiYFn7Y2zuc6UzG4zk5Xo+W1QGNMIqMzsPlBs3BrbWKpQzJ4r7ziryknf4Qs3J1sq
         AQKtkHJC6Qs20zQirJzKp+sMEcT69CV3B9NXGe0MCHitX7Hw3S7q5Ng6JjYpwOt571o6
         jA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bddl5zJdvIpRDv67hFhNPIFJF2EsWzz+rWzL2YtGbis=;
        b=w3+C5jxp1FLwgDN6kuiGVJMV14pPCvX6vcPzb11K2CgdKs3qyYNWjPdEo4nFZqjbH4
         fG8egwkx6H/eNwDYTL27flr2OEU2OFmJueKucHsaWwZStwrDI6PQdbdbejrNK2MMCXpZ
         5eZD7FQqKOrNOqc33sEtMRdwQ0vlLXsArY1hQJKsmUB0gVzFJ4PRTxPAJj5WID7BtVJd
         x+AZTbMums4tMkjQ5rIR1jDFYLyFqAyV3OIVupbERAYGx3c0iHuYdH/lrV0hJ8N6MvyD
         E1pLoKwxkB3YzlSYal4LvZ1hvVyyN7t8Y2d7aUL5Zw6X87SGaezwDGlM78XkfI3c8tyL
         NtEg==
X-Gm-Message-State: AOAM532XWBWeJitJTjHibqFMYSjNSzXm14Gp6WUniPCvOIjpPzVm1w2Z
	CJz/tWJyQyIT906Z1YPjja4YWUZEyZ2BfGWU5uUisw==
X-Google-Smtp-Source: ABdhPJwkGzNsZfC5qAtJ6gy53n6DA6VFZJWqbX+rbm2fF9UbQE/mgQ4QVgvYw/wKk4iYIG/ovBQUQ5wd6JihKJ3ZFOc=
X-Received: by 2002:a05:6512:3c8e:: with SMTP id h14mr9770534lfv.489.1643163152731;
 Tue, 25 Jan 2022 18:12:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220114010526.1776605-1-ndesaulniers@google.com>
 <YeQei0xNzMq7bFdg@zn.tnic> <20220118192256.jzk5dnceeusq7x7u@treble>
 <20220118230120.pivvson7qekfiqic@treble> <CAKwvOdmLzwz=02ypt0_1324_5-7i3Az7HizFaDMqZv__-D99uA@mail.gmail.com>
 <20220125233128.GT614@gate.crashing.org> <CAKwvOd=P0VAFrrUXV0z5dES9hYP2b8-KwTzyG5=ezeUve=K3QA@mail.gmail.com>
In-Reply-To: <CAKwvOd=P0VAFrrUXV0z5dES9hYP2b8-KwTzyG5=ezeUve=K3QA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 25 Jan 2022 18:12:20 -0800
Message-ID: <CAKwvOdnBT74081nCw2hcm2dxCacV0ume_noZ0=Q6e0UiBDF7wg@mail.gmail.com>
Subject: Re: [PATCH] objtool: prefer memory clobber & %= to volatile & __COUNTER__
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Borislav Petkov <bp@alien8.de>, Vasily Gorbik <gor@linux.ibm.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, x86@kernel.org, 
	llvm@lists.linux.dev, linux-sparse@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-toolchains@vger.kernel.org, apinski@marvell.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 25, 2022 at 4:59 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Jan 25, 2022 at 3:34 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > Hi!
> >
> > On Mon, Jan 24, 2022 at 03:26:36PM -0800, Nick Desaulniers wrote:
> >
> > > If this is fixed in gcc-10, then we can probably add a comment with a
> > > FIXME link to the issue or commit to replace __COUNTER__ with %= one
> > > day.  If not, then we can probably come up with a reduced test case
> > > for the GCC devs to take a look at, then add the FIXME comment to
> > > kernel sources.
> >
> > Please open a PR?
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104236

Andrew clarified (thanks Andrew!) that %= can't be used as I imagined
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104236#c4
and that I think was alluded to in
commit 3d1e236022cc ("objtool: Prevent GCC from merging annotate_unreachable()")
which is fine, so I'll just need to keep usage of __COUNTER__. I'll
try out a revised approach for this patch tomorrow.
-- 
Thanks,
~Nick Desaulniers
