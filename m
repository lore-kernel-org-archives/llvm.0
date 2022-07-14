Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF227E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 21:38:42 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id u15so3650771lji.10
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a1BPCOU0S8iLJ+DI8V3mTWw27zrRrIaENDKL+lLVRDM=;
        b=d9ptBNGjxYf6Rd//GdDmRSfzD45ifgMwjLxxyFX+i4jMZ+IJo4RTmDV+mQTB7ZvLMx
         Nq+ArH2jS1OtXHEDfSURC2xuL/ZZxfJe76eUfFZSMtiyU8ieaQ/q9Xg8qjoDVcQYsDzP
         OzJ/3aNpsn8KWiBC8c+QjuA2tQhgX0YxNq4SysqbYSpS06Lu6V/yKsLLeS4r8ugad4Fi
         SMNCdG02w6+IR5MZEmkPRNVL/RjFKGxXIITkpPGGWQiGGlpc1R8HZ+8d/vRFHn+y1Gwi
         uGkCuUFqL2nQmbqOAccecFeFibcLcAOpwhd5lEYKKaKhP9RARNQrN41u/fdATFjgcwer
         Sz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a1BPCOU0S8iLJ+DI8V3mTWw27zrRrIaENDKL+lLVRDM=;
        b=xovEqL/b1nty1FZ/vRm5TFSp8Lee8m7xILCd97hNDeEfZS3Yt3y5/k0rkQP9kAHlBb
         fUk55/Fji49XHUywcFZlykxUwJLK3g6CH8mUPpg+jV/1XOOXqjocm6kygcG89PkNSLnl
         GJ9d6nhsV5aQ/dQFcIPRkIdnplGs6Dxp5wsbSrTg7BCXsXzqZOydpAYyDMMfQVI35eUL
         gc3oWgljhSHqxzt2+3JFjdXDXcGfXYOBoe75RczO8QjlLwGzH0/CG39lNCPhNzy4Ar+0
         UAWbjalkvAXpyNDYrR8x1HIfBXdtNlXSP0BA3FuEFZfvz36JYn3uQ6tJd+IV4mAZJYqR
         UqBA==
X-Gm-Message-State: AJIora++nEWNIF4D4l8TXNqH8zWzTLAWR4kGByVto0fHsYZfDiUz1ssk
	ZAB6HY05sRTGOy5LCShgNwYVAe0xj/PJM4XPf/LOQA==
X-Google-Smtp-Source: AGRyM1sUJ7vRhOTvHnAzFXwl5l4d1fyp3Frm959403qykkzqb9n3jgzwrKJh+jZq6vDWYIza8eWbphCxj0Vfya0OSg8=
X-Received: by 2002:a2e:3109:0:b0:25a:8a0c:40e2 with SMTP id
 x9-20020a2e3109000000b0025a8a0c40e2mr5265245ljx.26.1657834720312; Thu, 14 Jul
 2022 14:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714205646.4023495-1-ndesaulniers@google.com> <CAHk-=whnndsMXO=32vFn9-Osw4r8-NvROV1rtsbxjw9Uvj1WPA@mail.gmail.com>
In-Reply-To: <CAHk-=whnndsMXO=32vFn9-Osw4r8-NvROV1rtsbxjw9Uvj1WPA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Jul 2022 14:38:28 -0700
Message-ID: <CAKwvOd=PB9Kpbnf3y0e5u6LrZ=Lv2Ex8O7y=VY63D67Jf2eyHQ@mail.gmail.com>
Subject: Re: [PATCH] ubsan: disable UBSAN_DIV_ZERO for clang
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Marco Elver <elver@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 2:25 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The way you do that is by warning, and giving it defined behavior. It
> really is that simple.

int do_div (int dividend, int divisor) {
  return dividend / divisor;
}

has UB should divisor ever be zero, not much different from:

int deref (int *foo) {
  return *foo;
}

when foo is NULL.  Should the two of those be:

int do_div (int dividend, int divisor) {
  if (!divisor)
    return -EOOPS;
  return dividend / divisor;
}
int deref (int *foo) {
  if (!foo)
    return -EOOPS;
  return *foo;
}

or keep the unchecked versions and wait for a report from a user or
bot with a sanitizer splat?

I get the sanitizer doesn't work as advertised. I _agree_ with you.
Hence this patch (which I _think_ works towards your point, shouldn't
you Ack it?).  I feel like you're talking past me without addressing
my point, let me try rephrasing it:

I _additionally_ think we should be adding more checks to guard
against division by zero to the kernel sources.  Or are we happy to
wait and find out if divisors are ever zero and fix them as they pop
up/become problematic?
-- 
Thanks,
~Nick Desaulniers
