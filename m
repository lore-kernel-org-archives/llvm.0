Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA09E4C64
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 16:55:45 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 75so4233415ybf.4
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vtZPLFwxYNKanG+h3QDUM6ra0yijWiFb3B9BIWY3S/E=;
        b=cMrZXi0Pvn7gE8mgb+Kk7Z7fqa/En6zp7q4PLY0uwK8QhR7RMf1b0JXavpeGSzBnxK
         UWPM+TBWB5uze16RTTsVLuvsNJEproQtmwbQbuW1pOoPc1Tf7st0Bv0t97YZUPrmV4GZ
         P/7VWUA0694iTSby/WA+82ey0a1XTfOuFW/qFwnjySlKYRSxYMmQIGJR8WqR8n8xikVd
         0xyjI2VM3KgR9L+BsD0vNH6HovcV5XwpdeOnBteFNkAia/CX3FsyLbOnFERoH2YDwY/Q
         Oq8vnXmwceEn4JnIN55o8kz9+NJDXsIQ8tIyNRWhTv7ah5dEIXSbQjlk1f70wFhrvyMK
         1dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vtZPLFwxYNKanG+h3QDUM6ra0yijWiFb3B9BIWY3S/E=;
        b=7lRdHWaFQ4xjcubX6VCLn+bznZIHeEm0X/l7VICtSXmO+Eb+yjsEHiBw932zYd3u37
         wjuCH3Ns8pyDu9bBK8JsySGxqB+8FE01nVdysfVYYFc49PR5r70UhOfDhlp3AlqAkgeB
         2ADQXxsF9aut6ZQfO5UgcPfU7qcpHeE4Xkrne5pLl1wPhk2bgSSz9LZoGtIkHwaK27qB
         R4SRcMFhBZICOJZO/PUu4UlY6DKbrmPzmtms1BX1+mus7QAk1g87afcJotPDaiPEeaNM
         sRWWHyGWKPXfXmQ9QayKBoNNWnBxum8HAJGqMLt5BbzSbmHs++QMguOxVgWS0FvWlDdp
         hL6g==
X-Gm-Message-State: AJIora9+1ii56P42yDLUu8edQ6WaEFbJKKytkJvvpXVVROj2YhEe+ef/
	RDj3qajMH9jp472K50dnBYxwO5vFy+1zN9SHQPFaRluVgZMQ0g==
X-Google-Smtp-Source: AGRyM1umoixex0sO+mcpexwT3t4HYjZOSBppDD8uRoW0tGM/uVoGSmFrclS/FHlDdVoimeoDUxODbtUIoj2Fka4tDMQ=
X-Received: by 2002:a05:6902:1109:b0:66e:f386:61ce with SMTP id
 o9-20020a056902110900b0066ef38661cemr8895044ybu.364.1657817744896; Thu, 14
 Jul 2022 09:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714185514.7d1a2ac9@canb.auug.org.au> <Ys/42uMzQy+CFTGI@debian>
 <YtA+127QgRifnRBZ@dev-arch.thelio-3990X> <CADVatmOTNA8uVqDEx6kp=+_O=wEhV2jbS9-frct-c4ZqBxcspg@mail.gmail.com>
 <YtBEXdrsthFamQs8@dev-arch.thelio-3990X>
In-Reply-To: <YtBEXdrsthFamQs8@dev-arch.thelio-3990X>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 14 Jul 2022 17:55:08 +0100
Message-ID: <CADVatmNBWnPxmMCs_LdTKgiy=+ebTZV7KT3E-62bZuK8LJyMfg@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 14
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 5:29 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jul 14, 2022 at 05:21:32PM +0100, Sudip Mukherjee wrote:
> > Hi Nathan,
> >
> > On Thu, Jul 14, 2022 at 5:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Hi Sudip,
> > >
> > > On Thu, Jul 14, 2022 at 12:07:06PM +0100, Sudip Mukherjee (Codethink) wrote:
> > > > Hi Stephen,
> > > >
> > > > On Thu, Jul 14, 2022 at 06:55:14PM +1000, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Changes since 20220713:
> > > >
> > > > Build failures on next-20220714:
> > >
> > > <snip>
> > >
> > > > x86_64 allmodconfig with clang fails with:
> > > >
> > > > drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a compile-time constant
> > > >         gpu_cc_parent,
> > > >         ^~~~~~~~~~~~~
> > > > drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is not a compile-time constant
> > > >         gpu_cc_parent,
> > > >         ^~~~~~~~~~~~~
> > >
> > > I sent https://lore.kernel.org/20220711174004.3047516-1-nathan@kernel.org/
> > > for this a few days ago, it just needs to be picked up.
> > >
> > > > arch/x86/kernel/cpu/bugs.c:58:21: error: section attribute is specified on redeclared variable [-Werror,-Wsection]
> > > > DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
> > > >                     ^
> > > > ./arch/x86/include/asm/nospec-branch.h:283:12: note: previous declaration is here
> > > > extern u64 x86_spec_ctrl_current;
> > >
> > > This is now fixed in -tip so it should be fixed in -next tomorrorow:
> > >
> > > https://git.kernel.org/tip/db866d3352ec85e821e730e191481cba3a2bfa6e
> >
> > This should also go to Linus. This failure is in the mainline also.
> > https://lore.kernel.org/lkml/Ys6sZj6KYthnDppq@debian/
>
> Yes, it is in the x86/urgent branch so it should get there by -rc7. Our
> CI is red too :(
>
> > > In the future, consider CC'ing our mailing list (llvm@lists.linux.dev)
> > > for any clang related issues so that we can get them taken care of ASAP,
> > > we have a MAINTAINERS entry for a reason :) thank you for testing with
> > > clang; the more people that use it, hopefully the easier it will be to
> > > get things unbroken.
> >
> > Sure. I run arm, arm64, powerpc and x86_64 allmodconfigs with clang
> > (along with gcc) every night for mainline, started with linux-next
> > from today. Trying to setup the mips build also, I will mail llvm list
> > asking for help with the mips build.
> > Currently I only monitor the clang output from x86_64 as thats the one
> > which builds. If you want I can send the other reports also.
>
> Sure! I am not sure that we have tested mips or powerpc allmodconfig now
> that I am thinking about it but we'll certainly take a look at any
> issues that come from them and see what we can do.

Uhhh.. I just checked powerpc build log and have now raised:
https://github.com/llvm/llvm-project/issues/56530

I am also part of Elisa project and there we run clang-analyzer on
defconfig of linux-next every day and the results are stored in a web
interface to check and compare. I have added Lukas if you both think
it will be good to collaborate.


-- 
Regards
Sudip
