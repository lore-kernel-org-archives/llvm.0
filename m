Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89474AECF
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 23:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710201383; cv=none; b=bOqEPIV28Wc63PyMdRqWLfW/aShkk/7AzNTCaOocRjXNyWtXKovYvXNY/0UBYjXApUZL0SxH1x2HjYpCK9kWlL1Ao6YJ0ZiLyQaCuC6mggjKI14Ty38jF/zcUrjANF+aO8sAdC2qBqEoQAmYNj4TJYWL7hfyC+dyZRs9y1JA818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710201383; c=relaxed/simple;
	bh=5p26sHDLh9VVK60a67e5p75SjjiOb2lV1QernvvO4Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpGq5CU8PTm5IpFtNT7HbKq0ExW1kZT4kecYJwrobv70QlSNP5zQDXFhUoJWzFLa3wbQo9FaU+pM/osubc21hUmfnGeaTnWmH2iFGIjaTP9+k+rrwS5qrHoUhjEWpk9w6M8Tvs1IL685/1Cddf+bDvrSEej48Io/ZYyH6dwK4vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/dHw/ow; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/dHw/ow"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso3853348276.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 16:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710201380; x=1710806180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jR7LnJq+WLd8+k+Oz/t1blDpr71ev15aQCn7enIPmk=;
        b=s/dHw/owa8noxGaJw7q4SFL9vgKzic6xlVQZ3tmUWqVttJEt6wmrbEixtxyBjLunxF
         kx609Buc2oVwctXkOrLrM7wwkxRKn1TJ7hJxE0FbhlFM6QjXwU8xb2nLJZLu30CWT/TS
         fEglhfkD1SiwFKywUMKI/59Px29OeWFt49F0uMv5JfAbmbAiUnaTpKW439fBI0aXIHFA
         TOeUwbvRW42aruNvqQhbIfm33/8wZoylZBV/StbeElwST+JYBUYY9jKVdTw0JAcLsgAj
         gKd7iwL+4sZ/gWjvINy7OSzQMX10/nnESbrOwcRhSAQMgJMX1tLhreMwlodyrXGDwyHW
         oUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710201380; x=1710806180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jR7LnJq+WLd8+k+Oz/t1blDpr71ev15aQCn7enIPmk=;
        b=tr8WNp5uCJ+yZZjVbE84HmCSwVNX2J3hYRAQ5mZj6RaU2qXU+5Ts/rvhYeIHtF4JwT
         Qu71y1ff5K6IhiBiN262mv+15hvi0le8AU2qdq1FHeDviFMkYc+FDrDcGGXlJL7U3Bcf
         GP+C2ki9022xYuzCCMuatGglNNkrk8zUHJAa4CixWQTQpAlE75lLeBPv+DKUF5rMe5Kf
         5qfKDo3qrgDQvuQUX0bQ18qsXZcwznEsqpgmn7lGBsqxY34iw9jhVhXXnwWBCjhmbuOS
         e8M4W/APjKtWfPxc7qKfaTRzm06MFR3iQkq+wESLuxE5CKfVKRzoJGqMARAK/gKEXLFH
         zIJA==
X-Forwarded-Encrypted: i=1; AJvYcCV29LLSxMnbMhjt8mcF6xjOgdi0fVJQbNDGI9NNyLxoaJhhLcvCK2C4E4TCn7LfhrJlrp+cwmT3xoQvz2+HIcbSYYUKUw==
X-Gm-Message-State: AOJu0YxIRLBZiY0ozRYm1Lc9b9fkgho2Bl2XOounbmbjvuMATPHKwFmC
	pEIUHefX+RZIXTXsW6PWk4d9oFNZbOyB+evIcOEHh4BtZ5kfVwkjmYSlksdfASujVwmMqyIW3uj
	mm6ZtWqh9lv5eYWTMa9rhnlNHJ5Mej/0K+zbUfw==
