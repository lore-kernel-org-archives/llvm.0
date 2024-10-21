Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077F11FE110
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 23:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729553304; cv=none; b=OCVGa2VjWGt5lHTYv1fOiLYIWwymlL/0ReJMAn4kCH7QVg8sT1jkhEpEY0kmw47xGDw4t68l5WKPp9fu0gGPVeVbJRXP0VSM5z7I77DJR2HRQ1OMwpA+TkqpQAp9AV9rejeNeDIQGhCliRVGiV+1U+tQ6/jchkzkf1QdYfVOorY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729553304; c=relaxed/simple;
	bh=Zff+RWbA2FT88lk3jSWQqGKGPHCgQFk2oW3h5uX7IeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0bxlHo0f9PkXCPj8RyH9d3U5sJqcnMUlzgWByYxljYp37E2kGf7po4AbLolV9rZ7wNM4HLEqtUbiqKv3txeBqrmToDXAehmrOsSGsYsBWKKdsKx4GkYY1d20NhbuK36m++zwSN1NlalSAqQfsFoB1MAOiN98BjH48SEDa3grDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1fTvawko; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1fTvawko"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4608dddaa35so150381cf.0
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 16:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729553301; x=1730158101; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7g9rImT4RZY0eWuCNKQmXqLXLyfWgLkLWLrUC8CYD4=;
        b=1fTvawkok9lJjoSWP8qGDZCZuq2vTkSd09Sr770KLmlOqp07a7qgSJExPpjxkIq0vT
         EHsIzG0/gz3fTJQlxA0K8GUqOVr4zVGLRjnwsD2k7snInWNl3lqmtLHvfzCcbeIgpFHf
         A6R4842/BdliMh9nU3PastMxe+K12+X2tiXF2xhV5Mj0zmicn+Kq1gHwUoLJ3PCGRGdw
         diDbzZTc1mRFxFc3KhZVSRaT9zW6yVMAvF3E8n7+j73GMoRBupPpMe6tir2Ii5U33t8f
         6janhsAeCtaAK+FVdDkQAB+xPVzRYZn5y4RqCP9ec9eaemfsKB15R3gFB0WPktRWkSRq
         4ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729553301; x=1730158101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7g9rImT4RZY0eWuCNKQmXqLXLyfWgLkLWLrUC8CYD4=;
        b=qvCeFT4zeHo285LMNTZhMberQqm/elHAR/5ygH98ZhXGzf4y6bvaTVL+7HyPgdWVBm
         9tlwvh/Hx7fSQdPa7ZXLmekYyxXH/h/i251KdiazkV9jiihgpY0DO+R9N0ar4lj/X08j
         QZmw87Nqu3m9f/2aZoS34W9mhwReRXxWSBvTlzJHizyUi1J9SHp3o2ADOE/Zkg/PWf0x
         K4RRCtZJGNg4ebqFdrA8k6wr8gaCnxzYGKJvAHBnMtEhUHlpXgZ+aKHyBqzDNrBTyOgf
         z0lXaxvQPTRIPKSiYQnwhgxqrH99cb2VvUmtcYpFBF5XBex+Ld4B+5xK8XVs54iOKGBb
         QI+A==
X-Forwarded-Encrypted: i=1; AJvYcCWMvHBQSoire703S+rrJTosEilmwvObH1ZRnFFaGOe4lhQiV3DqOU7sCIRjambYn0ppmsb0@lists.linux.dev
X-Gm-Message-State: AOJu0YxMO9LhiZ1/565w7oCTME8SxwsZdMkLJHfdA9LB5KOXt/4tPzS5
	Dw+CugrhCKsBrd7UdOV67eUgnGGSKNaXhTxNS8jHWiMCOUiajwS5P6R7bxx9HWaIyCXhYRn7G31
	5Ok8s8WNJvmgx3LQpTJMQHZfL88NCPxGQWTkm
X-Google-Smtp-Source: AGHT+IHlHILW/VtCMnIvRhHu4MUnVCebk8xwRyaArpHaBD/sb8cKitt+/rPJqdaQ95G0uL5u4b+WEZY+T68Iy0r6+2Q=
X-Received: by 2002:a05:622a:303:b0:460:f093:f259 with SMTP id
 d75a77b69052e-46100b89943mr1430991cf.22.1729553300622; Mon, 21 Oct 2024
 16:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-6-xur@google.com>
 <CAK7LNAQ0RwJYkCXHj8QMH3sqXgY2LBTiYV8HnKD8oANB8Bb+Yg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ0RwJYkCXHj8QMH3sqXgY2LBTiYV8HnKD8oANB8Bb+Yg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 21 Oct 2024 16:28:07 -0700
Message-ID: <CAF1bQ=RuLmO9S1W6ofmgVQZR7pBqR3iN7gCuUO2TkwGQwM76Kw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] AutoFDO: Enable machine function split
 optimization for AutoFDO
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2024 at 8:18=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Tue, Oct 15, 2024 at 6:33=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > Enable the machine function split optimization for AutoFDO in Clang.
> >
> > Machine function split (MFS) is a pass in the Clang compiler that
> > splits a function into hot and cold parts. The linker groups all
> > cold blocks across functions together. This decreases hot code
> > fragmentation and improves iCache and iTLB utilization.
> >
> > MFS requires a profile so this is enabled only for the AutoFDO builds.
> >
> > Co-developed-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Rong Xu <xur@google.com>
> > Suggested-by: Sriraman Tallam <tmsriram@google.com>
> > Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 6 ++++++
> >  scripts/Makefile.autofdo          | 2 ++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vm=
linux.lds.h
> > index ace617d1af9b..20e46c0917db 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -565,9 +565,14 @@ defined(CONFIG_AUTOFDO_CLANG)
> >                 __unlikely_text_start =3D .;                           =
   \
> >                 *(.text.unlikely .text.unlikely.*)                     =
 \
> >                 __unlikely_text_end =3D .;
> > +#define TEXT_SPLIT                                                    =
 \
> > +               __split_text_start =3D .;                              =
   \
> > +               *(.text.split .text.split.[0-9a-zA-Z_]*)               =
 \
> > +               __split_text_end =3D .;
> >  #else
> >  #define TEXT_HOT *(.text.hot .text.hot.*)
> >  #define TEXT_UNLIKELY *(.text.unlikely .text.unlikely.*)
> > +#define TEXT_SPLIT
> >  #endif
>
>
> Why conditional?

The condition is to ensure that we don't change the default kernel
build by any means.
The new code will introduce a few new symbols.

>
>
> Where are __unlikely_text_start and __unlikely_text_end used?

These new symbols are currently unreferenced within the kernel source tree.
However, they provide a valuable means of identifying hot and cold
sections of text,
and how large they are. I think they are useful information.

>
>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
