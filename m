Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B77499
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 21:19:15 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id a13so14602378lfr.10
        for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bWh9VRdZl1u3+H7jOVmIdNMxltD0sU3JDPWB8VuaPYc=;
        b=GaCRkRp65UFibVgjZ8jwNLwqZjAAQ91yIDFfaR1WpHRiZn2VmkUghBiK/w7aKV6wgP
         yQh/c630tmA+TO6D09+qRV/5VNmM00ubrCRiS7AHjAd0ZbntqEq2cw9KrAfhPah5dMVJ
         xz5sHs2leK33QQ67QYj0m+Q2B6rxnpQJI9/IXsg6jppScsx/M+jIHWvnwcRcDGRbai+o
         Ws9vTEJ1rP1Hm131G1cz48l4nn89K2tpAPdpjp/i8qB3VKZCCiB0vvzi1mMg4ca10A2u
         U9gdxu1V6qKQDYmxVU1WyBU6nTeFQx+/Ry6OVhO/IO1ahYva1IcZJEAIt2YGyAKGRlWM
         1AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bWh9VRdZl1u3+H7jOVmIdNMxltD0sU3JDPWB8VuaPYc=;
        b=0fZCVTEcFc+pQPZTHIS3Wvcr4lRM/QMyVEicS8/zX5r72LOR4qmq+bLKYxDxic0pks
         9rvMUmS6aQFsoloMlbcNmYRtBzU04NHXAvcn563h2j5c7T1WCw4pw5123u34wrU7VBUp
         AgQaejQgQUIcqK/vJzTyzabaMaKCiUYoJbHxyRdVGZ8v+aD2ybsH+1hr5Jvzw8u/EDgV
         ivhfsZC6AxazodJlOVG6CIqZ1TOA664nL2BhRwikpnDuTftMOfHFizYTU4COnqjqgBwj
         Iz6XBm/4V0ySxdIqKy+eft68X+4wOH5rDIDyqx0zadK/qWMvaOS1yD8egqyDrjQLUdgc
         PQXA==
X-Gm-Message-State: AJIora9hz7v5z3wMiS+S7E9sFht3vF0TLiZ8/siZDyhEyl4T/nZ9RM6F
	UflNHT+iAtLcdb7vZrlTXkDCfQgdYQP48+XXJh8MMQ==
X-Google-Smtp-Source: AGRyM1vbMNE2gVKmfFfSh4kTQIBakPO8vQBuEt2gKIJwqhpVwVHjN/BNgvlEXgQPNym96rNWYL6ik9iNPGRdlCvdNCo=
X-Received: by 2002:a05:6512:b8d:b0:47f:74f0:729b with SMTP id
 b13-20020a0565120b8d00b0047f74f0729bmr118613lfv.403.1655846353718; Tue, 21
 Jun 2022 14:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com>
 <87fsm7rbec.fsf@oracle.com> <CAGvU0H=sjwsWEmq1R7LKHiPjB3aBkzQ_qJqXDxhT_rFJShgVFg@mail.gmail.com>
 <2651230.KlZ2vcFHjT@sali> <CAJFNNnoWDS547q-MDye4L_2WkT9odxAvhD2JQkALH7Erm2YJtQ@mail.gmail.com>
In-Reply-To: <CAJFNNnoWDS547q-MDye4L_2WkT9odxAvhD2JQkALH7Erm2YJtQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 Jun 2022 14:19:02 -0700
Message-ID: <CAKwvOdmUXcapfojgcRK1OAZuCDCeQmD_cx9=y_iz6-L_uv0eHA@mail.gmail.com>
Subject: Re: Kernel ABI Monitoring and toolchain support
To: =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>
Cc: "Guillermo E. Martinez" <guillermo.e.martinez@oracle.com>, Giuliano Procida <gprocida@google.com>, 
	Dodji Seketeli <dodji@seketeli.org>, Elena Zannoni <elena.zannoni@oracle.com>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 6:42 AM Matthias M=C3=A4nnich <maennich@google.com>=
 wrote:
