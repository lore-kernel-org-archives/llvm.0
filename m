Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632CA29CA
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 17:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643305630; x=1674841630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q7j840C1wGJf53Hp/9GYEyeHEbOI9B1npOOT1aGZzHw=;
  b=KUTd9iJvgi9AAi1AyP2L4Nq0Nq5mLCNFD25etZsNaY5+nRM+IO3unMbF
   ugxFMViZlkBZTbAfBeqVCAjLXlYtIfLd0rTqF0WWJfKoEybpZuXAWdb63
   gmRzyJjvoszdeoYgFfnHX71PJ9OquggIW9XXSvZ8uPMtkGWVJ72FRczTi
   o959RyhWluXfjX8z+SG/ThiRPA1W8Uw4DLSHYg5u6FrQPC8Cib5ctkj/0
   a1hqNYwPJwY9doec4FP8FEKzRgltLjYzZRnnpypzYOgKLW4JZad4QLBDs
   OhT6WwdtEhqqglQYYLS3pLcmVwqmagdftvVZAWlAkNQKk+dzsfP5WBrnd
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="244526653"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="244526653"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 09:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="563874781"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Jan 2022 09:47:06 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nD8rR-000Msc-PJ; Thu, 27 Jan 2022 17:47:05 +0000
Date: Fri, 28 Jan 2022 01:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, hch@lst.de, jgg@nvidia.com,
	jani.nikula@linux.intel.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Terrence Xu <terrence.xu@intel.com>,
	intel-gvt-dev@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/3] i915/gvt: Introduce the mmio_table.c to
 support VFIO new mdev API
Message-ID: <202201280121.YX5gboDp-lkp@intel.com>
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127120508.11330-1-zhi.a.wang@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Zhi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220127]
[cannot apply to drm-intel/for-linux-next hch-configfs/for-next v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhi-Wang/i915-gvt-Introduce-the-mmio_table-c-to-support-VFIO-new-mdev-API/20220127-200727
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220128/202201280121.YX5gboDp-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dccb9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/533f92651a7a56481a053f1e04dc5a5ec024ffb9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zhi-Wang/i915-gvt-Introduce-the-mmio_table-c-to-support-VFIO-new-mdev-API/20220127-200727
        git checkout 533f92651a7a56481a053f1e04dc5a5ec024ffb9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gvt/handlers.c:45:6: warning: no previous prototype for function 'intel_gvt_match_device' [-Wmissing-prototypes]
   bool intel_gvt_match_device(struct intel_gvt *gvt,
        ^
   drivers/gpu/drm/i915/gvt/handlers.c:45:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool intel_gvt_match_device(struct intel_gvt *gvt,
   ^
   static 
   1 warning generated.


vim +/intel_gvt_match_device +45 drivers/gpu/drm/i915/gvt/handlers.c

12d14cc43b3470 Zhi Wang 2016-08-30  44  
12d14cc43b3470 Zhi Wang 2016-08-30 @45  bool intel_gvt_match_device(struct intel_gvt *gvt,
12d14cc43b3470 Zhi Wang 2016-08-30  46  		unsigned long device)
12d14cc43b3470 Zhi Wang 2016-08-30  47  {
533f92651a7a56 Zhi Wang 2022-01-27  48  	return intel_gvt_get_device_type(gvt->gt->i915) & device;
12d14cc43b3470 Zhi Wang 2016-08-30  49  }
12d14cc43b3470 Zhi Wang 2016-08-30  50  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
