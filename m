Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3558E1875
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 19:48:04 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id a2so29553847lfg.5
        for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sfM6WZqf/QZWZdyg0Q5MFwxvkOeV0SDZcoKjHkal9Eg=;
        b=KAhvScxw7vZNSabb7xqX8T0CP0gGB3NPyn5sj8msi3e1jzXMNu1ooTQSMbr7WQyUmE
         BQ68ohWz2J7gr7bpMisn18LALKA06UInMvOzRqy6LG/bE3bk/Qn35/u5h/Ov+/eFCxrH
         XAP6xdsWsh8AOlGKq3q0dAU9NaD6NbXME92+ekLvYin/IE/H0SaXSewWo39xS5Y0+ZaB
         WvVSD27DiwPu7mRR7FO/+IWF2BmyC6csszV9Tl1hD9WwH1KlaXUSC/VXEhc9bl8uZs0V
         khHP/580HtQSENVszuWii3nDgDNSSGxvjw2wHi0mLyOCoD4QA7l8GBOqASeN4Spp072N
         lTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sfM6WZqf/QZWZdyg0Q5MFwxvkOeV0SDZcoKjHkal9Eg=;
        b=UFd5iCUtxBdjmx8mMBJodiDIxOw0Y33mAX4CRPfKpxBApRqOgVD558vbEuoAW95W+V
         Pbu+fuqy7OW2kvBvW0hdZW6qKI495M1s0QMEFGCWkTOPx0e8KqX//AtTdzFdjmCO8YtO
         9HzM/NF7InyJplDDbClIYKq5qwAt3TuHF2O4eiw9qbdNmF+StDqVI3CaZNf/AVVb2CBV
         6uD3yRoqkPh0urK8YYscMQ69io+M4kiR4bNvOH8Q7mQZtQw4tgJhhqHqnSFqQs05gkjV
         BLm4PbpYrZ+yPm7dDY6RYFx2toEpxN88jNOPh89+mHz6IUvdXyziFdnwiGWXm222TgCG
         oPTQ==
X-Gm-Message-State: AJIora+C/w63Wqh9aKJwFikTrXw71a69mrz1NTsNVjpNJ+zjqqmPqqVR
	X0AEYEOJOngDnKrstUvqE2Hqo5FN0RrqEAmcWEXmXg==
X-Google-Smtp-Source: AGRyM1sZdcbi3PIOHk7HHuuYaTKZzl48NRlzmcXi3AlA//ujJi267Zt3HW/TEVsc176eXsTlAnm8YpC+Nf0vz6UeF+c=
X-Received: by 2002:a05:6512:ad6:b0:479:5599:d834 with SMTP id
 n22-20020a0565120ad600b004795599d834mr3044874lfu.103.1655927281995; Wed, 22
 Jun 2022 12:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com>
 <639f7737-fbbb-f0de-d465-d9770c794afb@oracle.com> <4404532.iIbC2pHGDl@sali> <2695836.VLH7GnMWUR@sali>
In-Reply-To: <2695836.VLH7GnMWUR@sali>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Jun 2022 12:47:50 -0700
Message-ID: <CAKwvOd=Sv1Aa49T-KPB2Kk0d78PSNCOM=Om5oTvjKuwCs1=c+g@mail.gmail.com>
Subject: Re: Kernel ABI Monitoring and toolchain support
To: "Guillermo E. Martinez" <guillermo.e.martinez@oracle.com>
Cc: =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>, Giuliano Procida <gprocida@google.com>, 
	Dodji Seketeli <dodji@seketeli.org>, clang-built-linux <llvm@lists.linux.dev>, 
	"Jose E. Marchesi" <jose.marchesi@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 8:27 AM Guillermo E. Martinez
<guillermo.e.martinez@oracle.com> wrote:
>
> Hello,
>
> Any comment?

LGTM; please file a formal submission at
https://lpc.events/event/16/abstracts/
with the "Track" set to "Toolchains Track."

