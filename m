Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5491FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649781447; x=1681317447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8zmapAeyFTtKr42ftB7igvZstrLdaQa5K0dOWyaPelI=;
  b=O3/o7hKpEyLyX2GTrx3IJvXdpAEzJnG+s+z4pZdtq3R4y5RV8yIRJo2U
   iu9Q3hzZidGC5ken4D0K9e3hcoy3TMI0ycpNzWgOe1W9XtqU8E032qbE8
   u2/yaL+MGRriA4q/iCBHfCreFD6hYxRvGW2Ob8pAtXhQecZ7Vj0otgOY8
   0fVJTgvGestMr85PBvQpA8uq2DWDUQJWZPjlrvwHgmeKsKNzJUq/vriEb
   xSTcE4CJejkA/lyo9cu51ZzDPlxto0c/9WeIkFX7/jFmzJ3lTVv5nPM8S
   8a3Uk7qStz0lVLQqNBnENEpWwc+/+78NR11E5k+ipO8HSm56Ddl9OzmQB
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="325340342"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="325340342"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 09:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="590393310"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Apr 2022 09:29:27 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neJOQ-0002zk-UN;
	Tue, 12 Apr 2022 16:29:26 +0000
Date: Wed, 13 Apr 2022 00:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com, jasowang@redhat.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, si-wei.liu@oracle.com,
	Eli Cohen <elic@nvidia.com>
Subject: Re: [PATCH v2 1/2] vdpa: Add support for querying vendor statistics
Message-ID: <202204130003.fROyiuxA-lkp@intel.com>
References: <20220412130402.46945-2-elic@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412130402.46945-2-elic@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Eli,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc2 next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Eli-Cohen/Show-statistics-for-a-vdpa-device/20220412-212129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
config: i386-randconfig-a004-20220411 (https://download.01.org/0day-ci/archive/20220413/202204130003.fROyiuxA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/813a1bf827634a8d7e148b133e2849fac37819cd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eli-Cohen/Show-statistics-for-a-vdpa-device/20220412-212129
        git checkout 813a1bf827634a8d7e148b133e2849fac37819cd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/typec/ drivers/vdpa/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/vdpa/vdpa.c:1122:61: warning: implicit conversion from 'int' to 's16' (aka 'short') changes value from 65535 to -1 [-Wconstant-conversion]
           [VDPA_ATTR_DEV_QUEUE_INDEX] = NLA_POLICY_RANGE(NLA_U32, 0, 65535),
                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/net/netlink.h:396:9: note: expanded from macro 'NLA_POLICY_RANGE'
           .max = _max                                     \
                  ^~~~
   1 warning generated.


vim +1122 drivers/vdpa/vdpa.c

  1114	
  1115	static const struct nla_policy vdpa_nl_policy[VDPA_ATTR_MAX + 1] = {
  1116		[VDPA_ATTR_MGMTDEV_BUS_NAME] = { .type = NLA_NUL_STRING },
  1117		[VDPA_ATTR_MGMTDEV_DEV_NAME] = { .type = NLA_STRING },
  1118		[VDPA_ATTR_DEV_NAME] = { .type = NLA_STRING },
  1119		[VDPA_ATTR_DEV_NET_CFG_MACADDR] = NLA_POLICY_ETH_ADDR,
  1120		/* virtio spec 1.1 section 5.1.4.1 for valid MTU range */
  1121		[VDPA_ATTR_DEV_NET_CFG_MTU] = NLA_POLICY_MIN(NLA_U16, 68),
> 1122		[VDPA_ATTR_DEV_QUEUE_INDEX] = NLA_POLICY_RANGE(NLA_U32, 0, 65535),
  1123	};
  1124	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
