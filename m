Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB425C818
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473658; cv=pass; b=MADTvlb3vqOjpSuwF7KzO7NY5xy+yD4/VxS6a61vnAEq/fQ75FAmcKYhvNvBuNi8pWvQ+8DMTl/NPnWKN7rhJu65qVoRrWulbx+yqSuhIdTOEl+AZj+gecV7L0zsXDyMgOpwJV4MJEbCOgNloKizivSF8A3XJMfJ4z1hMdgkjig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473658; c=relaxed/simple;
	bh=RTWW02r38+B8yR0GhIPcq4df4zXYUwN6uotDuYtqzEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vjicnz9gbtXWnd+EpuMADqtuZ4/dAuyC542hNRoGbBdwPK5lrs5nz7SJevQS+no8LVq1EOnmtfnfom6QYOIZMlZRBneDmmH+nL/SGHosZXfUm3VAwgcGKjxj9lhGiENDAvWAyf16E7LPFt1sgxWtYFOuEbWyNN0uLX5SniYQdaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N1tJnuwU; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N1tJnuwU"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-671588ab0cfso221a12.1
        for <llvm@lists.linux.dev>; Fri, 22 May 2026 11:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779473656; cv=none;
        d=google.com; s=arc-20240605;
        b=fbe5l1K7fitOCSxbV0j92u38zYBsL45+v5MXNXBOzbOK0cC6XxI9c3cRKWNLZn1rTn
         ax+VNw9om+UNQRYCylx9SVSPfOUOMGPvxWEIvbVhakkeOTW1jUElQO33c3JE1RWOj9O+
         v8iZa4TreCH5S6hNXLew/iFvUpyT4GVie55AbFOP85s77ut8NYOZ7BNoOHC+850AT0zZ
         jh6LtTsQeMggibcutYqd3E/kN2j3OUt9f02uulsToIG8WbwgX9kkeNjiVQvH5vLVM/f6
         YUXoEhsZGtwCHvfEZwdra8eNrUYOq1P39gnH5psEXxtANY4GqzxVYVW/bkWzk8/7qZrV
         JRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SVOjN8nARQR8e69Dc/KabVi6lzhVRC8O4He915pda0o=;
        fh=4DRpJvKiHLPLZzGoS2ICiW0twk1vLgKPYEImE7ZkOFU=;
        b=ECEU57/HhPbh3kRXSb48dD43s5yrVOrZGirzcGC/RwwAxb0OUk7bMkY4kxfbw4r7MH
         KrhCFD1lLklmf8erYGIWpbbm2L7NWZBMHnF2WkSiYon40sJw2w/21SaC15IpdEHx23IR
         LEEMTE6ilX0gJjF3cMR/ykTuC+62Zmei1QNa+90oMBqzv8Ssr24fijTd8JtOhVq0vkdp
         yKnEO0B0pgl12p945WPO70Is1dAdBc87mMohzL6OX2vRoOctE+5AtZ+3oIWj9XQMNW/4
         LDf77g5xkstigu3xe1sTte6+HovFCWnpLYdTFf5YbIpaH5wyiUXRmeQJWYAO+upXLeuk
         oUZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779473656; x=1780078456; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVOjN8nARQR8e69Dc/KabVi6lzhVRC8O4He915pda0o=;
        b=N1tJnuwUaLyl96YtfBmmJ5NaNGIPWoOQMsFnnMPjlZsMafhc08XhWhmZXTCpBdSa1j
         y5NyMIn5atmhHpic7v0Tt8hme+G6RvsJSyqys844L0V6nDvjbiA/m8zRqA1Lha3U7Xlq
         s2GCrlyu9oUWQePFmmo3jHoFf9s69O1fmY0AISf/v0e+HkAaDz7MYRF/2upZ9Mk8iYR7
         hN88ws5JAAIBmlvbdgwSoZlTayu7yGHJ5YwISfmMhFYbZ9wkr2MY4fUga0I2kTye1UGw
         2w9bsxsPY2ZY6HYcuVtrhC0x9d1v1gi6MztjwnPCkqsBTG5FDO0fNHn+c21xP4Jt/POZ
         mU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779473656; x=1780078456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SVOjN8nARQR8e69Dc/KabVi6lzhVRC8O4He915pda0o=;
        b=BKWmV37Pd3dm2M/0Idc2r/AMp8E5RIyH3jAlMafFtbnw0zZtBceHdn+rJ0834sMTvf
         W1i0pGn/BTQLVi1VgU5s3aWM2+yFdX4YwiAQJm66WAgoVEXwO3cu4zUV9WvstY+IVXKR
         xFLN5mHM+dGE/jVQsVK4iZHjFLmojgBoQwU3uOUgQ3BHAb3YETZkYZq7ycJlgpKoS1Gq
         LIpTOoiVza0rrMoeh4ELldSkytsbGoACsWmB1QXYbEWoNjx4jxHgJm/E9vMlTHK+ZN+4
         vdiJhrp9OYMjgLS5f1ljGzNecbTbhIfuEWa+gHiw80xPaS5CHE6FpLQT+FUHyMykpeUZ
         nJUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jPsywS+3tYi3yW1YWvQsfzzwq8uoedok+Uz1rRK/oFZrb0bMXI3HuhlMLX8WLvJvpcgp3@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+yxboy7oIOFi+L9uHp0JMXeYGTJwiwfr8vCJvllXQ3xmRqxoc
	x2dqzBq2H98AYc02vXmd9ZAlgrbqbkVuTD2HHqAeiZLahZdnxB33molKJJCPupezuKdTwoaL7/I
	3uAlNfk0l3HIC46BYA3XI43G3GY6xozeaCUrPSakK
