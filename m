Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6673466C5
	for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 19:41:45 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id h11so3348874ljb.2
        for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 12:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kQrBGFwucrBKBVfXucD62w2ROKP/3gosyL/mFvFuauw=;
        b=SBbwCPeyER6bdPDyzhQl8Ssg5BBoNYoxM4wuCfgnDMBpBaTxeqvdt/O+JMNniz4Myr
         AdkoKTp8pj5cEZ7B1s7i22BAAMAln1zN/s5LGOGGUaXqkEyoeXmpJZGsd41WBh8obao9
         pYKhcJps1P+IYJoqKMNmjNrvkWb20OvKGDggaxBL0ZGg9vSo1RzjWYXyLsF1PerHnr2c
         nsO8JOb+kjtiZDBdztqa00hyErV3EmCPRUTp3rN2xNNIbbqRgWpKrkDPz/uLFOdiCcjQ
         jkNlTUj3B8eSsD8dx+YpoFkZcoeocthFtBuffFjS9zUnTUK3XTXSLwCp7gYoYqVSHr4R
         5bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kQrBGFwucrBKBVfXucD62w2ROKP/3gosyL/mFvFuauw=;
        b=aWA7jXLm5rYakcLS+DLPKEAvsqkiDJzWGfjo+Zp6U6YI/xmvS16qyPCKMngsN/qJn/
         WxCaYcnEHPFade3TCBFyxwPuMPwBaV4VFS9IjSe8h3WmxGLcmoWzk/qUfuGtxn3WpX9h
         RbzvPmo4fMvttsSW7jxZS5cBEXrWFJ+62GuYOcflirFPgaiYVrRj3qMeSRWZTMsBraE/
         6KGrw0HtLPr8+smPdTWlQ+M3qEwOL2DKNOTl6shiuDNe79apl/gHR2azucpBmfZMh0VI
         NhgcNH/8Fke7DJhnd9V7P+LQYyYnFeBYH/XKZQvIsg1NdoY4I9EURtTBGyRsi6Lddbu2
         /JZw==
X-Gm-Message-State: AOAM532Tr7CkJbZvYQzf4BwrIMkOAqn/RYpMoYL0KUvVbUmJsok1ahGV
	PcIbzs+pZoVhoqAYVU7PIVQd9d1Kxg1e9C8PCzgn1Q==
X-Google-Smtp-Source: ABdhPJyPxaAkqjgQxr5Z0ufChFc+QxnVh2jtJFdKm1AViJ4raOtJ6ZSMiIycQXnGSjwQAoCxO1pVGEbNU+SzucsBVqo=
X-Received: by 2002:a2e:904c:0:b0:23e:d7ad:3fdd with SMTP id
 n12-20020a2e904c000000b0023ed7ad3fddmr1318780ljg.239.1648064503179; Wed, 23
 Mar 2022 12:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFGhKbyifH1a+nAMCvWM88TK6fpNPdzFtUXPmRGnnQeePV+1sw@mail.gmail.com>
In-Reply-To: <CAFGhKbyifH1a+nAMCvWM88TK6fpNPdzFtUXPmRGnnQeePV+1sw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 23 Mar 2022 12:41:31 -0700
Message-ID: <CAKwvOdmSV3Nse+tGMBXvN=QvnOs6-ODZRJB0OF5Pd6BVb-scFw@mail.gmail.com>
Subject: Re: [PATCH] x86: bug.h: merge annotate_reachable into _BUG_FLAGS for __WARN_FLAGS
To: Charlemagne Lasse <charlemagnelasse@gmail.com>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, jpoimboe@redhat.com
Cc: adobriyan@gmail.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, linux-kernel@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, luc.vanoostenryck@gmail.com, mingo@redhat.com, 
	nathan@kernel.org, peterz@infradead.org, tglx@linutronix.de, x86@kernel.org, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 23, 2022 at 12:30 PM Charlemagne Lasse
<charlemagnelasse@gmail.com> wrote:
>
> > @@ -75,9 +77,9 @@ do {                                \
> >   */
> >  #define __WARN_FLAGS(flags)                    \
> >  do {                                \
> > +    __auto_type f = BUGFLAG_WARNING|(flags);        \
> >      instrumentation_begin();                \
> > -    _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));        \
> > -    annotate_reachable();                    \
> > +    _BUG_FLAGS(ASM_UD2, f, ASM_REACHABLE);            \
> >      instrumentation_end();                    \
> >  } while (0)
>
> This causes following sparse warning on x86:
>
> make allnoconfig && touch init/version.c && make CHECK="sparse
> -Wshadow"  C=1 init/version.o
> #
> # No change to .config
> #
>  CALL    scripts/checksyscalls.sh
>  CALL    scripts/atomic/check-atomics.sh
>  CHK     include/generated/compile.h
>  CC      init/version.o
>  CHECK   init/version.c
> init/version.c: note: in included file (through
> include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h,
> include/linux/utsname.h):
> ./include/linux/rcupdate.h:1007:9: warning: symbol 'f' shadows an earlier one
> ./include/linux/rcupdate.h:1001:47: originally declared here

Thanks for the report. There was already a fix sent for this:
https://lore.kernel.org/lkml/20220317065743.8467-1-mailhol.vincent@wanadoo.fr/
but it doesn't mention that sparse is warning about this, too.

I think if Vincent sent a v3 that mentioned that sparse is warning
about this, too, and cc'ed you, you could then supply
signed-off/tested-by tags (or just do so on v2, though it doesn't
mention sparse), and maybe Josh would be so kind as to pick that up?

>
>
> Affected versions (from the ones on kernel.org):
>
> * 5.17 - bfb1a7c91fb7 ("x86/bug: Merge annotate_reachable() into
> _BUG_FLAGS() asm")
> * 5.16.17 - fe0c95903a68 ("x86/bug: Merge annotate_reachable() into
> _BUG_FLAGS() asm")
>
> Cannot be seen when changing the variable name:
>
> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> index bab883c0b6fe..cbd11e38252a 100644
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
> @@ -77,9 +77,9 @@ do {                                \
>   */
>  #define __WARN_FLAGS(flags)                    \
>  do {                                \
> -    __auto_type f = BUGFLAG_WARNING|(flags);        \
> +    __auto_type __f = BUGFLAG_WARNING|(flags);        \
>      instrumentation_begin();                \
> -    _BUG_FLAGS(ASM_UD2, f, ASM_REACHABLE);            \
> +    _BUG_FLAGS(ASM_UD2, __f, ASM_REACHABLE);            \
>      instrumentation_end();                    \
>  } while (0)



-- 
Thanks,
~Nick Desaulniers
