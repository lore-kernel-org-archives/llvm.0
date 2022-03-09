Received: from condef-05.nifty.com (condef-05.nifty.com [202.248.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C1B6464
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 02:24:58 +0000 (UTC)
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-05.nifty.com with ESMTP id 2292Haeq013109
	for <llvm@lists.linux.dev>; Wed, 9 Mar 2022 11:17:36 +0900
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
	by conssluserg-02.nifty.com with ESMTP id 2292HQDF025535
	for <llvm@lists.linux.dev>; Wed, 9 Mar 2022 11:17:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 2292HQDF025535
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1646792247;
	bh=yrz8MJgeMKuvnz33SMeYLZ7Cine73+llQkRSU7j3OeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QdLV+YuJnE3AuI25L44qDcEFha7V2tJikwuAbHrYtTptepmqS8wiUbtBjtqUKfiAe
	 GrVcq0Nf1zqBNYDN27k7DKPnorO++0pTgwRsKM/FmO+CaVio1dVjjmRHjNh7nvdN12
	 mnq8a/cyE3WVGk8FBI3Js7IexJIJXuXDmwovsVnUovEf7ioR8AbYSywB/qFq1Cly01
	 cLWX0DcMiW6S9JNVwcNjC5r7LbbjKr9K8LGSQJPy/07z/ZATjmEjMCk0Cd/RwvjwhZ
	 w/j0JU9CtFQ1+eQpoaJt6iY4/UdfEYRQ5jGuAiwMPNLt97UzDe1YtJpEAyhtL4FNAx
	 ZJAQuF3XM469w==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id c16-20020a17090aa61000b001befad2bfaaso1026725pjq.1
        for <llvm@lists.linux.dev>; Tue, 08 Mar 2022 18:17:27 -0800 (PST)
X-Gm-Message-State: AOAM533OqdYHOI/IXD4a+t3vk/MXgu6ElfkSjYRCQDGMrdz0dRpeBbJw
	c+mT16ej1po1xBEm5dF1vfyOtHbjLDvQH2zKa0s=
X-Google-Smtp-Source: ABdhPJyMpYSk5zXrKpcgek+899vxIgkJpkfAkc4Uc5APGsnHYk6hCj+dOoi9kSCk2xTpgtEh31/JWnYw2PXFOhrKljg=
X-Received: by 2002:a17:902:eb84:b0:151:f80e:e98b with SMTP id
 q4-20020a170902eb8400b00151f80ee98bmr9234067plg.99.1646792246518; Tue, 08 Mar
 2022 18:17:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220308215615.14183-1-arnd@kernel.org> <CAHk-=wjsCrVxToP0Zx+cUAVZmSKi=Y6NP1+VnBcoPyPPEBfonQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjsCrVxToP0Zx+cUAVZmSKi=Y6NP1+VnBcoPyPPEBfonQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 9 Mar 2022 11:16:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQoFFVLfkhA7FC9vDbvc4wdLginYeRHL0xHVAumu6p=uw@mail.gmail.com>
Message-ID: <CAK7LNAQoFFVLfkhA7FC9vDbvc4wdLginYeRHL0xHVAumu6p=uw@mail.gmail.com>
Subject: Re: [PATCH 0/4] [v4] Kbuild: std=gnu11 changes
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Alex Shi <alexs@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Marco Elver <elver@google.com>, Jani Nikula <jani.nikula@intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 9, 2022 at 9:09 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Mar 8, 2022 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > I've incorporated the feedback from Masahiro Yamada in this
> > version, splitting out one more patch, rebasing on top of
> > the kbuild tree, and changing the order of the patches.
> >
> > Please apply to the kbuild tree.
>
> I'd actually like to see this as a separate branch, so that I can
> merge it early - or other peoples git branches end up depending on it.


OK, I can apply this to a separate branch, kbuild-gnu11.
(and I will queue this up shortly because it is already -rc7)

Then, I will send two pull reqs in the next MW,
but please note they will conflict with each other,
between this gnu11 patch set and the following
one in my usual kbuild branch:

https://patchwork.kernel.org/project/linux-kbuild/patch/20220201213542.2808035-1-quic_eberman@quicinc.com/


I hope this is not a complex conflict, but please let me know
if you have any requests to me.





> Yeah, it shouldn't change anything on its own, but since it allows for
> new syntax, we might have other things depending on it (I'm obviously
> thinking of the list_for_each_entry() series that keeps getting
> posted).
>
>                       Linus



-- 
Best Regards
Masahiro Yamada