X-Gm-Gg: Acq92OE/mXLFOLpnnNlRPbMYyL8kxzsIyIAIbeXr8XxwpCJyvao4uTZHJzPBUkn4KN7
	3JsHS7Jolzy/a/1ACXDH92GzoW4lzJ/LLJr7y/hJQY1tw2/O/jgHMZK3X3GmW9oUN7jn8V0Vhzy
	3brCmv07BARkmYjwZ+NNDCjsOpbOIEiVULjxa79mu37IQcfyIkUQbMS6cSUwMaj2MdnEgBtFkgv
	qyxhYXh04h8Bi+MxRP73GhXftDlKJ8G+pky0SMuLqO27p1zSNd9RuUPHGlSoelaoeBuGbhMt4gi
	c+k0rhjGNfnosWD0JHU=
X-Received: by 2002:a05:6402:3047:10b0:678:93b4:1fd3 with SMTP id
 4fb4d7f45d1cf-688fd162ae6mr4766a12.6.1779473655215; Fri, 22 May 2026 11:14:15
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com> <20260331154827.2793269-4-xur@google.com>
 <20260331162729.GA2006419@ax162> <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
 <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
 <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev> <CAF1bQ=TFMSkLE6bqPEOqGxcLbC7tYfPqEmg7xrjbc2m_B=72GA@mail.gmail.com>
 <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev>
In-Reply-To: <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev>
From: Rong Xu <xur@google.com>
Date: Fri, 22 May 2026 11:14:01 -0700
X-Gm-Features: AVHnY4IyUbfkIDAcyICEqLeddZZVv8dc-GKGofSIvTvA2_zZ32AYW60ZtIP9fZM
Message-ID: <CAF1bQ=Ta0LJVSiEWnhyq=mXA81m3=-gW1H+iyQyQwZ+w02g1VA@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang ThinLTO
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 10:52=E2=80=AFAM Yonghong Song <yonghong.song@linux=
.dev> wrote:
>
>
>
> On 5/22/26 8:32 AM, Rong Xu wrote:
> > On Thu, May 21, 2026 at 2:57=E2=80=AFPM Yonghong Song <yonghong.song@li=
nux.dev> wrote:
> >>
> >>
> >> On 5/21/26 11:31 AM, Rong Xu wrote:
> >>> Yonghong, thanks for the update.
> >>>
> >>> Regarding this guard: ther is a period of Clang (before this patch an=
d
> >>> after your first patch), even though ld.lld having these options
> >>> (specifically --lto-whole-program-visibility -mllvm
> >>> -always-rename-promoted-locals=3Dfalse), distributed ThinLTO mode
> >>> remains unsupported, correct? What the behvior of using this options
> >>> in distributed mode with these compilers? nop or it will lead to
> >>> error?
> >> The in-process thin-lto support is landed on Feb 27.
> >> The distributed thin-lto support is landed on Apr 24.
> >>
> >> If people are using distributed thin-lto in kernel between Feb 27 and
> >> Apr 24, there will be some issues. But people typically use released
> >> compiler, so we should be fine.
> > This is not the case for us (google). We do use compiler b/w releases,
> > and we build our own.
> >
> > What is the issue if we use the compiler in b/w Feb27 and Apr24?
>
> If you use the custom compiler between Feb27 and Apr24 and your kernel
> will do distributed thin-lto, you can remove
>     $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename=
-promoted-locals=3Dfalse)
> from your kernel. Since you have custom compiler, you can
> do some customization for your kernel as well.

I am referring to this specific patch -- there are cases that use
custom compilers built between the February 27 and April 24 LLVM
releases.
I don't want to see any breakage for distributed ThinLTO in these cases.

