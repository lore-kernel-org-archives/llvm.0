Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B412906
	for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 22:05:41 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id n74so18033157yba.3
        for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 15:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rPTUmtD0mO4LKrdNJNBcqd3l40tXMwjLHVeP/VIEmwU=;
        b=MCM+6b6RcoWpklzEm4YevE5Ka2BDNSfA381jQ37WspKtLtFaGtYp4Cn9gkUEzqDX8m
         lFGst0so5xX874adBrMNfcUGkyDpwFIRbX5vcYIGz4hyplOPzMbgHNZXXXfC5Gt/Qzst
         wQFIese48HaG1DhH29UOvalnetjuHsZjd6LNXL/Wr1qWbyyBsJra9s1MbmFRbh12+5Ni
         fWQIPolwOATEMGRKEjm/mnv9QZq1xwqovzrvG1CLDXbIvwPVoShcB0ycsCOOIvooum1V
         KDoVs6yKnPJ+s51ym/EoSTCutBm3evgfnXnuoGTGmsOnTgDDMSii3gnsf9T70kxyrq75
         Pzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rPTUmtD0mO4LKrdNJNBcqd3l40tXMwjLHVeP/VIEmwU=;
        b=Gm98XklSEC/g8YwH8/lvl7KlOm1LWWnaTiOwsUmr/aIyWAULMBa0AzeDULDQcTR8qS
         95DUH5MdjmkreHygy1G+S1QmyuKnNQ/Qs/8uvezPjvGSebMgX+XbKK0BC16Gmc0dVZZb
         n+CAvjeyQcbrm9LBDaJCAtrpN4HfszDVk7ueQ4xYniTM/4xgrlBxJ3H7nClhPwPTBFfA
         fJQBxYHJkjTepjkIOWS05ZU81WnIJthk2U4q3pqRq5ggJKOyk8qvdx1VgCDxlVwiEtI3
         dqzIgb9WUkBaY6QhbuEtwRIS7ObSUh2s/gHhSA4YdX+ntCwkM7ONeqyYjMTGKFvXRskU
         X41w==
X-Gm-Message-State: AJIora/NmshuXGchc1k7va9PdRVLj0hBE8RaKutkkijMzT6zvx7dvtTJ
	BxiZ0Znc8WabunYCv14ITFIRUSVSff5Vi6+caAfXZEvx6t8=
X-Google-Smtp-Source: AGRyM1vatOGsN29IMyMlMqCAZgmigmBQAclp0VpHS4DcJ+4eMm5JYAL3GG92Uq242rPVItViwUScETsgp8LO06POcig=
X-Received: by 2002:a25:6b0f:0:b0:66e:cba3:8f2d with SMTP id
 g15-20020a256b0f000000b0066ecba38f2dmr23277092ybc.183.1658095540746; Sun, 17
 Jul 2022 15:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714185514.7d1a2ac9@canb.auug.org.au> <Ys/42uMzQy+CFTGI@debian>
 <YtA+127QgRifnRBZ@dev-arch.thelio-3990X> <CADVatmOTNA8uVqDEx6kp=+_O=wEhV2jbS9-frct-c4ZqBxcspg@mail.gmail.com>
 <YtBEXdrsthFamQs8@dev-arch.thelio-3990X> <CADVatmNOV+jn1WSFo=z4F9KqzYAgxCWr0cxTFL_5myJKFkQNzQ@mail.gmail.com>
 <YtCJeieW4Mz1VfRx@dev-arch.thelio-3990X>
In-Reply-To: <YtCJeieW4Mz1VfRx@dev-arch.thelio-3990X>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 17 Jul 2022 23:05:04 +0100
Message-ID: <CADVatmONHx5KjODAXWjKDs6OayDr2HJQpP6_mR+xSAADX_eByw@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 14
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Thu, Jul 14, 2022 at 10:24 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Dropping the next list and Stephen as these issues are likely present on
> mainline as well.
>
> On Thu, Jul 14, 2022 at 07:26:27PM +0100, Sudip Mukherjee wrote:
> > Hi Nathan,
> >
> > On Thu, Jul 14, 2022 at 5:29 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > On Thu, Jul 14, 2022 at 05:21:32PM +0100, Sudip Mukherjee wrote:
> > > > Hi Nathan,
> > > >
> > > > On Thu, Jul 14, 2022 at 5:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > > >
> > > > > Hi Sudip,
> > > > >
> > > > > On Thu, Jul 14, 2022 at 12:07:06PM +0100, Sudip Mukherjee (Codethink) wrote:
> > > > > > Hi Stephen,
> > > > > >
> > > > > > On Thu, Jul 14, 2022 at 06:55:14PM +1000, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > Changes since 20220713:
> > > > > >
> > > > > > Build failures on next-20220714:
> > > > >
> > > > > <snip>
> > > > >
> >
> > <snip>
> >
> > >
> > > Sure! I am not sure that we have tested mips or powerpc allmodconfig now
> > > that I am thinking about it but we'll certainly take a look at any
> > > issues that come from them and see what we can do.
> >
> > The build errors from powerpc allmodconfig with clang:
>
> Thanks for testing!
>
> > 1)
> > Error: External symbol 'memset' referenced from prom_init.c
>
> Good to know this is not clang specific.

Ok, so clang is also trying to use memset for any array.
Linus suggested adding volatile. ref:
https://lore.kernel.org/lkml/CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com/
for the gcc-12 problem, and with that I can see that clang has worked
as expected and removed memset from struct prom_args. But now memset
is still there for other arrays in prom_init_mem() and others. I think
we will still need a patch for clang, and that will also work when the
gcc-12 bug is fixed.


-- 
Regards
Sudip
