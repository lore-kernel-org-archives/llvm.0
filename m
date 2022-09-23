Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87E933DC
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663932650; x=1695468650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=84UejJdhDEJCnvldvahVNy6IjsFDY6m8rBDKQfgI6Z4=;
  b=kTb4IyPVeFuYTkGaiQDS5F44VszmdmNOkOzq28v4Ef8PmH3B2p56Sdcr
   bywlflrmxDOSPKsRQ7fZnxV1QMAl6+ra6UcCRL/5wtjTw7QcMe6Fe1b6+
   C2mvcIKwv4d03b8uvql/wp2rQf19NwZsomDq5Km5P349gB6KNlNjn2Xzf
   +Iywjyr4OkNXkHxIEUycoUFXUYrWOWt885MilzfzYtKwhLVAp1AbG/VR3
   GkkKENDUzAmNFSl787q/U10nz5TpANyXNSjGHIOGz5gNqgNz28Z/EWwB2
   nsQn2QM/TPxvqLAa0XPIfrdVaSpTtgH2BZJax5IbjDAIiOyPMENjRQVLG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362383818"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="362383818"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 04:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="948989097"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2022 04:30:48 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obgtM-0005cZ-10;
	Fri, 23 Sep 2022 11:30:48 +0000
Date: Fri, 23 Sep 2022 19:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/2] perf: Add xilinx APM support
Message-ID: <202209231915.HeK5MPqT-lkp@intel.com>
References: <20220921080623.22077-3-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921080623.22077-3-shubhrajyoti.datta@amd.com>

Hi Shubhrajyoti,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on soc/for-next]
[also build test ERROR on robh/for-next linus/master v6.0-rc6]
[cannot apply to next-20220923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/Add-Add-Xilinx-APM-support/20220921-160807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: hexagon-randconfig-r003-20220922 (https://download.01.org/0day-ci/archive/20220923/202209231915.HeK5MPqT-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d83b0b48e141c96db63f78607b065810e9b39988
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shubhrajyoti-Datta/Add-Add-Xilinx-APM-support/20220921-160807
        git checkout d83b0b48e141c96db63f78607b065810e9b39988
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/perf/xilinx_apm.c:185:54: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ptr += sprintf(ptr, "event=0x%02x\n", (unsigned int)get_event(config));
                                                               ^
   drivers/perf/xilinx_apm.c:37:28: note: expanded from macro 'get_event'
   #define get_event(_config)      FIELD_GET(XAPM_EVENT_MASK, _config)
                                   ^
   drivers/perf/xilinx_apm.c:262:20: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           hwc->event_base = get_evtype(event->attr.config);
                             ^
   drivers/perf/xilinx_apm.c:38:29: note: expanded from macro 'get_evtype'
   #define get_evtype(_config)     FIELD_GET(XAPM_EVTYPE_MASK, _config)
                                   ^
   drivers/perf/xilinx_apm.c:443:10: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                                 res->start);
                                 ^~~~~~~~~~
   1 warning and 2 errors generated.


vim +/FIELD_GET +185 drivers/perf/xilinx_apm.c

   174	
   175	static ssize_t xapm_perf_event_show(struct device *dev,
   176					    struct device_attribute *attr, char *buf)
   177	{
   178		struct dev_ext_attribute *eattr;
   179		unsigned long config;
   180		char *ptr = buf;
   181	
   182		eattr = container_of(attr, struct dev_ext_attribute, attr);
   183		config = (unsigned long)eattr->var;
   184	
 > 185		ptr += sprintf(ptr, "event=0x%02x\n", (unsigned int)get_event(config));
   186	
   187		return (ssize_t)(ptr - buf);
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
