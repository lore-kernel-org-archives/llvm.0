Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5D7E5;
	Wed,  1 Feb 2023 04:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675224783; x=1706760783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AzFXkKZspu1LTGX7uHNgR84FKsqjBYy1uQUuqwlv2SM=;
  b=Bm6vnsy7RbDTaQh8oTxSWWgEVblTT88mg7Dr2q0urZcfu9rUHLOODHZd
   gk6ZPJumqjKUNB6SOE+Pz+ZElRRDFWl7EHbDBJtltl5aryNxRsGs/vWAl
   ZZ0i40ZRQu9foBcB2I9TZveqdAB6DTh6emEX2t9+2QZJErRadYmdr4DnY
   T9KmSg5nPVcSmpGgX72i9v0vRmJwJQs34qI0Aed1iXZ7hGMF0jVe/M75+
   l+A/wdXc2q3yexa2QSe5LTo2FMd+v76vNgtFQkmDNh90w9ZWNPlyup6SI
   8iZHL07aOLtcMHzB6/WBMG3ADYyb5QhSqjF0hnsQDpls4vNh5Wa0h4Nsk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="390403785"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="390403785"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 20:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="753478700"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="753478700"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Jan 2023 20:11:43 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN4TG-00052w-2Y;
	Wed, 01 Feb 2023 04:11:42 +0000
Date: Wed, 1 Feb 2023 12:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v9 10/16] dm-verity: consume root hash digest and
 signature data via LSM hook
Message-ID: <202302011153.Xnz2WjMM-lkp@intel.com>
References: <1675119451-23180-11-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675119451-23180-11-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on axboe-block/for-next lwn/docs-next linus/master v6.2-rc6 next-20230131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20230131-070059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/1675119451-23180-11-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v9 10/16] dm-verity: consume root hash digest and signature data via LSM hook
config: arm64-randconfig-r025-20230130 (https://download.01.org/0day-ci/archive/20230201/202302011153.Xnz2WjMM-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f782f147bd864b6e3fc14d28daa4780a7aab80e6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Fan-Wu/security-add-ipe-lsm/20230131-070059
        git checkout f782f147bd864b6e3fc14d28daa4780a7aab80e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm-verity-target.c:19:
>> drivers/md/dm-verity-verify-sig.h:38:5: warning: no previous prototype for function 'verity_verify_root_hash' [-Wmissing-prototypes]
   int verity_verify_root_hash(struct block_device *bdev, const void *data,
       ^
   drivers/md/dm-verity-verify-sig.h:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int verity_verify_root_hash(struct block_device *bdev, const void *data,
   ^
   static 
   1 warning generated.


vim +/verity_verify_root_hash +38 drivers/md/dm-verity-verify-sig.h

    37	
  > 38	int verity_verify_root_hash(struct block_device *bdev, const void *data,
    39				    size_t data_len, const void *sig_data,
    40				    size_t sig_len)
    41	{
    42		return 0;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
