Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCEC1714B7
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758206050; cv=none; b=QDrhqFaRQx0C/c4jccaPF6SrMFTJkfNYxHLWLZCK84IC8y8TCKKGKoVEwlAAiEuEd4xfSN2/PfbH1W1DqRgT+Gn72iDcsSj6bUNUMPm7uYo0ZspmHNdWhagFSf04zzXAFJXU/drc2330nGYmQrISMFg483khMRKD1N/cisVAQGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758206050; c=relaxed/simple;
	bh=MBfiJfn6GCPk8lGYQ1D2ow124fRDtcVPcMxVyyku0+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkceFp6KgE4nRh3X26dtIWfzoY2q5MABunTTRVyzlNJW9cm1AFHwNLYbhVy+LwftcE9LuSFN7RP2K99YMGZRSR0ZZj67SqCLXwcTsZDdNWXqFjGPBRuOU1aggxeSrupTqaHtCHcXBrzmLGn0NsQoBRt//MmApkslwQ7c5X7VdpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=q0XvEpkT; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="q0XvEpkT"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d6014810fso8683077b3.0
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758206047; x=1758810847; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsFstqf0aPKFXQULvb/QA1W20AW77hE7rNx0BoX95nc=;
        b=q0XvEpkTIM06gfXb6ZGrzC0uhw6SmceHfeICt4PTFvBD/14amsQbTl7pV5ZZKxaN1n
         I5+UGNSBo/mv7DW2UvyoxFxV585XUhFnruqcponA/EjdLjo+U1U/ywMifc+YsjWMizVI
         v/MSBq2kYavX5fSLg/sKwwF8++zdsmWVTHrTbD1suBXaaxIe4ZmpFiwKrM5YnYW5q2o2
         0/vYPIjhP/bWbN/JIWZ8febHACtrNaGpt+QimVyTnATVms7IfCgPTqZuQM5le0UIlDHc
         F78SYTXk1OSpI8MPztIG4a0JxnMuPwiWSEJO4hg/ryue9g/50zi07DG3kE1Oc33+WLiU
         AEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206047; x=1758810847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsFstqf0aPKFXQULvb/QA1W20AW77hE7rNx0BoX95nc=;
        b=aizqgRLyf6iErVxpsqvAwKaADfyzIWbMeCyeVA+7hS4f8Ci3ivtC3ZpOTPrAXwcYIG
         C7+XIHf47lO0JKalYoix6t6yOGv+7qNVPWd16dQ2DKcgOwj/gW65bRw8KT0dcPyJI3De
         zBl9CeylVKW0inE8iNcDhI/CcYvksbxTB1yT9QZgLmF9mcZK9t2K1XijyY46fNOu2xbL
         FRey0q6J+BooETnyhgo7fgXsFdIAsA0+vI8NEH0+Fo45hSqPgfXCfmwKPdUK1DkBHuPt
         nJBgxm3AKPvYuRm2vaWU6527LyjggUZLnUPRDgk3EtxlG3ZodJdJNeOFvIzNoWf40BJs
         owug==
X-Forwarded-Encrypted: i=1; AJvYcCU4Y5x5Z7VYtq5BPlgiF4C22Rq8dPeXGMgp9OD2k4nVXtzd1mQfviNBV5Nrd4wCA+b+P5Um@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd/u7qZcV1Z5lN/CxsWEwVbUhc4kYCIYf9ptUi75RVRO+46u9i
	+YrUEQahbfpDvtTUv9gkNK30HnxnEPhBmug3sitSoLFkZ+xvtXcQJuU6Eji3CarVrJx65YbPo0M
	O1C6LQb0sdXuxpCJzsphWUMdrZ/y12lZOhTyG1LECEA==
X-Gm-Gg: ASbGncvL218hbIjY6ewY/8Zpfyh0tAB60300l8VNNxdBBJz6zAxmmunberiReOrZv+x
	jK9VO31nxzOOYmcwBZ7m1DLv/f4idubmftUdcS9FfhJj8dH0AL2dFCw4NzV6rMWJO4VInysF7LX
	KRg1tjpBifnJuC3fWcm1OELernfIbK8f5wuxlcqzZzVMXSdRQYGkv9PhPNvS+5qeXgWGBapgSOh
	utmdb/WJdykPJhujLyeGqxTZwxsfBoDZ/ge3dyHbKCE3+LUnrhW1d+gAQ==
X-Google-Smtp-Source: AGHT+IGGhIn8dGYcj5LaqtXCIoUBSX4wr/dd3ZmyZUAtSU0U2kK8GOGIRyt8aZK/8AqwjvXVn4MdC5tlBbzTORZV76A=
X-Received: by 2002:a05:690c:9:b0:721:64ec:bc65 with SMTP id
 00721157ae682-73892852d3bmr54486027b3.44.1758206047207; Thu, 18 Sep 2025
 07:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com>
 <a07b0ebf-25e7-48ba-a1da-2c04fc0e027f@app.fastmail.com> <20250903165931.GA3288670@ax162>
 <CAH1PCMYWWkThMosDMW=wZZWZ8d_c4_zQWhJOJPKe354LPiV1bA@mail.gmail.com> <20250917182512.GA98086@ax162>
In-Reply-To: <20250917182512.GA98086@ax162>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 18 Sep 2025 22:33:54 +0800
X-Gm-Features: AS18NWCkRCx-c09DhKbRjdrZJ83GwTW6_TUdgmfU5HjKCCFZgVCqB9ZOIxiAf5U
Message-ID: <CAH1PCMYoo_AqCXOH7--omBbmOyo6DSNgbF3DY-oPJHaYO4GaNQ@mail.gmail.com>
Subject: Re: next-20250903 x86_64 clang-20 allyesconfig mmp_pdma.c:1188:14:
 error: shift count >= width of type [-Werror,-Wshift-count-overflow]
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	dmaengine@vger.kernel.org, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Vinod Koul <vkoul@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Benjamin Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:25=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Guodong,
>
> On Thu, Sep 04, 2025 at 03:38:21PM +0800, Guodong Xu wrote:
> > On Thu, Sep 4, 2025 at 12:59=E2=80=AFAM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > >
> > > On Wed, Sep 03, 2025 at 02:04:10PM +0200, Arnd Bergmann wrote:
> > > > On Wed, Sep 3, 2025, at 12:08, Naresh Kamboju wrote:
> > > >
> > > > > Build error:
> > > > > drivers/dma/mmp_pdma.c:1188:14: error: shift count >=3D width of =
type
> > > > > [-Werror,-Wshift-count-overflow]
> > > > >  1188 |         .dma_mask =3D DMA_BIT_MASK(64),   /* force 64-bit=
 DMA
> > > > > addr capability */
> > > > >       |                     ^~~~~~~~~~~~~~~~
> > > > > include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA=
_BIT_MASK'
> > > > >    73 | #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL=
<<(n))-1))
> > > > >       |                                                      ^ ~~=
~
> ...
> > Thanks, Arnd. I'll send a patch to clean up and simplify the logic.
>
> This error continues to break our -next builds. Have you submitted this
> patch yet? I searched lore.kernel.org and I did not find anything but I
> wanted to make sure I had not missed anything.
>
> Cheers,
> Nathan

Hi, Nathan

Yes, I just sent it out. Here is the link to the submission:
https://lore.kernel.org/all/20250918-mmp-pdma-simplify-dma-addressing-v1-1-=
5c2be2b85696@riscstar.com/

BR,
Guodong
