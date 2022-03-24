Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A2510ED
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 02:42:13 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id o5so6147819ybe.2
        for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 19:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bq+5q/LUFVvKeFoA9Q8Sa2EEy5fY9kO3b6Q0RwFcT+M=;
        b=BiGVF4Kbw4UVB+9Pi5xCxN3zqzCuF6F7nSl5bvuGb0W4wfzwHNPLSjGndf8P9VXKKo
         zE5kHJ3UDa+y/Zce5qvrvIfTtVF6lHdfBw8Pp1XoYYAt/dezaQu96ebP1CzMV+ibR71c
         IBXZcUITF3xzhLAUtGGJUUnMbLswKHPMyB6KNo2thT11ugni1FJ+M9dUJ6f+x1Q2Dr00
         UPJvn0S1qE3XkMb21SEQLnj1HAUtRD8xfPHKWyuVlUXfjX1I6mMhliN7O7XI9K5DqflT
         0sMs3CqC77bnbijqHkPVG6hKOEQlfaOhQIsgZh1lmD/LNbdifCZf8z2tDfDwgIJuPRXR
         L5qw==
X-Gm-Message-State: AOAM532ugmEiUbVx900YNkq0Xckk16KalDjVKRm5LV29G3NNcypQeuxG
	5fVeTE/ctA0pMX92Lkek1JXV3Aj0cKctfnu5XDs=
X-Google-Smtp-Source: ABdhPJziSYCyql+0Kv8XlVNqbr2ofruuie+pCnMX37bMuuM+FvKjDm9W3ej9ZdR3kL6WfSaqPniODXBiYtiM3+EupHY=
X-Received: by 2002:a5b:8cc:0:b0:634:7343:9953 with SMTP id
 w12-20020a5b08cc000000b0063473439953mr2807315ybq.142.1648089732442; Wed, 23
 Mar 2022 19:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFGhKbyifH1a+nAMCvWM88TK6fpNPdzFtUXPmRGnnQeePV+1sw@mail.gmail.com>
 <CAKwvOdmSV3Nse+tGMBXvN=QvnOs6-ODZRJB0OF5Pd6BVb-scFw@mail.gmail.com>
In-Reply-To: <CAKwvOdmSV3Nse+tGMBXvN=QvnOs6-ODZRJB0OF5Pd6BVb-scFw@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Thu, 24 Mar 2022 11:42:01 +0900
Message-ID: <CAMZ6RqJ7B_Yqs0jE0nmkX2Z=xh7Jj6J_ihP=ybLVn5VXY+5kTA@mail.gmail.com>
Subject: Re: [PATCH] x86: bug.h: merge annotate_reachable into _BUG_FLAGS for __WARN_FLAGS
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Charlemagne Lasse <charlemagnelasse@gmail.com>, jpoimboe@redhat.com, adobriyan@gmail.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, luc.vanoostenryck@gmail.com, mingo@redhat.com, 
	nathan@kernel.org, peterz@infradead.org, tglx@linutronix.de, x86@kernel.org, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu. 24 Mar 2022 at 04:41, Nick Desaulniers <ndesaulniers@google.com> wrote:
> On Wed, Mar 23, 2022 at 12:30 PM Charlemagne Lasse
> <charlemagnelasse@gmail.com> wrote:
> >
> > > @@ -75,9 +77,9 @@ do {                                \
> > >   */
> > >  #define __WARN_FLAGS(flags)                    \
> > >  do {                                \
> > > +    __auto_type f = BUGFLAG_WARNING|(flags);        \
> > >      instrumentation_begin();                \
> > > -    _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));        \
> > > -    annotate_reachable();                    \
> > > +    _BUG_FLAGS(ASM_UD2, f, ASM_REACHABLE);            \
> > >      instrumentation_end();                    \
> > >  } while (0)
> >
> > This causes following sparse warning on x86:
> >
> > make allnoconfig && touch init/version.c && make CHECK="sparse
> > -Wshadow"  C=1 init/version.o
> > #
> > # No change to .config
> > #
> >  CALL    scripts/checksyscalls.sh
> >  CALL    scripts/atomic/check-atomics.sh
> >  CHK     include/generated/compile.h
> >  CC      init/version.o
> >  CHECK   init/version.c
> > init/version.c: note: in included file (through
> > include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h,
> > include/linux/utsname.h):
> > ./include/linux/rcupdate.h:1007:9: warning: symbol 'f' shadows an earlier one
> > ./include/linux/rcupdate.h:1001:47: originally declared here
>
> Thanks for the report. There was already a fix sent for this:
> https://lore.kernel.org/lkml/20220317065743.8467-1-mailhol.vincent@wanadoo.fr/
> but it doesn't mention that sparse is warning about this, too.
>
> I think if Vincent sent a v3 that mentioned that sparse is warning
> about this, too, and cc'ed you, you could then supply
> signed-off/tested-by tags (or just do so on v2, though it doesn't
> mention sparse), and maybe Josh would be so kind as to pick that up?

Thank Nick, I did as you suggested. Here is the v3:
https://lore.kernel.org/all/20220324023742.106546-1-mailhol.vincent@wanadoo.fr/

Yours sincerely,
Vincent Mailhol
