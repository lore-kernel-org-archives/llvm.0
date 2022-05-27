Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECED91FA4
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 14:25:49 +0000 (UTC)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-01.nifty.com with ESMTP id 24REMX1f027239
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 23:22:33 +0900
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 24REMPdn013102
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 23:22:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 24REMPdn013102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1653661346;
	bh=D2MGadW7/x48k4PZ30yDzkxYBsA9A8fC1SlKRvJ8QY4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qmTc1cATyT/3eLxKRJ9scNE9L+75DWWloU8rSwfykSlVT7vJ/UGJfLKi4jIiJSqrV
	 +YP3pGT7pgvH0duNb5n5T0j6mjhaTIc9MvmQ1vsb2cVXTs7rmY4JeUjBVUjLcFICNG
	 vJ32maExOXgPqt/9ko/xZGtI88W7+hiVIa3uGaILxUIzGqXPk7Uh0j08XLwP25MCVZ
	 JjNz8VOVNjW84JK2U3A9Ig8T0rDCD436U7v8gckUpFwU7MW3yA3nLSQyDC7btBPe8u
	 eCYvrYN2xt10i0waFequ2kmWu8ycqmlgsSE7LTT/a5MVuFmBdnkAqyt7GUYuP3E0Yj
	 XHAKTIg0LC0LQ==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id y199so4447715pfb.9
        for <llvm@lists.linux.dev>; Fri, 27 May 2022 07:22:26 -0700 (PDT)
X-Gm-Message-State: AOAM530YgridJs5ISjo7LV98FMY+gaQP1dZdFyjX8Wei8TEhLmCVjB6m
	iq4dwQYuVxFTvto0mOX/sq4yA4/K+xYvPs5FpVA=
X-Google-Smtp-Source: ABdhPJwgjJPevCtQwvLJf55nk2/tfb2++rXEO/QIaQn3mP9JsdT3MMxmtpojris8JB/UZv4CVw5KuNSHlyXl+IDx7JY=
X-Received: by 2002:a63:8949:0:b0:3fa:d71a:1025 with SMTP id
 v70-20020a638949000000b003fad71a1025mr12150597pgd.616.1653661345107; Fri, 27
 May 2022 07:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220527100155.1996314-1-masahiroy@kernel.org>
 <20220527100155.1996314-4-masahiroy@kernel.org> <1c12cd26-d8aa-4498-f4c0-29478b9578fe@gmx.de>
In-Reply-To: <1c12cd26-d8aa-4498-f4c0-29478b9578fe@gmx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 May 2022 23:21:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQC8jRMwOGfDW4TMRUp0aJW5qfn5MT6=sjEXp-2PoBYNQ@mail.gmail.com>
Message-ID: <CAK7LNAQC8jRMwOGfDW4TMRUp0aJW5qfn5MT6=sjEXp-2PoBYNQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] parisc: fix the exit status of arch/parisc/nm
To: Helge Deller <deller@gmx.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        clang-built-linux <llvm@lists.linux.dev>,
        Parisc List <linux-parisc@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"

Hi Helge,


On Fri, May 27, 2022 at 10:58 PM Helge Deller <deller@gmx.de> wrote:
>
> Hello Masahiro,
>
> On 5/27/22 12:01, Masahiro Yamada wrote:
> > parisc overrides 'nm' with a shell script. I do not know the reason,
> > but anyway it is how it has worked since 2003. [1]
>
> I don't know the reason either...
> I assume it was that the older toolchains had bugs and kept lots of local
> symbols like .LC? in the object files.
>
> I did a small build without the nm script (and removed it's reference
> in the Makefile), and it did not seem to break anything.
>
> > A problem is that this script returns the exit code of grep instead of
> > ${CROSS_COMPILE}nm.
>
> Instead of fixing this, I'd suggest that you simply remove the nm script
> alltogether. If you like I can apply such a patch in the parisc git tree,
> and you just drop this specific patch. Or you change your patch to remove it.
> Just let me know what you prefer.



This is a prerequisite of my kbuild work:
https://lore.kernel.org/linux-kbuild/20220527100155.1996314-5-masahiroy@kernel.org/T/#u

Without this, ARCH=parisc builds will be broken due to ${NM} returning 1.


I will send a patch to remove arch/parisc/nm.
Please give me your ack.

Thank you.




--
Best Regards
Masahiro Yamada
