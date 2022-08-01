Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573DC7F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 02:20:56 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id c12so12034661ede.3
        for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 19:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FL6269pemMpnmRW6a2WYgw7o9Iwarc5gVNQUemen3CE=;
        b=oQByfmNI24pr79uSmxZ4AT7q3m2Hn0A/YId5eEqPCiLFH2zaHVflt5Ol7XxkurYUCv
         Ly24dX+8zNf6lOHXfQwCRfempBk6LI+G/WpAXHb+Jj0OHHMQVhmXJS8G8ef7537KfRQv
         8jNVnZXFzK/AfocAkGq0QUehKQE7l0rDT09GV0zBcyDcbER60JVG667TWNOobDdrmqEA
         mS3QpSJJH8QiqGM225F4OtIUnuprDyoieZTSeakpBEPZ3l8PlmgY9fJcEcP+tB2Y56sB
         4x3YQT2CTp6ZVLAO8WU1jmcPXW6+r4CrolqHW7jB/Qj8YME+QhQ6k8yi9W3s3UtYNCbp
         xfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FL6269pemMpnmRW6a2WYgw7o9Iwarc5gVNQUemen3CE=;
        b=fWUa4gBB4aBwERVlKox8zWHRQiqL81WwnAVK30vtBKasH+eCeTcIROPedf7AbohPVM
         Vf2ROZAv3itLLlJedoqG7877ZguRAjmtAEfXMuvDlO4FlbsL8XE4B4eX4CTAwVSZCZS3
         juBh47i7wJk38xaxZpe9jh/cDRsns9amPLGmCMMr11bG5SN1tSpvY4sZ0hZW8k0Cp1Mp
         vEjy4GySjOOEDvI3c16unTD4iRvYk7GZXnuGLhAO1jS67QSvVK0FIQgEE/Y6Yg5eAtaj
         kXX4KwfYgMc2klfdXVHGD82v7RO75QxEcLByIx6EXewwDNF43aR3HHeqIOirHGu09CVI
         pFww==
X-Gm-Message-State: ACgBeo23GZ0n86ZiyCsiQtdUXT/ZdyueQpI07TVrlAkWgXlNMZ/3Ao1M
	nslMqLsWqpIANV/nzxE/xL21lw==
X-Google-Smtp-Source: AA6agR4KoEUwwcnlwJzKF6MF312WPGfuGy0TVRtge9Kvx1ilRchqSMgHzbNyGUj2IgAlR16VcDySjw==
X-Received: by 2002:a05:6402:34cf:b0:43d:96fd:bdfa with SMTP id w15-20020a05640234cf00b0043d96fdbdfamr3905237edc.40.1659320454535;
        Sun, 31 Jul 2022 19:20:54 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([104.245.98.208])
        by smtp.gmail.com with ESMTPSA id 22-20020a170906311600b0072b13ac9ca3sm4659207ejx.183.2022.07.31.19.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 19:20:54 -0700 (PDT)
Date: Mon, 1 Aug 2022 10:20:50 +0800
From: Leo Yan <leo.yan@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: Re: [steev:linux-v5.19.0-rc8-tests 109/182]
 drivers/interconnect/qcom/icc-rpm.c:378:16: error: use of undeclared
 identifier 'src_qn'
Message-ID: <20220801022050.GC101027@leoy-ThinkPad-X240s>
References: <202207311834.fM0dvTaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202207311834.fM0dvTaU-lkp@intel.com>

On Sun, Jul 31, 2022 at 06:04:38PM +0800, kernel test robot wrote:
> tree:   https://github.com/steev/linux linux-v5.19.0-rc8-tests
> head:   171125613e081f0d0d9aeb710dc7469ce2c6a219
> commit: 20386c070c2d12a74092d72aef1c8be37a5f5177 [109/182] interconnect: qcom: icc-rpm: Set bandwidth and clock for bucket values
> config: arm64-buildonly-randconfig-r005-20220731 (https://download.01.org/0day-ci/archive/20220731/202207311834.fM0dvTaU-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/steev/linux/commit/20386c070c2d12a74092d72aef1c8be37a5f5177
>         git remote add steev https://github.com/steev/linux
>         git fetch --no-tags steev linux-v5.19.0-rc8-tests
>         git checkout 20386c070c2d12a74092d72aef1c8be37a5f5177
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/msm/ drivers/interconnect/qcom/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/interconnect/qcom/icc-rpm.c:378:16: error: use of undeclared identifier 'src_qn'
>                    do_div(rate, src_qn->buswidth);
>                                 ^
>    1 error generated.

This is the same issue that merged old version patches on the repo
https://github.com/steev/linux, branch "linux-v5.19.0-rc8-tests", as I
described in:
https://lore.kernel.org/lkml/20220801020945.GB101027@leoy-ThinkPad-X240s/T/#t

Thanks,
Leo
