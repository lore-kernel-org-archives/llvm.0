Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E262CA0
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 00:19:44 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id e8so19302523ilu.9
        for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 16:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XVdnzwGGQAXYZhMMw7RdhGS83GpDEAMdHspEpAeHJpM=;
        b=JBrWP5gHT51LQzPYhdA4VAomps44xCU8LhhSK2Bx1F1tVEYFPki+zoEGaGxsBaFrNC
         d9TJX+V07TVh1euztC31OXrBSoSdF+liKsegk5taJKyExVSxUM+oCxHX22LOPitJ29vI
         6F7yHM+oPaLf7rTJZTaqpkiY4xsa+Z9uDxus8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XVdnzwGGQAXYZhMMw7RdhGS83GpDEAMdHspEpAeHJpM=;
        b=32Udtm3hRLr9lbd75z0E+JOiqLLZTVCLYssZjXMKtnaYxYPwh2YoXMRZvXjpn+upsG
         LOOYKDIC64CN1J5B1tgHT7DVKQjJpvBwcOgFiJxYF0krYb8wMzRCVlbC95dzj26pgPns
         +MC/gSLHLBN1Iz9aDxi1uYYJvyrs0Poip3dID0IKjIOouZAyP9xOKxA/fMQJ2uDLNQ1L
         EtqecTvqGHmX7YhPtXnGQdk8fhBVnpSJTKmmoldriLfKbAoQllXHpBHcZhKj0tAETB1N
         PnANI3rnsg0P3AhaoSn4SnsmrSZkmKwIGWXEjKr2L/LSIpne9w5cR7B2wAaJ25ehk/p4
         8Xug==
X-Gm-Message-State: AOAM5307CfBVAEgIxRLR1RcfBktuoeQMA7vjMASVfQ61WI9MzOAdDNdj
	mLQr2y6h48SxqYWRF4hkaH4KWQrs1P9H8Q==
X-Google-Smtp-Source: ABdhPJw09OWA2L53kbZQppvVNgivyCCjOYyUnUgOI+gVV4Oob01X96QT8IZr/Rp5ByxRV3yFUx4kvw==
X-Received: by 2002:a05:6e02:1ba4:: with SMTP id n4mr20469199ili.147.1638231583035;
        Mon, 29 Nov 2021 16:19:43 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id r12sm8933430iln.72.2021.11.29.16.19.42
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 16:19:42 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id p23so23859616iod.7
        for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 16:19:42 -0800 (PST)
X-Received: by 2002:a6b:440f:: with SMTP id r15mr58122525ioa.128.1638231582031;
 Mon, 29 Nov 2021 16:19:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202111261447.lxHTeAhi-lkp@intel.com>
In-Reply-To: <202111261447.lxHTeAhi-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Nov 2021 16:19:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZv1LuGm59vJDQKuwqO0zdFZQQthfct7Z_bPcdkm4UUQ@mail.gmail.com>
Message-ID: <CAD=FV=XZv1LuGm59vJDQKuwqO0zdFZQQthfct7Z_bPcdkm4UUQ@mail.gmail.com>
Subject: Re: drivers/hid/i2c-hid/i2c-hid-core.c:867:4: warning: format
 specifies type 'unsigned short' but the argument has type 'int'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"

<Beep> <Boop> <Bop> (translates as "Hello Mr. Robot"),

On Thu, Nov 25, 2021 at 10:44 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Douglas,
>
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a4849f6000e29235a2707f22e39da6b897bb9543
> commit: c1ed18c11bdb80eced208a61d40b1988f36a014f HID: i2c-hid: Introduce goodix-i2c-hid using i2c-hid core
> date:   10 months ago
> config: arm64-randconfig-r034-20211116 (https://download.01.org/0day-ci/archive/20211126/202111261447.lxHTeAhi-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project fbe72e41b99dc7994daac300d208a955be3e4a0a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c1ed18c11bdb80eced208a61d40b1988f36a014f
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout c1ed18c11bdb80eced208a61d40b1988f36a014f
>         # save the config file to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=arm64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/hid/i2c-hid/i2c-hid-core.c:867:4: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
>                            le16_to_cpu(hdesc->bcdVersion));
>                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/dev_printk.h:112:32: note: expanded from macro 'dev_err'
>            _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                  ~~~     ^~~~~~~~~~~
>    include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16_to_cpu'
>    #define le16_to_cpu __le16_to_cpu
>                        ^
>    include/uapi/linux/byteorder/big_endian.h:36:26: note: expanded from macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
>                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
>            (__builtin_constant_p((__u16)(x)) ?     \
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

May I kindly point to the reply I gave to the same error last month
when you mailed it out?

https://lore.kernel.org/r/CAD=FV=WkUEkkkfGa+6QJSBvj8EgVrnGYYbd6RrC_5HdTue=mDw@mail.gmail.com/
