Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A06815
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 07:18:53 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id f2so5928352ilq.1
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 23:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=Em4vIFtbnAfHzqImau3wflNwYLrEwWXRRPlRb6fFAik=;
        b=AQ+vItkCK/KQHEUSzHxM2ukwePVCTPXqZLpjiIIjLSzXBM/fx496O/ME8K9a7ToBPr
         Zq/k+3ePgMPSe6/WF3bnzmmZU5Ug/g+LbCGqp5NhR3bRqIRxVh+Y8849i/zi+5H2xKa+
         WvKzoo/YAHjnKJpu/mzRt1wMIvnb7xB16f6eaX/nkdpqFUQR3ARHHwvH4TNBStQ4qI7u
         lyApT9q8gW3izpqDEn/R6+kyou2u7qEWkYx+SintwAhnrMjMom0UDKV/p3KqrFFl1kd2
         rxrbIa3NgFagkcYzZik+r/acVk4SrJVa5BOMLQtPg5ZqGFw64XI63tPA+UOUQNwzvtqS
         wwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=Em4vIFtbnAfHzqImau3wflNwYLrEwWXRRPlRb6fFAik=;
        b=DbPuWPsXESs5eTeTJK4dTjFqob7yjiWAhobHebPJ/drKXjPwp9Gf7gRVOPG9dhBe87
         xQ+00J6JMsJewWV4DNoSul9ZGkXsBDvV1Qq1AdE0sm/E/9yFUP/63f/h/M53BKHkrkuo
         06mReGB5rkxh/QDfZxjjqLycDu18LM4phsFIjHRKo4KwrlFoxzBoxM8A31V0OKZsvRu8
         pnkXhWPUSo/LBwCVsa5y6Mkll6FLPvNPx+caZrTI31gWcDEIYJqFDU/w6/jWuyfGcjwg
         lKlPU2+E9cWU3KbVOe1cK5tMHDquP/MH3r0M4q8/JT6SB5GzhSB4vj0MFCYu2n7KtK4I
         e92A==
X-Gm-Message-State: AOAM531iRANaISbIPKDYTVbFEBtQ9oCnc3Wf7A7thinipQQojGJw21dc
	FOU/CuhtDJwgk+qtgWTzdUJGwjGj4/uGlGC4u9Q=
X-Google-Smtp-Source: ABdhPJybQ6fYgvuM8D5CD0i1MixyIsqbUa6RJpl03+vMLWnwjvlqkhpRtmzXdXhlPEcIGQg643vX7Clekr+saOwTIKA=
X-Received: by 2002:a05:6e02:de2:b0:2c6:f14:884a with SMTP id
 m2-20020a056e020de200b002c60f14884amr2995481ilj.100.1646378332178; Thu, 03
 Mar 2022 23:18:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-3-arnd@kernel.org>
 <CA+icZUWCTuVeohWvePhxYY3WC9xAYSy9nP1xQQf=tFH_mWDCNQ@mail.gmail.com>
 <CAKwvOdn04aoWO_384k5HQodwA1-DCFwU50iRXQXh_BQk5pyz7w@mail.gmail.com>
 <CA+icZUWD_O1WTKNDTj7f+EUxx5Pf=zC53mfOBNgtj1JQwjZVAQ@mail.gmail.com>
 <YiD86pay2ENCebkR@dev-arch.thelio-3990X> <CA+icZUXDBe5MF6G_2v4XoV0SFVkTZ96M5i-VGSvHsP1pFJ+nAg@mail.gmail.com>
