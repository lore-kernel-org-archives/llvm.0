Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1D539E;
	Fri, 26 May 2023 07:04:18 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b9daef8681fso409987276.1;
        Fri, 26 May 2023 00:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685084657; x=1687676657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hP5Hjf1luQydJ9DLMKusibQhr4NEmLhV7a5C7xBBU3o=;
        b=E0/gdd/ekD92G0WsbmDpB2MfsSQ4TlDjqrxx0LHYPWT0QQRj4BQcZ1GELgzvxRZNlh
         lDK8P1i/jvQVZNQzTsIu9kcjMoUliFWBjpALwQf5p9TxqMpv9ysJmuXgVw0/AN0LQ/yd
         VZQmw0rpClYhF/x+w6kUX1r/SDq4uDPwEItQb/pb+pjSWbHm0dxTEMK2uS/as4FwfscT
         DDBFy8+97ig4suPIuHe5XBwfP5XoHcwJw1BDzhCg8jumXQFZtMWyzzM+fbTKfrlERTBL
         gLiUvSVa5CqEy6DV0HXlfnMmbnmXj+FF4oVu9KVj94P2lVLC+YwycSGlp0GOwN3LT2h5
         9DLQ==
X-Gm-Message-State: AC+VfDw9yguthn5dNHRizmD00H9398+QbRO9Btkv0vwc1deCEDk3bKHx
	tsiX8lzD1fRY/dCM9F5/NTLr4y2wyf8l8Q==
X-Google-Smtp-Source: ACHHUZ7YkZmfmOrIwGB76O8V7NqGd1BcZdbxIM6tpvtFhD8Vp2Z3y9xDtUzQv3uZVepIUAt6Gpuplg==
X-Received: by 2002:a25:8087:0:b0:ba6:cf6f:960b with SMTP id n7-20020a258087000000b00ba6cf6f960bmr735694ybk.27.1685084656802;
        Fri, 26 May 2023 00:04:16 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 205-20020a2514d6000000b00ba87e9b5bf9sm842244ybu.45.2023.05.26.00.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 00:04:15 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-563b1e5f701so4796017b3.3;
        Fri, 26 May 2023 00:04:15 -0700 (PDT)
X-Received: by 2002:a0d:cb83:0:b0:561:d21d:8ce4 with SMTP id
 n125-20020a0dcb83000000b00561d21d8ce4mr1048307ywd.19.1685084654815; Fri, 26
 May 2023 00:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305260739.yrWlFZTF-lkp@intel.com>
In-Reply-To: <202305260739.yrWlFZTF-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 May 2023 09:04:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3wFeBBK64Q5-pGcRVP12Smhmaon-Em0cQREjj2duLEg@mail.gmail.com>
Message-ID: <CAMuHMdV3wFeBBK64Q5-pGcRVP12Smhmaon-Em0cQREjj2duLEg@mail.gmail.com>
Subject: Re: [stable:linux-5.4.y 1809/9999] ld.lld: error: lib/fonts/font_sun8x16.o:
 contains a compressed section, but zlib is not available
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 1:24=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> FYI, the error/warning was bisected to this commit, please ignore it if i=
t's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git linux-5.4.y
> head:   f53660ec669f60c772fdf7d75d1c24d288547cee
> commit: 11420c32c1b49d0f900c4b20bc77c963c54086ce [1809/9999] efi: EFI_EAR=
LYCON should depend on EFI
> config: x86_64-randconfig-x071-20230525
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c=
006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able.git/commit/?id=3D11420c32c1b49d0f900c4b20bc77c963c54086ce
>         git remote add stable https://git.kernel.org/pub/scm/linux/kernel=
/git/stable/linux-stable.git
>         git fetch --no-tags stable linux-5.4.y
>         git checkout 11420c32c1b49d0f900c4b20bc77c963c54086ce
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash lib/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305260739.yrWlFZTF-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but z=
lib is not available
>    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but z=
lib is not available
>    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but z=
lib is not available
>    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but z=
lib is not available
>    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but z=
lib is not available
>    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but z=
lib is not available
>    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but z=
lib is not available
>    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but z=
lib is not available
>    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but z=
lib is not available
> >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section=
, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section=
, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section=
, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section=
, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section=
, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section=
, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section=
, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed sectio=
n, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed sectio=
n, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed sectio=
n, but zlib is not available
> >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed sectio=
n, but zlib is not available
>    ld.lld: error: too many errors emitted, stopping now (use -error-limit=
=3D0 to see all errors)

This looks like a toolchain issue to me: the fonts themselves do not
contain compressed data, but perhaps they do contain some data that
coincidentally matches a zlib compressed-data signature?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
