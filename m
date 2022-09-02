Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C6C10F0
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 05:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662096664; x=1693632664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZP16yHySMl8eG2EwQ8pPKQTQf9pSFzjCjniCmbqnYHY=;
  b=mXS0GojwET1pWG3ae/NKsiZ1lPLygvbynjwkVG0M9ylmWAiXV92PL0dM
   JHa1zOb0o86uIvGD/jXiD5tHFgWbLYhPwqQYoPQDx+u6nwx1eYq2POXJQ
   HNxusZb4pj9XMBe5+bZlUS/iFS8d1uZ3/Xks6hj5z95IwflIN179KCYOK
   BXZHZkTCimTaNpUagfNhVKaY4Re3zhVDLZgkrWXKLH+RFCzJK+8BJi6xK
   mplS+IHnO3aDJh3i95RSeX+RFZ7LW+grb/rcGVB7/Sx7B8mR1bn8l0pj3
   9nfO4L7Yszuv0Ar2Z7EMqgaDxiPKMrvF+qPAJNDN/wlqGsrDWAxD81L8q
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359856938"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="359856938"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 22:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="642767538"
Received: from lkp-server02.sh.intel.com (HELO fccc941c3034) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Sep 2022 22:31:02 -0700
Received: from kbuild by fccc941c3034 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTzGg-0000CN-0Z;
	Fri, 02 Sep 2022 05:31:02 +0000
Date: Fri, 2 Sep 2022 13:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH V5 vfio 04/10] vfio: Add an IOVA bitmap support
Message-ID: <202209021338.Yf1CDIZe-lkp@intel.com>
References: <20220901093853.60194-5-yishaih@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901093853.60194-5-yishaih@nvidia.com>

Hi Yishai,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yishai-Hadas/Add-device-DMA-logging-support-for-mlx5-driver/20220901-174304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git c5e4d5e99162ba8025d58a3af7ad103f155d2df7
config: hexagon-buildonly-randconfig-r004-20220901 (https://download.01.org/0day-ci/archive/20220902/202209021338.Yf1CDIZe-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/84e183bf41bda194be7b88bfeddddc93202bd550
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yishai-Hadas/Add-device-DMA-logging-support-for-mlx5-driver/20220901-174304
        git checkout 84e183bf41bda194be7b88bfeddddc93202bd550
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/vfio/iova_bitmap.c:405:24: warning: comparison of distinct pointer types ('typeof (1UL) *' (aka 'unsigned long *') and 'typeof (length >> mapped->pgshift) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
           unsigned long nbits = max(1UL, length >> mapped->pgshift), set = nbits;
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +405 drivers/vfio/iova_bitmap.c

   389	
   390	/**
   391	 * iova_bitmap_set() - Records an IOVA range in bitmap
   392	 * @bitmap: IOVA bitmap
   393	 * @iova: IOVA to start
   394	 * @length: IOVA range length
   395	 *
   396	 * Set the bits corresponding to the range [iova .. iova+length-1] in
   397	 * the user bitmap.
   398	 *
   399	 * Return: The number of bits set.
   400	 */
   401	unsigned long iova_bitmap_set(struct iova_bitmap *bitmap,
   402				      unsigned long iova, size_t length)
   403	{
   404		struct iova_bitmap_map *mapped = &bitmap->mapped;
 > 405		unsigned long nbits = max(1UL, length >> mapped->pgshift), set = nbits;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
