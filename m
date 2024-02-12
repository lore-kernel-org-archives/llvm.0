Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9148795
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 21:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707775171; cv=none; b=h+8oWoAR7DS9I+p+FjBEmoasvUUuZPzXNow5i5SDeSiNC2DFzYSQ9IsdqbAmubcs3u3hKShEGoRAHcdw004X+gyCKLy8BS1DfLOkb93y4/ttLdCFyZHiFjt7/f37OrbH7KV+VtyDgYUFk+giV3ZRJGxnX5p81bHAhV9/Cm/Pg0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707775171; c=relaxed/simple;
	bh=b+F7pcUkc0r1mBK4PMiDYHZh9PrP/YYZbjdLAkDYuqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWlS2gP4h0MMZVhupMbmqtojkjrA8GMpzUAcTmOXBRMkEwaLFQ2WKoU+Bwttvf0cWAFDe+Xup22XqGu3wqKBOaYF2I3yVV+g0gwN1qrSuSjbfksBgQMt6HlEM0kFISVtZerurkyMpOnUGzNlgFUiSOCRtCTkblIaB3vQ83arpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JwefIHVL; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JwefIHVL"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56101dee221so866a12.1
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 13:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707775168; x=1708379968; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAP8ciFMVXJQebx3ikecm7gfdkfYQjqo8DHa2ep2azc=;
        b=JwefIHVLTNrrZBJrmD6WitdG0h7N4pZSN/+feCf88B/XbQxYIrLhUORUgZ8KhQV4TP
         LULpdP/VDk4ZrEPkOB3mZluh14k75xIjkD9BYpDckeXrW3HdAxyEJ08362qvl5TDHbFo
         hou0xtOlOkjjkPXlD6CXvxNEiaZtNUBtcJuxmzBeLmh/qnh2NqB5FAgv+Be5Os8vTWP7
         UiK4hZksAKcQNbFZuBQ4kBmvQf5dgE1Bj6mAYchyLLvCOK2vHdC+HuWh/nFyjEsYrjFa
         R58o4qoVehdPOY1cFdDGkoPKNbUe9t6O7v4TqAaH2FjzJnTBggLPVabW+EmSgX1TGsAI
         wF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707775168; x=1708379968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAP8ciFMVXJQebx3ikecm7gfdkfYQjqo8DHa2ep2azc=;
        b=n3fmZBvm5XiVHtS6DlljnBIGRgEkhb8pJ4vjgbkHWHRWh2IXRgr8fEvMWGOd6MaK0d
         7QwQ0WgVpNEwkqlTvQUwkyC1O1XIr9H5OPTiUEiXlQ5qpTQJq8BwuRtx8lT6SfXLj1eS
         Rx4+5it67uJYQtgFuXGoeBFWwvTzoVy6gzhq3umhwQRWccSdoCsF0a4z491JxppySX79
         ER/y64YXjJa1N9ncXaleJ/xXGA+twjuWO4dYqKADFYwHumJiDdc/ylihV4Bcm1+j/qAF
         3RxxvYjmrzzGAAV25DIPCHqv6CZsf9Wyqa6QqdBbclZgEQd86GvvqUii+BoShkIU0ioC
         I6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPepgqZ4Ru/6ksOhj1Kydu8X0PAqjPuNBjxZf3FQKpY0vUbghxFdtOEOiRg9obAKd892ap6RmQxQ9HXQ79InQ8Vg4P/A==
X-Gm-Message-State: AOJu0Yx50/aYN0d/zUScWRZIBMy+ikPIBOJHsJxyEDNW32M5M9QBXBN+
	fe8qiTpxblui+08XXvW/QeAbLG9uhQAYd5fX4g+32UNVBDx8ouTbs34iScgpuXrLjfAh6VXfZfw
	k9ro+xeK26FwfORBPG0TrPHThNysMuxyJHXQL
X-Google-Smtp-Source: AGHT+IHVMdtdCGzIfHivtEQ0BtRleckWRpXt904pHGON8MVFD17b2K8kzlWT2wyZJMxj43kyZ4tIOGfpdJ4L3KikWtM=
X-Received: by 2002:a50:f615:0:b0:561:d84d:f6ce with SMTP id
 c21-20020a50f615000000b00561d84df6cemr22522edn.6.1707775167821; Mon, 12 Feb
 2024 13:59:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240208012057.2754421-2-yshuiv7@gmail.com> <CAK7LNAT0KT7sbZJZNXtq5waM-UjUm4zHyf9xHZc3uHLvZ_eAfA@mail.gmail.com>
