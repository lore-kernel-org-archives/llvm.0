Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B232FAF
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 20:26:49 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id i13so357647ilm.4
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 13:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oB1STMFxd2csSkl8IVlp20V6oUL88X9VqIf6wV2nNYM=;
        b=cvGdKIORLe2S+zKWVexAroERaaQrNTAwn/jv4gFIHlSk+LC2Zqjl6pW2h99Yiufmbk
         f4PESEjpImEgoZ6pynUwpxjV93QT63a7KVnt+VC0+juRVtia13z2VugvLYFPs1IyVahJ
         fw6hbhoyt1rKcXnH/HmvrICYbmsWZK74Ynqrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oB1STMFxd2csSkl8IVlp20V6oUL88X9VqIf6wV2nNYM=;
        b=bj/7L2RpYmq2UU8lBFyOQPJ8+n6ZUMb+a3dcucq4Qp/GUbiU1nPfnbMSwnEB8u+cv7
         W/GKBdDMslzY9kCMRut6BlQ+Gkdabm1iKyy9tV90mL80xbR8YQWhpeN1oJX6UZDoOhUI
         vDbhnlHU74x7/smzeR1AThgC4kw/dxvynXBRtMkyFPStjoo4glIGMKjGV9Za7Ej0ze4n
         uuLPF0j033hZH4XoBXVWaKJ9FTOe/u9YFpvwwZv/jPQ66TJ9BMd5kVeckRgWHvs6oSdz
         6EOs3OXIWx0xI/okNKwaPdlM+TAyoiGU6rRLX/FOY493rsqIeKj7pqYK2voL50SZgCw5
         uJbQ==
X-Gm-Message-State: AOAM533GU+OrDEmMqnjCmFWTC/7ukLzzyeSVXBXU4tBvSG139lrxqfsr
	bzVPhnVHAywFsdVDdfCeb4Q8vb7i15n2Fg==
X-Google-Smtp-Source: ABdhPJzewPPwu4wuXr3lEWgFBGxlsr63YkJFC5FEtXX3Nuhcb8KrReBudeiR/UurSUCOaEZPhjyWNg==
X-Received: by 2002:a05:6e02:17ce:: with SMTP id z14mr5702517ilu.89.1632860807823;
        Tue, 28 Sep 2021 13:26:47 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id z20sm34668ill.2.2021.09.28.13.26.46
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 13:26:47 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id y197so186175iof.11
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 13:26:46 -0700 (PDT)
X-Received: by 2002:a05:6638:dcc:: with SMTP id m12mr6353650jaj.68.1632860806568;
 Tue, 28 Sep 2021 13:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202109290438.wHIL8nIE-lkp@intel.com>
In-Reply-To: <202109290438.wHIL8nIE-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Sep 2021 13:26:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WkUEkkkfGa+6QJSBvj8EgVrnGYYbd6RrC_5HdTue=mDw@mail.gmail.com>
Message-ID: <CAD=FV=WkUEkkkfGa+6QJSBvj8EgVrnGYYbd6RrC_5HdTue=mDw@mail.gmail.com>
Subject: Re: drivers/hid/i2c-hid/i2c-hid-core.c:867:4: warning: format
 specifies type 'unsigned short' but the argument has type 'int'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Sep 28, 2021 at 1:16 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Douglas,
>
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6fd3ec5c7af58d5d6b598fba22ac387645af33f4
> commit: b33752c300232d7f95dd9a4353947d0c9e6a0e52 HID: i2c-hid: Reorganize so ACPI and OF are separate modules
> date:   8 months ago
> config: arm64-randconfig-r016-20210927 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8dfdfe7efecfda318d43a06fae18b40eb498)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b33752c300232d7f95dd9a4353947d0c9e6a0e52
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout b33752c300232d7f95dd9a4353947d0c9e6a0e52
>         # save the attached .config to linux build tree
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

Definitely not something new introduced by my commit. Also seems like
something wrong in the compiler or in the generic Linux header files?
It sure seems like if you call le16_to_cpu() you should be able to
assume that the type is "unsigned short" and not "int".

-Doug
