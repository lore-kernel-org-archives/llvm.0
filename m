Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811CB1FB2
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 04:25:01 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z97so14268710ede.8
        for <llvm@lists.linux.dev>; Sun, 09 Oct 2022 21:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eYIWoBzISWNiaFgZK0kBLxYMV/52i3ncI+TFO3bhqBI=;
        b=txgJwnubEG4zxxfOzPKAburmZc6NqVwL5t9UsZsAwui8bnwnWbeNdjBgCh4ySZFASj
         +/w6WWBbSgs2rbyni2WTq3E3oIS5sHNJRcW0NV0GBvwJvfU/RgMj4yE0IPzdJmT3yZ8E
         EzRDeD6KlRgBpye2kC8BScSsU7HH3NF4b4ZrBndjsmb4PfaIat6aVpd0nBgMmz3kzDUO
         XvP5Ysvu8GN4IGcJWtZRqW3APvPBinvkPc7NzDwpaA1yZ3QnAUHgg34SJPF3m0JogGd1
         SDU4qgMSfrf9SPs05ZvetWqTnFay28lBPeEWSUasbe3RURjP2lZuEARrvYTQvTXBqwu0
         8Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYIWoBzISWNiaFgZK0kBLxYMV/52i3ncI+TFO3bhqBI=;
        b=EPFvAfM/LANTaM7d3PCEOmZH/wBF+Ij8nDQOQICnLL2jrriE1EbMuetUypJaAhyJIA
         Zx3+fbnFHBwMySBhjX5a5n6HHIJO4Mg1kp8N5NFeajVQbeWblRaag8M5MCcTOv61DZF0
         iccvrLtQIeUP9uQrJRVCF24QPcAH5KvbhzV5kEPTV7CH9kpBBHLg6+4yJVo/r1NuQHaX
         4dwQd2lk+G/0WEjCP1AFJb54TXAvonxGXTXztlFqU1/LKlRAlIrZNLZKvJzsTLCCQZ2o
         vntWJOmiWcZW4OOwsVfE4CXLnqfykCSkpOQS6OTOWrGOd/opuxfLrV6+mmHuFbDq849L
         DIEA==
X-Gm-Message-State: ACrzQf3dCeHoEgwVk3SK3zerPcPyHS5oUf2F5quGZry9x4zJV30cRKBH
	YeOYw/zP9JhmZn4yJW/teIGMN2z1rfJazoxIf78=
X-Google-Smtp-Source: AMsMyM7WLePdaCQwBE/zbL5rFNhk7s6ramJmXX+AI0/fTiACo7PPGL26BroGQQrC7qdYcr7pfyYh2EOuN7cxN7KvtUc=
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr16214829edz.301.1665375899634; Sun, 09
 Oct 2022 21:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209280309.kaIzKfm8-lkp@intel.com>
In-Reply-To: <202209280309.kaIzKfm8-lkp@intel.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 10 Oct 2022 09:54:47 +0530
Message-ID: <CAOh2x=mJp+xsR=Y4PnHTT9DGemUx491j2ST7dP9XDUf89A+xLw@mail.gmail.com>
Subject: Re: arch/arm/mach-spear/spear6xx.c:365:13: warning: no previous
 prototype for function 'spear6xx_map_io'
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 28, 2022 at 1:49 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Arnd,
>
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   46452d3786a82bd732ba73fb308ae5cbe4e1e591
> commit: 250c1a694ff304e5d69e74ab32755eddcc2b8f65 ARM: pxa: convert to multiplatform
> date:   5 months ago
> config: arm-randconfig-r016-20220927
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=250c1a694ff304e5d69e74ab32755eddcc2b8f65
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 250c1a694ff304e5d69e74ab32755eddcc2b8f65
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mach-spear/ drivers/clk/spear/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

Sent patches to fix these warnings today. Thanks.
