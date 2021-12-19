Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C96C29CA
	for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 12:29:41 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id s1so14240301wrg.1
        for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 04:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i/nOnLrUtXLrdXzK8zEtzWYdMs/JTFryzu35YjyVQIs=;
        b=AjrtdLCg3RcREmz0fGoBcdevGyn8gnZf+r+rovQ1f52CnkTYeJgRS+LpduWj0sW4Kg
         HTDpIrZhnjZLuT4EFFOEKfX94yh1OO3PWmFh8omQg3V77E5/ka4RrAn/TSu/H2In2mc9
         yZEedgY5eqx1kNNQM3lSVAxG9KRgHvMjnHdqAx0Jwb5M942iJTAOmUO3SFsGnlsePHQx
         Ar5u6A17AVXg4g6wPmV/SWRAQ6ejQ33TJbjnbfEQNQV+wPz3vEpC/QqQc+IZdSg0CIKo
         0aa6MKuLpzM8TFaMjHC/Ymj0TtXKW+9aiE9DgjKyPAmiEg7vz7jukZhBtz8rDEAc8//7
         Ys2g==
X-Gm-Message-State: AOAM530dRxa8rivwPRQLQ/EaakS/E5RfdrFemGfldx8bai9J5Oo04TAD
	c4AWHphBe1HtvjZ2O6sSDGQ=
X-Google-Smtp-Source: ABdhPJysFM6BWBZTOk5G+YgnuuZ4kNGbN46pkZcNsmQK1+ha5AI4dHgEynWCKy5DDVZEsNzKYaegNg==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr9586156wra.715.1639916979473;
        Sun, 19 Dec 2021 04:29:39 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id c187sm13879999wme.33.2021.12.19.04.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 04:29:39 -0800 (PST)
Date: Sun, 19 Dec 2021 12:29:37 +0000
From: Wei Liu <wei.liu@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Tianyu Lan <Tianyu.Lan@microsoft.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>, Long Li <longli@microsoft.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: Re: [hyperv:hyperv-next 4/5] drivers/hv/vmbus_drv.c:2082:29:
 warning: shift count >= width of type
Message-ID: <20211219122937.7zi3etrcl6rpob3t@liuwe-devbox-debian-v2>
References: <202112181827.o3X7GmHz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202112181827.o3X7GmHz-lkp@intel.com>

On Sat, Dec 18, 2021 at 06:20:43PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
> head:   19fd7ca00201c0525452dcf5a490e4b01674ef4c
> commit: 6327882f7b4a476ea902de4bee5657f1028d6859 [4/5] scsi: storvsc: Add Isolation VM support for storvsc driver
> config: x86_64-randconfig-a013-20211216 (https://download.01.org/0day-ci/archive/20211218/202112181827.o3X7GmHz-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31a4814592bbda7153833e46728dc7b21100)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/commit/?id=6327882f7b4a476ea902de4bee5657f1028d6859
>         git remote add hyperv https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
>         git fetch --no-tags hyperv hyperv-next
>         git checkout 6327882f7b4a476ea902de4bee5657f1028d6859
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hv/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/hv/vmbus_drv.c:2082:29: warning: shift count >= width of type [-Wshift-count-overflow]
>    static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
>                                ^~~~~~~~~~~~~~~~
>    include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
>    #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
>                                                         ^ ~~~

I don't think there is anything wrong with the code. When n is 64 the
problematic expression is not evaluated.

Wei.
