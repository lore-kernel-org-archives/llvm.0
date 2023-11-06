Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62598F61;
	Mon,  6 Nov 2023 05:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UlaL33PH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699247703; x=1730783703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OSXRo6ixbXt6IHHGTAYjmoYFLLZ5Lxvu/gV2Hvx4MYo=;
  b=UlaL33PHM/SPdudMUFUMFpY5HTQsFSV7EItWPn59J5rekPqUyvNPGUFL
   F6st01Gy8+Hg7yNUT53tdLhNC0OhGZtbsia8a3uZSCD1Xv5XRxl1CKa8a
   AkN5vU3oifM2qoA+TRAiUQoM0fh/zR1tCg8Uerlovly8u02ruv5lHRffB
   sjKToMUG2zySzyJc6UZXUJHgDkIB9q5V+/j1UyAZ81RxRpUdgzJUps1St
   wnuLoZvCTCG/S4dWUkSzZ2tWepTI1dY6HhHPUz7TnWkmxJimNUF462Fk5
   uZIeKJ86VYDqOdIcv1/KEXvu2luJmbxB0kh2bnFOp4/deq3ZHObab+CrC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379600190"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="379600190"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 21:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3508949"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2023 21:14:58 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzrwt-000688-2T;
	Mon, 06 Nov 2023 05:14:55 +0000
Date: Mon, 6 Nov 2023 13:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Heng Qi <hengqi@linux.alibaba.com>, netdev@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	"Liu, Yujie" <yujie.liu@intel.com>
Subject: Re: [PATCH net-next v2 4/5] virtio-net: support rx netdim
Message-ID: <202311061237.I4bMaa06-lkp@intel.com>
References: <12c77098b73313eea8fdc88a3d1d20611444827d.1698929590.git.hengqi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12c77098b73313eea8fdc88a3d1d20611444827d.1698929590.git.hengqi@linux.alibaba.com>

Hi Heng,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Heng-Qi/virtio-net-returns-whether-napi-is-complete/20231103-040818
base:   net-next/main
patch link:    https://lore.kernel.org/r/12c77098b73313eea8fdc88a3d1d20611444827d.1698929590.git.hengqi%40linux.alibaba.com
patch subject: [PATCH net-next v2 4/5] virtio-net: support rx netdim
config: arm-vexpress_defconfig (https://download.01.org/0day-ci/archive/20231106/202311061237.I4bMaa06-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061237.I4bMaa06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061237.I4bMaa06-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: net_dim_get_rx_moderation
   >>> referenced by virtio_net.c:3529 (drivers/net/virtio_net.c:3529)
   >>>               drivers/net/virtio_net.o:(virtnet_rx_dim_work) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: net_dim
   >>> referenced by virtio_net.c:2176 (drivers/net/virtio_net.c:2176)
   >>>               drivers/net/virtio_net.o:(virtnet_poll) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
