Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C77C
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 21:17:01 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id i29so18342609lfp.3
        for <llvm@lists.linux.dev>; Wed, 08 Jun 2022 14:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B6C8MTvcXwBNw4LdJXdbBi37tOtw//zd33JtMDW1DQE=;
        b=nvzXsL4rs3pJ2D9yxy+nCzjJz8vFHFgY6aiepsTCsGGSq0qNdLnh8I8rYPMK+p0rkE
         ehrTWi6WFab0XmQlP727O5PG/kC9N9ik7KgwYykh9TgTB8uT+VLN3dHnXvV1PIM9J/GR
         xte8vq3SQJJmBZqDUMakXQtOF5rQSunc1NSmt+xmsW6HB5jWKkjoFwDJfwTtEicgJ7C7
         +vCR9YKHcODu3xSDIgetYK40B7Fa2gyJEb21CLEMqPdbZ+HEEvNJMlIrWyaH1OtZykv2
         VgET6kRzryuMVxyXco+iDCMFgb14WbAqGiF3sYJL2ro55L4x2wwKjDntaSBZgNACnibd
         3aHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B6C8MTvcXwBNw4LdJXdbBi37tOtw//zd33JtMDW1DQE=;
        b=eqIPMj8tgo+EzuaPSm83ytzjoP6bZiEEfBd3S1ItORCBuXIO/WFuj29QdlVW8kU4tX
         NyJkaWYu7x9r/rFGb86H1iDs8yyC086QT3gLobmPSpezXqTvp1x3cPBHZvUtbTb9ioW7
         +iSnurTZBqLxefi69H9ukuJ+e7u1M9P4+U7GHX5FXKE8cZtVQyd/iu7jcIu8r/cKqGVj
         Ex6icZ0jzsZNuYgRNktXazCwDwfOcmVADBJFKlq0G8EmjjVLtl3OqkL4XSKK5ihQRrG7
         ETSJDXR+HpChrl2OSBuf/gdmQRrMPkIItp9PpO/4CZhguSeofHcTTf8ExFZol99C294E
         dl4g==
X-Gm-Message-State: AOAM531WgbqDylnxrPIXWt879irCr6Ub+72vPwr66C+sMlO4hJrjRUiu
	zNwuOpDK30B6Vi8yBgqBAOGaUH6tvnH7iHaTxsLoHQ==
X-Google-Smtp-Source: ABdhPJwX4kIxGUkT8y6j6ox6caGj8Wb+tgOxrrW6epfoaH5G/pIZ/aklM+6PhP9mmc9PgJCY/iaoEiHz5GxPLAku7fY=
X-Received: by 2002:a05:6512:10cb:b0:479:682e:7f0c with SMTP id
 k11-20020a05651210cb00b00479682e7f0cmr5779920lfg.626.1654723018719; Wed, 08
 Jun 2022 14:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOd=-NXR5HoHwwEUZMsCt90oaADH6XHifje9n-8S8rj9SFw@mail.gmail.com>
 <20220608001422.26383-1-jstitt007@gmail.com> <20220608130940.8d2c3cb4a31b77a3274756df@linux-foundation.org>
In-Reply-To: <20220608130940.8d2c3cb4a31b77a3274756df@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 8 Jun 2022 14:16:47 -0700
Message-ID: <CAKwvOd=9o6B0NHEAZHjsDdQ+rwaCeni+2yk2WRX=NB2946VtgQ@mail.gmail.com>
Subject: Re: [PATCH v2] include/uapi/linux/swab.h: move explicit cast outside ternary
To: Andrew Morton <akpm@linux-foundation.org>, Justin Stitt <jstitt007@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	trix@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 1:09 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue,  7 Jun 2022 17:14:22 -0700 Justin Stitt <jstitt007@gmail.com> wrote:
>
> > A cast inside __builtin_constant_p doesn't do anything since it should evaluate
> > as constant at compile time irrespective of this cast. Instead, I moved this
> > cast outside the ternary to ensure the return type is as expected.
> >
> > For instance, if __HAVE_BUILTIN_BSWAP16__ was not defined then __swab16 is
> > actually returning an `int` not a `u16` due to integer promotion as described
> > by Nick in this thread. This has repercussions when building with clang
> > -Wformat. This fix should solve many of these warnings.
> >
>
> ARM allmodconfig:
>
> In file included from ./include/linux/swab.h:5,
>                  from ./arch/arm/include/asm/opcodes.h:86,
>                  from ./arch/arm/include/asm/bug.h:7,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/gfp.h:5,
>                  from ./include/linux/slab.h:15,
>                  from ./fs/xfs/kmem.h:9,
>                  from ./fs/xfs/xfs_linux.h:24,
>                  from ./fs/xfs/xfs.h:22,
>                  from fs/xfs/scrub/agheader.c:6:
> fs/xfs/scrub/agheader.c: In function 'xchk_superblock':
> ./include/uapi/linux/byteorder/little_endian.h:42:52: error: unsigned conversion from 'int' to 'short unsigned int' changes value from '-49265' to '16271' [-Werror=overflow]
>    42 | #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
>       |                                                    ^~~
> ./include/uapi/linux/swab.h:102:46: note: in definition of macro '__swab16'
>   102 | #define __swab16(x) (__u16)__builtin_bswap16(x)
>       |                                              ^
> ./include/linux/byteorder/generic.h:96:21: note: in expansion of macro '__cpu_to_be16'
>    96 | #define cpu_to_be16 __cpu_to_be16
>       |                     ^~~~~~~~~~~~~
> fs/xfs/scrub/agheader.c:158:23: note: in expansion of macro 'cpu_to_be16'
>   158 |         vernum_mask = cpu_to_be16(~XFS_SB_VERSION_OKBITS |
>       |                       ^~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:249: fs/xfs/scrub/agheader.o] Error 1
> make[1]: *** [scripts/Makefile.build:466: fs/xfs] Error 2
> make: *** [Makefile:1839: fs] Error 2
>

Ah, I see what went wrong.

Justin added more than I requested.
Compare the diffstat between:
https://lore.kernel.org/llvm/CAKwvOd=-NXR5HoHwwEUZMsCt90oaADH6XHifje9n-8S8rj9SFw@mail.gmail.com/
with the v2:
https://lore.kernel.org/llvm/20220608001422.26383-1-jstitt007@gmail.com/

Justin, please send a v3 dropping the changes made to the
"__HAVE_BUILTIN_BSWAP*__ is defined" case; just make the changes I
suggested.

In addition, please add to the commit message this snippet from Al:
```
As Al Viro notes:

You *can't* get smaller-than-int out of ? :, same as you can't get it
out of addition, etc.
```

Finally, Justin, you can retest this by running:
$ ARCH=arm make LLVM=1 -j72 allmodconfig fs/xfs/scrub/agheader.o
with your patch applied to linux-next. (It wouldn't hurt to build the
whole thing...but it's next, which is red today for ARCH=arm so nvm:
https://github.com/ClangBuiltLinux/continuous-integration2/runs/6796317443?check_suite_focus=true).
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
-- 
Thanks,
~Nick Desaulniers