>
> Thanks,
> guillermo
>
> > Hello guys,
> >
> > The paragraphs bellow summarize the proposal  for Kernel ABI analysis
> > talk in LPC, these ideas comes from the thread mail bellow.
> >
> > Please let me know your comments to submit it
> > to https://lpc.events/event/16/abstracts/
> >
> > guillermo
> >
> > ---
> > Kernel ABI Monitoring and toolchain support
> >
> > The new CTF(Compact C Type Format) supported  in  libabigail  is  able
> > to extract a  corpus  representation  for  the  debug  information  in
> > Kernel binary and its modules, i.e, entire Kernel  release  (kernel  +
> > modules).  Using CTF reader improvements the time to extract and build
> > the corpus compared with DWARF reader,  for  example,  extracting  ABI
> > information  from  the  Linux  kernel  takes  up  to  ~4.5times   less
> > time, this was done using a Kernel  compiled  by  GCC,  nowadays  LLVM
> > doesn't support binaries generation with CTF debug info, would be nice
> > to have this.
> >
> > But what about of the modules inserted  (loaded)  at  runtime  in  the
> > Kernel image?.  To make the comparison it uses kABI  scripts  this  is
> > useful among other things to load modules with compatible  kABI,  this
> > mechanism allows modules to be used with a  different  kernel  version
> > that of the kernel for which it was built.  So what of using a  single
> > notion  of   ABI   (libabigail)   also   for   the   modules   loader?
> >
> > Since we add support for  CTF  in  libabigail,  is  needed  the  patch
> > for building the Kernel  with  CTF  enabled  in  the  Kernel  upstream
> > configuration.  Also some GCC  attributes  that  affect  the  ABI  and
> > are used by kernel hackers like noreturn,  interrupt,  etc.   are  not
> > represented in DWARF/CTF debug  format  and  therefore  they  are  not
> > present in the corpus.
> >
> > A stricter conformance to DWARF standards would be nice, full DWARF  5
> > support, getting things like ARM64 ABI extensions (e.g.,  for  HWASAN)
> > into things like  elfutils  at  the  same  time  as  the  compile-link
> > toolchain, more consistency between Clang and GCC debug info  for  the
> > same sources, the same for Clang and Clang  with  full  LTO.   And  an
> > extending ABI monitoring coverage beyond  just  architecture,  symbols
> > and  types  /  dealing  with  header  constants,   macros   and   more
> >
> > The  interest  in  discussing  ways  to  standardize  ABI   and   type
> > information in a way that it can be embedded into binaries in  a  less
> > ambiguous way.  In other words, what can we do to not rely entirely on
> > intermediate formats like CTF or DWARF to make sense of an ABI?  Maybe
> > CTF is already a good starting point, yet some  additions  are  needed
> > (e.g. other language features like for C++)?
> >
> > > On 6/21/22 15:19, Nick Desaulniers wrote:
> > > > On Mon, Jun 20, 2022 at 6:42 AM Matthias M=C3=A4nnich <maennich@goo=
gle.com> wrote:
> > > >> Hi!
> > > >>
> > > >> That is a very late response, sorry about that.
> > > >>
> > > >> In the Android MC we will have a talk about the latest news monito=
ring
> > > >> Android Kernel ABIs already, but I definitely see value in a more
> > > >> generic session in the Kernel+Toolchain MC. Is that schedule alrea=
dy
> > > >> finalized or is there still a slot available and interest from you=
r
> > > >> side?
> > > > We haven't finalized the schedule yet.  Matthias, Guillermo, Giulia=
no
> > > > can one of you perhaps fill out a proposal then for the ideas
> > > > discussed in this thread on https://lpc.events/event/16/abstracts/
> > > > with the "Track" set to "Toolchains Track?"
> > > >
> > >
> > > Hi,
> > >
> > > actually Guillermo was already working on that, will send something b=
y the end of the day
> > >
> > > elena
> > >
> > > >> In particular, I would be interested in discussing ways to standar=
dize
> > > >> ABI and type information in a way that it can be embedded into
> > > >> binaries in a less ambiguous way. In other words, what can we do t=
o
> > > >> not rely entirely on intermediate formats like CTF or DWARF to mak=
e
> > > >> sense of an ABI? Maybe CTF is already a good starting point, yet s=
ome
> > > >> additions are needed (e.g. other language features like for C++)?
> > > >>
> > > >> Cheers,
> > > >> Matthias
> > > >>
> > > >>
> > > >> On Sat, May 7, 2022 at 3:15 AM Guillermo E. Martinez
> > > >> <guillermo.e.martinez@oracle.com> wrote:
> > > >>> Hello guys,
> > > >>>
> > > >>> On our side we are working on:
> > > >>>
> > > >>>   * Gives the support  to extract the ABI for Linux kernel image
> > > >>>   and Linux  kernel modules using the CFT backed in with
> > > >>>   libabigail tools.
> > > >>>   * Add support to compare packages with CTF debug format by usin=
g
> > > >>>   abipkgdiff and other related libabigail tools.
> > > >>>
> > > >>>    * https://sourceware.org/pipermail/libabigail/2022q2/004340.ht=
ml
> > > >>>    * https://sourceware.org/pipermail/libabigail/2022q2/004345.ht=
ml
> > > >>>
> > > >>> If you think that it could be a point to talk as part of your MC,=
  I can for sure
