Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A88A146A7B
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728036114; cv=none; b=ufXQQe1WUFm0TzsJyBL6nE5WOvuWfEmjmmyi7ZtRpGamWF4gS3cOEp/927CkMEq6HNq7z9EP6MrONfG5woc0EDa9d6tRUkyINVhB9cnu+MYmRHD/ubSDiEO83ejxr66j0iUKIBvk6/l6r6bsOrelbkFuolzEA5wbnBZSl8aQQGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728036114; c=relaxed/simple;
	bh=nuE9Wx0dXnlPfKn5kpp9tKPB9VOjIJcG2joICPhGO2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxuDaNkUWZeLGBipsBdeCkhm6Mej4WktzAc6c+HhnzgApFvpstkfBdjGFYWORpjLDzEffawWbJCZRYBNRWCv74pTI1h5Rqt+euN4zAwby+phc3yR/CLWG7Qtx70Afr6RhBKhxBQJWvruta4wuVkbmdtE/aorvMxTZU3ee0e7v84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikKOhlzv; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikKOhlzv"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2faccada15bso20055381fa.3
        for <llvm@lists.linux.dev>; Fri, 04 Oct 2024 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728036111; x=1728640911; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cieeCIQbn3uKGp6ANoCcdjT0voB4iLaxe9sLqJZ6O1w=;
        b=ikKOhlzvJKuIaU0CeVYuAa18HgioHiunRrjfbIwl5TmPWhqU+mmM1/cEVkLzYF3Ycw
         n4LGQ3veBqfZQTfyGrePpbfxXyXog+cF0HNlb1p+Vops3itaRBNQttnLJmrZgpL3wmIp
         uiVPPUGK5M2LXm54GPe9KD5mFPy+T7+bLnIOXAONGK2tikYjKPD6uO/LPLFLNzvwXrIZ
         6IbIcMxzx4BjHJTqQF1liH/ZEXkPYamcISIiw1tZmMXxqbX2q2ZgFzqyCcSU3WuBeZdN
         R2hPVmvXTft5zfN/MLe9ovrPXZ6UbD7Dm4OIngXCjQ42t4it6klMmciEd/jIRQ9EQj98
         BV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728036111; x=1728640911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cieeCIQbn3uKGp6ANoCcdjT0voB4iLaxe9sLqJZ6O1w=;
        b=TLTGRPe2Jk88XuupSi18ZdfddCFm8bAX+TcrlT0EPOkRFK1FJy0MuWJlOKpJ3V9dy3
         Jt+i6qdmj48GBa6aBDID5j/2dMWUy1Xg+/z4bNeBM5jQq7eLjXYE1MoW/Btcz+gLqzgc
         Gsi4EfureLZZf05HUZRot2cPlsFBQe/xUX0kX6DCfHgwB0D0bMDVHiu5ha1bhucLlpOR
         vNL14ASlTMuCVyDEddUHQ72RCIhK7EGSsYPTsoT8HplsSmtI5P8kwtSvl5l+FrywdWmb
         pBq7VaWn13dQbLzk5qv3PRiEEOduC+DLmkh64N9MJ+z/GFr23++KiZQk9qpJxekajJkY
         0KfA==
X-Forwarded-Encrypted: i=1; AJvYcCUxQz28sgM7YrEtT1yedMKoEFL8ER5LG8K9UkjRUjyiRAS9Qf+/IplFYBS29sga/JSgH+5n@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6X/YHbWIFwBTEmid2qJi3xJ4vLA/rSQaIsp2xe/GFxlay2riK
	qkEUMGHzjcMfQrPiVYG4KkiqiIjS5Mroq6hzC6KhrfOjAH2dLCewZZuU5Kn0h1Yqk6Ue7Pp1MlS
	7yfn32dERauqy4IUbvG5kqZxlpHE=
X-Google-Smtp-Source: AGHT+IFNljN6dwZlkogrdacVOY8k+lgMnJISEE8yVKjz9PNhP8aN8ZuhCudCHYoRMsLr1EPgwfyfZf3qjEWBYLSi1O4=
X-Received: by 2002:a2e:b889:0:b0:2ef:20ae:d113 with SMTP id
 38308e7fff4ca-2faf3d8a95emr9412991fa.40.1728036110938; Fri, 04 Oct 2024
 03:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-35-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-35-ardb+git@google.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 4 Oct 2024 12:01:39 +0200
Message-ID: <CAFULd4an+aN4iJ7T0DdMQDOBWrTZPJ4Oyy9ULm6R29fLNQND9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Specify the guard symbol for the stack cookie explicitly, rather than
> positioning it exactly 40 bytes into the per-CPU area. Doing so removes
> the need for the per-CPU region to be absolute rather than relative to
> the placement of the per-CPU template region in the kernel image, and
> this allows the special handling for absolute per-CPU symbols to be
> removed entirely.
>
> This is a worthwhile cleanup in itself, but it is also a prerequisite
> for PIE codegen and PIE linking, which can replace our bespoke and
> rather clunky runtime relocation handling.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/Makefile                     |  4 ++++
>  arch/x86/include/asm/init.h           |  2 +-
>  arch/x86/include/asm/processor.h      | 11 +++--------
>  arch/x86/include/asm/stackprotector.h |  4 ----
>  tools/perf/util/annotate.c            |  4 ++--
>  5 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 6b3fe6e2aadd..b78b7623a4a9 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -193,6 +193,10 @@ else
>          KBUILD_RUSTFLAGS +=3D -Cno-redzone=3Dy
>          KBUILD_RUSTFLAGS +=3D -Ccode-model=3Dkernel
>
> +        ifeq ($(CONFIG_STACKPROTECTOR),y)
> +                KBUILD_CFLAGS +=3D -mstack-protector-guard-symbol=3Dfixe=
d_percpu_data

Looking at:

> +        * Since the irq_stack is the object at %gs:0, the bottom 8 bytes=
 of
> +        * the irq stack are reserved for the canary.

Please note that %gs:0 can also be achieved with
-mstack-protector-guard-offset=3D0

Uros.