>
> Hi!
>
> That is a very late response, sorry about that.
>
> In the Android MC we will have a talk about the latest news monitoring
> Android Kernel ABIs already, but I definitely see value in a more
> generic session in the Kernel+Toolchain MC. Is that schedule already
> finalized or is there still a slot available and interest from your
> side?

We haven't finalized the schedule yet.  Matthias, Guillermo, Giuliano
can one of you perhaps fill out a proposal then for the ideas
discussed in this thread on https://lpc.events/event/16/abstracts/
with the "Track" set to "Toolchains Track?"

>
> In particular, I would be interested in discussing ways to standardize
> ABI and type information in a way that it can be embedded into
> binaries in a less ambiguous way. In other words, what can we do to
> not rely entirely on intermediate formats like CTF or DWARF to make
> sense of an ABI? Maybe CTF is already a good starting point, yet some
> additions are needed (e.g. other language features like for C++)?
>
> Cheers,
> Matthias
>
>
> On Sat, May 7, 2022 at 3:15 AM Guillermo E. Martinez
> <guillermo.e.martinez@oracle.com> wrote:
> >
> > Hello guys,
> >
> > On our side we are working on:
> >
> >   * Gives the support  to extract the ABI for Linux kernel image
> >   and Linux  kernel modules using the CFT backed in with
> >   libabigail tools.
> >   * Add support to compare packages with CTF debug format by using
> >   abipkgdiff and other related libabigail tools.
> >
> >    * https://sourceware.org/pipermail/libabigail/2022q2/004340.html
> >    * https://sourceware.org/pipermail/libabigail/2022q2/004345.html
> >
> > If you think that it could be a point to talk as part of your MC,  I ca=
n for sure
> > provides more details about it.
> >
> > Thanks for your comments,
> > Guillermo
> >
> > On Wednesday, April 20, 2022 12:34:59 PM CDT Giuliano Procida wrote:
> > > Sorry for the late reply, I've been on leave and Mattias is still on =
leave.
> > >
> > > That sounds quite interesting.
> > >
> > > Matthias and I could certainly talk about what we've been busy with a=
nd
> > > what are the main pain points for Android (not just the kernel).
> > >
> > > On what more would we like from the toolchain... it falls into at lea=
st two
> > > buckets:
> > >
> > > 1. make the possible easier - stricter conformance to DWARF standards=
, full
> > > DWARF 5 support, getting things like ARM64 ABI extensions (e.g., for
> > > HWASAN) into things like elfutils at the same time as the compile-lin=
k
> > > toolchain, more consistency between Clang and GCC debug info for the =
same
> > > sources, the same for Clang and Clang with full LTO
> > > 2. make the impossible possible - extending ABI monitoring coverage b=
eyond
> > > just architecture, symbols and types / dealing with header constants,
> > > macros and more
> > >
> > > Giuliano.
> > >
> > >
> > > On Wed, 20 Apr 2022 at 17:02, Jose E. Marchesi <jose.marchesi@oracle.=
com>
> > > wrote:
> > >
> > > >
> > > > [Adding Dodji Seketeli, libabigail maintainer,
> > > >  and Guillermo Martinez, who works in the CTF support for libabigai=
l
> > > >  including kernel support.]
> > > >
> > > > > Hi Matthias and Giuliano,
> > > > > Jose and I are currently in the planning process to put together =
a
> > > > > Kernel+Toolchain microconference track at Linux Plumbers Conferen=
ce
> > > > > this year (Sept 12-14) in Dublin, Ireland.
> > > > >
> > > > > Would you all be interested in a leading session on Kernel ABI
> > > > > Monitoring and perhaps what toolchain vendors can do to help, as =
part
> > > > > of our MC (which itself is currently still in planning phase).
> > > >
> > >
> >
> >
> >
> >



--=20
Thanks,
~Nick Desaulniers
