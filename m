Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9555685
	for <llvm@lists.linux.dev>; Tue,  7 Feb 2023 17:50:29 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 16so1587686pfo.8
        for <llvm@lists.linux.dev>; Tue, 07 Feb 2023 09:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w48o95h0egkihevp24LUCBIapstbM68U7lsO7f0kOXg=;
        b=BZCdQiS8PQ0sH5xkOHzQo75rW6+sbgQX6onEtJD9T2EGtsClWZxEcITBKW4PX5BE86
         oB9geZ214JhL2uE5DpswdhkU9pV1OqrD5fllQtbR1pJWq9EFhBqAgH4fabKMxysbjTb2
         WZszCS46F+nRIuF/iBwfMUwgkpDGDuJuYPhmCobLbnEa1d6+29hvhetlEphHCTskt/d1
         +YrYcDUHGpEiiAHei8QzbvJGcElhC2aUP8ZE84392gtiPs/s/j6UnbSpuCVV0TBC4vVT
         9XPmCt/7+0UhRwq59KWRqIfG6fTAggYR7xa2Wc2Mg9xqpp5aefwcVZK24+5+Trj9Nh01
         /CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w48o95h0egkihevp24LUCBIapstbM68U7lsO7f0kOXg=;
        b=ERvY+mwjQMoGeWq4hObqjYOA15CQz4NVQK9PSMy1Kv8L1jaaF9bRxbchSwDvOPNz6R
         Gh2nQWWfAUOvTWIb34x/lc1LcBY36RkTONpUR5hZilxQ0L7NU37HzwmVzcE35EwTd7Hl
         d4vVmn9rXddHELS4waEMvSEGs5E9EcePM+Ff2jX1GIphQew9QPbnlHD+3yHsiA+D9be+
         IO+eczx8dcbwOHUKpjT5kO27Ooh1t7/7ocx2Ykf8/XGrWIRK2X6ijRFUT/sSYrniR0TJ
         oVOmVnvnnFADz1kDEyEuyoKbznfV1JERa39YIv6VUNa+T5FPxNJFBUb2qufW1AchKJeL
         WflA==
X-Gm-Message-State: AO0yUKVtI+uE2BZe/epSOZ1S8WWhcHjM8kKiC1+B7AxVH5K0lKUpDkNN
	n5iGsi6W4RBjonp/3gbar0IKQ2m/cJ5/mvVJ9O3FNg==
X-Google-Smtp-Source: AK7set8EMz1NCWIcsUMWJWJ6NuvWvNL0fF7AImNaPIwI0omUP301DOLkM/u16KYeK5+5gWtlYm+IfUrVLUguMFMU2q0=
X-Received: by 2002:aa7:9472:0:b0:5a7:6ee6:6710 with SMTP id
 t18-20020aa79472000000b005a76ee66710mr771984pfq.29.1675792228338; Tue, 07 Feb
 2023 09:50:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9698eff1-9680-4f0a-94de-590eaa923e94@app.fastmail.com>
 <Y+J5ev/R/Sz6nwBF@hirez.programming.kicks-ass.net> <20230207174227.rimpkz3b3y7m4fch@treble>
In-Reply-To: <20230207174227.rimpkz3b3y7m4fch@treble>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Feb 2023 09:50:16 -0800
Message-ID: <CAKwvOdnd2X+m9YhOqXbw912BW2vP-RtFusch3_fughriqvruaw@mail.gmail.com>
Subject: Re: current objtool warnings from randconfig builds
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2023 at 9:42 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Tue, Feb 07, 2023 at 05:16:58PM +0100, Peter Zijlstra wrote:
> > On Tue, Feb 07, 2023 at 11:25:27AM +0100, Arnd Bergmann wrote:
> > > Hi Josh and Peter,
> > >
> > > I've updated my randconfig test setup to use gcc-13 and clang-16, and
> > > have sent fixes for all normal WERROR=3Dy build warnings, but there a=
re a
> > > lot of objtool warnings that remain. I've reported some of them in
> > > the past, some others are new. It would be nice to at least reduce
> > > the number of warnings either through code changes or workarounds
> > > in objtool for any false positives.
> > >
> > > Out of 1500 builds, about a third had any warnings, this is the full
> > > list sorted by frequency. Let me know if there are any that you haven=
't
> > > seen before, I can provide the corresponding object and config files
> > > for reproducing.
> > >
> > >     Arnd
> > >
> > > 8<---
> > > 205 mm/kasan/shadow.o: warning: objtool: __asan_memset+0x2e: call to =
__memset() with UACCESS enabled
> > > 205 mm/kasan/shadow.o: warning: objtool: __asan_memmove+0x48: call to=
 __memmove() with UACCESS enabled
> > > 205 mm/kasan/shadow.o: warning: objtool: __asan_memcpy+0x48: call to =
__memcpy() with UACCESS enabled
> >
> > Patch pending here:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/comm=
it/?h=3Dsched/core-robot&id=3D79cdfdacd5b8d1ac77e24ccbc178bba0294d0d78
> > =EF=BF=BC
> >
> > > 80 vmlinux.o: warning: objtool: ibt_selftest+0x11: sibling call from =
callable instruction with modified stack frame
> >
> > Can you provide details on how to reproduce this?
>
> Arnd, thanks for rounding these up and posting them.
>
> I agree we need to get these all cleaned up, but before we go too far
> down the rabbit hole, is there some better way to track these?
>
> Not that I would suggest using an external tracker, but maybe at least
> put each set of related warnings (e.g., those having the same frequency)
> in its own subthread with the config/compiler info included.

If any are specific to clang, please use
https://github.com/ClangBuiltLinux/linux/issues
We have a tag for issues flagged by objtool
https://github.com/ClangBuiltLinux/linux/issues?q=3Dis%3Aopen+is%3Aissue+la=
bel%3A%22%5BTOOL%5D+objtool%22

>
> --
> Josh
>


--=20
Thanks,
~Nick Desaulniers