In-Reply-To: <CAK7LNAT0KT7sbZJZNXtq5waM-UjUm4zHyf9xHZc3uHLvZ_eAfA@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Mon, 12 Feb 2024 13:59:13 -0800
Message-ID: <CAFP8O3Kqx-gdTBFn_hesWzd-6NCpGEz1=fMoJXuX+n4c7sp0Bw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix building with LLVM on NixOS
To: Yuxuan Shui <yshuiv7@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 1:30=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> +Cc: Fangrui Song <maskray@google.com>
>
>
>
> On Thu, Feb 8, 2024 at 10:22=E2=80=AFAM Yuxuan Shui <yshuiv7@gmail.com> w=
rote:
> >
> > NixOS is designed to have immutable packages, and explicit dependencies=
.
> > It allows multiple different versions of the same shared library to
> > co-exist in its file system.
> >
> > Each application built with Nix, the NixOS package manager, will have
> > paths to its dependency shared libraries hardcoded into its executable,
> > this includes the dynamic linker. To achieve this, Nix adds a
> > --dynamic-linker linker flag when building any application.
> >
> > This isn't a problem if the kernel is built with ld.bfd, because ld.bfd
> > ignores the --dynamic-linker flag when the resulting binary doesn't hav=
e
> > a DT_NEEDED entry. However, ld.lld respects --dynamic-linker
> > unconditionally, which breaks linking in several cases.
> >
> > This commit adds an explicit --no-dynamic-linker flag which overrides
> > the flag added by Nix.
>
>
>
> I expect some Acks from LLVM folks (especially, from Frangrui)
> if this is the right thing to do.

GNU ld seems to ignore --dynamic-linker for a position-dependent
executable (ET_EXEC) when there is no DT_NEEDED entry.
ld.lld respects --dynamic-linker in this case. Before this kernel
report, I do not know any user inconvenienced by this difference.
(mold respects --dynamic-linker as well.)
This could be helpful to test an executable with PT_INTERP but no DT_NEEDED=
.

I think this patch does not fix non-x86 builds.
It feels to me that NixOS should provide a linker wrapper that does
not force --dynamic-linker=3D.
While it's extremely uncommon (and generally not recommended), certain
programs invoke the linker directly (instead of using a compiler
driver).
Such programs would run into a problem when they make a
position-dependent executable with no dependency as well.
I don't feel that NixOS forcing --dynamic-linker=3D is enough
justification to change linkers.

> > Signed-off-by: Yuxuan Shui <yshuiv7@gmail.com>
> > ---
> >  Makefile                      | 3 +++
> >  arch/x86/boot/Makefile        | 2 +-
> >  arch/x86/realmode/rm/Makefile | 2 +-
> >  3 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index a171eafce2a3b..10ed19caecb1b 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -531,6 +531,9 @@ RUSTFLAGS_KERNEL =3D
> >  AFLAGS_KERNEL  =3D
> >  LDFLAGS_vmlinux =3D
> >
> > +LDFLAGS_MODULE +=3D --no-dynamic-linker
> > +LDFLAGS_vmlinux +=3D --no-dynamic-linker
> > +
> >  # Use USERINCLUDE when you must reference the UAPI directories only.
> >  USERINCLUDE    :=3D \
> >                 -I$(srctree)/arch/$(SRCARCH)/include/uapi \
> > diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> > index 3cece19b74732..390a4604166eb 100644
> > --- a/arch/x86/boot/Makefile
> > +++ b/arch/x86/boot/Makefile
> > @@ -102,7 +102,7 @@ $(obj)/zoffset.h: $(obj)/compressed/vmlinux FORCE
> >  AFLAGS_header.o +=3D -I$(objtree)/$(obj)
> >  $(obj)/header.o: $(obj)/zoffset.h
> >
> > -LDFLAGS_setup.elf      :=3D -m elf_i386 -z noexecstack -T
> > +LDFLAGS_setup.elf      :=3D --no-dynamic-linker -m elf_i386 -z noexecs=
tack -T
> >  $(obj)/setup.elf: $(src)/setup.ld $(SETUP_OBJS) FORCE
> >         $(call if_changed,ld)
> >
> > diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makef=
ile
> > index f614009d3e4e2..4b42006d9ce02 100644
> > --- a/arch/x86/realmode/rm/Makefile
> > +++ b/arch/x86/realmode/rm/Makefile
> > @@ -50,7 +50,7 @@ $(obj)/pasyms.h: $(REALMODE_OBJS) FORCE
> >  targets +=3D realmode.lds
> >  $(obj)/realmode.lds: $(obj)/pasyms.h
> >
> > -LDFLAGS_realmode.elf :=3D -m elf_i386 --emit-relocs -T
> > +LDFLAGS_realmode.elf :=3D --no-dynamic-linker -m elf_i386 --emit-reloc=
s -T
> >  CPPFLAGS_realmode.lds +=3D -P -C -I$(objtree)/$(obj)
> >
> >  targets +=3D realmode.elf
> > --
> > 2.43.0
> >
>
>
> --
> Best Regards
> Masahiro Yamada
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
