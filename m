Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843831C02
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 22:52:52 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-58fc4eaa04fso17102887b3.0
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 15:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693003971; x=1693608771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xMtqDbKxEwCzgnyNbVs2sMz5QqO99bNAeKAJBAO7ac=;
        b=owun0nYHfvLTp02HwjgYJCJKKexvJCKZ8eEpK/3Pa51NHe3qKpAz3uJHyuIsFuWBSL
         s8prQQagkZbq4lBh+Vb/qil5pGBOTceukyQpNn+SD480sQl3YIzE7pWG+7PyQFayvM+q
         8WhSikpJegzXr+eu+3QY4wqY5bofpo+TgaSgHtXLMN9rXyi934cymNwNw9mcN4psAFWD
         e6f6ePwPhTMBdPi1PLhDF1EKPIiLG7c4lp2fpy4/uNrHVrx6SEkFbm3ooIXfahBbkNiy
         QMesI7AF4+yAjxNNYdcaaCLhrNDpo9mP6TPiCb9GW8Si7JtKP8EohgzrmuPP0u2RCpPh
         cQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693003971; x=1693608771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xMtqDbKxEwCzgnyNbVs2sMz5QqO99bNAeKAJBAO7ac=;
        b=iOQq7JPWmcWvqnY+bmsvHj6WbeiygowwVEts1DbgmAT/oBl/waWBH2/pYqvGOLzAO8
         bD0babKj5wOEmgyYEBGo8er5SZEnh3qpdPpwY1/BrNCVJuScjZrFZHJB7cdvZkCAxDYe
         Kl8GKWbpa0VvqyU0iuG5JUL9Jl7BC7d4OdTMdi2+br5WtPqvtJDvEhxebJeOOoNgYydq
         GwQ9brepygcVkLutWAR8jgPrHVfC6I8Y5iM86Kt9QL4E9TTtm2N5JKjtU3lhcZgPIBh0
         CrKbwXWyKb4xD6HPjxKY8OwXdUoOvg70Mda/EP2XHX9wNCH7Sv10+m0vsAwB3xUijZjx
         ZFjA==
X-Gm-Message-State: AOJu0Yyqmky9XeQI0h6Yf0Q4JRXMkyBGFJs3ME8zoItxjYRZrUwTowxh
	o4XGLBv6nXzq6N3ANUpsBNx0197/LTwA89RfVGK62w==
X-Google-Smtp-Source: AGHT+IHXxCQJZoZx8m6MeDZFbASI/p7xgZwgm0CtAj9gMwK5eTjmcUc8UZWXJ+fjed0ebk0B7L3wKLDrCavAO/UrWKw=
X-Received: by 2002:a0d:d4d5:0:b0:579:ec06:eb3d with SMTP id
 w204-20020a0dd4d5000000b00579ec06eb3dmr22215439ywd.21.1693003971054; Fri, 25
 Aug 2023 15:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
 <ZOkofUzv6t9lXyN+@shikoro> <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>
In-Reply-To: <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Aug 2023 15:52:39 -0700
Message-ID: <CAKwvOd=1otHgNkJf7wBajDrGmRNQduvR5ie_XgJMPPWT6+n_mQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: pxa: fix clang -Wvoid-pointer-to-enum-cast warning
To: Justin Stitt <justinstitt@google.com>
Cc: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 3:49=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> On Fri, Aug 25, 2023 at 3:17=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wro=
te:
> >
> >
> > > Note: I think something like this may be more readable:
> > > |     *i2c_types =3D (enum pxa_i2c_types)(uintptr_t)of_id->data;
> > >
> > > Thoughts on this approach against the one present in this patch?
> >
> > On the one hand, I think this is more explicit and, thus, more readable=
.
> > On the other hand, we still have the loss of precision, between the
> > first and the second cast. Which gives it a bit of a "let's hide it
> > somewhat so the compiler will be happy" feeling?
> >
> There was some discussion [1] wherein it was ultimately decided that
> this warning should probably be turned off (contrary to what the title
> of the GitHub issue says).
>
> The state of these patches [2] is in some sort of limbo until I get a
> patch in to disable the warning from W=3D1 (keep in mind GCC doesn't
> even support this specific warning). I want to make the patch but am
> seeking some guidance about what exactly is to be done -- I feel a
> simply _demotion_ from W=3D1 to W=3D2 would suffice as CI robots aren't
> testing w/ that AFAIK.
>
> Nick, do you have anything to add here as we had previously discussed
> this off-list/IRL.

Mostly that we should make -fsanitize=3Denum not totally suck (i.e.
actually do anything for C code, then check for bad conversions from
values that aren't valid enumeration values including truncations),
then disable this warning in favor of folks testing with that
sanitizer enabled.

>
> [1]: https://github.com/ClangBuiltLinux/linux/issues/1910
> [2]: https://lore.kernel.org/all/?q=3Db%3Apointer-to-enum-cast



--=20
Thanks,
~Nick Desaulniers
