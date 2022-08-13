Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528B67EC
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660386257; x=1691922257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AI/ZjbXXGKaR+KWga5q8jUaSQly+j2b9tIwYV4eb+r4=;
  b=Nkm2Uw5GCvz3tLkTHAjsh3nDPQQ0gB7R7Uti3FmObTGM/hN4sKJ79grW
   16gqcXJgDJmvWmkT4/8BWQ+Txq73HkK5BbFllTWQE7lNUaH9OZajwi+EI
   pkA1zH5NDjiHI09ePrbZqqm2sPIfuY3eJ/vNYdXsZJ7i+IMR++XoJlPjj
   bY7YeUoDAwGn+eluW8ebI1YIzlS54EU66cVnHkWoMzx2U++hDPF09DU1/
   13xraFIID3MwCCMxb9y2hbfJ1UKtoTGa6IsFRM5b8WMF6Sn1nn7b4fnC1
   Vrku/CWk6NEOyG4UCzsLVsaA0pXe5Y8Veg8g0MIjIqWml+I9hZeDk44Wd
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="290497529"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="290497529"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 03:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="851812436"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Aug 2022 03:24:15 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMoJS-0001ZH-2B;
	Sat, 13 Aug 2022 10:24:14 +0000
Date: Sat, 13 Aug 2022 18:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] power: supply: Add Lenovo Yoga C630 EC driver
Message-ID: <202208131821.HWmmofHI-lkp@intel.com>
References: <20220810030500.2793882-3-bjorn.andersson@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810030500.2793882-3-bjorn.andersson@linaro.org>

Hi Bjorn,

I love your patch! Yet something to improve:

[auto build test ERROR on sre-power-supply/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v5.19 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/power-supply-Lenovo-Yoga-C630-EC/20220810-110737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20220813/202208131821.HWmmofHI-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/d194cf7394bbf827844847bbde97efa1283ccb08
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bjorn-Andersson/power-supply-Lenovo-Yoga-C630-EC/20220810-110737
        git checkout d194cf7394bbf827844847bbde97efa1283ccb08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/power/supply/yoga-c630-ec.c:225:24: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ec->adapter_online = FIELD_GET(LENOVO_EC_ADPT_PRESENT, val);
                                        ^
   drivers/power/supply/yoga-c630-ec.c:391:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (FIELD_GET(LENOVO_EC_USB_EVENT_MUX, event))
               ^
>> drivers/power/supply/yoga-c630-ec.c:493:9: error: call to undeclared function 'devm_drm_bridge_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = devm_drm_bridge_add(dev, &ec->bridge);
                         ^
   drivers/power/supply/yoga-c630-ec.c:493:9: note: did you mean 'drm_bridge_add'?
   include/drm/drm_bridge.h:798:6: note: 'drm_bridge_add' declared here
   void drm_bridge_add(struct drm_bridge *bridge);
        ^
   3 errors generated.


vim +/FIELD_GET +225 drivers/power/supply/yoga-c630-ec.c

   216	
   217	static int yoga_c630_ec_update_adapter_status(struct yoga_c630_ec *ec)
   218	{
   219		int val;
   220	
   221		mutex_lock(&ec->lock);
   222	
   223		val = yoga_c630_ec_read8(ec, LENOVO_EC_ADPT_STATUS);
   224		if (val > 0)
 > 225			ec->adapter_online = FIELD_GET(LENOVO_EC_ADPT_PRESENT, val);
   226	
   227		mutex_unlock(&ec->lock);
   228	
   229		return val;
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
