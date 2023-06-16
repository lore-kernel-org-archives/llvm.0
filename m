Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF01E18C11;
	Fri, 16 Jun 2023 14:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686924440; x=1718460440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N/d+Y/4Dq6rhjNnlkPdhh6+3o+oEa3eFMji5Z3JjKdI=;
  b=aAz5HyJCOqZVmkJG86Sg/Up1cGMMbh3hVj14C0ERqo4xkgAplEOL1cZs
   OUpRRJLH4sytVnJ6WnHEEnfq2W01+xuUK85SoaY7PocUDVX/q4Ws4zFrr
   IuveGlhmt1gkhOhX5TAm6u4Nl7TaO+xIxHJ0AniF87hXQp3OTX+Ed6mxq
   ZW3WIqjlTd8xA6Tq9EvHFJHEUubfqbfbtUlrUONiYJwqfAjQiZMyNwiqH
   P8REukwPFvFFaa9Ve1airoQNS/m/DtWwPxU/Q9ZWDATRYsNz8lzi2f1+j
   5matm8mNgIvV+T7InHAQhwWu5W7AkJetDNSHZYEnZVziy/nCYAVuzjlqn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="338838705"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="338838705"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:07:20 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="746278319"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="746278319"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 16 Jun 2023 07:07:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qAA6e-004Idn-11;
	Fri, 16 Jun 2023 17:07:16 +0300
Date: Fri, 16 Jun 2023 17:07:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [linux-next:master 6153/10326] drivers/block/pktcdvd.c:1315:13:
 warning: stack frame size (2496) exceeds limit (2048) in
 'pkt_handle_packets'
Message-ID: <ZIxsk1tiSwujC586@smile.fi.intel.com>
References: <202306160811.nV1bMsK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306160811.nV1bMsK4-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jun 16, 2023 at 08:43:56AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
> commit: 3a41db531e5124adaa3a9ab9ca0c724aee85b10c [6153/10326] pktcdvd: Get rid of custom printing macros
> config: riscv-buildonly-randconfig-r001-20230615 (https://download.01.org/0day-ci/archive/20230616/202306160811.nV1bMsK4-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3a41db531e5124adaa3a9ab9ca0c724aee85b10c
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 3a41db531e5124adaa3a9ab9ca0c724aee85b10c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ mm//
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306160811.nV1bMsK4-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/block/pktcdvd.c:1364:12: warning: stack frame size (3648) exceeds limit (2048) in 'kcdrwd' [-Wframe-larger-than]
>    static int kcdrwd(void *foobar)
>               ^
> >> drivers/block/pktcdvd.c:1315:13: warning: stack frame size (2496) exceeds limit (2048) in 'pkt_handle_packets' [-Wframe-larger-than]
>    static void pkt_handle_packets(struct pktcdvd_device *pd)
>                ^
>    2 warnings generated.

Ha, the added line

> 4b83e99ee7092d Jens Axboe      2023-01-04 @1315  static void pkt_handle_packets(struct pktcdvd_device *pd)
> 4b83e99ee7092d Jens Axboe      2023-01-04  1316  {

> 3a41db531e5124 Andy Shevchenko 2023-03-10  1317  	struct device *ddev = disk_to_dev(pd->disk);

is a simple macro

	#define disk_to_dev(disk) \
	        (&((disk)->part0->bd_device))

and looking into implementation it might be that clang mistakenly allocates
stack based on bd_device size. And since it's a randconfig, quite likely
something like GCOV, KASAN, etc. is involved.

Also note, that

struct block_device {
	...
	/*
	 * keep this out-of-line as it's both big and not needed in the fast
	 * path
	 */
	struct device           bd_device;
} __randomize_layout;

> 4b83e99ee7092d Jens Axboe      2023-01-04  1318  	struct packet_data *pkt, *next;

-- 
With Best Regards,
Andy Shevchenko