I would prefer to keep this guard for distributed ThinLTO for the time
being and remove it later. What do you think?


>
>
> >
> > -Rong
> >
> >>> I would assume there will be errors; otherwise, you would not ask me
> >>> to change my patch last time. In this case, I would keep this guard
> >>> and remove it when the minimum llvm version passes llvm23. What do yo=
u
> >>> think?
> >> There is no need to keep compiler version guard.
> >>
> >> Before llvm23, the below will be a noop:
> >>      $(call ld-option,--lto-whole-program-visibility -mllvm -always-re=
name-promoted-locals=3Dfalse)
> >> since '-mllvm -always-rename-promoted-locals=3Dfalse' is a new flag an=
d the compiler won't
> >> recognize it so the kernel will resolve above 'call ...' option as noo=
p.
> >>
> >> With llvm23 and later, the kernel will be able to recognize above opti=
ons and
> >> things should be okay.
> >>
> >>> Best,
> >>>
> >>> -Rong
> >>>
> >>>
> >>> On Thu, May 21, 2026 at 1:57=E2=80=AFPM Yonghong Song <yonghong.song@=
linux.dev> wrote:
> >>>>
> >>>> On 3/31/26 9:27 AM, Nathan Chancellor wrote:
> >>>>> Hi Rong,
> >>>>>
> >>>>> On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
> >>>>>> diff --git a/Makefile b/Makefile
> >>>>>> index 69ccf9b8507d..26005c64016d 100644
> >>>>>> --- a/Makefile
> >>>>>> +++ b/Makefile
> >>>>>> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
> >>>>>>     endif
> >>>>>>
> >>>>>>     ifdef CONFIG_LTO_CLANG
> >>>>>> -ifdef CONFIG_LTO_CLANG_THIN
> >>>>>> +ifdef CONFIG_LTO_CLANG_FULL
> >>>>>> +CC_FLAGS_LTO        :=3D -flto
> >>>>>> +else
> >>>>>>     CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> >>>>>> +if CONFIG_LTO_CLANG_THIN
> >>>>> This should be an 'ifdef', not an 'if'. You copied Yonghong's mista=
ke:
> >>>>>
> >>>>>      https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
> >>>>>      https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@l=
inux.dev/
> >>>>>
> >>>>> Please slow down and test build your changes before sending them. E=
ach
> >>>>> revision adds four new emails to everyone's inbox, which is just no=
ise
> >>>>> when there are obvious, basic problems. 'b4 diff' shows no actual
> >>>>> difference from v8 and v9, which should have been caught by a simpl=
e
> >>>>> build test right before 'git send-email'.
> >>>>>
> >>>>>>     KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visib=
ility -mllvm -always-rename-promoted-locals=3Dfalse)
> >>>>>> -else
> >>>>>> -CC_FLAGS_LTO        :=3D -flto
> >>>>>> +endif
> >>>> The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be remo=
ved.
> >>>> See llvm patch
> >>>>       https://github.com/llvm/llvm-project/pull/188074
> >>>> which supports distributed thin-lto mode too for reducing the number
> >>>> of renaming. In other words, for llvm23, both in-process and
> >>>> distributed-process are supported for thin-lto.
> >>>>
> >>>>>>     endif
> >>>>>>     CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> >>>>>>
> >>>>>> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
> >>>>>>     CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
> >>>>>>               modules.builtin modules.builtin.modinfo modules.nsde=
ps \
> >>>>>>               modules.builtin.ranges vmlinux.o.map vmlinux.unstrip=
ped \
> >>>>>> +           vmlinux.thinlto-index builtin.order \
> >>>>>>               compile_commands.json rust/test \
> >>>>>>               rust-project.json .vmlinux.objs .vmlinux.export.c \
> >>>>>>                    .builtin-dtbs-list .builtin-dtb.S
> >>>>>> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
> >>>>>>        $(call cmd,rmfiles)
> >>>>>>        @find . $(RCS_FIND_IGNORE) \
> >>>>>>                \( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko=
' -o -name '.*.cmd' \
> >>>>>> -            -o -name '*.ko.*' \
> >>>>>> +            -o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
> >>>>>>                -o -name '*.dtb' -o -name '*.dtbo' \
> >>>>>>                -o -name '*.dtb.S' -o -name '*.dtbo.S' \
> >>>>>>                -o -name '*.dt.yaml' -o -name 'dtbs-list' \
> >>>>> With that addressed above, the series survives my basic LLVM 22.1.2
> >>>>> build test with my distribution configuration. I'll provide formal =
tags
> >>>>> on a properly tested and fixed revision.
> >>>>>
> >>>>> Cheers,
> >>>>> Nathan
>
