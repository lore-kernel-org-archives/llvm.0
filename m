Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B22F28
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 22:01:19 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id t7so5883452ljc.10
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 14:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cOwd+xKfDb+D7R22x2j6Xg0Pm7V5Bcnv8frM7DHB9xc=;
        b=qKsj1zmJmC2rY8CmZCR0DCeZljuwB+1GIt7MSX+2QKBdlC2+BViC4sUv1bjz5ARufw
         hJgAlA/W4VOwD6dAz3cHxdqo7tBWIYVnoir/9uEY224JYvoyNYLfxkYCx8LyzlfWz0lA
         bj31FK2mXLBjF7KKOSt5d8+XdN4eQ6vQwe8cbZUvYeASzTIjousJwPMWo1ceQWFEifz0
         sVSNqXr9PtiOpb8QJ9UpuG+xpjgzreUqj3WoFo37jx3fu+SR9LUVMg08PpgM6nJ3Rahb
         13vOkA6Tt+t2kuHqc82flfDTgP2Au9cVCbB4Fx8fzUAbzP562SCKrRoGzHhqkIp3zKbs
         tlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cOwd+xKfDb+D7R22x2j6Xg0Pm7V5Bcnv8frM7DHB9xc=;
        b=aYLXZIF5kV6OL/Ns2/jgrmSHXzpYhwU3M/n7Acu5rg/+oSn19ewVIILwWOtaMTRrs8
         NYMMjGaZGJqd+odelpfVKfRuBHR0tozyOrlahiAnMePX8+KrkWzh7I/Cr38pXujQ1/Ki
         QArggo9UdyVECpzRX27sSwPJ+epf2wMIfLbGeWTKwdUPZoOZdAufPCWNBiIM01FjcJgP
         Ai5n7I+uWzTkUmVEBCxBQvsXlplW6RE1x7XoGACGncUaI5VjYbqjXXSODwIUY+jQ23G0
         JjFdW9jq/bYw93z/Dt6BNjRAWkHbqd7uCWRk/mI3kwKf2TPf/+f4z0xZDBx0BnGkBbsg
         dQ/g==
X-Gm-Message-State: AOAM530CIeDLiwEiEnLOqDDD7E7jviVGRRm1gHLcINYWj+RDgLFcxm4K
	yK3MEb1qtd7eg3EuThSsGJ6HI+Vj8HdvZeI+wqkwHA==
X-Google-Smtp-Source: ABdhPJzYUKomEFSrUBdXf5Ui2PKnaYfgpYNBueMKfPHNY8RPYyDrGoF0s3abGsoFXIZCiigrqziNFDooOPrV64adGU0=
X-Received: by 2002:a05:651c:3c7:: with SMTP id f7mr27644ljp.62.1643925677879;
 Thu, 03 Feb 2022 14:01:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203173307.1033257-1-keescook@chromium.org>
 <20220203173307.1033257-2-keescook@chromium.org> <CAKwvOdmzdQ+X2BsUbuVBWzFtaE2Vst4=ihNNR=LmOdozqQ5Ukg@mail.gmail.com>
 <202202031247.4F3AC598@keescook>
In-Reply-To: <202202031247.4F3AC598@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Feb 2022 14:01:06 -0800
Message-ID: <CAKwvOdnUHFi=1+9VxsfwxNAkTFEytg5FV=Aii7awSx+ioRaQbQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] Compiler Attributes: Add __pass_object_size for Clang
To: Kees Cook <keescook@chromium.org>
Cc: George Burgess IV <gbiv@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 3, 2022 at 12:58 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Feb 03, 2022 at 12:18:24PM -0800, Nick Desaulniers wrote:
> > On Thu, Feb 3, 2022 at 9:33 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > In order to gain greater visibility to type information when using
> > > __builtin_object_size(), Clang has a function attribute "pass_object_=
size"
> > > that will make size information available for marked arguments in
> > > a function by way of implicit additional function arguments that are
> > > then wired up the __builtin_object_size().
> > >
> > > This is needed to implement FORTIFY_SOURCE in Clang, as a workaround
> > > to Clang's __builtin_object_size() having limited visibility[1] into =
types
> > > across function calls (even inlines).
> > >
> > > Since any usage must also be const, include it in the macro.
> >
> > I think it might be helpful to quote the docs
> > (https://clang.llvm.org/docs/AttributeReference.html#pass-object-size-p=
ass-dynamic-object-size)
> >
> > >> Additionally, any parameter that pass_object_size is applied to must=
 be marked const at its function=E2=80=99s definition.
> >
> > One thing that's concerning to me is though:
> >
> > >> It is an error to take the address of a function with pass_object_si=
ze on any of its parameters.
> >
> > Surely the kernel has indirect calls to some of these functions
> > somewhere? Is that just an issue for C++ name-mangling perhaps?
>
> AFAIU, this shouldn't be a problem for any of these. Nothing is trying
> to take memcpy, memset, etc by address. The macro-ified version of this
> change proved that out. :)

I thought Sami had found a location where memcpy was invoked
indirectly as part of his kcfi work? Maybe I'm misremembering.

https://github.com/samitolvanen/linux/commit/46a777fb35784a8c6daf13d67de8bf=
b5148adc2a#diff-a27660992abdf360d01deac6364db31836d0d98b5d9573b7fc10a6785a6=
69975R16
--=20
Thanks,
~Nick Desaulniers
