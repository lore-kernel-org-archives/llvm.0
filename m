Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAE94DC9B
	for <llvm@lists.linux.dev>; Tue,  1 Aug 2023 16:51:10 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-63cfe6e0c32so41361476d6.1
        for <llvm@lists.linux.dev>; Tue, 01 Aug 2023 09:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690908670; x=1691513470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzryMjySR1ilIQJogkpEiq4/HKuChL2WRfawPAgdQ7I=;
        b=Ay6+nlDYEoqMNTybOc0KFFJlHBad2YSerfhdGyk+P162oTlZ4rSIxgYECnAFdPYfZC
         QjG9FYti6+ZPqeC6KTIB9NN1mRHYa/iKXOjEaMPTqUHcxrKqTpCW564dIxBmXL//A8HB
         MYYLwahJ9g/qa4y6sqbcgZzqyjvhy3P3TwvoWIiI/u6RAak/bqUI1YQutMdJSyEwSGZZ
         3m53lbPQUWxVPY2WtnTQvN0setYnWeBP/AdbOKatEHphdtAPQYOU4yIEt+Dvw4fJbN4M
         9SUWlcnv+BDLm5rqjYq9EzG4hsyBuRwioBV71s0xh0jrGkJ2LJLhD7KLn2h/XOJCN6Nc
         apeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690908670; x=1691513470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzryMjySR1ilIQJogkpEiq4/HKuChL2WRfawPAgdQ7I=;
        b=H/EnpsoSpmFtajiLxdbuNP+xep2Xsft/0l/9Uo0M3SJMVAdwIO70gSC7rqkH9+fvDp
         IMuT2eaLGXeX1aVXVhpz4qxJq81RAicS36kHSKsrD/msHhDbCgYamcmWCcd1TbjOIWpy
         KZJhBluMhPM6dXzZm1ugG9yeyzWtinkSvrtlYO81uQpfiPD3k5ZDqcpHI/GdH0YUP8Ue
         rH9jrKS0tXEm4jR2DRBBbNzVyOEnKhflU5WoBpI2kkGIsRFlRXjJWaOyEna25g22Q3nl
         MCRGBkw/qOkc9c0N+xYyIoFYXYtCnNrPbn3eT2gUYctJstSIC0oHtwI7uJ3YNpvRJwT2
         tHNw==
X-Gm-Message-State: ABy/qLZX5Q7jrb84qdOvKeOj5kiFAM8S/OxkdHdoTex8ECGR6B08BsdN
	oA9etGu8VII8A/q7Uub9sQTniKnlYs9vaE8GBjovdw==
X-Google-Smtp-Source: APBJJlFz/6BADrSwtiTVvMZa6M/4XOaJ8DJhEWR8hoAe1oALta5l1GpWPAUhN9QLDVEAM35A+giuSxBF3BNpkqI8xCs=
X-Received: by 2002:a05:6214:57cb:b0:63d:1aed:72ee with SMTP id
 lw11-20020a05621457cb00b0063d1aed72eemr13837966qvb.64.1690908669745; Tue, 01
 Aug 2023 09:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230728113415.21067-1-will@kernel.org> <20230728113415.21067-2-will@kernel.org>
 <CAK7LNATaXbGb7w=5xHtpVdPwcpm3iMPfzooABpftah1Sdw7ooQ@mail.gmail.com>
In-Reply-To: <CAK7LNATaXbGb7w=5xHtpVdPwcpm3iMPfzooABpftah1Sdw7ooQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Aug 2023 09:50:58 -0700
Message-ID: <CAKwvOd=BPCoib2zcMnnuw-S9T52CGXvJ3MXyTawurV7x2P_XqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] scripts/faddr2line: Use LLVM addr2line and readelf
 if LLVM=1
To: Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, John Stultz <jstultz@google.com>, linux-kbuild@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 29, 2023 at 1:48=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Jul 28, 2023 at 8:34=E2=80=AFPM Will Deacon <will@kernel.org> wro=
te:
> >
> > GNU utilities cannot necessarily parse objects built by LLVM, which can
> > result in confusing errors when using 'faddr2line':
> >
> > $ CROSS_COMPILE=3Daarch64-linux-gnu- ./scripts/faddr2line vmlinux do_on=
e_initcall+0xf4/0x260
> > aarch64-linux-gnu-addr2line: vmlinux: unknown type [0x13] section `.rel=
r.dyn'

^ old GNU binutils missing support for RELR relocation format.
https://maskray.me/blog/2021-10-31-relative-relocations-and-relr

> > aarch64-linux-gnu-addr2line: DWARF error: invalid or unhandled FORM val=
ue: 0x25

^ old GNU binutils missing support for DWARFv5

I suppose if someone used a new GCC with an old binutils, they could
observe the exact same errors.

> > do_one_initcall+0xf4/0x260:
> > aarch64-linux-gnu-addr2line: vmlinux: unknown type [0x13] section `.rel=
r.dyn'
> > aarch64-linux-gnu-addr2line: DWARF error: invalid or unhandled FORM val=
ue: 0x25
> > $x.73 at main.c:?
> >
> > Although this can be worked around by setting CROSS_COMPILE to "llvm=3D=
-",
> > it's cleaner to follow the same syntax as the top-level Makefile and
> > accept LLVM=3D1 as an indication to use the llvm- tools.
>
>
> Just a note.
> The top Makefile accepts not only LLVM=3D1
> but also LLVM=3D/usr/lib/llvm-16/bin/.
> The latter is useful when you want to use
> a particular version or a custom one.

Ah, like LLVM_PREFIX/LLVM_SUFFIX a la
commit e9c281928c24 ("kbuild: Make $(LLVM) more flexible")

Then we could have both UTIL_PREFIX+UTIL_SUFFIX.

>
> Another idea might be to use a generic '${prefix}'
> as this is not hooked to the Makefile,
> but I do not have a strong opinion.
>
>
>
>
> >
> > Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> > Cc: John Stultz <jstultz@google.com>
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  scripts/faddr2line | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/faddr2line b/scripts/faddr2line
> > index 0e73aca4f908..62a3fa6f6f59 100755
> > --- a/scripts/faddr2line
> > +++ b/scripts/faddr2line
> > @@ -58,8 +58,14 @@ die() {
> >         exit 1
> >  }
> >
> > -READELF=3D"${CROSS_COMPILE:-}readelf"
> > -ADDR2LINE=3D"${CROSS_COMPILE:-}addr2line"
> > +if [ "${LLVM:-}" =3D=3D "1" ]; then
> > +       UTIL_PREFIX=3Dllvm-
> > +else
> > +       UTIL_PREFIX=3D${CROSS_COMPILE:-}
> > +fi
> > +
> > +READELF=3D"${UTIL_PREFIX}readelf"
> > +ADDR2LINE=3D"${UTIL_PREFIX}addr2line"
> >  AWK=3D"awk"
> >  GREP=3D"grep"
> >
> > --
> > 2.41.0.487.g6d72f3e995-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada



--=20
Thanks,
~Nick Desaulniers
