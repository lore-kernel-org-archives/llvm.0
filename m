Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899597468
	for <llvm@lists.linux.dev>; Tue,  7 Feb 2023 18:01:33 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so15822035pjb.5
        for <llvm@lists.linux.dev>; Tue, 07 Feb 2023 10:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZduzSQedcfK0VkSdKK8LkGwE1Lav/aAuVJtPsAz85U=;
        b=OBxGFk75lDiGUlUvrFhIHJPcRAslCw/EEvSQNDBB5YCIzMHVA4EnksKV25d5GBa8T9
         dFS19YdvdlPngB22IpK6355pvCbZS88YSXZJn0ypE20zzdLdc3hFS7GLG9O2Oi6SBDZr
         iX8gB/ssqdae0nsogt7pu+1nXVASgEzoB3iba34bqufCITrZzBbSUG72BPS1U/xt4PMm
         ZvdfoPHZ8gwvGgVZ8ryLTePkyRraoiOf8yX2ucJpoHts2vqjlVXcdjCZI1HRRTIdUqEJ
         I07rC4JoFiNgx1KV8OsL+j5niabSt3T/7hR+ulfJikexep4XdQnX2OIPRZ7KcZnGiE4h
         yBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZduzSQedcfK0VkSdKK8LkGwE1Lav/aAuVJtPsAz85U=;
        b=IGeHgEMLSCOBH+HLqaUeYdxbDeicEY5ovi+adxTjLe6blgf5BzUJQLz1lwnmsXv3o3
         9sZgFiqJhzLsVDKjQg9hVBriPo0bJmKOjYBUNgWLaadE/ziCItj7ieww1ikAnSbLMOrm
         qH91SMvOPq7SRJYSUDkjYat+1NgN5mVKFbSyGaBRTr8ek/wvmQw4nwHXxqII1jK96aRr
         eC4kuN66+JhNjXNZZnuIYwlvYnEf6OWq9yP9uJUSvvxr+5ZKrFrmh0ZP31WZDOJQPaBH
         WTGjtd6EHzoh/05Pbf9c0gaY1Qlfm2lIrjpN5IWLTBWDQMYxKd2nYaO8QcnrXWRE0cfj
         FMTQ==
X-Gm-Message-State: AO0yUKUZ6/v5zYqHYiV5k0onjOlWrfur7CK7ZnuqZkLjoiytnLCZ+t0D
	vy45VxtFxcglWuAIOB5GNbzOHoUD4x1sDNYvCFaJ1Q==
X-Google-Smtp-Source: AK7set/5/7deqTUQyO/sBNCbUgkmz7QmmOIK18S7lNp32mxnhOYV8HOSgp8+KUAArWSXjr58XkSfzZwy3swzWUzfUDI=
X-Received: by 2002:a17:903:555:b0:196:14ea:d3c6 with SMTP id
 jo21-20020a170903055500b0019614ead3c6mr923273plb.20.1675792892586; Tue, 07
 Feb 2023 10:01:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230203194201.92015-1-ebiggers@kernel.org> <63deacb1.170a0220.f078.6779@mx.google.com>
 <CAFP8O3Kwa2V7GvJPEbr87o6hMi8i2JquWniFOaiFR3nv9pGc_g@mail.gmail.com>
In-Reply-To: <CAFP8O3Kwa2V7GvJPEbr87o6hMi8i2JquWniFOaiFR3nv9pGc_g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Feb 2023 10:01:21 -0800
Message-ID: <CAKwvOdm8F_VcdegPGw3vPu+-H1Gyh0rqQWpf=+Yh9YAowVuWSA@mail.gmail.com>
Subject: Re: [PATCH] randstruct: temporarily disable clang support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2023 at 3:41 PM Fangrui Song <maskray@google.com> wrote:
>
> On Sat, Feb 4, 2023 at 11:06 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Fri, Feb 03, 2023 at 11:42:01AM -0800, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > Randstruct with clang is currently unsafe to use in any clang release
> > > that supports it, due to a clang bug that is causing miscompilations:
> > > "-frandomize-layout-seed inconsistently randomizes all-function-point=
ers
> > > structs" (https://github.com/llvm/llvm-project/issues/60349).  Disabl=
e
> > > it temporarily until the bug is fixed and the fix is released in a cl=
ang
> > > version that can be checked for.
> > >
> > > Fixes: 035f7f87b729 ("randstruct: Enable Clang support")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >  security/Kconfig.hardening | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> > > index 53baa95cb644..aad16187148c 100644
> > > --- a/security/Kconfig.hardening
> > > +++ b/security/Kconfig.hardening
> > > @@ -280,7 +280,8 @@ config ZERO_CALL_USED_REGS
> > >  endmenu
> > >
> > >  config CC_HAS_RANDSTRUCT
> > > -     def_bool $(cc-option,-frandomize-layout-seed-file=3D/dev/null)
> > > +     # Temporarily disabled due to https://github.com/llvm/llvm-proj=
ect/issues/60349
> > > +     def_bool n
> > >
> > >  choice
> > >       prompt "Randomize layout of sensitive kernel structures"
> > >
> > > base-commit: 7b753a909f426f2789d9db6f357c3d59180a9354
> > > --
> > > 2.39.1
> >
> > This should be fixed with greater precision -- i.e. this is nearly fixe=
d
> > in Clang now, and is likely to be backported. So I think we'll need
> > versioned checks here.
> >
> > --
> > Kees Cook
> >
>
> Bill has requested cherry-pick the llvm-project fix into the
> release/16.x branch [1].
> https://github.com/llvm/llvm-project-release-prs/pull/276
> It may take one day to land.
>
> [1]: https://github.com/llvm/llvm-project/tree/release/16.x
>
> --
> =E5=AE=8B=E6=96=B9=E7=9D=BF
>

All landed; the version check should be for 16+. (And the link to the
issue report would be nice to retain).
--=20
Thanks,
~Nick Desaulniers
