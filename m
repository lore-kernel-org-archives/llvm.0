Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF58F7C;
	Fri, 14 Apr 2023 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681471109; x=1713007109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l4qNLKTj9QPpHS6kKM/BJm4nUevcTnmASIXPMvkuWmw=;
  b=KeotX9sfjx6GqDBd/rsp9X38wY1tsS9mxE/TiXt3EakCT27LPJdPAd0B
   wOSuwVY+kF1Wkcuy92ZegytFrT1hS8m4COFH8EgDM0DWS1R9eOj0AZGIr
   h10/a9veOPjbzOj003KBezYg3Rtebz197uRI955+k0mMNHjNQtI5KZUDM
   iDFPbI0VAjwcu3j9z1Na/o3Q/Jckmzw9uL0iHQFwldhRDgeHKVovFxdM7
   fbnTl0vGmFi0vWOfZhRbUg7yTiTssmyzbhM2Ic7WxnusG1ki+sfdK/GZa
   OvImY8Vt8Vw4gxfHly5YIF0Pj+HEUjqTSPd5eNoogh2UmZx748NBVMQz6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="430733833"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="430733833"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 04:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="935984364"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="935984364"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2023 04:18:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnHRi-000ZTX-1P;
	Fri, 14 Apr 2023 11:18:26 +0000
Date: Fri, 14 Apr 2023 19:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/5] perf: Add fork to the sideband ioctl
Message-ID: <202304141902.2MeBvBcO-lkp@intel.com>
References: <20230414082300.34798-3-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414082300.34798-3-adrian.hunter@intel.com>

Hi Adrian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on acme/perf/core]
[also build test WARNING on tip/perf/core tip/master tip/auto-latest linus/master v6.3-rc6 next-20230413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Hunter/perf-Add-ioctl-to-emit-sideband-events/20230414-162719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core
patch link:    https://lore.kernel.org/r/20230414082300.34798-3-adrian.hunter%40intel.com
patch subject: [PATCH RFC 2/5] perf: Add fork to the sideband ioctl
config: i386-randconfig-a002-20230410 (https://download.01.org/0day-ci/archive/20230414/202304141902.2MeBvBcO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/48bf5fef7be6160c89995b4f98ffed4312999e96
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Adrian-Hunter/perf-Add-ioctl-to-emit-sideband-events/20230414-162719
        git checkout 48bf5fef7be6160c89995b4f98ffed4312999e96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/events/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141902.2MeBvBcO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:7975:6: warning: no previous prototype for function 'perf_output_f_wrapper' [-Wmissing-prototypes]
   void perf_output_f_wrapper(struct perf_event *event, void *data)
        ^
   kernel/events/core.c:7975:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void perf_output_f_wrapper(struct perf_event *event, void *data)
   ^
   static 
   1 warning generated.


vim +/perf_output_f_wrapper +7975 kernel/events/core.c

  7974	
> 7975	void perf_output_f_wrapper(struct perf_event *event, void *data)
  7976	{
  7977		struct perf_output_f_data *f_data = data;
  7978	
  7979		f_data->func(event, f_data->data);
  7980	}
  7981	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
