Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C52AB42
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 20:47:20 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-62f2b068ba4so37390696d6.3
        for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687294039; x=1689886039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rA3i2opblg9AHF1F2rlGv1v4lotXDt+23xIwyDkolDY=;
        b=mo8QWb4ccpQbDOhOajnjX4GpXsPkN6vj8KMB45EVj+cKZ9yB/OmK8Q8efQ55ZiK52z
         kAUSB2YNV6eb6Ss6jDDLA6a/3qyELGXwYF+eb2Q7i1KCtaxQTJ3dj1B3NWIoF7Squ0Ke
         CSHYdQQbTT4oFSDOJAgGkzIY1H8H1YVeiEbxrPo5ye9BlG8awpkWXWhd0JC7gpQxVac9
         9NmEVDglP1v7F+PRA8cx6t8vAVZqHzWIXw1H6bnk9CHvm7EGWjS/V9TEs/eYjXcw3+AL
         QOTiuwMTQZFk2pvbVkwihO44E6CKg1mmFu+0U0yRqsMjeAunPeYLBUXN0mNyY1x3sbX1
         YDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687294039; x=1689886039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rA3i2opblg9AHF1F2rlGv1v4lotXDt+23xIwyDkolDY=;
        b=CC5+08Hd5e0/2NpeETMFcLLu9vUOo07hK1Hpe/jEEia5enCCOBGgxld7IP94nAeSzC
         X4wqRqgeLNjL473YEjv88ogaYUdTNHRFj5AkZyUrhNB7vKsQKxi/rR/6Xv6s7ya+Mltx
         fCAeKkBG4iiFvMMkkJWqcQ5E/b87v1TJ7FkdtxB2/RkOCTcrePhFnxuSCevW2cw01281
         mIfMaKR6f+RDpFBEFa02o9Yng0QnMJQCAveJZ/8/y0S/8EpHbQTuznpdtgRnypp7hUl8
         cjtoJSVyzD8/4tYiXX8rRYgiAH7+/V+n/BoR7z50Mux063+2FB8QdSSDEkmJ5TX5s+0V
         kocA==
X-Gm-Message-State: AC+VfDzgnDa4YbvvZgPIfPapwp+sOKIUWkyP8dUn4Q639t1ilLCQDXJ5
	NMEVh9P0laylN3keH84pegw7Tofqb1LkiJGyCO8cMRP7C0bluSIFAqDplQ==
X-Google-Smtp-Source: ACHHUZ6UItpw2LPCk1xMc27GiRDBKedo6AyfjmO6DAgYOkoG5EFO12A+M83vVJshZiaOHJI8CRKa8frMLgIu+Nenrlk=
X-Received: by 2002:a05:6214:27cb:b0:626:e55:dfb2 with SMTP id
 ge11-20020a05621427cb00b006260e55dfb2mr15688866qvb.39.1687294039262; Tue, 20
 Jun 2023 13:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdn_U+yjFBn6pq5XwP1rTEKA1MWBkd0f2N8wB_nuS1_sWw@mail.gmail.com>
 <mhng-16f1b957-5cf5-4786-a760-e4ab1fbe83ce@palmer-ri-x1c9a>
In-Reply-To: <mhng-16f1b957-5cf5-4786-a760-e4ab1fbe83ce@palmer-ri-x1c9a>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 20 Jun 2023 16:47:07 -0400
Message-ID: <CAKwvOdm4FLSq41WTzmPqCeNh-WBX1_rtKpT3zwyGez7bZ-jE7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, llvm@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 4:41=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com>=
 wrote:
>
> On Tue, 20 Jun 2023 13:32:32 PDT (-0700), ndesaulniers@google.com wrote:
> > On Tue, Jun 20, 2023 at 4:13=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> >>
> >> On Tue, Jun 20, 2023 at 04:05:55PM -0400, Nick Desaulniers wrote:
> >> > On Mon, Jun 19, 2023 at 6:06=E2=80=AFPM Palmer Dabbelt <palmer@dabbe=
lt.com> wrote:
> >> > > On Thu, 15 Jun 2023 06:54:33 PDT (-0700), Palmer Dabbelt wrote:
> >> > > > On Wed, 14 Jun 2023 09:25:49 PDT (-0700), jszhang@kernel.org wro=
te:
> >> > > >> On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
> >> > > >>> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org w=
rote:
> >>
> >> > > >> Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused=
 by
> >> > > >> kernel/pi") touches vmlinux.lds.S, so to make the merge easy, t=
his
> >> > > >> series is based on 6.4-rc2.
> >> > > >
> >> > > > Thanks.
> >> > >
> >> > > Sorry to be so slow here, but I think this is causing LLD to hang =
on
> >> > > allmodconfig.  I'm still getting to the bottom of it, there's a fe=
w
> >> > > other things I have in flight still.
> >> >
> >> > Confirmed with v3 on mainline (linux-next is pretty red at the momen=
t).
> >> > https://lore.kernel.org/linux-riscv/20230517082936.37563-1-falcon@ti=
nylab.org/
> >>
> >> Just FYI Nick, there's been some concurrent work here from different
> >> people working on the same thing & the v3 you linked (from Zhangjin) w=
as
> >> superseded by this v2 (from Jisheng).
> >
> > Ah! I've been testing the deprecated patch set, sorry I just looked on
> > lore for "dead code" on riscv-linux and grabbed the first thread,
> > without noticing the difference in authors or new version numbers for
> > distinct series. ok, nevermind my noise.  I'll follow up with the
> > correct patch set, sorry!
>
> Ya, I hadn't even noticed the v3 because I pretty much only look at
> patchwork these days.  Like we talked about in IRC, I'm going to go test
> the merge of this one and see what's up -- I've got it staged at
> <https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/=
?h=3Dfor-next&id=3D1bd2963b21758a773206a1cb67c93e7a8ae8a195>,
> though that won't be a stable hash if it's actually broken...

Ok, https://lore.kernel.org/linux-riscv/20230523165502.2592-1-jszhang@kerne=
l.org/
built for me.  If you're seeing a hang, please let me know what
version of LLD you're using and I'll build that tag from source to see
if I can reproduce, then bisect if so.

$ ARCH=3Driscv LLVM=3D1 /usr/bin/time -v make -j128 allmodconfig vmlinux
...
        Elapsed (wall clock) time (h:mm:ss or m:ss): 2:35.68
...

Tested-by: Nick Desaulniers <ndesaulniers@google.com> # build

>
> >
> >>
> >> Cheers,
> >> Conor.
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
