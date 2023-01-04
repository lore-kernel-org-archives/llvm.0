Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB39A4A
	for <llvm@lists.linux.dev>; Wed,  4 Jan 2023 17:30:35 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id jl4so30275173plb.8
        for <llvm@lists.linux.dev>; Wed, 04 Jan 2023 09:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RraqTIc19Yf5WtljYry6wuVG1FISGDkwp9OBAd+D23A=;
        b=nYD+1MWGEyXXY7smw4USQOZ+pFDB8wUhA6OqZNwfBqAuXcxed7yNXs0Uh+Y5wKpErG
         jtF1Vx87FoUTEOUrJTCBixGhRZTHta5JTHroUkxEZwR5bMmK8UFhPhvL5EJoTmcdTdiV
         th3K4t/tI/kdnYSSfCSoZ4B9oxxIn0NCt/KhydPVoyLDcflZrSo22T84RVu1nSkc5zAp
         rlZJv/FPDdSV6svuxHyxxCOg9z6GPFXRxhdigGz8XvZTahIrx6SeEIUn0b1hKzSZUuAN
         ZRQYGWsNG/cIdRhBz3rO/VARYVcVowy/nJLBb9EZo49qBJl91Op8S0SFxsrvWi3CKcz9
         1H3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RraqTIc19Yf5WtljYry6wuVG1FISGDkwp9OBAd+D23A=;
        b=LSaboeL3S5VQbp76RG/H6S6BOffLqNZt+26e1/rOlZSwxywE7fRj5wVwIjZnZ5jEdA
         CTafG1I08Sb3EBaiBcFaNVH+eweUC7FFwU3fbhU43NyhkplikTE1QaqlZuNca2w6MXHh
         qHqQnuSP2ILL/QL+HbPgEt5X1QX5nzYZ/ogdYc/Qr9F3NoxLh8qHidd1194chQx452G7
         JYjcLkXwGsZ06YSvHGU/YrFGzTkXfeL+YbLxiymT/wn7V4x6eUavKrHopEU5FDGxWWXh
         0BLhuGXdSR8kCr4gv5Qh6CQhPtIrCYoD7p91aHZQvKo2XanGgcN/RLsdqt/8cHY+1zGU
         Bzhg==
X-Gm-Message-State: AFqh2kpVztsaT1IJcJo7CqFfwylU/nr/a4ZQZhMZ3QvyDmOGrdNAStZp
	Wl3UNcPXJCQLhzfFiwGkz1aVmLNsv8mqCIOtuda2xA==
X-Google-Smtp-Source: AMrXdXuGAjwbDO6MlESAelpRxq+pO6qqLPGFFa6VegJVnadYDSgxviiV3lNZONQzL2U8Rb3QZX7hTECA6cgKpvNbp6Y=
X-Received: by 2002:a17:902:6b08:b0:190:f5f5:fd17 with SMTP id
 o8-20020a1709026b0800b00190f5f5fd17mr3078478plk.59.1672853434356; Wed, 04 Jan
 2023 09:30:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1LBGZPMfCZ8A1bl@FVFF77S0Q05N> <Y1QEzk/A41PKLEPe@hirez.programming.kicks-ass.net>
 <Y1Z12xuY9fDaHuCm@FVFF77S0Q05N>
In-Reply-To: <Y1Z12xuY9fDaHuCm@FVFF77S0Q05N>
From: Fangrui Song <maskray@google.com>
Date: Wed, 4 Jan 2023 09:30:22 -0800
Message-ID: <CAFP8O3+X0ZoA3MjzgDDwqV2OyCwkperKiQK5cx36j0FypVdJeA@mail.gmail.com>
Subject: Re: kCFI && patchable-function-entry=M,N
To: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joao Moreira <joao@overdrivepizza.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 On Mon, Oct 24, 2022 at 4:24 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Sat, Oct 22, 2022 at 04:57:18PM +0200, Peter Zijlstra wrote:
> > On Fri, Oct 21, 2022 at 04:56:20PM +0100, Mark Rutland wrote:
> > > Hi,
> > >
> > > For arm64, I'd like to use -fatchable-function-entry=3DM,N (where N >=
 0), for our
> > > ftrace implementation, which instruments *some* but not all functions=
.
> > > Unfortuntately, this doesn't play nicely with -fsanitize=3Dkcfi, as i=
nstrumented
> > > and non-instrumented functions don't agree on where the type hash sho=
uld live
> > > relative to the function entry point, making them incompatible with o=
ne another.
> > > AFAICT, there's no mechanism today to get them to agree.
> > >
> > > Today we use -fatchable-function-entry=3D2, which happens to avoid th=
is.
> >
> > > ... but I understand that for x86, folk want the pre-function NOPs to
> > > fall-through into the body of the function.
> >
> > Yep.
> >
> > > Is there any mechanism today that we could use to solve this, or coul=
d we
> > > extend clang to have some options to control this behaviour?
> >
> > So the main pain-point for you is differentiating between function with
> > notrace and those without it, right?
> >
> > That is; suppose you (like x86) globally do:
> > -fpatchable-function-entry=3D4,2 to get a consistent function signature=
,
> > you're up a creek because you use the __patchable_function_entries
> > section to drive ftrace and now every function will have it.
> >
> > So perhaps something like:
> >
> >  -fpatchable-function-entry=3DN,M,sectionname
> >
> > would help, then you can have notrace be the same layout, except a
> > different section. Eg. something like:
> >
> >  #define notrace __attribute__((patchable_function_entry(4,2,__notrace_=
function_entries)))
>
> FWIW, I think that'd work for me, and that was roughly my original propos=
al on
> IRC. My only concern with this approach is code size, since all uninstrum=
ented
> functions gain some point less prefix NOPs.
>
> We can make that slghtly better as:
>
> #define notrace __attribute__((patchable_function_entry(2,2,__notrace_fun=
ction_entries)))
>
> ... since we don't care about placing NOPs *within* the function
>
> > It does make the whole: CFLAGS_REMOVE_file.o =3D $(CC_FLAGS_FTRACE)
> > a bit of a pain, but I've long favoured removing all that and having
> > explitic notrace attributes on all relevant functions.
> >
> > Then again; perhaps it could be made to work by ensuring CFLAGS starts
> > with:
> >
> >  -fpatchable-function-entry=3D4,2,__notrace_function_entries
> >
> > and have CC_FLAGS_FTRACE include (and hence override with)
> >
> >  -fpatchable-function-entry=3D4,2,__ftrace_function_entries
> >
> > assuming that with duplicate argument the last is effective.
>
> TBH, it'd be nice to move ftrace to the `CFLAGS_WHATEVER_obj.o :=3D n` ap=
proach
> the other instrumentation uses, which IIUC would allow us to define diffe=
rent
> flags for the two cases (though I'll need to go check that).
>
> Thanks,
> Mark.

Hi Mark and Peter,

Sami asked my opinion (as the main -fpatchable-function-entry=3D
implementer on the llvm-project side) on this extension
(-fpatchable-function-entry=3D4,2,__ftrace_function_entries).
I think this is fine.

You may consider bringing this up as a GCC feature request
(https://gcc.gnu.org/bugzilla/show_bug.cgi) and CCing the author/the
committer of https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D417ca0117a=
1a9a8aaf5bc5ca530adfd68cb00399
(original -fpatchable-function-entry=3D support) and the author of
https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3Dc23b5006d3ffeda1a9edf5fd=
817765a6da3696ca
(powerpc64 ELFv2 support).
On the feature request, a summary (so that toolchain people don't have
to read every message in this thread) will help:)



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
