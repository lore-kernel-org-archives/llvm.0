Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5D160
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 00:12:36 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id g3so10942024pja.2
        for <llvm@lists.linux.dev>; Tue, 11 Apr 2023 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681258356; x=1683850356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUfNHvgbMHbCxR7Z5ej0J4OW6YiW5Ee09V0uQZNWLuA=;
        b=yRuWuTRhiWx3XwFpc57Ol2M1IPyVrYtxZC3LJYOl+z6YsIP1MVABRg2+I1SYgCvB5r
         9ma9A/JibUHa8FeY439yp5Z1o59QK0Jr36B5oqQWOJiPUjdfX83Yl8tuXtbQFh6gLWR8
         dwnI3QGeP/PgL/C7Bi7zDPqNmKSIwYahqjJxsklqdeVWzEfsf3VWL64TZmkx+pwkwv7a
         gY7m98i6jaFqo3atHGNZpP8nwW4Vil4325RnsXUn1l8VDrF2qkisVY/7Id5ooJQIC4gk
         6zn380pEKuZ0vlDDYZsLg2fIGhtIJ61YuSVuQnxwtUt/6ag6cQGbY825Ls8Jf7Edy4hD
         ff9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681258356; x=1683850356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUfNHvgbMHbCxR7Z5ej0J4OW6YiW5Ee09V0uQZNWLuA=;
        b=5deya+nldFMus4ym02T0DT3csI7HIweTMVXg3toAdKsAbezxTkY0WgSJw3dz36ZQUX
         XzD5V2DE8tuWpmPMmlyQT69b47Bqg1VxKGoqathMK/saN4F2KhDh+Tij3OwMTBQxjtsq
         xFjFHcNlWIxtDJISxGGwkbZN3eq8DmCPhE+MDCX9keaGyl0gM3i247V1acXeXRX08/gk
         bZskwKIXC0aUWZxrkLaq0sufFSuqijhJT/iiSegVaxbYVjzxhPwXwtJed0ozwZldvK0P
         oI4pBjL9Wqph6kXjDUaDRFQWqH/GBBM/lNBRUS+4VtyzUxoqXGKUQw/kAinrsAwMpmcE
         JGPQ==
X-Gm-Message-State: AAQBX9d4WXGRsUY3TBZNXATuNcW8JQRiFXo9XOBSAnJsJ6y3k+M3ZU1U
	2xPo093/gN/vD5Io6fGSDNvv6lX/IDJiVYs097wWig==
X-Google-Smtp-Source: AKy350a6v0Bzy8uTYnPo43Z1a0p7U8LI2dM7an6ki1cKagG6JpglxhSHLcrBIVpCj5q+AYqQphGmoJQ/Nqm5Pnc108M=
X-Received: by 2002:a17:90b:3641:b0:244:987c:a873 with SMTP id
 nh1-20020a17090b364100b00244987ca873mr4635662pjb.7.1681258355815; Tue, 11 Apr
 2023 17:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407215406.768464-1-ndesaulniers@google.com> <20230407215824.GA1524475@dev-arch.thelio-3990X>
In-Reply-To: <20230407215824.GA1524475@dev-arch.thelio-3990X>
From: Fangrui Song <maskray@google.com>
Date: Tue, 11 Apr 2023 17:12:24 -0700
Message-ID: <CAFP8O3+YzvwgeSS_GvU3oTtxunyUm8qMaAnV3Mt-ezTsxZ=Q0Q@mail.gmail.com>
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-hardening@vger.kernel.org, 
	Tom Rix <trix@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miroslav Benes <mbenes@suse.cz>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 2:58=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Fri, Apr 07, 2023 at 02:54:06PM -0700, Nick Desaulniers wrote:
> > -fsanitize-undefined-trap-on-error has been supported since GCC 5.1 and
> > Clang 3.2.  The minimum supported version of these according to
> > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Drop
> > this cc-option check.
> >
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> As an aside, we should really consider having some standard format of
> comment around cc-option checks so that we can easily remove them when
> they become stale...
>
> > ---
> > Masahiro, Kees: get_maintainer.pl leaves much to be desired for this
> > file. Can one of you please pick this up?
> >
> >  lib/Kconfig.ubsan | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> > index fd15230a703b..0e7ad0782399 100644
> > --- a/lib/Kconfig.ubsan
> > +++ b/lib/Kconfig.ubsan
> > @@ -15,7 +15,6 @@ if UBSAN
> >  config UBSAN_TRAP
> >       bool "On Sanitizer warnings, abort the running kernel code"
> >       depends on !COMPILE_TEST
> > -     depends on $(cc-option, -fsanitize-undefined-trap-on-error)
> >       help
> >         Building kernels with Sanitizer features enabled tends to grow
> >         the kernel size by around 5%, due to adding all the debugging
> > --
> > 2.40.0.577.gac1e443424-goog
> >
>

-fsanitize-undefined-trap-on-error is a legacy option from 2013 when
-fcatch-undefined-behavior instead of -fsanitize=3Dundefined enabled
UBSan.
On the Clang side, http://reviews.llvm.org/D10464 added
-fsanitize-trap=3D in June 2015.
It's best to use -fsanitize-trap=3Dundefined and avoid uses of
-fsanitize-undefined-trap-on-error.



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
