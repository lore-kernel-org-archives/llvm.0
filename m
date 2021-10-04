Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4DA3FC7
	for <llvm@lists.linux.dev>; Mon,  4 Oct 2021 11:38:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 093F46136F
	for <llvm@lists.linux.dev>; Mon,  4 Oct 2021 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633347521;
	bh=o+Rpfn1IC4KVCQeTsymhJ0z7e32ceLwRcmHzK/wEniw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JM7d+iCbONZJRHYECgQ7zEA8E1YeS49mlMARkiWTW2oHFWsR0XdokiJ8JsPmk2UdI
	 lq5YCIUihsVteM9TUim+0enXwG3P1q1AGeGhaEKX54VX1Rt1e7aJKx/eJ4bklJHxF+
	 OIq2Yo8wBz+Oy4QuNDqQxuXYa3hRVqmDtto1x/hykJtKSLqcHzxi4RXajnmjCG6bI+
	 +OjPDxuuQ6/h+61b/nFdUx1h/FhCo7sfLhYTlek/0cHneRmIpJq6LPwozd5oKCZ/kx
	 uOBWtYECYGew0RnNNwJVG3dXfG4Z3Nt3d0viebhL7Djwy191cuBUEPGUKxqUgc3aT/
	 vq050GFtZjXwg==
Received: by mail-wr1-f52.google.com with SMTP id r10so13744932wra.12
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 04:38:40 -0700 (PDT)
X-Gm-Message-State: AOAM532m2IY2G3V1b+u/QS42HKX9V1P74oevd11rjj6eNpikIxY3ghKW
	DPvJkZUH1x3DGnsboAbiRpUoDU8TsGTYWP9vfag=
X-Google-Smtp-Source: ABdhPJxv9OQzgkYLcrhTEoNwZKjERfe5+BmhLWHHuHXPpk8ez+hpUBxHKKihnnuZMc6vtUQnuufmrxm2EI/4F5RzHJw=
X-Received: by 2002:a5d:564f:: with SMTP id j15mr13449053wrw.336.1633347519578;
 Mon, 04 Oct 2021 04:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927122024.941874-1-arnd@kernel.org> <ea4cbdd2-3f78-7bc6-d378-b9edb14ce80d@xs4all.nl>
In-Reply-To: <ea4cbdd2-3f78-7bc6-d378-b9edb14ce80d@xs4all.nl>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 4 Oct 2021 13:38:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ZOO-1QHAQbhPqFe9URX77bXORCybemLyd8DNQC-wVQw@mail.gmail.com>
Message-ID: <CAK8P3a0ZOO-1QHAQbhPqFe9URX77bXORCybemLyd8DNQC-wVQw@mail.gmail.com>
Subject: Re: [PATCH] media: gspca/gl860-mi1320: avoid -Wstring-concatenation warning
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Olivier Lorin <o.lorin@laposte.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 4, 2021 at 12:55 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Arnd,
>
> On 27/09/2021 14:20, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Newer clang versions are suspicious of definitions that mix concatenated
> > strings with comma-separated arrays of strings, this has found real bugs
> > elsewhere, but this seems to be a false positive:
> >
> > drivers/media/usb/gspca/gl860/gl860-mi1320.c:62:37: error: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Werror,-Wstring-concatenation]
> >         "\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"
> >                                            ^
> >                                           ,
> > drivers/media/usb/gspca/gl860/gl860-mi1320.c:62:2: note: place parentheses around the string literal to silence warning
> >         "\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"
> >
> > Use the extra parentheses as suggested in the warning message.
>
> I noticed that gl860-ov9655.c uses the same construct, doesn't that produce the
> same warning?

Curiously, it does not. I tried reproducing this in godbolt.org,
see https://godbolt.org/z/W6K69qcz3

For some reason, clang only warns about some of those, and it appears to
depend on the ratio between string concatenations and array elements.

> Also, does clang only warn about 'static u8 *tbl[]' initializers, or also
> for 'static u8 *tbl' initializers (i.e. not a pointer array) with the same
> string concatenation?

When there is only one element rather than an array, it does not warn,
because it's not a mix of concatenation and array elements.

> I made a patch that replaces these ugly hex strings with compound initializers:
>
> static u8 *tbl_640[] = {
>         (u8[]){
>                 0x0d, 0x80, 0xf1, 0x08, 0x03, 0x04, 0xf1, 0x04,
>                 0x04, 0x05, 0xf1, 0x02, 0x07, 0x01, 0xf1, 0x7c,
>                 0x08, 0x00, 0xf1, 0x0e, 0x21, 0x80, 0xf1, 0x00,
>                 0x0d, 0x00, 0xf1, 0x08, 0xf0, 0x00, 0xf1, 0x01,
>                 0x34, 0x10, 0xf1, 0x10, 0x3a, 0x43, 0xf1, 0x00,
>                 0xa6, 0x05, 0xf1, 0x02, 0xa9, 0x04, 0xf1, 0x04,
>                 0xa7, 0x02, 0xf1, 0x81, 0xaa, 0x01, 0xf1, 0xe2,
>                 0xae, 0x0c, 0xf1, 0x09
>         }, (u8[]){
>                 0xf0, 0x00, 0xf1, 0x02, 0x39, 0x03, 0xf1, 0xfc,
>                 0x3b, 0x04, 0xf1, 0x04, 0x57, 0x01, 0xf1, 0xb6,
>                 0x58, 0x02, 0xf1, 0x0d, 0x5c, 0x1f, 0xf1, 0x19,
>                 0x5d, 0x24, 0xf1, 0x1e, 0x64, 0x5e, 0xf1, 0x1c,
>                 0xd2, 0x00, 0xf1, 0x00, 0xcb, 0x00, 0xf1, 0x01
>         }, (u8[]){
>                 0xd3, 0x02, 0xd4, 0x10, 0xd5, 0x81, 0xd0, 0x02,
>                 0xd1, 0x08, 0xd2, 0xe1
>         }
> };
>
> but it clang also warns about 'static u8 *tbl' multi-string initializers,
> then it would make sense to replace all these hex-strings. It's rather
> ugly.

This seems fine.

       Arnd
