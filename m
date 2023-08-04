Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0A0CA6E
	for <llvm@lists.linux.dev>; Fri,  4 Aug 2023 15:46:30 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-63cf6b21035so13835066d6.1
        for <llvm@lists.linux.dev>; Fri, 04 Aug 2023 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691163990; x=1691768790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lbb2VkUYpcvrjAbuA8UFz73QM1aapinYdQ8PfffEqdw=;
        b=uSw8srlvkdNUYJYtc5TNkofuuRG9NlvWsa9z1FxvyZgYol80KHdrxc49/RmliZ/fzc
         W62Zh23a8h9A5Q0U05CYcZlliurch5SLeO+NXbcUxc5Snxe44CHOT6pBpKqbjCQ5tJtu
         m9x21PVKgCsS8RkvCKOUgc2DDgcdAbsfSxqeCLcGA9Chi5toZU2Pq72NgECAMBtyTp0/
         EvoBi8TVPPuKrA0RnO0NW6ui2xNhaT15TPafkWO048bdvP9IwJ2EdIlPNR0oKJfBKuZ+
         326P99bNO/E4ZNzmMhORxtwrEzvIcGTMMa/n/K+eISL7k3poBMBIMrfxtcQw793EssFM
         NbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163990; x=1691768790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lbb2VkUYpcvrjAbuA8UFz73QM1aapinYdQ8PfffEqdw=;
        b=WR84CRkralmNQ1x1B+IeYjEg4XB9X5ruIH+MWaRS73BQoSoSEfvJPnZ7f0l5pgqm+m
         1t7feCFLRjBfQnCumsjx2GY9mQ2FS8LCWfXwya8SfzRZFeHvLimJnUCE25mpInO0ago6
         h6k4pvH+jr0PQAwjoQzJBXDSeEyzaX9zA2r/biEo/gwOxv1hGZhm8cDmRwsCb/bg0iSO
         zKd4WL/jNJtrPyXsItKGZnHbuPMsILLLF9Z1mrn3USzC02ME3ebkSP8CwRNc01dZCk0h
         x6wRxZB4Ua/LvU2aZ1Zc+LpmihecHTVRmh8MB04M+24zjklGSRtO5qemrTSmVMvGJRqU
         7tDA==
X-Gm-Message-State: AOJu0Yy3A8XSgEIl6mXS1o+hac6UncajYvVBkekUx+Ru6di/+zskc+1+
	trrcYaBxlLv95+v1WNAJra0Tmdh5Tt5ng+80WmH7hg==
X-Google-Smtp-Source: AGHT+IEu1uNcPnRW/G5hBNtOR5DUb/bVDRNMeccdfr2Wm9PDbUnpDbM+4Azra3rGP6+r18EkGk6+83/9IQfnQ1iFGYg=
X-Received: by 2002:a0c:cb09:0:b0:63d:6fb:c8da with SMTP id
 o9-20020a0ccb09000000b0063d06fbc8damr1804085qvk.14.1691163989483; Fri, 04 Aug
 2023 08:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230804125609.2054719-1-kernel@xen0n.name> <CAAhV-H5g-jmeQMhicrqhpStV9n0Z-EZ1dZAsuT2hmOaHki4ucg@mail.gmail.com>
In-Reply-To: <CAAhV-H5g-jmeQMhicrqhpStV9n0Z-EZ1dZAsuT2hmOaHki4ucg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 4 Aug 2023 08:46:18 -0700
Message-ID: <CAKwvOdmt+p3KM23hz2BfheoWgEa0G9QKnAFYUP+EL2Ta5LXUUg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Drop -ffreestanding from CFLAGS
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 8:26=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Xuerui,
>
> On Fri, Aug 4, 2023 at 8:56=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wr=
ote:
> >
> > From: WANG Xuerui <git@xen0n.name>
> >
> > As explained by Nick in the original issue: the kernel usually does a
> > good job of providing library helpers that have similar semantics as
> > their ordinary userspace libc equivalents, but -ffreestanding disables
> > such libcall optimization and other related features in the compiler,
> > which can lead to unexpected things such as CONFIG_FORTIFY_SOURCE not
> > working (!).
> >
> > As it turns out to be the case, removing the flag does not impact the
> > LoongArch kernel's normal operation at all; so just remove it to
> > restore expected libcall semantics globally on this architecture.
> >
> Not all processors support unaligned access, so we need the
> alternative mechanism to select memset/memcpy/memmove implementations.
> If remove -ffreestanding, the builtin implementation cannot be used on
> all hardware.

That sounds like a compiler bug in that compiler's implementation of
string.h builtins then; it should default to the safest implementation
(aligned accesses) until instructed otherwise.  Have you filed a bug
against your compiler vendor for which compiler you observe that
behavior from?

At the very least, there should be a comment above the addition of
-ffreestanding justifying why it's being used, probably with a link to
the above bug report.

I would expect either -mcpu or perhaps some other -m flag to guide the
compiler when it is safe to emit memcpy (and friends) in terms of
unaligned access or not.

>
> Huacai
>
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/1897
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: WANG Xuerui <git@xen0n.name>
> > ---
> >  arch/loongarch/Makefile | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> > index b1e5db51b61c..db0d7210272d 100644
> > --- a/arch/loongarch/Makefile
> > +++ b/arch/loongarch/Makefile
> > @@ -83,7 +83,6 @@ KBUILD_CFLAGS_KERNEL          +=3D -fPIE
> >  LDFLAGS_vmlinux                        +=3D -static -pie --no-dynamic-=
linker -z notext
> >  endif
> >
> > -cflags-y +=3D -ffreestanding
> >  cflags-y +=3D $(call cc-option, -mno-check-zero-division)
> >
> >  load-y         =3D 0x9000000000200000
> > --
> > 2.40.0
> >
>


--=20
Thanks,
~Nick Desaulniers
