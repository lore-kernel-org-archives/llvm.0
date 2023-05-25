Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C032224E9F
	for <llvm@lists.linux.dev>; Thu, 25 May 2023 21:21:36 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-62576fa52b4so2534086d6.0
        for <llvm@lists.linux.dev>; Thu, 25 May 2023 14:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685049695; x=1687641695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAreeB289hYqC9QkPIJw+jIvSwYuYqhQWcJOMaksQhw=;
        b=CbkF07UtHGKUGe6rDMeSjcCMfSB6XhcwOYlyDm3YwvUumB++KKg0hnm5wvNepdYmyw
         j+u2opNahlZ/d5/NLun990nr/07DYVmh0s0yf85aY7McEFjWH4V2ByqDQ30kh2+EiGc3
         dJamghQW0tltlOHm5H1c5xqZh+bGM+mSyZF1eO8TyOKKu5Qa3wEmVoEQbVHLSpCrfP91
         1WqukHcCj1gD41BS2NrcLKFU0r4ie5QA5cdz/iRKMNaBfTxojpQJC11L62KgMIvQrw+3
         VEEyraz8ButHyoWGOJiFrp94aYUSpsiTL/W5VoPapxVAAbLRZU3v+jqQ8vNzvjzGy3ZX
         DINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685049695; x=1687641695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAreeB289hYqC9QkPIJw+jIvSwYuYqhQWcJOMaksQhw=;
        b=h5hc7IPIpwozHRQ1eVzxQ3CAcRi/9LtSR9BErJKjzH7joNp0ByU/DVJm0kTo/qMJbo
         /i0rOvybYZ06mx+LcS9ShdlniQEdM+lzFdQQ42v59WtZHH3OPuA4nhilD76FFwOwVYdj
         MCDmep6tX9iZ2KQiUmgN83wxkXs14pTOR0MKD640NE4orAZEWmTCSYo16wLHHbUX01x/
         Ptfp9ytWQ0Jrs+rOwZHQQkBir9u8TZuRlkcaWojDdzfbitwTBmM07rCS9Vl+6klJV0le
         hIsc6Gkxe3jXZdh2/ARNeE1BBv57Ty0C0UpEettw9sHpB/5UVMXTrabV+VHIFfLs68lI
         BORQ==
X-Gm-Message-State: AC+VfDw4Vdr6PE1sZYDD9UqTf9elhsdJkCvInb5EEo99zh7zu0VNNNFt
	CmUI91CaFCOxwdWSq5alHzBlopQr5UMGqYeV/OMkPg==
X-Google-Smtp-Source: ACHHUZ5QYAKLu8momFty5fDZLtzcgf2/3Mj0oobvvXC46YBHLdX2N4LMW3h8YhaPw3qoCtNeVK3Ozixa/KV5/GHonyY=
X-Received: by 2002:a05:6214:490:b0:625:b3a2:f637 with SMTP id
 pt16-20020a056214049000b00625b3a2f637mr3100923qvb.8.1685049695480; Thu, 25
 May 2023 14:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305251508.iFEInYVW-lkp@intel.com>
In-Reply-To: <202305251508.iFEInYVW-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 25 May 2023 14:21:24 -0700
Message-ID: <CAKwvOd=QY_QNWP2+nofvowbCD66noajsY8q1xe-MamV_gF3TPA@mail.gmail.com>
Subject: Re: [stable:linux-4.19.y 984/6017] ld.lld: error: drivers/usb/dwc2/platform.o:
 contains a compressed section, but zlib is not available
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Keeping <john@metanate.com>, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 12:44=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git linux-4.19.y
> head:   3f57fb8b1bd06b277556601133823bec370d723f
> commit: c964b1bbf179a163084b1ec8ad094b8c8dce28c8 [984/6017] usb: dwc2: hc=
d_queue: Fix use of floating point literal
> config: x86_64-randconfig-x093-20230524
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c=
006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able.git/commit/?id=3Dc964b1bbf179a163084b1ec8ad094b8c8dce28c8
>         git remote add stable https://git.kernel.org/pub/scm/linux/kernel=
/git/stable/linux-stable.git
>         git fetch --no-tags stable linux-4.19.y
>         git checkout c964b1bbf179a163084b1ec8ad094b8c8dce28c8
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/usb/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305251508.iFEInYVW-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available

Hmmm...that's surprising to see on 4.19.  I didn't add support for
compressed debug info until:

commit 10e68b02c861 ("Makefile: support compressed debug info")

which landed in v5.8-rc1 and AFAIK was never backported.

I wasn't able to reproduce this with ToT LLVM (clang-17); I wonder if
this is an issue with clang-14?

Just tried and could not reproduce.  Has this issue been seen elsewhere?

Ah, we have

https://lore.kernel.org/llvm/?q=3Dcontains+a+compressed+section%2C+but+zlib=
+is+not+available
https://lore.kernel.org/llvm/20230404161735.GA1703291@dev-arch.thelio-3990X=
/

So since 10e68b02c861 is in v5.8-rc1, then for 4.14, 4.19, and 5.4 we
probably want a stable-only patch for -gz=3Dnone.

GCC didn't support -gz=3Dnone until 5.1, so that might be an issue for
older branches of stable which might still support older GCC versions.
4.19.y still supports gcc 4.6.

```
diff --git a/Makefile b/Makefile
index 71416fde7348..e6754300021c 100644
--- a/Makefile
+++ b/Makefile
@@ -756,6 +756,7 @@ KBUILD_AFLAGS       +=3D -g
 else
 KBUILD_AFLAGS  +=3D -Wa,-gdwarf-2
 endif
+KBUILD_CFLAGS  +=3D $(call cc-option, -gz=3Dnone)
 endif

 ifdef CONFIG_DEBUG_INFO_DWARF4
```

Godbolt only binutils v2.27+, but 4.19 supported v2.20+ (so I can't
check --compress-debug-sections=3Dnone assembler support quickly).


>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section,=
 but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed sec=
tion, but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed sec=
tion, but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed sec=
tion, but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed sec=
tion, but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed sec=
tion, but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed sec=
tion, but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed sec=
tion, but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed sec=
tion, but zlib is not available
>    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed sec=
tion, but zlib is not available
> >> ld.lld: error: drivers/usb/dwc2/platform.o: contains a compressed sect=
ion, but zlib is not available
>    ld.lld: error: too many errors emitted, stopping now (use -error-limit=
=3D0 to see all errors)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Thanks,
~Nick Desaulniers
