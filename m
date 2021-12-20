Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA06173
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 17:44:38 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id e5so21635867wrc.5
        for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 09:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=COpSoZwmnRvBNoLHp+2DxbYAIb0dSgQ0tqkVz4IdVjY=;
        b=pKA/dzaC695QYNEjcBOMhzwIYEnyfCk0TkUcoj4bs50p2dsNAtv6i1y+dEJh0qOGjp
         o6KGdxe4iNLPG2/7BI1kWSZobNpKdcVYpI9PA1ES/YtLBVnZX9kENJsZp3f3i4j0MJTq
         qZLSmXMlOVvtpDBmBx1B2nWtJGrevmrRo3z/PYrxXVwfaMMaWl6QlhyZnnKoAhrQC5tx
         vjGIIPub1+PkvrdyDJiJ+0OEMSxSI837qrPgEwKzGDA9zB/suNBN2akvMp314g0sfOk/
         jgbADq3xHlz28NCsuinhKOHALK6oOzuWnMz15AHckZhCuPheokII4kqVTHZMZ4wZT0KQ
         7Tig==
X-Gm-Message-State: AOAM533P4iqpq/u0pX4yRQC4hmNn/ytdlumbDHQKdWo6qmoPbYuYqilC
	nlT5IO7dZ81NqzGRoL+Ireg=
X-Google-Smtp-Source: ABdhPJzRF+ZPpVA5NWW+LdDQ/fybqOOqa0SuF9Tqv5iH/rurEe4M3yMlfZN03Z4YyH6eXS2K7+uE8w==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr13798439wrv.299.1640022277280;
        Mon, 20 Dec 2021 09:44:37 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id k9sm6165763wro.80.2021.12.20.09.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 09:44:37 -0800 (PST)
Date: Mon, 20 Dec 2021 17:44:35 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Wei Liu <wei.liu@kernel.org>, kernel test robot <lkp@intel.com>,
	Tianyu Lan <Tianyu.Lan@microsoft.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Long Li <longli@microsoft.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: Re: [hyperv:hyperv-next 4/5] drivers/hv/vmbus_drv.c:2082:29:
 warning: shift count >= width of type
Message-ID: <20211220174435.2mv4gna5eu7awzt5@liuwe-devbox-debian-v2>
References: <202112181827.o3X7GmHz-lkp@intel.com>
 <20211219122937.7zi3etrcl6rpob3t@liuwe-devbox-debian-v2>
 <YcC1CobR/n0tJhdV@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcC1CobR/n0tJhdV@archlinux-ax161>

On Mon, Dec 20, 2021 at 09:53:30AM -0700, Nathan Chancellor wrote:
> Hi Wei,
> 
> On Sun, Dec 19, 2021 at 12:29:37PM +0000, Wei Liu wrote:
> > On Sat, Dec 18, 2021 at 06:20:43PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
> > > head:   19fd7ca00201c0525452dcf5a490e4b01674ef4c
> > > commit: 6327882f7b4a476ea902de4bee5657f1028d6859 [4/5] scsi: storvsc: Add Isolation VM support for storvsc driver
> > > config: x86_64-randconfig-a013-20211216 (https://download.01.org/0day-ci/archive/20211218/202112181827.o3X7GmHz-lkp@intel.com/config)
> > > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31a4814592bbda7153833e46728dc7b21100)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/commit/?id=6327882f7b4a476ea902de4bee5657f1028d6859
> > >         git remote add hyperv https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
> > >         git fetch --no-tags hyperv hyperv-next
> > >         git checkout 6327882f7b4a476ea902de4bee5657f1028d6859
> > >         # save the config file to linux build tree
> > >         mkdir build_dir
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hv/
> > > 
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> drivers/hv/vmbus_drv.c:2082:29: warning: shift count >= width of type [-Wshift-count-overflow]
> > >    static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
> > >                                ^~~~~~~~~~~~~~~~
> > >    include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
> > >    #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
> > >                                                         ^ ~~~
> > 
> > I don't think there is anything wrong with the code. When n is 64 the
> > problematic expression is not evaluated.
> 
> Yes, unfortunately, this is an outstanding bug in clang where it does
> not properly build a control flow graph for expressions at a global
> scope:
> 
> https://github.com/ClangBuiltLinux/linux/issues/92
> 
> We should absolutely fix that but it has not come up too often so other
> fires have been prioritized. Now that -Werror is a thing, that issue's
> priority should probably be upgraded, as this warning will break
> allmodconfig for clang.

Thanks for the explanation.

> 
> If you were feeling generous, just changing that to ~0ULL directly would
> solve the warning but I get that it is less documentation that way.

I would actually like to keep the code as-is because it gives a clear
idea what it is doing.

Wei.

> 
> Cheers,
> Nathan
