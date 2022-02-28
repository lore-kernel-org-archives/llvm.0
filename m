Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572DF7A;
	Mon, 28 Feb 2022 17:11:04 +0000 (UTC)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-10.nifty.com with ESMTP id 21SH41Qj031741;
	Tue, 1 Mar 2022 02:04:01 +0900
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 21SH3bt4021028;
	Tue, 1 Mar 2022 02:03:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 21SH3bt4021028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1646067818;
	bh=sryAZLDXD/t7zVmI+J82zVk8l2yloq/oD0nvYGiN984=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DFAl9D3d5SV7l8OlblFtkdudyppXM87TTXLJkKaFiDrnHYA5wFLCqpf/bi6XW+/lL
	 Wxcxf4DRuPeQzgRVRD0ZLZqGJVyV92OkIiBQSKCRD0fkbmGaM77V1X8/io54DfJJE1
	 WHjVeTmICFjHCNQFMP84l0KM6p9KeusZdxBvunEoZ/3O0KaCmfcm9xJcBOxDBliQLy
	 v2hLNwthpmWXp3NyaQ3wZjDjgPQxfdr5sC/vbH+pTH2mOrDULVuZBpmLb5vfOGA989
	 Xl28AGykKx2Snuz0kqy9XcABSVfqA/+0wAkzfvVhA8SShTSlLQBtapcr4hUau+8ujK
	 GQtrmak7eUByg==
X-Nifty-SrcIP: [209.85.210.171]
Received: by mail-pf1-f171.google.com with SMTP id g21so5203344pfj.11;
        Mon, 28 Feb 2022 09:03:37 -0800 (PST)
X-Gm-Message-State: AOAM530Me8uysKbii9FolO/LN644IIbiuW2SV5X+oMI8RmcsAvRtMXcR
	FTWMTOx65RiLi916MmZQJCBwvnN/9hY+eY0j988=
X-Google-Smtp-Source: ABdhPJxISxDkNdxsVTKDDV2g7ZIxBL9oz/LlNlGrxEOGwup5cilO+xLo89K+cDWbGEDhDHUjyYzEiShtkCuCLkVGAaU=
X-Received: by 2002:a05:6a02:182:b0:374:5a57:cbf9 with SMTP id
 bj2-20020a056a02018200b003745a57cbf9mr18072494pgb.616.1646067817034; Mon, 28
 Feb 2022 09:03:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Mar 2022 02:02:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATVs-yRX4PnURkLv3fz3gAnuzG2GxZ2gdvmJX2g+0P-_w@mail.gmail.com>
Message-ID: <CAK7LNATVs-yRX4PnURkLv3fz3gAnuzG2GxZ2gdvmJX2g+0P-_w@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>,
        Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 7:32 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> During a patch discussion, Linus brought up the option of changing
> the C standard version from gnu89 to gnu99, which allows using variable
> declaration inside of a for() loop. While the C99, C11 and later standards
> introduce many other features, most of these are already available in
> gnu89 as GNU extensions as well.
>
> An earlier attempt to do this when gcc-5 started defaulting to
> -std=gnu11 failed because at the time that caused warnings about
> designated initializers with older compilers. Now that gcc-5.1 is the
> minimum compiler version used for building kernels, that is no longer a
> concern. Similarly, the behavior of 'inline' functions changes between
> gnu89 and gnu11, but this was taken care of by defining 'inline' to
> include __attribute__((gnu_inline)) in order to allow building with
> clang a while ago.
>
> One minor issue that remains is an added gcc warning for shifts of
> negative integers when building with -Werror, which happens with the

Is this a typo?

   building with -Werror, ...
->
   building with -Wextra, ...




> 'make W=1' option, as well as for three drivers in the kernel that always
> enable -Werror, but it was only observed with the i915 driver so far.

Same here.

   enable -Werror, but ...
->
  enable -Wextra, but ...




Otherwise,

Acked-by: Masahiro Yamada <masahiroy@kernel.org>


Please let me know if you want me to pick up this.









--
Best Regards

Masahiro Yamada