X-Google-Smtp-Source: AGHT+IG0jiq4zbSMxNOfrFkPGz0j+KpZqLby9w4stazuMmu7RMIiKqVH7DiyTSdDceC9IBLNqYt7zwTonMaWxWCQaD0=
X-Received: by 2002:a25:e910:0:b0:dc2:3a05:489 with SMTP id
 n16-20020a25e910000000b00dc23a050489mr4760919ybd.14.1710201380689; Mon, 11
 Mar 2024 16:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org> <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
 <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com>
 <CABCJKuf6CWw5Ff955H5qD1Nva-j3WJZ-5A7Rb1TyBwCaEd3E2A@mail.gmail.com>
 <CACRpkdbjjbRP5cED+qX5PGpvjvBEK9AxnGekVab=7WMrAPe+pQ@mail.gmail.com>
 <CABCJKuf7xmCBs8UrpEbeRtQnofuq2Pp4M=RGT4TUw1+HsvS_CA@mail.gmail.com>
 <CACRpkdaVkaM4ERUcK-3BqHK6O9hBtj4tEHZaQXbvW9Oh23c8Gw@mail.gmail.com> <CABCJKucJd-EG1yr6u5SvUW2Frxs3aBPCuo9TH83ba2chdkb7tw@mail.gmail.com>
In-Reply-To: <CABCJKucJd-EG1yr6u5SvUW2Frxs3aBPCuo9TH83ba2chdkb7tw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Mar 2024 00:56:09 +0100
Message-ID: <CACRpkdZOsST_QtouokNgF0XRVSyoOJQr0cfAGTMjSCb7ezBLPg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 11:28=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
> On Mon, Mar 11, 2024 at 3:17=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> >   LD      .tmp_vmlinux.kallsyms1
> > ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_flush_user_tlb_ran=
ge
> > >>> referenced by arch/arm/mm/tlb-v7.o:(.text+0x0) in archive vmlinux.a
> >
> > ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_flush_kern_tlb_ran=
ge
> > >>> referenced by tlb-v7.S:60 (/mnt/storage/linus/linux-integrator/buil=
d-vexpress/../arch/arm/mm/tlb-v7.S:60)
> > >>>               arch/arm/mm/tlb-v7.o:(.text+0x40) in archive vmlinux.=
a
> >
> > ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_tlb_fns
> > >>> referenced by arch/arm/mm/tlb-v7.o:(.init.text+0x0) in archive vmli=
nux.a
>
> Clang only emits __kcfi_typeid symbols for functions that are
> address-taken in C code. You need to add __ADDRESSABLE(function)
> references to a C file somewhere for functions that otherwise are not
> address-taken.

Hey it works. So for example if for these functions I also add:

diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
index d19d140a10c7..23eb0f9358cb 100644
--- a/arch/arm/mm/flush.c
+++ b/arch/arm/mm/flush.c
@@ -18,6 +18,11 @@

 #include "mm.h"

+void v7wbi_flush_user_tlb_range(unsigned long, unsigned long, struct
vm_area_struct *);
+void v7wbi_flush_kern_tlb_range(unsigned long, unsigned long);
+__ADDRESSABLE(v7wbi_flush_user_tlb_range);
+__ADDRESSABLE(v7wbi_flush_kern_tlb_range);

Then that works.

The problem is that I also have to define all these function signatures tha=
t
are never used in C and there are quite a few of them, if I start listing t=
hem
all and #ifdefining them for selected CPUs it's not going to be pretty.

It can be done and they can be in a cfi-defs.c file though.
And it's better than __nocfi.

The complexity comes from the fact that arm can boot a kernel
with support for several different CPU:s.

The different CPU management functions are put in a list of supported
processors by the linker, and then e.g. the tlb maintenance functions
are dereferenced directly from *list->tlb in setup_processor()
in arch/arm/kernel/setup.c.

Yours,
Linus Walleij
