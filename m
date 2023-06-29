Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E7F5257;
	Thu, 29 Jun 2023 07:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688023400; x=1719559400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=74L0FNsCDZ5Sbc+RH88Wm9TjQdzKD1PxAYE2xBAuh/8=;
  b=Ygy8FB/C50WFQjlKr55+0eEcA69A3ZhqJBWOpEmz8yGdCgvdd0Hpy+/N
   u63O4sXkNcYXu0I7S7PxDejt0zPgHA3wyImrHWTMYphehpG3vq2QyVFCE
   UEfEtXYVOQlI4qESb5/scPh9Hlls7uIfbWpw9jzz5hgNys56OWgEBGTKB
   wnQXXZ93YMTe4V6mLjDIeKNNGGR0BZ92PIUJZHS6zxuXM8KwFvn22k+1x
   BBhG19esahpAP/azZ1Mca57WZ6Br3FWSkkAo+zssyA+XsfjVvboYCPPlb
   /Dp0g4ANAGz5xquyuJIYGpaUUzgGoUYZ78Un2wPq2CuFP0+GPOWA1fq7b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="425714105"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="425714105"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 00:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047687351"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="1047687351"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 00:23:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qElzm-000Dwj-1p;
	Thu, 29 Jun 2023 07:23:14 +0000
Date: Thu, 29 Jun 2023 15:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <nmi@metaspace.dk>, Ming Lei <ming.lei@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
	gost.dev@samsung.com, Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v4 3/4] ublk: enable zoned storage support
Message-ID: <202306291515.z7ox8OTz-lkp@intel.com>
References: <20230628190649.11233-4-nmi@metaspace.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628190649.11233-4-nmi@metaspace.dk>

Hi Andreas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3261ea42710e9665c9151006049411bd23b5411f]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Hindborg/ublk-change-ublk-IO-command-defines-to-enum/20230629-031015
base:   3261ea42710e9665c9151006049411bd23b5411f
patch link:    https://lore.kernel.org/r/20230628190649.11233-4-nmi%40metaspace.dk
patch subject: [PATCH v4 3/4] ublk: enable zoned storage support
config: i386-randconfig-i006-20230628 (https://download.01.org/0day-ci/archive/20230629/202306291515.z7ox8OTz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291515.z7ox8OTz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291515.z7ox8OTz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __udivdi3
   >>> referenced by ublk_drv-zoned.c:16 (drivers/block/ublk_drv-zoned.c:16)
   >>>               drivers/block/ublk_drv-zoned.o:(ublk_set_nr_zones) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
