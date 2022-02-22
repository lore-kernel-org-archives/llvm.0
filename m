Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315647E
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 08:23:34 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id w37so7252551uad.10
        for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 00:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tk9270/DJPjZhEz2uSUrxKZsYgZ92Nn0w0pQGUilrP8=;
        b=vuRYMITWgvYAVXMzJ+PuiDzpqPjs/VOXFZibaEOntUn2xecgnPDI26S6GqIyH1s8As
         GsBaGw6gwLSRseb6DweT/0JxaroNShktsG5FALbsinn3jKLE0VI7RjmG/G3Ct+GMenS8
         6cLQ0ak70OmQCyYeIzD38oZL96+nKj13+Ba1UUq5QbCdoBQ02p2gVsLvJ4oyo7ougLnB
         RfNZazYZfhFk/4GHRQuS3L1m+aB15WYbpjZ8Il0nOkqr5l2Nf2aYCWQLxJ7KV2XkFg4u
         Qo9y98maOezptpIikMQ+fLhYRnOYbDnQKebLKVJYO6myRI1eCgMSVGgtcNPDWcD4TqHQ
         ZSWQ==
X-Gm-Message-State: AOAM532TVPd+m9KcbRWWvgcuMQQ3aoyEtE24BJsyzcQYYlHK55r7mfPC
	Jbwx+AEITu6i5oUvHMY5y2CMpUnKnlw0MQ==
X-Google-Smtp-Source: ABdhPJyLhiW/APF38of4KRNcoGNFCUVmjPs/G76cykjFn9lEC33I6S9A+GviXcJPmh4K1xniH1tT3Q==
X-Received: by 2002:ab0:2111:0:b0:341:8339:51b4 with SMTP id d17-20020ab02111000000b00341833951b4mr8205603ual.76.1645518212964;
        Tue, 22 Feb 2022 00:23:32 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 3sm487766vkf.16.2022.02.22.00.23.32
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 00:23:32 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id q9so14789672vsg.2
        for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 00:23:32 -0800 (PST)
X-Received: by 2002:a67:af08:0:b0:31b:9451:bc39 with SMTP id
 v8-20020a67af08000000b0031b9451bc39mr9520705vsl.68.1645518212524; Tue, 22 Feb
 2022 00:23:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <81a35c1fac4616d25501942848eb9662d477f9ef.1645457792.git.geert+renesas@glider.be>
 <202202220816.4R3DRnX0-lkp@intel.com>
In-Reply-To: <202202220816.4R3DRnX0-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Feb 2022 09:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFpXvJApcGkaOEXJdvRMgNL7w8AwpqUa052P_ba4M42A@mail.gmail.com>
Message-ID: <CAMuHMdWFpXvJApcGkaOEXJdvRMgNL7w8AwpqUa052P_ba4M42A@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: renesas: r8a779f0: Add MMC pins,
 groups, and function
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 22, 2022 at 1:43 AM kernel test robot <lkp@intel.com> wrote:
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
> [also build test ERROR on robh/for-next linusw-pinctrl/devel v5.17-rc5 next-20220217]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
> config: arm64-randconfig-r021-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220816.4R3DRnX0-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/06b5c197da936f9f7d6dc715ff6ae7ab6aee760d
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
>         git checkout 06b5c197da936f9f7d6dc715ff6ae7ab6aee760d
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pinctrl/renesas/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/pinctrl/renesas/pfc-r8a779f0.c:851:2: error: implicit declaration of function 'BUS_DATA_PIN_GROUP' [-Werror,-Wimplicit-function-declaration]

Missing dependency:

    This depends on "[PATCH 00/60] pinctrl: renesas: Share more pin group
    data"[1].

    [1] https://lore.kernel.org/r/cover.1640269757.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
