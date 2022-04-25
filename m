Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AC7C
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 07:42:37 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id f38so25509996ybi.3
        for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 00:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FzWf0IlKm0WlWwUvnTwOql8/+3g8LAVAbjzV5OJCv40=;
        b=PSPngd2YV1sJKKgVWUbQ6v2W3ZD29fU2TyGjNS0kmscsz9hLHZ/VGLTnBmhkfG/hyi
         vY+UkBWGuaA1khsvUoDaszlcnC9OOH5BsnbsawjU0vWsM02h7WlRRSRIy8cCukl4SdGi
         vQ7mYqP4YaQFk38alLvTbzLv3FVd/K+yi7TbQzztJvRb1unFILiCVdIhw67YFs0UERoo
         E6k9+OzDCsvHvIs0V40ywrdXptM4uezsGB6aL6KGZWl0V8jGvS4Mm/A3x1N2AYqYsWpg
         bveNjDxN1Vh3nt3rdOTKC2rmHjuvhNNFrNNw/Ltx5BvpVDfU7QGquuVAtXY+5JOqTdJ9
         fl0A==
X-Gm-Message-State: AOAM533jzSpNMPb+nQYi8rSsvoCyZevGngn2qxR226Va3CXFIvuM2ayD
	z4VvdX66f5BOQONjTwGEnpc4PQdWmkK1Jwig6Do=
X-Google-Smtp-Source: ABdhPJxoquitjR/CgWqxiQggvdjEfLTVH93JgWAsDE1w9KXG5pEboj4HBXfMD3vXswPoWKwRsD9CYDzZyIRa9lbYoN4=
X-Received: by 2002:a25:df0a:0:b0:648:6364:a150 with SMTP id
 w10-20020a25df0a000000b006486364a150mr3606038ybg.381.1650872556572; Mon, 25
 Apr 2022 00:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422151725.1336997-1-mailhol.vincent@wanadoo.fr>
 <YmXMiTXEvFXZ/swU@dev-arch.thelio-3990X> <CAMZ6Rq+3XOze01dZZRTe+V44N2uo5J_=rtd9bKH7d7Fq9sNxVw@mail.gmail.com>
 <CAK8P3a31WAyh_vLqNwvv2GMcZ8SQp7gC=OV8c=Nc9pBtOSR8-g@mail.gmail.com>
In-Reply-To: <CAK8P3a31WAyh_vLqNwvv2GMcZ8SQp7gC=OV8c=Nc9pBtOSR8-g@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Mon, 25 Apr 2022 16:42:25 +0900
Message-ID: <CAMZ6RqL8G4uVn--Y5pBC+_c9Ex3Sjf8OJuVRwkVFFPwWd_ezLQ@mail.gmail.com>
Subject: Re: [PATCH] checksyscalls: ignore -Wunused-macros
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon. 25 Apr 2022 at 15:50, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Apr 25, 2022 at 8:17 AM Vincent MAILHOL
> <mailhol.vincent@wanadoo.fr> wrote:
> > On Mon. 25 Apr 2022 at 07:17, Nathan Chancellor <nathan@kernel.org> wro=
te:
> > > Hi Vincent,
> > >
> > > On Sat, Apr 23, 2022 at 12:17:25AM +0900, Vincent Mailhol wrote:
> > > > The macros defined in this file are for testing only and are purpos=
ely
> > > > not used. When compiled with W=3D2, both gcc and clang yield some
> > > > -Wunused-macros warnings. Ignore them.
> > > >
> > > > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > >
> > > The change itself looks fine but a couple of comments:
> > >
> > > 1. Nick and I do not pick up patches, we rely on others to do so.
> > >    Additionally, this is not really something within our domain, desp=
ite
> > >    what get_maintainer.pl might say. This change should be sent to
> > >    either
> > >
> > >    Masahiro Yamada <masahiroy@kernel.org>
> > >    linux-kbuild@vger.kernel.org
> > >
> > >    or
> > >
> > >    Andrew Morton <akpm@linux-foundation.org>
> > >
> > >    so that it can be applied by one of them.
> >
> > Ack. As you pointed out, I indeed just followed get_maintainer.pl.
> > I will resend a v2 to the people you pointed out (and exclude you).
> >
> > > 2. I am not sure that silencing warnings from W=3D2 is that useful, a=
s
> > >    they are unlikely to be real issues. Not to discourage you by any
> > >    means but it might be more useful to focus on cleaning up warnings
> > >    from W=3D1 and getting those promoted to regular build warnings.
> >
> > Normally I agree, but there is one reason to fix this W=3D2: this
> > warning appears when building other files.
> >
> > Example:
> > | $ make W=3D2 drivers/net/dummy.o
> > |   CALL    scripts/checksyscalls.sh
> > | <stdin>:21: warning: macro "__IGNORE_stat64" is not used [-Wunused-ma=
cros]
> > | <stdin>:22: warning: macro "__IGNORE_lstat64" is not used [-Wunused-m=
acros]
> > | <stdin>:75: warning: macro "__IGNORE_llseek" is not used [-Wunused-ma=
cros]
> > | <stdin>:159: warning: macro "__IGNORE_madvise1" is not used [-Wunused=
-macros]
> > (rest of the output redacted).
> >
> > When I run W=3D2, I want to only see the warnings of the file I am
> > working on. So I find it useful to fix the W=3D2 warnings which
> > show up when building other files to not get spammed by
> > irrelevant issues and to simplify the triage.
> >
> > My initial message lacked the rationale. I will add additional
> > explanations in the v2 of this patch.
>
> I agree this is worth fixing if we want to make W=3D2 have any meaning at=
 all.
>
> Your approach is probably fine. We could try to improve this by comparing
> against the list from include/uapi/asm-generic/unistd.h instead of the i3=
86
> list. I suppose that would involve rewriting the script into a simpler on=
e,
> but I'm not sure if anyone has an interest in working on this.

If someone wants to do it, great, but I do not have the
confidence to do it myself so I hope you will forgive me for
taking a pass here.

Another alternative I considered was to only call
checksyscalls.sh when doing a 'make all'. This way, we keep the
warning but people won=E2=80=99t be spammed when building sub projects
because the script would not be executed.

I tried to be as less disruptive as possible. Unless people show
interest in one of the alternative approaches, I will keep using
the -Wno-unused-macros approach in the v2.

> diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
> index 9dbab13329fa..cde15f22ec98 100755
> --- a/scripts/checksyscalls.sh
> +++ b/scripts/checksyscalls.sh
> @@ -255,6 +255,7 @@ cat << EOF
>  /* 64-bit ports never needed these, and new 32-bit ports can use statx *=
/
>  #define __IGNORE_fstat64
>  #define __IGNORE_fstatat64
> +

Just realized that I added a new line for no reason.
This will be removed in v2. Sorry.

>  EOF
>  }
>
> @@ -268,4 +269,4 @@ syscall_list() {
>  }
>
>  (ignore_list && syscall_list $(dirname $0)/../arch/x86/entry/syscalls/sy=
scall_32.tbl) | \
> -$* -Wno-error -E -x c - > /dev/null
> +$* -Wno-error -Wno-unused-macros -E -x c - > /dev/null
> --
> 2.35.1

Yours sincerely,
Vincent Mailhol
