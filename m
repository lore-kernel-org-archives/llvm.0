Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3878F68
	for <llvm@lists.linux.dev>; Sat, 27 Nov 2021 12:56:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="259666851"
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="259666851"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2021 04:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="458514770"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Nov 2021 04:56:51 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqxG6-0009X2-KG; Sat, 27 Nov 2021 12:56:50 +0000
Date: Sat, 27 Nov 2021 20:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kenny Ho <Kenny.Ho@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 2/4] bpf, perf: add ability to attach complete array
 of bpf prog to perf event
Message-ID: <202111272020.wypD6U2V-lkp@intel.com>
References: <20211118202840.1001787-3-Kenny.Ho@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118202840.1001787-3-Kenny.Ho@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kenny,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v5.15]
[also build test WARNING on next-20211126]
[cannot apply to bpf-next/master bpf/master tip/perf/core v5.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kenny-Ho/Add-ability-to-attach-bpf-programs-to-a-tracepoint-inside-a-cgroup/20211119-043050
base:    8bb7eca972ad531c9b149c0a51ab43a417385813
config: hexagon-randconfig-r045-20211118 (https://download.01.org/0day-ci/archive/20211127/202111272020.wypD6U2V-lkp@intel.com/config)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9de19275a9d70c47811096791fae34fedbdeeb94
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kenny-Ho/Add-ability-to-attach-bpf-programs-to-a-tracepoint-inside-a-cgroup/20211119-043050
        git checkout 9de19275a9d70c47811096791fae34fedbdeeb94
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/scsi/ufs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/ufs/ufshcd.c:32:
   In file included from include/trace/events/ufs.h:396:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   include/linux/trace_events.h:747:1: error: cannot combine with previous 'int' declaration specifier
   int perf_event_attach_bpf_prog_array(struct perf_event *event,
   ^
>> drivers/scsi/ufs/ufshcd.c:9415:44: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (!dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(64)))
                                                            ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.


vim +9415 drivers/scsi/ufs/ufshcd.c

47555a5c8a11a4 Yaniv Gardi  2015-10-28  9404  
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9405  /**
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9406   * ufshcd_set_dma_mask - Set dma mask based on the controller
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9407   *			 addressing capability
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9408   * @hba: per adapter instance
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9409   *
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9410   * Returns 0 for success, non-zero for failure
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9411   */
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9412  static int ufshcd_set_dma_mask(struct ufs_hba *hba)
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9413  {
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9414  	if (hba->capabilities & MASK_64_ADDRESSING_SUPPORT) {
ca3d7bf9c646e9 Akinobu Mita 2014-07-13 @9415  		if (!dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(64)))
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9416  			return 0;
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9417  	}
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9418  	return dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(32));
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9419  }
ca3d7bf9c646e9 Akinobu Mita 2014-07-13  9420  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
