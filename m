Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AF115CB;
	Thu, 29 Jun 2023 02:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688007330; x=1719543330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i1sa4cvEA8Rmjxit7jRDnIHSuvuhYk3OiqZDlWsdOPk=;
  b=Zf/bVQi10/6ScZ/1QLGUtWX9h0p1GYtbECAK5PKbuws+W0miH2n4Y4p2
   /XF7JMJ2rvEGRFtjDUADQxfPLZ432RkskOl8MgO0pMfZ2XXidvVLrJqeW
   5wlbk6N7wlQHbIGk0kVDeK5rj4i6TRQAgiH1LQUPNR8H3AiibevYd7g2C
   cEHS2zebjiqCC0MHgMQ9Q6Y3oskyvVPBEzj5YBO3Z983uKg0fwlLm1o8g
   N3p/LDuqihvg95tP+7VzYz64kS7gdeJVoNLuFR4HdtX1NfKj0jCESmxtG
   aWKFu3OCUEnfM1E69BhLKNRS5q8MnoK04wT72XlxQeWhhAMcqAGU9RAW6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448394761"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="448394761"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 19:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="694478313"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="694478313"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jun 2023 19:55:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEhoH-000Div-1C;
	Thu, 29 Jun 2023 02:55:05 +0000
Date: Thu, 29 Jun 2023 10:54:49 +0800
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
Message-ID: <202306291026.DwVHcWAA-lkp@intel.com>
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
config: hexagon-randconfig-r041-20230628 (https://download.01.org/0day-ci/archive/20230629/202306291026.DwVHcWAA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291026.DwVHcWAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291026.DwVHcWAA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __hexagon_udivdi3
   >>> referenced by ublk_drv-zoned.c:16 (drivers/block/ublk_drv-zoned.c:16)
   >>>               drivers/block/ublk_drv-zoned.o:(ublk_set_nr_zones) in archive vmlinux.a
   >>> referenced by ublk_drv-zoned.c:16 (drivers/block/ublk_drv-zoned.c:16)
   >>>               drivers/block/ublk_drv-zoned.o:(ublk_set_nr_zones) in archive vmlinux.a
   >>> did you mean: __hexagon_udivsi3
   >>> defined in: vmlinux.a(arch/hexagon/lib/udivsi3.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
