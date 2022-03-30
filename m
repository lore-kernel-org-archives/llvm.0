Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51787C
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 20:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648671901; x=1680207901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wboxa4jZtmOkjpLUdeWqAzwK0HTPOa90n7+6qqhyKlo=;
  b=WgDdTuCnyLWkoTXVWtJL5/j7TRvnR9EcKJldIeN1oQYDFcPtmsnfmEJr
   4XfW2yPX2dcdg5LgP0ErIeVKxWJeZiE0zb2TDFswUpDQ2IEKgeOe7DGjp
   c632KqoawpTXbfijRU4NkAAGjHWdaM2PYwySgCFlezIHhZ2zRkFZpCJ62
   oI5y36MEbzCZbNF8hIqxkXbX/zOdYuJ43IC60MWcCxg9fqZvDODNihAc3
   HGwRb/5RgggBMgLjIBOusZUnhgADzTKFib5n5K2eZSjAlnJCLF0ugJWf0
   HRslRJBTAqGNJ9e/lXLP344JU1lOUIyp73Jj3VHsFviOB/GFExziIJgb1
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="247139092"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="247139092"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 13:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="547000682"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2022 13:25:00 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nZesF-0000T6-Ip;
	Wed, 30 Mar 2022 20:24:59 +0000
Date: Thu, 31 Mar 2022 04:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] dmaengine: apple-admac: Add Apple ADMAC driver
Message-ID: <202203310457.QwVTRPVs-lkp@intel.com>
References: <20220330164458.93055-3-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330164458.93055-3-povik+lin@cutebit.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Martin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220330]
[cannot apply to vkoul-dmaengine/next linus/master v5.17 v5.17-rc8 v5.17-rc7 v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Povi-er/Apple-ADMAC-driver/20220331-004821
base:    a67ba3cf9551f8c92d5ec9d7eae1aadbb9127b57
config: arm64-randconfig-r036-20220330 (https://download.01.org/0day-ci/archive/20220331/202203310457.QwVTRPVs-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/59c4f21d2dd9da4011ffb3644127b35d12f6786a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Martin-Povi-er/Apple-ADMAC-driver/20220331-004821
        git checkout 59c4f21d2dd9da4011ffb3644127b35d12f6786a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/apple-admac.c:213:11: warning: format specifies type 'void *' but the argument has type 'dma_addr_t' (aka 'unsigned long long') [-Wformat]
                   channo, addr, tx->period_len, FLAG_DESC_NOTIFY);
                           ^~~~
   include/linux/dev_printk.h:158:46: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                               ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
>> drivers/dma/apple-admac.c:213:33: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                   channo, addr, tx->period_len, FLAG_DESC_NOTIFY);
                                                 ^~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:158:46: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                               ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   drivers/dma/apple-admac.c:32:26: note: expanded from macro 'FLAG_DESC_NOTIFY'
   #define FLAG_DESC_NOTIFY        BIT(16)
                                   ^~~~~~~
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +213 drivers/dma/apple-admac.c

   197	
   198	/*
   199	 * Write one hardware descriptor for a dmaengine cyclic transaction.
   200	 */
   201	static void admac_cyclic_write_one_desc(struct admac_data *ad, int channo,
   202						struct admac_tx *tx)
   203	{
   204		dma_addr_t addr;
   205	
   206		if (WARN_ON(!tx->cyclic))
   207			return;
   208	
   209		addr = tx->buf_addr + (tx->submitted_pos % tx->buf_len);
   210		WARN_ON(addr + tx->period_len > tx->buf_end);
   211	
   212		dev_dbg(ad->dev, "ch%d descriptor: addr=0x%pad len=0x%zx flags=0x%x\n",
 > 213			channo, addr, tx->period_len, FLAG_DESC_NOTIFY);
   214	
   215		admac_poke(ad, REG_DESC_WRITE(channo), addr);
   216		admac_poke(ad, REG_DESC_WRITE(channo), addr >> 32);
   217		admac_poke(ad, REG_DESC_WRITE(channo), tx->period_len);
   218		admac_poke(ad, REG_DESC_WRITE(channo), FLAG_DESC_NOTIFY);
   219	
   220		tx->submitted_pos += tx->period_len;
   221		tx->submitted_pos %= 2 * tx->buf_len;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
