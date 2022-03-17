Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FBA4A9F
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 21:45:37 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id p8so7890861pfh.8
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 14:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IPOIkmx/1ZEzac6tX87LtTmxD7qv0ZDR17y94CVjDjM=;
        b=PPA8dRi4KI3FwJ1U/1S2LJsZEyxCAqZHA8pGlFu0lhXkTkpwruUj6vS3P/MD4h7Z9Q
         irjoPWQIUZtr1wg3ZfXIk7I4s8Vw/LtWDH9EultQ9EYJwNjUPdXj7Ya9P+2LlSsCko3Y
         XZKsqFy3IRVk3HZx7XNt59NGkxb1MlAj+3XhXng6bAtmwnDFWhDVO/sDNnnYWl+4R1g+
         j0qXbx3o//DiCZcjkQZEHSBxwYc/lMHnUgTL6PweZCYjBImpNvtPFOVr+YBwNAwpEqBW
         0RBNL0R6oO+CdphmVSZLHuhzGjygGU1X2DMvFj516Nd+sgD1Y7xyniu/9KhIM2zz1nnB
         YVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IPOIkmx/1ZEzac6tX87LtTmxD7qv0ZDR17y94CVjDjM=;
        b=ZN5Cp7aMMeeJT67RXZcx3+Rrm1kihD0i5mwPcLYvHvoSt9ZUlWGv0KejQve3spoduE
         mbelc4OYFBwJXPfG+oiduz22WVOAPp+G/x5pBvoh4iGsHLrSxBgKOv7eswuv/FR48ZiW
         Ig1L8Ef4/AyR8bIbdRE5q4EzHKR7qB7KDw9L3kCYJiUTtFiGr0liaCM2TgCgDk+TI8MD
         77S6dgzizUfCKv1pDEw7WamDKKlSDFSAgbX1ELF48zOKfhDSEdKZRE1IJbjpVWAQ3/e6
         UF5zk5J9JtrTOEb1EEI2uYNSbw8ANCeRi7B0k8YwEXvykwW/kuTSFw6epOQFbRdr1hi0
         ZJZA==
X-Gm-Message-State: AOAM533GRuZz3PoJFLxq8bmdZcb835QkYE3b4Euu+nONIygcrvWtsIug
	kgg0JB5BoQaRouqTkyKzkzZHMgduqZq30zNDd8eH
X-Google-Smtp-Source: ABdhPJxAhlXJfmDyDkQQ+h1lUvIFbNNj5OWZGK6sdNBsVl37VkPAC01npTUgWrIz/K99HNPx06c8cshuGVJoe8+lkwE=
X-Received: by 2002:a05:6a00:1596:b0:4f9:f992:9f69 with SMTP id
 u22-20020a056a00159600b004f9f9929f69mr6437304pfk.7.1647553536437; Thu, 17 Mar
 2022 14:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220210223134.233757-1-morbo@google.com> <20220301201903.4113977-1-morbo@google.com>
 <CAGG=3QWh90r5C3gmTj9zxiJb-mwD=PGqGwZZTjAfyi1NCb1_9w@mail.gmail.com>
 <AC3D873E-A28B-41F1-8BF4-2F6F37BCEEB4@zytor.com> <CAGG=3QVu5QjQK8m2FWiYn-XQuVBjUGXcbznSbK22jVMB5GAutw@mail.gmail.com>
 <F5296439-4CA3-4F31-BD91-5ED1510BC382@zytor.com> <CAKwvOdkk-C8HMemKs4+yoxvNDgTLmvZG1rmwjVXBqhsQ-cED5g@mail.gmail.com>
 <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com>
 <CAGG=3QW2ey2w91TxqJ6tzfJOswhTce2e0QTW7kAWyvxeiO+VNg@mail.gmail.com>
 <CAHk-=whn3iYE7gZM4vHx1kFhWBD2P9Wvmcyj8OOqv=y_7nemGQ@mail.gmail.com>
 <CAGG=3QWC9VS9RdGFTwY8VGqujDnFYnRTT1dQ6kkVr+0SRk6COg@mail.gmail.com> <CAHk-=wh=x7oCk05JD1=6XNsvvgpsidRWupoqySw1zODmvNy9Ug@mail.gmail.com>
In-Reply-To: <CAHk-=wh=x7oCk05JD1=6XNsvvgpsidRWupoqySw1zODmvNy9Ug@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 17 Mar 2022 14:45:25 -0700
Message-ID: <CAGG=3QWcKof_NXrC0kznM2ikwTA00AgUJrcWhKBTitmjCuOxqw@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 2:21 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Mar 17, 2022 at 2:10 PM Bill Wendling <morbo@google.com> wrote:
> > >
> > > As a result, we mark pretty much all system instructions as being
> > > memory clobbers, because that actually works.
> >
> > For now.
>
> No. Forever.
>
> If you change the compiler to ignore memory clobbers in inline asms,
> we'll stop using clang again.
>
> This is not some kind of "threat". This is literally just a plain fact.
>
> If you turn your compiler into garbage, we can't use it.
>
> End of discussion.
>
> > > Whether they actually clobber memory or not is immaterial, and is not
> > > why we do it.
> >
> > I understand that. My point is that it's not a guarantee that the
> > compiler won't change in the future.
>
> YES IT DAMN WELL IS.
>
> If I have an inline asm thing, and I tell the compiler "this inline
> asm reads or writes memory in ways you don't understand", and you then
> move externally visible memory operations around it - or move other
> inline asms that do the same thing around it - then your compiler is
> simply not a compiler any more.
>
> IT IS BROKEN  SHIT.
>
> See?
>
> That memory clobber is not a "please mister compiler, can you pretty
> please take this into account".
>
> That memory clobber is a "if you don't take this into account, you are
> now no longer a working compiler, and thank Gods we have
> alternatives".
>
> This is not a "in ten years things can change" kind of issue. This is
> a very fundamental and simple thing.
>
> I don't understand why you can't just admit that.
>
> This is as simple as 2+2 being 4. That's black and white.
>
> There is no "the compiler might optimize it to be 3 at some future date".
>
I'm NOT saying that it WILL change or that it SHOULD change. I'm also
not saying that your concern isn't justified. What I am saying is that
unless you're using a compiler feature that's DEFINED as having a
certain effect, then you are not using that feature correctly,
regardless of how it's acted in the past. And it has the potential to
bite you in the ass sooner or later. We've all seen such things happen
before.

I'm not thick and you don't have to yell about this. We're on the same
page! :-) It would be much much better if there was a feature that was
defined to act in the way you want it to. But I'm not offering one at
the moment or even with the change that started this thread.

-bw
