Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2497B
	for <llvm@lists.linux.dev>; Sun, 19 Jun 2022 19:54:15 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w17so11974910wrg.7
        for <llvm@lists.linux.dev>; Sun, 19 Jun 2022 12:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D+oeUGf8SKARwU9Ugn7wJKG05hg8Mji5Rbfklf989Ik=;
        b=cNYzo1ElEIpx+pqr90RmBVb/3zVAEOJJEEMyz3LaOwr3z5z9TVPtfKHRytyZRE7sMN
         QlhW4FzP/yklu824oMM+X0ybttZ258VGxXXch3wvOJHmfpErN6xTf5EwsOGIxcd6qalm
         x3ZJbWQwIF7ni5M0U1axLPGGKCQi4sURtIUHhOXm1C/ZwWEcR+QqON1fgKLXwn0XBKtL
         VyM6xLI4x8fil/Ijq8iueaT8OqhyGIV+RHRbBhBlEQoxlVBzlpo80NAuEc9MSSp1S+z6
         SM3W/gz0Snn/OBqpnYKIZaf5dV/scSWgEcx75UAbB2NGjGL0+IzNl32MD8nDI2n5Am0h
         yeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D+oeUGf8SKARwU9Ugn7wJKG05hg8Mji5Rbfklf989Ik=;
        b=73dWA7UFIMTMGPV7nN6GLLU6iW86ypnYhQyw7+DOS/XrxLeMLmbkEsWGjRcbED+atv
         DgtyRz7wo/20S4yj4KDK7p9pyAV+Zvv6Rn4crA+zzoIT+12at1FoflwKyqtjtjwWpt4u
         EIOV7GbKKoOWmDRexGjpAsBa8osUcHQndIx2HeJwyheKdBdoeN7Wfzr3Ip9mjIhD1/g6
         rKGQgw+j/J0/B6OB6j6tRhiRNFM2YcdIWP8qgKwIafRhdskxSK9EgV/Lopue/vIsIsbg
         sCbIEXCwoOZX5FLf0CUV6mgWU4KLzrV/bXsQuEdM6fQelK8i/J4NVyc09x9HNftclrXY
         44yQ==
X-Gm-Message-State: AJIora9WAeDsSYWZUIW/4MrwmyYParR2crax1qgK9pZFpPPUOtAhl1co
	N51jH6tR37jhuNZdI1EYrBRy5N+FTRYvQ5FJurs=
X-Google-Smtp-Source: AGRyM1u6aAE52npz9c27JUrLTjSJNhOuiX4d5ZyhNKUhSRX/2XPufhlTot69wAM0p7I1MqKxXCer6A==
X-Received: by 2002:adf:d1c2:0:b0:218:5736:63d9 with SMTP id b2-20020adfd1c2000000b00218573663d9mr19440744wrd.667.1655668454335;
        Sun, 19 Jun 2022 12:54:14 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id h28-20020adfa4dc000000b0020fff0ea0a3sm11210407wrb.116.2022.06.19.12.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 12:54:13 -0700 (PDT)
Message-ID: <2b30919a-ccb9-9891-d145-e2e4107d244e@conchuod.ie>
Date: Sun, 19 Jun 2022 20:54:12 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC 4/6] reset: add polarfire soc reset support
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
References: <20220619164935.1492823-5-mail@conchuod.ie>
 <202206200343.mg3VsC0H-lkp@intel.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <202206200343.mg3VsC0H-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Can I just make it stop trying to build the series?
Clearly I screwed up the kconfig depends...

On 19/06/2022 20:52, kernel test robot wrote:
> Hi Conor,
> 
> [FYI, it's a private test report for your RFC patch.]
> [auto build test ERROR on b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/PolarFire-SoC-Reset-controller/20220620-005055
> base:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
> config: riscv-randconfig-r026-20220620 (https://download.01.org/0day-ci/archive/20220620/202206200343.mg3VsC0H-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/760155ed7d4eb45e0d8cfbbf8c471b4b1548bc1e
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Conor-Dooley/PolarFire-SoC-Reset-controller/20220620-005055
>         git checkout 760155ed7d4eb45e0d8cfbbf8c471b4b1548bc1e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/reset/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/reset/reset-mpfs.c:33:8: error: call to undeclared function 'mpfs_reset_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            reg = mpfs_reset_read(rcdev->dev);
>                  ^
>>> drivers/reset/reset-mpfs.c:35:2: error: call to undeclared function 'mpfs_reset_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            mpfs_reset_write(rcdev->dev, reg);
>            ^
>    drivers/reset/reset-mpfs.c:39:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>                    id);
>                    ^~
>    include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
>            dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                         ~~~     ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
>                               dev, fmt, ##__VA_ARGS__)
>                                    ~~~    ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
>            __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>                                                                  ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
>                    func(&id, ##__VA_ARGS__);               \
>                                ^~~~~~~~~~~
>    drivers/reset/reset-mpfs.c:47:8: error: call to undeclared function 'mpfs_reset_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            reg = mpfs_reset_read(rcdev->dev);
>                  ^
>    drivers/reset/reset-mpfs.c:49:2: error: call to undeclared function 'mpfs_reset_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            mpfs_reset_write(rcdev->dev, val);
>            ^
>    drivers/reset/reset-mpfs.c:53:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>                    id);
>                    ^~
>    include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
>            dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                         ~~~     ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
>                               dev, fmt, ##__VA_ARGS__)
>                                    ~~~    ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
>            __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>                                                                  ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
>                    func(&id, ##__VA_ARGS__);               \
>                                ^~~~~~~~~~~
>    drivers/reset/reset-mpfs.c:60:12: error: call to undeclared function 'mpfs_reset_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            u32 reg = mpfs_reset_read(rcdev->dev);
>                      ^
>    drivers/reset/reset-mpfs.c:69:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>                    id);
>                    ^~
>    include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
>            dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                         ~~~     ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
>                               dev, fmt, ##__VA_ARGS__)
>                                    ~~~    ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
>            __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>                                                                  ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
>                    func(&id, ##__VA_ARGS__);               \
>                                ^~~~~~~~~~~
>    3 warnings and 5 errors generated.
> 
> 
> vim +/mpfs_reset_read +33 drivers/reset/reset-mpfs.c
> 
>     24	
>     25	/*
>     26	 * Peripheral clock resets
>     27	 */
>     28	
>     29	static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>     30	{
>     31		u32 reg;
>     32	
>   > 33		reg = mpfs_reset_read(rcdev->dev);
>     34		reg |= (1u << id);
>   > 35		mpfs_reset_write(rcdev->dev, reg);
>     36	
>     37		dev_dbg(rcdev->dev,
>     38			"Asserting reset for device with REG_SUBBLK_RESET_CR index: %u\n",
>     39			id);
>     40		return 0;
>     41	}
>     42	
> 
