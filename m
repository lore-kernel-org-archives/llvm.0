Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6EC10E9
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 01:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648861510; x=1680397510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7jVlny9eKCOZGz+JpaTeaYkMxEayrQ2fC9IOPYubG+0=;
  b=msQm7KYT0C19/SEpgN8lRvHoDMfFKL354E+m7acRmO+BpigNJ/nUssBr
   GXh5NAsPBn0aZNx/tT+DOYdWNvz7nQoUbdVEHUOEdKvw62S3sygApBQaq
   4j2NNZOkoWRCBuIFEnTGAU8xdKjuwO84eJ4CrpQM8rnumMGCbK6saQzMn
   CMpafYsB3N+s5RreQ4SA1iI/TsAVsUJP/N+z2TAQrAs0NC3qABlKIUX2r
   ZPG4P7Ko8SSGRSgYni14Hv5jgBRMvWiZpR/NmKKXXicXIEpIO6RYh/LG6
   2sjsjaHm7e0PtBtl63FJTi14VxMhQp2o4eQfktqszOqBdSl1hBy9ZgQ8p
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="320961739"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="320961739"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 18:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="567973947"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 18:05:09 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1naSCS-0001e8-9L;
	Sat, 02 Apr 2022 01:05:08 +0000
Date: Sat, 2 Apr 2022 09:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/display/psr: Lock and unlock
 PSR around pipe updates
Message-ID: <202204020818.P5BApjRe-lkp@intel.com>
References: <20220401222911.199284-2-jose.souza@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401222911.199284-2-jose.souza@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "José,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on v5.17 next-20220401]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Roberto-de-Souza/drm-i915-display-psr-Set-partial-frame-enable-when-forcing-full-frame-fetch/20220402-062837
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220402/202204020818.P5BApjRe-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project cc2e2b80a1f36a28fa7c96c38c2674b10868f09f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/955b4bf1a2fd2e6652980814983464f3db8f955f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jos-Roberto-de-Souza/drm-i915-display-psr-Set-partial-frame-enable-when-forcing-full-frame-fetch/20220402-062837
        git checkout 955b4bf1a2fd2e6652980814983464f3db8f955f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_psr.c:2485: warning: expecting prototype for intel_psr_lock(). Prototype was for intel_psr_unlock() instead


vim +2485 drivers/gpu/drm/i915/display/intel_psr.c

  2477	
  2478	/**
  2479	 * intel_psr_lock - grab psr.lock mutex
  2480	 * @crtc_state: the crtc state
  2481	 *
  2482	 * Release the PSR lock that was held during pipe update.
  2483	 */
  2484	void intel_psr_unlock(const struct intel_crtc_state *crtc_state)
> 2485	{

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
