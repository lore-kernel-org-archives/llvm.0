Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F973174FA
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 21:22:28 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-651ffcc1d3dso4606114b3a.3
        for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 14:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686691348; x=1689283348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wWRudrPnHjVGc5oCn6M809kCQsjvZKoLo1qzFLP37Us=;
        b=Ktgo8zSr8EXXB2UzZLgdhE6zaCRIeHoRMwBb1uUA1A9M3CTZ+2BYMnYKR2PzOHPNwa
         YWDiUp1WSeHQkJDCpGcgRLHm9/AGUtAYL1oeHSQmkxlym0jpb8Pr2lf6FjB/QY+fD9Bz
         oU9HOHcqvQec/HPDkxKJvpmw5IMRk3QcXazpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686691348; x=1689283348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWRudrPnHjVGc5oCn6M809kCQsjvZKoLo1qzFLP37Us=;
        b=jh5xWobMMAbwfQ2YijuUzEtJGnej1WvbmFIIEa3d6oSxOioMDJTFzbgx3oL84lO7Z8
         EMB8taJXMt7c1Kf85leydjuTtaeKdxstGtGhrrxTdcd0WZLP52dn3RDrXvPDdEMQmI9w
         +KyLA0GflKuquYc2jetbkmzAK3iJOgKBpO+shzrxW2EAjoAmLpmaHMwGLPBam+FTgrts
         sAN0DLz25GSHA1aBiJiy/MeOnn2BF5KkeHSyf46zyJvO6a9KXvDuZEsDEJkWyoNm2yFM
         xjC2uc4e18vzWQMgZs3uyoK2ctRsjbA8SiSFqb0o66b2fQIewiVDLzYEbXlQdWmPLbq8
         Jkdg==
X-Gm-Message-State: AC+VfDw0IltZYJ0y22/Uk5M0WJfzi310234HJOfdpulIrpiYU2RD4V3m
	9tHS2q4fhbnx4v2MysYxQBoKGUnykdFnkPEpjFw=
X-Google-Smtp-Source: ACHHUZ7Hnj2dBGCbwSlRjBAKHsJQ2zREIGLpMzHssRYQlX+brI0ocqWinP2aG4ynfZVSI0C/+C81Cw==
X-Received: by 2002:a05:6a00:14d0:b0:64c:c5f9:1533 with SMTP id w16-20020a056a0014d000b0064cc5f91533mr16110132pfu.33.1686691347806;
        Tue, 13 Jun 2023 14:22:27 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u5-20020aa78385000000b0064d4d11b8bfsm8986934pfm.59.2023.06.13.14.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 14:22:27 -0700 (PDT)
Date: Tue, 13 Jun 2023 14:22:26 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [linux-next:master 3357/8413] drivers/scsi/FlashPoint.c:1712:12:
 warning: stack frame size (1056) exceeds limit (1024) in
 'FlashPoint_HandleInterrupt'
Message-ID: <202306131418.35B5D649DC@keescook>
References: <202306100035.VTusNhm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306100035.VTusNhm4-lkp@intel.com>

On Sat, Jun 10, 2023 at 12:58:23AM +0800, kernel test robot wrote:
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   53ab6975c12d1ad86c599a8927e8c698b144d669
> commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 [3357/8413] kbuild: Enable -fstrict-flex-arrays=3
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230610/202306100035.VTusNhm4-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=df8fc4e934c12b906d08050d7779f292b9c5c6b5
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout df8fc4e934c12b906d08050d7779f292b9c5c6b5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306100035.VTusNhm4-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/scsi/BusLogic.c:51:
> >> drivers/scsi/FlashPoint.c:1712:12: warning: stack frame size (1056) exceeds limit (1024) in 'FlashPoint_HandleInterrupt' [-Wframe-larger-than]
>     1712 | static int FlashPoint_HandleInterrupt(void *pcard)
>          |            ^
>    1 warning generated.

I wasn't able to generate the warning with my Clang, but it sure is
close! Building with KCFLAGS=-Rpass-analysis=stack-frame-layout I see:


In file included from ../drivers/scsi/BusLogic.c:51:
../drivers/scsi/FlashPoint.c:1713:1: remark:
Function: FlashPoint_HandleInterrupt
Offset: [SP-4], Type: Protector, Align: 4, Size: 4
Offset: [SP-8], Type: Spill, Align: 8, Size: 4
Offset: [SP-12], Type: Spill, Align: 4, Size: 4
Offset: [SP-16], Type: Spill, Align: 16, Size: 4
Offset: [SP-20], Type: Spill, Align: 4, Size: 4
Offset: [SP-24], Type: Spill, Align: 8, Size: 4
Offset: [SP-28], Type: Spill, Align: 4, Size: 4
Offset: [SP-32], Type: Spill, Align: 16, Size: 4
Offset: [SP-36], Type: Spill, Align: 4, Size: 4
Offset: [SP-40], Type: Spill, Align: 8, Size: 4
Offset: [SP-44], Type: Spill, Align: 4, Size: 4
Offset: [SP-48], Type: Spill, Align: 16, Size: 4
Offset: [SP-52], Type: Spill, Align: 4, Size: 4
Offset: [SP-56], Type: Spill, Align: 8, Size: 4
Offset: [SP-60], Type: Spill, Align: 4, Size: 4
Offset: [SP-64], Type: Spill, Align: 16, Size: 4
Offset: [SP-68], Type: Spill, Align: 4, Size: 4
Offset: [SP-72], Type: Spill, Align: 8, Size: 4
Offset: [SP-76], Type: Variable, Align: 4, Size: 4
Offset: [SP-80], Type: Spill, Align: 4, Size: 4
Offset: [SP-84], Type: Spill, Align: 4, Size: 4
...[4 byte spills]...
Offset: [SP-1012], Type: Variable, Align: 4, Size: 4
Offset: [SP-1016], Type: Variable, Align: 4, Size: 4
[-Rpass-analysis=stack-frame-layout]

So something is very weird in FlashPoint_HandleInterrupt -- it has a
single while loop with an internal if/else if/.../else chain. So I don't
see why it would need such extensive spills...

This seems like a missed optimization in Clang, maybe?

-- 
Kees Cook