> > > >>> provides more details about it.
> > > >>>
> > > >>> Thanks for your comments,
> > > >>> Guillermo
> > > >>>
> > > >>> On Wednesday, April 20, 2022 12:34:59 PM CDT Giuliano Procida wro=
te:
> > > >>>> Sorry for the late reply, I've been on leave and Mattias is stil=
l on leave.
> > > >>>>
> > > >>>> That sounds quite interesting.
> > > >>>>
> > > >>>> Matthias and I could certainly talk about what we've been busy w=
ith and
> > > >>>> what are the main pain points for Android (not just the kernel).
> > > >>>>
> > > >>>> On what more would we like from the toolchain... it falls into a=
t least two
> > > >>>> buckets:
> > > >>>>
> > > >>>> 1. make the possible easier - stricter conformance to DWARF stan=
dards, full
> > > >>>> DWARF 5 support, getting things like ARM64 ABI extensions (e.g.,=
 for
> > > >>>> HWASAN) into things like elfutils at the same time as the compil=
e-link
> > > >>>> toolchain, more consistency between Clang and GCC debug info for=
 the same
> > > >>>> sources, the same for Clang and Clang with full LTO
> > > >>>> 2. make the impossible possible - extending ABI monitoring cover=
age beyond
> > > >>>> just architecture, symbols and types / dealing with header const=
ants,
> > > >>>> macros and more
> > > >>>>
> > > >>>> Giuliano.
> > > >>>>
> > > >>>>
> > > >>>> On Wed, 20 Apr 2022 at 17:02, Jose E. Marchesi <jose.marchesi@or=
acle.com>
> > > >>>> wrote:
> > > >>>>
> > > >>>>> [Adding Dodji Seketeli, libabigail maintainer,
> > > >>>>>  and Guillermo Martinez, who works in the CTF support for libab=
igail
> > > >>>>>  including kernel support.]
> > > >>>>>
> > > >>>>>> Hi Matthias and Giuliano,
> > > >>>>>> Jose and I are currently in the planning process to put togeth=
er a
> > > >>>>>> Kernel+Toolchain microconference track at Linux Plumbers Confe=
rence
> > > >>>>>> this year (Sept 12-14) in Dublin, Ireland.
> > > >>>>>>
> > > >>>>>> Would you all be interested in a leading session on Kernel ABI
> > > >>>>>> Monitoring and perhaps what toolchain vendors can do to help, =
as part
> > > >>>>>> of our MC (which itself is currently still in planning phase).
> > > >>>
> > > >>>
> > > >>>
> > > >
> > > >
> > >
> > >
> >
> >
> >
> >
> >
>
>
>
>


--=20
Thanks,
~Nick Desaulniers
