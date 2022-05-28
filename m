Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99B23B2
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 07:11:57 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
	by conssluserg-02.nifty.com with ESMTP id 24S7BlIZ000850
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 16:11:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 24S7BlIZ000850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1653721908;
	bh=Ke5jHo8VtsnIBuHnKcTafO9UNs8CqmDY9CjC7LoWcyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SvcSdFCEKE8RRXBMIA7XpimKe+J6UWfLaXXEF+jpQfgdH3GrR8iY9q+ZsIV8xpUKG
	 St5ue4XgFERGiF+RT4A6EvCeqUvsstIYFgPOqpteV32R21Bjx2ckbRlHWHpo47vG/u
	 I88KuEAfS8feRvZ1Zeu6e8/TF4z9c0qR3/CeLnvYu1SNlyr0FGFXmOg9qe8kTiydNj
	 XOVejqH6RrgBpRp8OhPPt43V0mzC7828XWYpqPtFLDDVU5P4JWiXvfNQNb71p9BZqb
	 gtsgVUBMyYe+u8aEOVKUYCS6ptlP6MLeS0ATaUDDjS8saLcJzCjLZSIqfyqyfzvrf5
	 uzrCpOzyd8HEA==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id m14-20020a17090a414e00b001df77d29587so8932277pjg.2
        for <llvm@lists.linux.dev>; Sat, 28 May 2022 00:11:48 -0700 (PDT)
X-Gm-Message-State: AOAM533mvSNU6lW5HWfzfZ2iEl3D48wnxI3jom3wxxZ+x2HzRfya24VM
	wyrNaWjxyuIrbL2mqRzRw6gxJaaECPhAbtxM7IQ=
X-Google-Smtp-Source: ABdhPJxIgcs0jv5kYFRTIFUI+PolCz13bwvjdRWJmELBANgzVLOZHuuZI+qAblhvtkFaI4hepCODALq+NqXohlAZTOc=
X-Received: by 2002:a17:90a:9b08:b0:1e2:837f:bcce with SMTP id
 f8-20020a17090a9b0800b001e2837fbccemr5889109pjp.144.1653721907307; Sat, 28
 May 2022 00:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220527100155.1996314-1-masahiroy@kernel.org>
 <20220527100155.1996314-2-masahiroy@kernel.org> <CA+icZUX_xeZ8k-3YZppGbuYzeypU8f_iz_-tuMJ1bg0dhikH8A@mail.gmail.com>
In-Reply-To: <CA+icZUX_xeZ8k-3YZppGbuYzeypU8f_iz_-tuMJ1bg0dhikH8A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 28 May 2022 16:10:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNARyyomaAS1FK6CMbXKB69RzZMA-hDHL1wzLsuHtCkckyw@mail.gmail.com>
Message-ID: <CAK7LNARyyomaAS1FK6CMbXKB69RzZMA-hDHL1wzLsuHtCkckyw@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] kbuild: replace $(linked-object) with CONFIG options
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        clang-built-linux <llvm@lists.linux.dev>, Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 28, 2022 at 11:32 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Fri, May 27, 2022 at 1:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > *.prelink.o is created when CONFIG_LTO_CLANG or CONFIG_X86_KERNEL_IBT
> > is enabled.
> >
> > Replace $(linked-object) with $(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT)
> > so you will get better idea when the --link option is passed.
> >
> > No functional change is intended.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Hi Masahiroy,
>
> I was not CCed on the cover-letter and only on some patches in this series.
>
> So, I have re-tested this series by pulling from kbuild.git#kbuild
> (saw later you renewed the parisc/nm patch).
>
> While testing my selfmade LLVM version 14.0.4 (PGO + ThinLTO
> optimized) toolchain I included this series.
>
> Just built fine and I was able to boot on bare metal.
>
> -Sedat -
>

Thanks for your testing!

I added your Tested-by tag.





> > ---
> >
> > Changes in v7:
> >   - New patch
> >
> >  scripts/Makefile.build | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 06400504150b..f80196eef03a 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -219,7 +219,7 @@ objtool_args =                                                              \
> >         $(if $(CONFIG_STACK_VALIDATION), --stackval)                    \
> >         $(if $(CONFIG_HAVE_STATIC_CALL_INLINE), --static-call)          \
> >         --uaccess                                                       \
> > -       $(if $(linked-object), --link)                                  \
> > +       $(if $($(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT)), --link)    \
> >         $(if $(part-of-module), --module)                               \
> >         $(if $(CONFIG_GCOV_KERNEL), --no-unreachable)
> >
> > @@ -284,7 +284,6 @@ quiet_cmd_cc_prelink_modules = LD [M]  $@
> >  # modules into native code
> >  $(obj)/%.prelink.o: objtool-enabled = y
> >  $(obj)/%.prelink.o: part-of-module := y
> > -$(obj)/%.prelink.o: linked-object := y
> >
> >  $(obj)/%.prelink.o: $(obj)/%.o FORCE
> >         $(call if_changed,cc_prelink_modules)
> > --
> > 2.32.0
> >



-- 
Best Regards
Masahiro Yamada
