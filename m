Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E66D2CA4
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 04:48:55 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id v77so18782292oie.1
        for <llvm@lists.linux.dev>; Mon, 25 Oct 2021 21:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QUu57E+IbafflI6/qVuHyQy7kRwajg1mknD459Ucq7I=;
        b=T8WI27PGDwenRdxbOfKA3S8HDZp6sbhIYxqeZCLhTLN8rjreR9bE81IbHgyxIXWZDN
         tfiz3zX8hZ98FBrMRlHLhXGjJR7QyTqpTTo76DmaTboNPKkLZTftb9grrBzZGXJZJMZ2
         qQNrLs7a2o0D/fB8RmiTp7WV7e3Z4d+z3ZTe8qQX+Ayl03TcVgJd61dlM8KcEG2ckILv
         w0rld49kC3zcx0mj4gy3KLH4VOr+rh2GWb5FL8aISjJOO/UHp42QlfzDo5ae4NAyouwq
         VJIdniD5FIqowWM+CY/FCMQajtRI81OoYsunNKlf6BfaDVngZcP25jYNmsjDer9/zmDM
         DZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QUu57E+IbafflI6/qVuHyQy7kRwajg1mknD459Ucq7I=;
        b=iO+aiv76iLaAolHCh0L/ZWh51W+nkrx6IL3+flUoUjG9eFEDKBu0arxhotPWVrCG1w
         qbMhxkEaWtn5t4hYW87BC09GiIF3Esj4j9mztVcQfhoGJlXDcsCfRWk5dd7X8g9M9yUS
         1RGNBBYY2SOHiBnRK5z7+vjo2btJO/9GN5nvU4k+Y+AKs55xzfYVsXmAh+L4uNgpWaCc
         XoYFMDD99frjQ48zXxSTivsl0KrKFQYxp8k2N2+B2PemB8MQEF2WCFvfg0aSuNUJ28/b
         1ec0iVZ+gM/CEzKuKowLVlw9DuIX2oaoF8d98R9ta3/wUeofyZFs176WnJJ0lqHqCEFd
         +poQ==
X-Gm-Message-State: AOAM532G+SHcTQLkfn4RFO35ns3QfH8bjdFs8cUTL6o7xcG/lFKCIdng
	uznR8pUFXhShSwmPkKnY6CnCQQOvPA2WFIwTwFMv4g==
X-Google-Smtp-Source: ABdhPJzJuju7W8fVQKSWN7LZOO+GImj6gI5G1vJrPU/fI3FVbgnKwQQU/7onk+tN13HsakK+UGRKvBeTK8zMxSd6LyU=
X-Received: by 2002:a05:6808:ec9:: with SMTP id q9mr25537738oiv.160.1635223734188;
 Mon, 25 Oct 2021 21:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YUyWYpDl2Dmegz0a@archlinux-ax161> <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>
 <YWhg8/UzjJsB51Gd@archlinux-ax161> <afeaea5f-70f2-330f-f032-fb0c8b5d0aa5@ghiti.fr>
 <990a894c-1806-5ab2-775e-a6f2355c2299@ghiti.fr> <CA+zEjCt28iYQARQa=8Nsw8+_j0PuEee==gUqjKjasMo+w2Ohwg@mail.gmail.com>
