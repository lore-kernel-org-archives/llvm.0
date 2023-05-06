Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891476FA5;
	Sat,  6 May 2023 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683369672; x=1714905672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eYThk7xThecAD7U0kspgJQQjp3rX/qJ0z5PRl6YbFO0=;
  b=X0wBWLXaiDEvlv1iUz71OxVgDHjBkWrpVyA9qghnxEf1g3VRNwqaDGqN
   rb72Ek0YQQKYMw29jX6ulNSPds+pODX6osZITSzrRPY+fnw7yK5yrG+Bt
   D/jNrR170NOohtRdSDfXRom+eEefXszqcD+jaZQfn+o2wkqfsdZcevOs4
   9j1ieXGvpQHRqVJdouF9DMi+vetA0SGFjrFiW+I6Vncu2UxuEQzPllQdK
   8ffWeibNdtgrOWFZI5HDI9WttvJSCG0dAmZ3O9X6tGBNv3tBFQjwA+mZa
   zjljF4ApqQjzRea0+S/hXJAYRDVPxlqQ4iu6L07BA8jczPlmpb1qpFEbk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="435689036"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="435689036"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 03:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="872222092"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="872222092"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 May 2023 03:41:10 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvFLh-00009J-1Y;
	Sat, 06 May 2023 10:41:09 +0000
Date: Sat, 6 May 2023 18:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.4 23/26] crypto/algapi.c:431:3: error:
 non-void function 'crypto_unregister_alg' should return a value
Message-ID: <202305061817.CE4IZ6k3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   7e4ab664280ce88c69fad5875e49d02c7c4cf810
commit: 0eda47db82148ff66cd46f5b4677cd98336b1b3f [23/26] crypto: api - Demote BUG_ON() in crypto_unregister_alg() to a WARN_ON()
config: x86_64-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061817.CE4IZ6k3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=0eda47db82148ff66cd46f5b4677cd98336b1b3f
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout 0eda47db82148ff66cd46f5b4677cd98336b1b3f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061817.CE4IZ6k3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/algapi.c:431:3: error: non-void function 'crypto_unregister_alg' should return a value [-Wreturn-type]
                   return;
                   ^
   1 error generated.


vim +/crypto_unregister_alg +431 crypto/algapi.c

   417	
   418	int crypto_unregister_alg(struct crypto_alg *alg)
   419	{
   420		int ret;
   421		LIST_HEAD(list);
   422	
   423		down_write(&crypto_alg_sem);
   424		ret = crypto_remove_alg(alg, &list);
   425		up_write(&crypto_alg_sem);
   426	
   427		if (ret)
   428			return ret;
   429	
   430		if (WARN_ON(refcount_read(&alg->cra_refcnt) != 1))
 > 431			return;
   432	
   433		if (alg->cra_destroy)
   434			alg->cra_destroy(alg);
   435	
   436		crypto_remove_final(&list);
   437		return 0;
   438	}
   439	EXPORT_SYMBOL_GPL(crypto_unregister_alg);
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