In-Reply-To: <CA+icZUXDBe5MF6G_2v4XoV0SFVkTZ96M5i-VGSvHsP1pFJ+nAg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 4 Mar 2022 08:18:15 +0100
Message-ID: <CA+icZUXNtq3+cW6OBiO1TPhHT2xwXFe_D-Ja8HAO0XH2y6h=GA@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kbuild: use -std=gnu11 for KBUILD_USERCFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jani Nikula <jani.nikula@intel.com>, David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 4, 2022 at 7:47 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Mar 3, 2022 at 6:37 PM Nathan Chancellor <nathan@kernel.org> wrot=
e:
> >
> > Hi Sedat,
> >
> > On Thu, Mar 03, 2022 at 07:26:05AM +0100, Sedat Dilek wrote:
> > > Hey Nick!
> > >
> > > This only applies 1/3.
> > >
> > > $ b4 --version
> > > 0.8.0
> > >
> > > $ b4 am https://lore.kernel.org/lkml/20220301145233.3689119-1-arnd@ke=
rnel.org/
> > > -o - | git am -3
> > > Analyzing 14 messages in the thread
> > > Will use the latest revision: v3
> > > You can pick other revisions using the -vN flag
> > > Checking attestation on all messages, may take a moment...
> > > ---
> > >  =E2=9C=93 [PATCH v3 1/3] Kbuild: move to -std=3Dgnu11
> > >    =E2=9C=93 Signed: DKIM/kernel.org
> > >    + Reviewed-by: Nathan Chancellor <nathan@kernel.org> (=E2=9C=93 DK=
IM/kernel.org)
> > >  ERROR: missing [2/3]!
> > >  ERROR: missing [3/3]!
> > >  ---
> > >  NOTE: install patatt for end-to-end signature verification
> > > ---
> > > Total patches: 1
> > > ---
> > > WARNING: Thread incomplete!
> > > Link: https://lore.kernel.org/r/20220301145233.3689119-1-arnd@kernel.=
org
> > > Base: not specified
> > > Wende an: Kbuild: move to -std=3Dgnu11
> >
> > It looks like the threading somehow got broken, likely due to the [v3]
> > on the first patch and not the second or third:
> >
> > This worked for me on v5.17-rc6:
> >
> > $ for i in $(seq 1 3); do b4 shazam -P _ 20220301145233.3689119-"$i"-ar=
nd@kernel.org; done
> >
> > "b4 shazam" is the equivalent of "b4 am -o - ... | git am" and the
> > "-P _" tells b4 to only fetch that exact message ID, not the whole
> > thread.
> >
>
> Hmm, the universe is not good to me...
>
> $ for i in $(seq 1 3); do b4 shazam -P _
> 20220301145233.3689119-"$i"-arnd@kernel.org; done
> usage: b4 [-h] [--version] [-d] [-q] {mbox,am,attest,pr,ty,diff,kr} ...
> b4: error: argument subcmd: invalid choice: 'shazam' (choose from
> 'mbox', 'am', 'attest', 'pr', 'ty', 'diff', 'kr')
> usage: b4 [-h] [--version] [-d] [-q] {mbox,am,attest,pr,ty,diff,kr} ...
> b4: error: argument subcmd: invalid choice: 'shazam' (choose from
> 'mbox', 'am', 'attest', 'pr', 'ty', 'diff', 'kr')
> usage: b4 [-h] [--version] [-d] [-q] {mbox,am,attest,pr,ty,diff,kr} ...
> b4: error: argument subcmd: invalid choice: 'shazam' (choose from
> 'mbox', 'am', 'attest', 'pr', 'ty', 'diff', 'kr')
>
> Do I need a higher version of b4 (here: v0.8.0)?
>
> Check myself... b4.git:
>
> commit 7c1d044ff1d5235e598d4c777c4abfe60e0a09a8
> ("shazam: change default behaviour to be "apply-here"")
>
> ...is post-v0.8.0.
>

I brutally applied the post-v0.8.0 patches stolen from b4.git over my
local distro b4 files.

And was able to apply the triple:

$ git log --oneline --no-merges
5.17.0-rc6-1-amd64-clang13-lto..5.17.0-rc6-2-amd64-clang13-lto
96a4222bdd4c (for-5.17/kbuild-std_gnu11-arndb-20220301) Kbuild: use
-std=3Dgnu11 for KBUILD_USERCFLAGS
c4e8cef401a8 treewide: use -Wdeclaration-after-statement
6a7cc105b238 Kbuild: move to -std=3Dgnu11

- sed@ -