In-Reply-To: <CA+zEjCt28iYQARQa=8Nsw8+_j0PuEee==gUqjKjasMo+w2Ohwg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 26 Oct 2021 06:48:42 +0200
Message-ID: <CACT4Y+YB8bjqxFfSrXKbfETXJAUxH=HR+kizC0T-AZLArY3A5A@mail.gmail.com>
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Alexandre ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, elver@google.com, akpm@linux-foundation.org, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	ndesaulniers@google.com, Arnd Bergmann <arnd@arndb.de>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Oct 2021 at 06:39, Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> Hi,
>
> On Fri, Oct 15, 2021 at 3:08 PM Alexandre ghiti <alex@ghiti.fr> wrote:
> >
> > On 10/14/21 8:31 PM, Alex Ghiti wrote:
> > > Hi Nathan,
> > >
> > > Le 14/10/2021 =C3=A0 18:55, Nathan Chancellor a =C3=A9crit :
> > >> On Fri, Oct 08, 2021 at 11:46:55AM -0700, Palmer Dabbelt wrote:
> > >>> On Thu, 23 Sep 2021 07:59:46 PDT (-0700), nathan@kernel.org wrote:
> > >>>> On Thu, Sep 23, 2021 at 12:07:17PM +0200, Marco Elver wrote:
> > >>>>> On Wed, 22 Sept 2021 at 22:55, Nathan Chancellor
> > >>>>> <nathan@kernel.org> wrote:
> > >>>>>> Currently, the asan-stack parameter is only passed along if
> > >>>>>> CFLAGS_KASAN_SHADOW is not empty, which requires
> > >>>>>> KASAN_SHADOW_OFFSET to
> > >>>>>> be defined in Kconfig so that the value can be checked. In RISC-=
V's
> > >>>>>> case, KASAN_SHADOW_OFFSET is not defined in Kconfig, which means
> > >>>>>> that
> > >>>>>> asan-stack does not get disabled with clang even when
> > >>>>>> CONFIG_KASAN_STACK
> > >>>>>> is disabled, resulting in large stack warnings with allmodconfig=
:
> > >>>>>>
> > >>>>>> drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q=
02.c:117:12:
> > >>>>>>
> > >>>>>> error: stack frame size (14400) exceeds limit (2048) in function
> > >>>>>> 'lb035q02_connect' [-Werror,-Wframe-larger-than]
> > >>>>>> static int lb035q02_connect(struct omap_dss_device *dssdev)
> > >>>>>>             ^
> > >>>>>> 1 error generated.
> > >>>>>>
> > >>>>>> Ensure that the value of CONFIG_KASAN_STACK is always passed
> > >>>>>> along to
> > >>>>>> the compiler so that these warnings do not happen when
> > >>>>>> CONFIG_KASAN_STACK is disabled.
> > >>>>>>
> > >>>>>> Link: https://github.com/ClangBuiltLinux/linux/issues/1453
> > >>>>>> References: 6baec880d7a5 ("kasan: turn off asan-stack for clang-=
8
> > >>>>>> and earlier")
> > >>>>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > >>>>>
> > >>>>> Reviewed-by: Marco Elver <elver@google.com>
> > >>>>
> > >>>> Thanks!
> > >>>>
> > >>>>> [ Which tree are you planning to take it through? ]
> > >>>>
> > >>>> Gah, I was intending for it to go through -mm, then I cc'd neither
> > >>>> Andrew nor linux-mm... :/ Andrew, do you want me to resend or can =
you
> > >>>> grab it from LKML?
> > >>>
> > >>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > >>>
> > >>> (assuming you still want it through somewhere else)
> > >>
> > >> Thanks, it is now in mainline as commit 19532869feb9 ("kasan: always
> > >> respect CONFIG_KASAN_STACK").
> > >>
> > >>>>> Note, arch/riscv/include/asm/kasan.h mentions KASAN_SHADOW_OFFSET=
 in
> > >>>>> comment (copied from arm64). Did RISC-V just forget to copy over =
the
> > >>>>> Kconfig option?
> > >>>>
> > >>>> I do see it defined in that file as well but you are right that
> > >>>> they did
> > >>>> not copy the Kconfig logic, even though it was present in the tree
> > >>>> when
> > >>>> RISC-V KASAN was implemented. Perhaps they should so that they get
> > >>>> access to the other flags in the "else" branch?
> > >>>
> > >>> Ya, looks like we just screwed this up.  I'm seeing some warnings l=
ike
> > >>>
> > >>>     cc1: warning: =E2=80=98-fsanitize=3Dkernel-address=E2=80=99 wit=
h stack protection
> > >>> is not supported without =E2=80=98-fasan-shadow-offset=3D=E2=80=99 =
for this target
> > >>
> > >> Hmmm, I thought I did a GCC build with this change but I must not ha=
ve
> > >> :/
> > >>
> > >>> which is how I ended up here, I'm assuming that's what you're
> > >>> talking about
> > >>> here?  LMK if you were planning on sending along a fix or if you
> > >>> want me to
> > >>> go figure it out.
> > >>
> > >> I took a look at moving the logic into Kconfig like arm64 before sen=
ding
> > >> this change and I did not really understand it well enough to do so.=
 I
> > >> think it would be best if you were able to do that so that nothing g=
ets
> > >> messed up.
> > >>
> > >
> > > I'll do it tomorrow, I'm the last one who touched kasan on riscv :)
> > >
> >
> > Adding KASAN_SHADOW_OFFSET config makes kasan kernel fails to boot.
> > It receives a *write* fault at the beginning of a memblock_alloc
> > function while populating the kernel shadow memory: the trap address is
> > in the kasan shadow virtual address range and this corresponds to a
> > kernel address in init_stack. The question is: how do I populate the
> > stack shadow mapping without using memblock API? It's weird, I don't
> > find anything on other architectures.
>
> @kasan: Any idea what we are doing wrong in riscv to encounter the
> above situation?

Hi Alex, Palmer,

The patch changes the definition of the KASAN_SHADOW_OFFSET const.
Does it's value change as a result or not? Have you tried to print it
before/after?
If value does not change, then this is more mysterious. If it changes,
then there lots of possible explanations (points to unmapped region,
overlaps with something), but we need to know values before/after to
answer this.


> Thanks,
>
> Alex
>
> >
> > And just a short note: I have realized this will break with the sv48
> > patchset as we decide at runtime the address space width and the kasan
> > shadow start address is different between sv39 and sv48. I will have to
> > do like x86 and move the kasan shadow start at the end of the address
> > space so that it is the same for both sv39 and sv48.
> >
> > Thanks,
> >
> > Alex
> >
> >
> > > Thanks,
> > >
> > > Alex
> > >
> > >> Cheers,
> > >> Nathan
> > >>
> > >> _______________________________________________
> > >> linux-riscv mailing list
> > >> linux-riscv@lists.infradead.org
> > >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >>
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
