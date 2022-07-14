Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786D4A38
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 16:22:10 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2ef5380669cso22197947b3.9
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8PLNmXxl330LfuHB/ULIc5yFPBlPwtCsvTmuIMEY5vA=;
        b=dLqbRYRTbz//P2gYc1pZHfFAE7Y+lqUE0qZa2LhvvNfxOI6moys75wiIYrlgt34jIg
         cntt5bSx9j0nKHZ2RKJnCjnE8DBBgsSjBYdyqETxY81Yrt3OK4/BVQ5+MmMoS+xYDQVS
         oIwcJq86/w0x9rBpN5CNmhA6CMq+95P7vll/mv9TDxVXoIUXIKsyld90NB96/HK97u72
         R1v0WXS5EyjTjl179NvWS5glLHPVFwBoF83gU6z6LMIqjDZO+ko9AiJhmVf7WFN1PlQ6
         zdXOPj6eMeBg4LcViEA8r7xHYWMT2IQ1J8UkiquYxzY/p7nSKt/RXLuzKce1VR+Swq/P
         vROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8PLNmXxl330LfuHB/ULIc5yFPBlPwtCsvTmuIMEY5vA=;
        b=ZNz0tTxfntF8al1AfBI3k99txfs7yZGLyofwurWEN2Y8OHtotiWyspzZ/zmHH5zEBU
         sZyXjsKFMU2A6SKml+fGQfHq9jpwUrsD4RlP/pD6CvRamPiM1KKa4yOYomx2tFabLhdX
         UyyvN1F3Z5v62zEj2sbT5k3kvlJnpuixiMyvdFOhjlc2hU7p40ogJ/iME/GlNoZQQ6kN
         MBrwZ4S0FncQcfWsEl6nYUJL8agBwOo0C/eb+gK2cn6qEmqTQ5779Hw8Xt6+r1BRZVBE
         rmlOlThr4LjP2MqTG06LIvMSBEI9K/rPJcjgAXVxlyxWEWmFmbRnAjc0xM/MMiuIjh3Q
         KGcQ==
X-Gm-Message-State: AJIora8sy3f34XpcHHRtlWf0Fv9lopW7MkIOJGe4F+MaK/Gc/RHLww2Y
	hdJXr3XY6Dveh25R1J2KXAWnESWAVJ3QcIHmY2g=
X-Google-Smtp-Source: AGRyM1skykoApRV1gfbIMqLhePAJT0SCwPyajDzu0o3LZfwwpxU3/9f1BZYxWQ2vLHGLZ+tB/Ju3VZhvG8yo7SJUNTY=
X-Received: by 2002:a81:6783:0:b0:31c:8668:ed85 with SMTP id
 b125-20020a816783000000b0031c8668ed85mr10691429ywc.194.1657815729064; Thu, 14
 Jul 2022 09:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714185514.7d1a2ac9@canb.auug.org.au> <Ys/42uMzQy+CFTGI@debian>
 <YtA+127QgRifnRBZ@dev-arch.thelio-3990X>
In-Reply-To: <YtA+127QgRifnRBZ@dev-arch.thelio-3990X>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 14 Jul 2022 17:21:32 +0100
Message-ID: <CADVatmOTNA8uVqDEx6kp=+_O=wEhV2jbS9-frct-c4ZqBxcspg@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 14
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Thu, Jul 14, 2022 at 5:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Sudip,
>
> On Thu, Jul 14, 2022 at 12:07:06PM +0100, Sudip Mukherjee (Codethink) wrote:
> > Hi Stephen,
> >
> > On Thu, Jul 14, 2022 at 06:55:14PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20220713:
> >
> > Build failures on next-20220714:
>
> <snip>
>
> > x86_64 allmodconfig with clang fails with:
> >
> > drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a compile-time constant
> >         gpu_cc_parent,
> >         ^~~~~~~~~~~~~
> > drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is not a compile-time constant
> >         gpu_cc_parent,
> >         ^~~~~~~~~~~~~
>
> I sent https://lore.kernel.org/20220711174004.3047516-1-nathan@kernel.org/
> for this a few days ago, it just needs to be picked up.
>
> > arch/x86/kernel/cpu/bugs.c:58:21: error: section attribute is specified on redeclared variable [-Werror,-Wsection]
> > DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
> >                     ^
> > ./arch/x86/include/asm/nospec-branch.h:283:12: note: previous declaration is here
> > extern u64 x86_spec_ctrl_current;
>
> This is now fixed in -tip so it should be fixed in -next tomorrorow:
>
> https://git.kernel.org/tip/db866d3352ec85e821e730e191481cba3a2bfa6e

This should also go to Linus. This failure is in the mainline also.
https://lore.kernel.org/lkml/Ys6sZj6KYthnDppq@debian/

>
> In the future, consider CC'ing our mailing list (llvm@lists.linux.dev)
> for any clang related issues so that we can get them taken care of ASAP,
> we have a MAINTAINERS entry for a reason :) thank you for testing with
> clang; the more people that use it, hopefully the easier it will be to
> get things unbroken.

Sure. I run arm, arm64, powerpc and x86_64 allmodconfigs with clang
(along with gcc) every night for mainline, started with linux-next
from today. Trying to setup the mips build also, I will mail llvm list
asking for help with the mips build.
Currently I only monitor the clang output from x86_64 as thats the one
which builds. If you want I can send the other reports also.


-- 
Regards
Sudip
