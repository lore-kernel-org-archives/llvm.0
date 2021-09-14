Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C413FD0
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 15:34:08 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id s12so24749904ljg.0
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 08:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ICD+lh04ktszv5GKgo+I7gDa5qnX1ofZQCfwJyIAnWY=;
        b=ShqjgPLcB3v+vuV946tnrUqG+LM093fj/YhcZTvLjKG4anY/YTyitvKlnv4e1JspcO
         Y/addYnmSk820RkiaB6s5MDI2MQZbVE+FOuZjHgY19IqWUBTvrnrtw2xptNY9ztWJyWH
         GqboDpDAE6MrGW01ul7IFIvmTtNjoSSsaTuiqoX2d4V5DYvUQdBPLaGOJc/FxBgWcobA
         PNeMGyqeQWf5OeOTIpX2Z7czNIAe0rClPqwftdF5qr+/cgrVhevwMNIjaG0BLI+F1rdH
         YgW9b1AruWVNuG4iLz7LPGHbBmyd5hSfbz7qc/EmA65hKkHMVG3caepDxZH3wB/UKq0M
         yJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICD+lh04ktszv5GKgo+I7gDa5qnX1ofZQCfwJyIAnWY=;
        b=K1G1pBUPBhv4qnu+N//VFgbLFjH+wA0/5rwY2QoShmdt8JYpBeHgBauhOJUvyJ/jA0
         N+uVfqxS2VF87AIYnhZrQcJt/6OAv7ruIIQyr1JdKa8tQjhX30354+R3DYuW7YMMgrKa
         1dbBKjsOE7aGD/qWz8/WLWgWev5BQEoCqW6rzGm7BYNPx+y+TSqis/fKgjnEmhE0rct7
         yNEpHXo9Uqz+/kOGxD80b3yvh8AzkN66nAUsHmHmKFPi5ilZzAAPHvA32SyF7D9OpY2N
         7dhu4PP5x0aiRUAer/OQ2eElAz8EVIsKwMLTsHzC4C5kCjJerB5qyNIWFJEEja4Vor5b
         rcIg==
X-Gm-Message-State: AOAM5323BzdMDvez4OSYctVsIQjltkfwEHmhXRzHpLt4x+Nvw+HNooXs
	GdeAJDiWge3exmKETfvT3F4s41e1vDE5OkAB7AKyUg==
X-Google-Smtp-Source: ABdhPJw0bz3NZ0k+7kAHLE8DMSK3SJwdxRvOGVAegQ/CkeY4vydYdRL59oDg3vtcM6CL6Km2awF0cn7Fd2+TG9cHFGY=
X-Received: by 2002:a2e:b551:: with SMTP id a17mr15761414ljn.128.1631633646572;
 Tue, 14 Sep 2021 08:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-3-ndesaulniers@google.com> <YTvyiv6M05Zk/C70@archlinux-ax161>
In-Reply-To: <YTvyiv6M05Zk/C70@archlinux-ax161>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 08:33:54 -0700
Message-ID: <CAKwvOdn==O+yJHLbxSEyx=xwpKbOsXY9_YkyU2m7+kiEwtPMrA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: drop fallback overflow checkers
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 10, 2021 at 5:04 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Sep 10, 2021 at 04:40:39PM -0700, Nick Desaulniers wrote:
> > diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> > index 0f12345c21fb..4669632bd72b 100644
> > --- a/include/linux/overflow.h
> > +++ b/include/linux/overflow.h
> > @@ -6,12 +6,9 @@
> >  #include <linux/limits.h>
> >
> >  /*
> > - * In the fallback code below, we need to compute the minimum and
> > - * maximum values representable in a given type. These macros may also
> > - * be useful elsewhere, so we provide them outside the
> > - * COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW block.
> > - *
> > - * It would seem more obvious to do something like
> > + * We need to compute the minimum and maximum values representable in a given
> > + * type. These macros may also be useful elsewhere. It would seem more obvious
> > + * to do something like:
> >   *
> >   * #define type_min(T) (T)(is_signed_type(T) ? (T)1 << (8*sizeof(T)-1) : 0)
> >   * #define type_max(T) (T)(is_signed_type(T) ? ((T)1 << (8*sizeof(T)-1)) - 1 : ~(T)0)
>
> The signed and type macros right below this comment can be removed as
> they were only used in the !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW case.

Did you check for users outside of this header?

I see:
type_min ->
lib/test_scanf.c:189
include/rdma/uverbs_ioctl.h:951
include/rdma/uverbs_ioctl.h:973

type_max ->
lib/test_scanf.c:189
lib/test_scanf.c:190
include/rdma/uverbs_ioctl.h:952
include/rdma/uverbs_ioctl.h:962
include/rdma/uverbs_ioctl.h:974
include/rdma/uverbs_ioctl.h:985

is_signed_type has many many users throughout the kernel.

Or were you referring to other defines?

>
> Also applies to the tools/ version.

The version in tools/ should probably be "refreshed" ie. copy+pasted
over.  Why there is a separate copy under tools/...
-- 
Thanks,
~Nick Desaulniers
