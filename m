Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23667479
	for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 17:23:00 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id f205so15525519yba.2
        for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NKTXcYN6Ga8OwOynRBy3VsgpCimivGzV8i42n9KI8Xs=;
        b=dnCJtTbVe6fGlfGFGFEzpXhI8pThgiiSAAo7AcJBQwDLg9hhJdKYXB9MJDE6iZyAGW
         P6qW+MXcbyKwSxXUy9taRrWk3088fgsh3WalfN3A588AH7Ppg5+QIe3oiVn3wJqHjSta
         2nu0gIzyTwGwR4tYgnIvovM/ymkKIul3FI1r8CKFHALd5ji0KC5+UB7arLByWR6ocaer
         r65UU/Qzomw83ejZEoE1DOSB50Psslpap4cpVVGuzMsk1zi+M+pk2VzzL53iZQsAW4bz
         U9Dc8IH+Du+hcSIMOh9aIV3meSAqFwHEhkuaswKMBcIzL18f64uH9Iuu5yCuf427rlwv
         yB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKTXcYN6Ga8OwOynRBy3VsgpCimivGzV8i42n9KI8Xs=;
        b=YIHTPUraX8oCWMnL6pDhuW0eKbioX8oAc6ozlkmxYMMDXHy8Zv0rOxigPNmx60h5vx
         rEgnsANoGy8YNTDAEcyz7+jhfPwyiLPZ9ZW16A/w8xkxfmNmnyWZRFSuM8y7AabHNMaM
         At18y+cHsmelu5b6tnHMe5wgwF0C1fsUBgFWqLymv6AzxNs7sjfWMnO0OjUZhyqyoUCV
         QJcxG4+7hoIQRrFUOlLQPHtsf2n33rvAEPaTbI8dZRY1IEKQJ7c2C/q6tN8xrBmevvTM
         X29ltTV8Xzu88pzhF0iHK6WnyKei96ix/sftws/abBt3DCtj6HsCwe6+K2g4S8SsRdCF
         mtCg==
X-Gm-Message-State: ACrzQf0I8kjEyQ1LilsteicqcH2ZyzTkveFrZJX1Mdm+GHTZGkrJ5TM5
	/32/xBYQlxeP3ngvu8GiPqQ77eRo/gHqvF3NGa+oZg==
X-Google-Smtp-Source: AMsMyM5D22AxGmbHEw1VDoNqDzk8sAPCpRYX8yAWCbCLAlgN2IR6RbCtmXFpkIMMVcOdHCdp1w7aria/94BIN8t1MhM=
X-Received: by 2002:a05:6902:305:b0:6c3:b4d6:7a04 with SMTP id
 b5-20020a056902030500b006c3b4d67a04mr34072324ybs.93.1666718579652; Tue, 25
 Oct 2022 10:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210260009.9qq1JXZi-lkp@intel.com>
In-Reply-To: <202210260009.9qq1JXZi-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Tue, 25 Oct 2022 10:22:23 -0700
Message-ID: <CANpmjNP4kX75dTyoGHMkS4Rmjd7rkPGzQn9y3Xuvrc5TUSu3zA@mail.gmail.com>
Subject: Re: [linux-next:master 1602/3190] ERROR: modpost: "iounmap"
 [drivers/tty/ipwireless/ipwireless.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Oct 2022 at 09:40, kernel test robot <lkp@intel.com> wrote:
>
> Hi Marco,
>
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   89bf6e28373beef9577fa71f996a5f73a569617c
> commit: 7c201739beef1a586d806463f1465429cdce34c5 [1602/3190] kcsan: Instrument memcpy/memset/memmove with newer Clang

This is unlikely to be the cause.

> config: s390-randconfig-r044-20221025 (attached as .config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7c201739beef1a586d806463f1465429cdce34c5
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 7c201739beef1a586d806463f1465429cdce34c5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
> >> ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
> >> ERROR: modpost: "iounmap" [drivers/net/ethernet/fujitsu/fmvj18x_cs.ko] undefined!
> >> ERROR: modpost: "ioremap" [drivers/net/ethernet/fujitsu/fmvj18x_cs.ko] undefined!
> >> ERROR: modpost: "devm_ioremap" [drivers/net/ethernet/altera/altera_tse.ko] undefined!
> ERROR: modpost: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
> ERROR: modpost: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!

There are already similar warnings.

My guess is that testing newer (unstable!) clang + CONFIG_KCSAN=y was
broken before the KCSAN commit that fixed memcpy/etc., so from this
commit onwards things build again and thus show a bunch of other
warnings/errors due to semi-successful build.
