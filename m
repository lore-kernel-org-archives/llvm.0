Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F3D136B
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651166213; x=1682702213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/+tcj9MOM8SRKwd/Bfj6oifzGIT2Rpk+mPUGMEyU7AI=;
  b=HN/c//B1rea2ZDQSDg7IJpyN3Gd/pL84ISNVnshbUajjvfaQeB0wLz+0
   0teYMJpW8QMWkqZ2lP/TcfRNrK9C6PlJBOb4hzpk+k6CyHVFBvocK8+QF
   J3TFRoyvStPUpEPp30yjpsYwH3GfLW1vvgt8otDGLKibG6lAA2giZFVrk
   2u09t+wfDrH0OLm+v5OzvC9TvNBxR4rA6+2j9zmQzKWo/t6horPZPFmM3
   JMOFGzgnQ0xu4wr/3bMDuI/dXftGyuKd+iIN993YmA0LXRcvYNCG/G+vs
   FjdBxQA5WiZ6sC/wSRBvieZREzlW2ttLvPAFa3wEWAblPK7U1R/kWP1FM
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="291519810"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="291519810"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 10:16:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="534001962"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Apr 2022 10:16:50 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nk7l3-0005Z5-ON;
	Thu, 28 Apr 2022 17:16:49 +0000
Date: Fri, 29 Apr 2022 01:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/2] Swiotlb: Add device bounce buffer allocation
 interface
Message-ID: <202204290145.wcC5anxG-lkp@intel.com>
References: <20220428141429.1637028-3-ltykernel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428141429.1637028-3-ltykernel@gmail.com>

Hi Tianyu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on next-20220428]
[cannot apply to linus/master v5.18-rc4 v5.18-rc3 v5.18-rc2 v5.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/swiotlb-Introduce-swiotlb-device-allocation-function/20220428-221517
base:    bdc61aad77faf67187525028f1f355eff3849f22
config: hexagon-randconfig-r045-20220428 (https://download.01.org/0day-ci/archive/20220429/202204290145.wcC5anxG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/68c4bec9aa77ed6aedaa27a63a2b1c5916f0db50
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tianyu-Lan/swiotlb-Introduce-swiotlb-device-allocation-function/20220428-221517
        git checkout 68c4bec9aa77ed6aedaa27a63a2b1c5916f0db50
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/base/core.c:30:
>> include/linux/swiotlb.h:213:6: warning: no previous prototype for function 'swiotlb_device_free' [-Wmissing-prototypes]
   void swiotlb_device_free(struct device *dev)
        ^
   include/linux/swiotlb.h:213:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void swiotlb_device_free(struct device *dev)
   ^
   static 
>> include/linux/swiotlb.h:217:5: warning: no previous prototype for function 'swiotlb_device_allocate' [-Wmissing-prototypes]
   int swiotlb_device_allocate(struct device *dev,
       ^
   include/linux/swiotlb.h:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int swiotlb_device_allocate(struct device *dev,
   ^
   static 
   2 warnings generated.


vim +/swiotlb_device_free +213 include/linux/swiotlb.h

   212	
 > 213	void swiotlb_device_free(struct device *dev)
   214	{
   215	}
   216	
 > 217	int swiotlb_device_allocate(struct device *dev,
   218				    unsigned int area_num,
   219				    unsigned long size)
   220	{
   221		return -ENOMEM;
   222	}
   223	#endif /* CONFIG_SWIOTLB */
   224	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
