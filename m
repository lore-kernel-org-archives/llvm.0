Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03B11FA5
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 22:29:50 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id f4so489521lfu.12
        for <llvm@lists.linux.dev>; Tue, 17 May 2022 15:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vRrKK940tfY15AL/k2whqSoFtZdbDZpofZ1keoPwuls=;
        b=bmW79KvYYbX9yJ25BckYi9U4OZPqh9WoGqI0OtODtPwXovUvFB0Mlx7LQg5aEmBLUA
         BiVzwzxveln6wne0cgVGF37mWxwUOsxkjXFyhS7Ax8UPP2uL61asXWWhB84s9eLrEoZI
         afCElLueYI9Ar3gaweUf3VPgkl8g5E5Xa1bH3nfox4kc7tal/yDxEE7djtQyPkLGrlNm
         FZTPC87BoRi7kWr611X2F6GFlucPK7Ih5N/LkMzOwVzwow7t/qDugrr5X5/tiMk8pEf7
         pcJeNVa+Qj8MSJRjtdM+pY3HWqdoLYvA/hhXaTzVduKO35znsTrdWKlyNc4Jl4t0AgRo
         3SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vRrKK940tfY15AL/k2whqSoFtZdbDZpofZ1keoPwuls=;
        b=GKdVOOxyBk9SDukpNDViyaJdDz+IBBxOdXh0qPFQnTqI4igV8q7/L9vbYnmZKAPf5O
         EraQDCDahQ5tC2W6A+Q1oUgw2TVW+jwF1JreggaqnqiLyGBKPK2aRbNKxKAOnqRZ/sX1
         LGtHYFMDRJilqmlDkXlq+Hrzlg8R1L4hSIYdRUX+5Q/moGpC7ck89UUEbOby4TgN0Yaz
         3gE4kfBa71H7M7ZtyJtVsDyRq++x/yhgpxOtoB0M3IXJ3g68uHuw1NfI+hDiN0RJ4Adp
         71BlEPbF80wsG6CQf7lZ2V2vSIvkEyajldjYCU5KuCAoqJxHcDlUVv8RoWUkjxXJghb1
         VGbQ==
X-Gm-Message-State: AOAM530G3HDRXPk4VXiACkBewwLn6eUgXB4fZKqEVi+FLceoG7exYRVG
	XwQOIB35z+7M2kc+8Y25+g4Kp4+0z2mnA/JENMio/Q==
X-Google-Smtp-Source: ABdhPJzAQmbCDjA2O7dLfFPHDMx+mXoBHhB/mP3eIxQ/7+fxV1qQkpaIZEiwttGEcDDfQrLU5iW98Ti7DlMBe9dnlbo=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr18342309lfp.392.1652826588756; Tue, 17
 May 2022 15:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yk7/T8BJITwz+Og1@Pauls-MacBook-Pro.local> <CAKwvOdkEULT_OOeaaCneJjbrE=O3kC8SMDs2thFa9gBfpuo2Jg@mail.gmail.com>
 <YmKF5tiH4W8AVdXe@Pauls-MacBook-Pro.local>
In-Reply-To: <YmKF5tiH4W8AVdXe@Pauls-MacBook-Pro.local>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 May 2022 15:29:36 -0700
Message-ID: <CAKwvOd=yLgY_0SwfBuOAzo=+zeWNMu4FMp65y0bi_RM+1G3NWQ@mail.gmail.com>
Subject: Re: Dangerous addr to ctrl dependency transformation in fs/nfs/delegation.c::nfs_server_return_marked_delegations()?
To: =?UTF-8?Q?Paul_Heidekr=C3=BCger?= <paul.heidekrueger@in.tum.de>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, 
	Charalampos Mainas <charalampos.mainas@gmail.com>, Pramod Bhatotia <pramod.bhatotia@in.tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 3:39 AM Paul Heidekr=C3=BCger
<paul.heidekrueger@in.tum.de> wrote:
>
> On Thu, Apr 14, 2022 at 02:21:25PM -0700, Nick Desaulniers wrote:
> > On Thu, Apr 7, 2022 at 8:22 AM Paul Heidekr=C3=BCger
> > <paul.heidekrueger@in.tum.de> wrote:
> > >
> > > Hi all,
> > >
> > > work on my dependency checker tool is progressing nicely, and it is
> > > flagging, what I believe is, a harmful addr to ctrl dependency
> > > transformation. For context, see [1] and [2]. I'm using the Clang
> > > compiler.
> > > [1]: https://linuxplumbersconf.org/event/7/contributions/821/attachme=
nts/598/1075/LPC_2020_--_Dependency_ordering.pdf
> > > [2]: https://lore.kernel.org/llvm/YXknxGFjvaB46d%2Fp@Pauls-MacBook-Pr=
o/T/#u
> >
> > Hi Paul,
> > Thanks for the report and your (and your team's) work on this tool.
> > Orthogonal to your report, Jose (cc'ed) and I are currently in the
> > planning process to put together a Kernel+Toolchain microconference
> > track at Linux Plumbers Conference [0] this year (Sept 12-14) in
> > Dublin, Ireland.  Would you or someone from your group be able and
> > interested in presenting more information about your work to an
> > audience of kernel and toolchain developers at such an event?
> >
> > Would others be interested in such a topic? (What do they say in
> > Starship Troopers...?...Would you like to know more?)
> >
> > [0] https://lpc.events/event/16/
> > --
> > Thanks,
> > ~Nick Desaulniers
>
> Hi Nick and Jose,
>
> Many thanks for inviting us! I would love to do a talk at LPC! Hopefully
> in person too.
>
> Given that there have been several talks around this topic at LPC
> already, it seems very fitting, and we'll hopefully have more to share
> by then. Actually we have more to share already :-)
>
> https://lore.kernel.org/all/YmKE%2FXgmRnGKrBbB@Pauls-MacBook-Pro.local/T/=
#u
>
> I assume we will have to submit an abstract soon?

Yes, if you go to: https://lpc.events/event/16/abstracts/

click "Submit new abstract" in the bottom right.

Under the "Track" dropdown, please select "Toolchains Track."
--=20
Thanks,
~Nick Desaulniers
