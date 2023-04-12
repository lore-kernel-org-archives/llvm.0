Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E85B746F
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 18:14:06 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id q191so13946756pgq.7
        for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681323245; x=1683915245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQ31eEt6ZYO43YiugcfpSmhC+pVuzGTb6Zz9KcAavfM=;
        b=vPofuZHIlhfX+z2SNgprxinQozpSZBivzLioAa02Vh4CbOQvKruyUSng5BJb3+2x6m
         BWgKaeoklbSElYf8aVzcH7T7XATjsnAnebZHGs/LbFWCIR0Cn6Cer0rm8FPFWEY660wa
         zuY0hdsRCAfsQ3DBNg3SgqDGqYOZn2LDXcS4sYotY+nLwd0en1CjaBkQZRzE4EsVQ52/
         ku3rYsbfzwFQRMl/tbpEszdHABMWHU9/JG11CZcpTeDUeijH7s4u0GC/FuD+2X8zJZcr
         j7PBAHmX0gHOCJXW85/xp9wxxzZTCJC7iFkrzB2JvrObM5tqpw06FagdVai3X2VRH/vZ
         dXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681323245; x=1683915245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQ31eEt6ZYO43YiugcfpSmhC+pVuzGTb6Zz9KcAavfM=;
        b=XIXX5iYl9qjPPaqUcDc6DF0LU+3ulM2BGAJ0A+1aKCNgXKsjHWHkaFE9ntutTLkJAS
         IXi7flyN3/D0EISAnuzWuM9/0+sI4/oIpNET4eAej2q927kNYl42nV+BhkTU5KNJXz9A
         6Tp65V3y8Ekvus+yMoz5ZFcujWC16Brm9mfUiDhTDFUKeLlX4Ksr0J4YrFVdVBaR82bK
         tjPL9+vdns4yGbEEjNVzHzKclJ/KHfYZsUCeHfoHdpvl3ba8TCHq8cPiiquVFrTqz5qO
         IB9CVvB1y4QEqavJSL3kOXk9h2RuSZmEyLnnkQCM2WqgHx0BraO2pqezf42WPXX0c+jg
         O0JQ==
X-Gm-Message-State: AAQBX9eC9mjk8aUcvx6qEogFCnzHk/OtgMZBEnkZWUe0s8av4INsgQ+y
	UmnCidx3yO8ma/4of+5uYrSjaUWLnAR54iEK4ZIcNg==
X-Google-Smtp-Source: AKy350YqdV99jeX0kMzDXAbWTGOCcv8Rkwt8IAeySrgHWgkIMB5tfHY8Z+rwpBHb+G4KrRxgFc7ThZ7IXuy2tQXa+ro=
X-Received: by 2002:a63:a47:0:b0:513:90eb:a37c with SMTP id
 z7-20020a630a47000000b0051390eba37cmr840341pgk.11.1681323245458; Wed, 12 Apr
 2023 11:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407215406.768464-1-ndesaulniers@google.com>
 <20230407215824.GA1524475@dev-arch.thelio-3990X> <CAFP8O3+YzvwgeSS_GvU3oTtxunyUm8qMaAnV3Mt-ezTsxZ=Q0Q@mail.gmail.com>
 <6436ca47.a70a0220.e83cf.adf4@mx.google.com>
In-Reply-To: <6436ca47.a70a0220.e83cf.adf4@mx.google.com>
From: Fangrui Song <maskray@google.com>
Date: Wed, 12 Apr 2023 11:13:53 -0700
Message-ID: <CAFP8O3K2c-7wCeDrxPaFpNe-yV9M1g0BPQw7qA6JdpUD74dC1w@mail.gmail.com>
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-hardening@vger.kernel.org, 
	Tom Rix <trix@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miroslav Benes <mbenes@suse.cz>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 8:12=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Tue, Apr 11, 2023 at 05:12:24PM -0700, Fangrui Song wrote:
> > On Fri, Apr 7, 2023 at 2:58=E2=80=AFPM Nathan Chancellor <nathan@kernel=
.org> wrote:
> > >
> > > On Fri, Apr 07, 2023 at 02:54:06PM -0700, Nick Desaulniers wrote:
> > > > -fsanitize-undefined-trap-on-error has been supported since GCC 5.1=
 and
> > > > Clang 3.2.  The minimum supported version of these according to
> > > > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. D=
rop
> > > > this cc-option check.
> > > >
> > > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > >
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > As an aside, we should really consider having some standard format of
> > > comment around cc-option checks so that we can easily remove them whe=
n
> > > they become stale...
> > >
> > > > ---
> > > > Masahiro, Kees: get_maintainer.pl leaves much to be desired for thi=
s
> > > > file. Can one of you please pick this up?
> > > >
> > > >  lib/Kconfig.ubsan | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> > > > index fd15230a703b..0e7ad0782399 100644
> > > > --- a/lib/Kconfig.ubsan
> > > > +++ b/lib/Kconfig.ubsan
> > > > @@ -15,7 +15,6 @@ if UBSAN
> > > >  config UBSAN_TRAP
> > > >       bool "On Sanitizer warnings, abort the running kernel code"
> > > >       depends on !COMPILE_TEST
> > > > -     depends on $(cc-option, -fsanitize-undefined-trap-on-error)
> > > >       help
> > > >         Building kernels with Sanitizer features enabled tends to g=
row
> > > >         the kernel size by around 5%, due to adding all the debuggi=
ng
> > > > --
> > > > 2.40.0.577.gac1e443424-goog
> > > >
> > >
> >
> > -fsanitize-undefined-trap-on-error is a legacy option from 2013 when
> > -fcatch-undefined-behavior instead of -fsanitize=3Dundefined enabled
> > UBSan.
> > On the Clang side, http://reviews.llvm.org/D10464 added
> > -fsanitize-trap=3D in June 2015.
> > It's best to use -fsanitize-trap=3Dundefined and avoid uses of
> > -fsanitize-undefined-trap-on-error.
>
> But that's Clang-only. -fsanitize-undefined-trap-on-error works for both
> GCC and Clang.
>
> --
> Kees Cook

Just filed a -fsanitize-trap=3D feature request for GCC:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109489 :)

https://reviews.llvm.org/D10464 (2015) does mention the state of the
legacy option:

  // https://clang.llvm.org/docs/UsersManual.html#cmdoption-fsanitize-undef=
ined-trap-on-error
  -fsanitize-undefined-trap-on-error
  Deprecated alias for -fsanitize-trap=3Dundefined.





--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
