Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E32C82
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118180; x=1674654180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x+a5Z1XP4uKLId4JeGm19/FSwvCA8i9jwFC/ezaIeWg=;
  b=lzuq7SxTJFMy7AyPEZM3IK7eXLJWybJ9Sx139mxZQIld9Y5FE84tR5dx
   4gTuuG1BZ+7JBRm8FI7xyknECXzUwqsY3JRzUxk9sW6hw9tB5nJkc2c6s
   OvRlaGMPG7CAAPKWKuqn/LycsJz13rdyS8GGoSjGf5/22PtPyIpNKRfRt
   9kw9SbS1/7n/NdiOgKlJX+ImLimwbVKnHXyMDJj5TaE/az7PBXYpEtZip
   x/hiRvfuXsAvxCZkvuLJj2Jy7O6rNCQJS77xduUj/FHr+PsUKuqXgmQjz
   FPlwPIleidFLfZTsF0zeoGfyhRI0LNJ5mr4T1UtXeJGWolUcrHJqSAooD
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="245133580"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="245133580"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 05:42:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="597126727"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2022 05:42:57 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCM65-000Jxj-90; Tue, 25 Jan 2022 13:42:57 +0000
Date: Tue, 25 Jan 2022 21:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/5] driver/net/tun: Added features for USO.
Message-ID: <202201252109.aW3GcH2N-lkp@intel.com>
References: <20220125084702.3636253-3-andrew@daynix.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125084702.3636253-3-andrew@daynix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andrew,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]
[also build test WARNING on net/master mst-vhost/linux-next linus/master v5.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andrew-Melnychenko/TUN-VirtioNet-USO-features-support/20220125-171057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 6e667749271e58d34238cf700e543beabdbe6184
config: arm-randconfig-r005-20220124 (https://download.01.org/0day-ci/archive/20220125/202201252109.aW3GcH2N-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/3c1c2daa10c8eac3d9b546fa8caf99fcb5a40454
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andrew-Melnychenko/TUN-VirtioNet-USO-features-support/20220125-171057
        git checkout 3c1c2daa10c8eac3d9b546fa8caf99fcb5a40454
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/tap.c:945:11: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
                   if (arg & (TUN_F_USO4 | TUN_F_USO6) == (TUN_F_USO4 | TUN_F_USO6))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/tap.c:945:11: note: place parentheses around the '==' expression to silence this warning
                   if (arg & (TUN_F_USO4 | TUN_F_USO6) == (TUN_F_USO4 | TUN_F_USO6))
                           ^
                             (                                                     )
   drivers/net/tap.c:945:11: note: place parentheses around the & expression to evaluate it first
                   if (arg & (TUN_F_USO4 | TUN_F_USO6) == (TUN_F_USO4 | TUN_F_USO6))
                           ^
                       (                              )
   drivers/net/tap.c:958:19: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
               feature_mask & (TUN_F_USO4 | TUN_F_USO6) == (TUN_F_USO4 | TUN_F_USO6))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/tap.c:958:19: note: place parentheses around the '==' expression to silence this warning
               feature_mask & (TUN_F_USO4 | TUN_F_USO6) == (TUN_F_USO4 | TUN_F_USO6))
                            ^
                              (                                                     )
   drivers/net/tap.c:958:19: note: place parentheses around the & expression to evaluate it first
               feature_mask & (TUN_F_USO4 | TUN_F_USO6) == (TUN_F_USO4 | TUN_F_USO6))
                            ^
               (                                       )
   2 warnings generated.


vim +945 drivers/net/tap.c

   919	
   920	static int set_offload(struct tap_queue *q, unsigned long arg)
   921	{
   922		struct tap_dev *tap;
   923		netdev_features_t features;
   924		netdev_features_t feature_mask = 0;
   925	
   926		tap = rtnl_dereference(q->tap);
   927		if (!tap)
   928			return -ENOLINK;
   929	
   930		features = tap->dev->features;
   931	
   932		if (arg & TUN_F_CSUM) {
   933			feature_mask = NETIF_F_HW_CSUM;
   934	
   935			if (arg & (TUN_F_TSO4 | TUN_F_TSO6)) {
   936				if (arg & TUN_F_TSO_ECN)
   937					feature_mask |= NETIF_F_TSO_ECN;
   938				if (arg & TUN_F_TSO4)
   939					feature_mask |= NETIF_F_TSO;
   940				if (arg & TUN_F_TSO6)
   941					feature_mask |= NETIF_F_TSO6;
   942			}
   943	
   944			/* TODO: for now USO4 and USO6 should work simultaneously */
 > 945			if (arg & (TUN_F_USO4 | TUN_F_USO6) == (TUN_F_USO4 | TUN_F_USO6))
   946				features |= NETIF_F_GSO_UDP_L4;
   947		}
   948	
   949		/* tun/tap driver inverts the usage for TSO offloads, where
   950		 * setting the TSO bit means that the userspace wants to
   951		 * accept TSO frames and turning it off means that user space
   952		 * does not support TSO.
   953		 * For tap, we have to invert it to mean the same thing.
   954		 * When user space turns off TSO, we turn off GSO/LRO so that
   955		 * user-space will not receive TSO frames.
   956		 */
   957		if (feature_mask & (NETIF_F_TSO | NETIF_F_TSO6) ||
   958		    feature_mask & (TUN_F_USO4 | TUN_F_USO6) == (TUN_F_USO4 | TUN_F_USO6))
   959			features |= RX_OFFLOADS;
   960		else
   961			features &= ~RX_OFFLOADS;
   962	
   963		/* tap_features are the same as features on tun/tap and
   964		 * reflect user expectations.
   965		 */
   966		tap->tap_features = feature_mask;
   967		if (tap->update_features)
   968			tap->update_features(tap, features);
   969	
   970		return 0;
   971	}
   972	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
