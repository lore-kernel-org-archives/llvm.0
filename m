Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D86E581
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sAkO2DIk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3332ad5b3e3so84579f8f.2
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 13:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701810871; x=1702415671; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb9GJhgKgkRI3jsH9IhBCRgWeg/UhW5Tj812rINOCFM=;
        b=sAkO2DIk6BMT+UA6LC42uePw1pke4OIaxmjmP2utXqDaNQecpl35z/qTa7VhVeVkKc
         k3Kv5zq05B3PEjnaIReub1m/R1hjJoDwTCm0ady3gCcKuD9XOFkPPV9+Oo0/XRAFLaS4
         jm8d+uqq+aivGLiSv+9RVsWRuyhs+zXHzw+tapsKjozTvMBxrehbfBFOzsUsjyfez1UN
         LMuBCBFzMcwEp3VJMlugIySJ2FcaYiVyr6EmpC+zbhAgQqAnXk34NJ/YuKC3AMYNv0ux
         AzqIXQh+YUx824f2dbcHNTxjXAjuEzkt6McSsCBhlcBwaf4uDgdmzmkobFTEKWwjF73y
         0/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701810871; x=1702415671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xb9GJhgKgkRI3jsH9IhBCRgWeg/UhW5Tj812rINOCFM=;
        b=n6Ua5ozO0l+cf9vCvOhfm245EL5lb5/9s7KWF8L78rjYsAjuJm1RvmYkNJEOhpFNwN
         eBPMninteFYK+4oXpFucBihS9HhWZ1RXaQx/wzdKrE/kUYvi9dP67EWrvjW+hEZixF1V
         liVAM3rNANmed/6wbmea9yXdw92A5B2EqezgEWZR1jvGkE+SehNtuVUvJAuEP8O0tP2s
         ix6V4nTk4B35j84zUr+HWHWxDVm/vnhsUaxPjwWS0qRzsMMoxHWFoXGnXiuGQnoyObTE
         CRUUNmx4nakYoZADA/7KHm+pZNmQ5AOyHwBlzrOM5kMDOdrnq8rbuGY2Zu/7CNxMymji
         Uhjw==
X-Gm-Message-State: AOJu0YxvOhiZuxcsjFbFsgUDNX+70quLrcQfbtA0qgLXzFv5hVG21h7q
	2SNhItMunr8OWFZqjLTo2y5UlqzOAx7bY5Mh8f8Qcg==
X-Google-Smtp-Source: AGHT+IFtwZSJqg8gvuxWPu2/HOAjM4Hs0ORK9NX8PQalweoM2W2+Tz3HLyv4QgDmB4awRlvW031nTSk916w+pJBzDzY=
X-Received: by 2002:a5d:51c2:0:b0:333:2fd2:51f0 with SMTP id
 n2-20020a5d51c2000000b003332fd251f0mr4397193wrv.105.1701810871355; Tue, 05
 Dec 2023 13:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com> <20231205130449.8e330a26ecbed1f7b5ad5d7a@linux-foundation.org>
In-Reply-To: <20231205130449.8e330a26ecbed1f7b5ad5d7a@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Dec 2023 13:14:16 -0800
Message-ID: <CAKwvOdn+VTM+LY6ALcgaZTL57JpiKt5rBPMSPNXsgS3MCENhDQ@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Andrew Morton <akpm@linux-foundation.org>
Cc: tanzirh@google.com, Kees Cook <keescook@chromium.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 1:04=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Tue, 05 Dec 2023 20:58:53 +0000 tanzirh@google.com wrote:
>
> > This diff uses an open source tool include-what-you-use (IWYU) to modif=
y
> > the include list changing indirect includes to direct includes.
> > IWYU is implemented using the IWYUScripts github repository which is a =
tool that is
> > currently undergoing development. These changes seek to improve build t=
imes.
> >
> > This change to lib/string.c resulted in a preprocessed size of
> > lib/string.i from 26371 lines to 5232 lines (-80%).
> >
> > If there are any problems with the output of the tool please raise an
> > issue on the github.
> >
> > Link: https://github.com/ClangBuiltLinux/IWYUScripts
>
> Issue:
>
> > --- a/lib/string.c
> > +++ b/lib/string.c
> > @@ -16,16 +16,16 @@
> >
> >  #define __NO_FORTIFY
> >  #include <linux/types.h>
> > +#include <asm/bitsperlong.h>

Thanks for the quick feedback.  For additional context, Tanzir is my
intern working on getting IWYU working on the kernel.  Welcome Tanzir
to LKML!

>
> The preferred way to import bit-fiddling stuff is to include
> <linux/bits.h>.  Under the hood this may include asm/bitsperlong.h.  Or
> it may not, depending on Kconfig settings (particularly architecture).
>

Just triple checking my understanding; it looks like
include/linux/bits.h unconditionally includes asm/bitsperlong.h (which
is implemented per arch) most of which seem to include
asm-generic/bitsperlong.h.

include/linux/bits.h also defines a few macros (BIT_MASK, BIT_WORD,
BITS_PER_BYTE, GENMASK, etc).  If lib/string.c is not using any of
those, why can't we go straight to #including asm/bitsperlong.h?  That
should resolve to the arch specific impl which may include
asm-generic/bitsperlong.h?
--=20
Thanks,
~Nick Desaulniers
