Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ED820EE0;
	Tue, 22 Aug 2023 23:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692746446; x=1724282446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kgy2s3AWh0nClfqy+h0H3jVvZUdkh/pPySDh330wzk8=;
  b=enumIz73kiWeO5DHm9rnfYsZYNamX/9s2f27VZ0YpuJNcvwxpVdxClEj
   2mD2ibpIsttFJO82KwBkGdvWFX4RrxFS4X2hPXyIMBWtW/kcfmmaBBc5n
   yUK77wt80FYM/my1TsmIaUGtwOCq0gZys3jtWr0KUur1w2WlvZqsWyMSq
   ts8fegvISjN35aqLEdjDoXe90YjQL+Oq+1Df96pZdWABs56j5DRJE9uI7
   iGdoh9Av86x5+dMzRzTZbrUUgfwNygMSz563kRhmKsO6Ca99Nut2Gy6dd
   6XxWS9fbbq++eRxs5MElXF/8/MzfCx6NPAxSn+tmhPST1w5BLAU+stiQr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="405017113"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="405017113"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 16:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="801866947"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="801866947"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 16:20:44 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYafz-0000c4-0j;
	Tue, 22 Aug 2023 23:20:43 +0000
Date: Wed, 23 Aug 2023 07:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-peheader-cleanup 11/17] ld.lld: error: Setup image
 size too big!
Message-ID: <202308230702.tJTGBA8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-peheader-cleanup
head:   7adbbfc82e28c75fa5ae9217df351b921f2e0960
commit: d109cd036fae945ab0281877d471854053ef3ba7 [11/17] x86/boot: Use fixed size of 16k for setup block
config: x86_64-randconfig-r023-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230702.tJTGBA8z-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230702.tJTGBA8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230702.tJTGBA8z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Setup image size too big!
>> ld.lld: error: Setup image size too big!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
