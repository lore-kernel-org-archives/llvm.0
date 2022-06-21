Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FCA1C00
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 22:05:26 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id s10so17050906ljh.12
        for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 15:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qk9wW2plDRuZUfEbH5Ob9wJ8MzMD7oQ2u+YwN1EZlno=;
        b=PksK/pvVejHaPuJXQTH64r9lAa+BSxcqKlrp/YdZR0LE3hMPpWsFWMmQlN59uGmqpC
         NGtOHmEng/i/D9QbisoA6LN/yBGK4iJJU/k3KEURwdY+ntci4FCk3uFB9wCf3zkTyyph
         ujW4+5Ew683yYv1nlMz+a1NfvCpJtah5v1ZIP9FAYrl/OBRwO35C0h4y6vt/5DidZ0aA
         VDgDJZB5O2+5JjDtUDq97kAzxKFMzbHUTgi+BlLmCK8Vaoeh9ARNa840AGaHLk8g7jiE
         HhIIQ5x6G6w07sWsUsLL5/c4nKukLWjXG7Og10dAonWaQ2gTR4W0jlT/QAo+ZavHaGtb
         stUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qk9wW2plDRuZUfEbH5Ob9wJ8MzMD7oQ2u+YwN1EZlno=;
        b=em3qiGwgIuuisKu7u5u5YMe9LbyeX+nmZn3B4aHv4WeWzp9rElybNYblVl2mggaRAD
         DYDmIP4SzAcYmdhcl8+aP1EcuKMHf3xri1DSepGI5WSXLjHncU8kcite4efZKmiG36f7
         o42lggUl9QDe1U+7mcAkZImnnYcXkmA/aVMV9VdnwABQDsWl/xnXLK5r4lx28MZpCKbL
         NTXrksRLdOXaY0qcoLFGqmJ2YnGEBK3IElLxq+jeLT95eiAroor6a4Iy7/vxsboLm62V
         myXeXH0XBqDNCjF4Un8vs6S8B/uOuU+yXHEXwPeHQjSajjOi4AWya1HM8cfQORP38KB/
         YRZA==
X-Gm-Message-State: AJIora8C9OeGCvF2Dky38x5fLwu9yAZ9pRyHiLuppFBorglpk4s0uxK+
	BYmx3BiA4PDDkt6r8+l9xKEoD8TEERID3Y8UAr0njw==
X-Google-Smtp-Source: AGRyM1s8ItdZNicXgy4vfEI31Rcdko+391VPjrdp8750VHiNV/XVuGohJzT8zmLpof5YTXJPo8fI2yLlcamrBqB4reA=
X-Received: by 2002:a05:651c:23b:b0:259:fee:cc2a with SMTP id
 z27-20020a05651c023b00b002590feecc2amr130672ljn.400.1655849123759; Tue, 21
 Jun 2022 15:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yk7/T8BJITwz+Og1@Pauls-MacBook-Pro.local> <CAKwvOdkEULT_OOeaaCneJjbrE=O3kC8SMDs2thFa9gBfpuo2Jg@mail.gmail.com>
 <YmKF5tiH4W8AVdXe@Pauls-MacBook-Pro.local> <CAKwvOd=yLgY_0SwfBuOAzo=+zeWNMu4FMp65y0bi_RM+1G3NWQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=yLgY_0SwfBuOAzo=+zeWNMu4FMp65y0bi_RM+1G3NWQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 Jun 2022 15:05:12 -0700
Message-ID: <CAKwvOdkrZbRTfrK_cFRseoONGi7qQ-_4vB=Zm9KH3Bb2KZ5tww@mail.gmail.com>
Subject: Re: Dangerous addr to ctrl dependency transformation in fs/nfs/delegation.c::nfs_server_return_marked_delegations()?
To: =?UTF-8?Q?Paul_Heidekr=C3=BCger?= <paul.heidekrueger@in.tum.de>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Marco Elver <elver@google.com>, 
	Charalampos Mainas <charalampos.mainas@gmail.com>, Pramod Bhatotia <pramod.bhatotia@in.tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 3:29 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Apr 22, 2022 at 3:39 AM Paul Heidekr=C3=BCger
> <paul.heidekrueger@in.tum.de> wrote:
> >
> > On Thu, Apr 14, 2022 at 02:21:25PM -0700, Nick Desaulniers wrote:
> > > On Thu, Apr 7, 2022 at 8:22 AM Paul Heidekr=C3=BCger
> > > <paul.heidekrueger@in.tum.de> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > work on my dependency checker tool is progressing nicely, and it is
> > > > flagging, what I believe is, a harmful addr to ctrl dependency
> > > > transformation. For context, see [1] and [2]. I'm using the Clang
> > > > compiler.
> > > > [1]: https://linuxplumbersconf.org/event/7/contributions/821/attach=
ments/598/1075/LPC_2020_--_Dependency_ordering.pdf
> > > > [2]: https://lore.kernel.org/llvm/YXknxGFjvaB46d%2Fp@Pauls-MacBook-=
Pro/T/#u
> > >
> > > Hi Paul,
> > > Thanks for the report and your (and your team's) work on this tool.
> > > Orthogonal to your report, Jose (cc'ed) and I are currently in the
> > > planning process to put together a Kernel+Toolchain microconference
> > > track at Linux Plumbers Conference [0] this year (Sept 12-14) in
> > > Dublin, Ireland.  Would you or someone from your group be able and
> > > interested in presenting more information about your work to an
> > > audience of kernel and toolchain developers at such an event?
> > >
> > > Would others be interested in such a topic? (What do they say in
> > > Starship Troopers...?...Would you like to know more?)
> > >
> > > [0] https://lpc.events/event/16/
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
> >
> > Hi Nick and Jose,
> >
> > Many thanks for inviting us! I would love to do a talk at LPC! Hopefull=
y
> > in person too.
> >
> > Given that there have been several talks around this topic at LPC
> > already, it seems very fitting, and we'll hopefully have more to share
> > by then. Actually we have more to share already :-)
> >
> > https://lore.kernel.org/all/YmKE%2FXgmRnGKrBbB@Pauls-MacBook-Pro.local/=
T/#u
> >
> > I assume we will have to submit an abstract soon?
>
> Yes, if you go to: https://lpc.events/event/16/abstracts/
>
> click "Submit new abstract" in the bottom right.
>
> Under the "Track" dropdown, please select "Toolchains Track."

Hi Paul, we'll need all proposals soon.
If you're still considering attending Linux Plumbers conf, please
submit a proposal:
https://lpc.events/event/16/abstracts/
Please make sure to select "Toolchains Track" as the "Track" after
clicking on "Submit new abstract."

> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
