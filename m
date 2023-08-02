Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07A110C;
	Wed,  2 Aug 2023 04:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690950192; x=1722486192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6487yMnOXVoGa8mCicwN9RDmCnny31ff9CNYFzRXXXw=;
  b=lUYImWGSSGohVQEiHYDnCzgKXrkApmQGFeAw3zyG2lpT34vGlk0yCKje
   Qd4d+HO52mNY6iyLqnMNZHrpDFm/AWfCulM3L7lOm+P41s3gliDyse/vy
   9bgzazcOOcK8braUD9GTx0qGYHP/bS2AN/pToT+FGiW9AVvzSsrqoeCtq
   SBBu9gk0L7IdRGtlncZwVBJiWlCtBItDzhX1bhaqaDF4Hx01KDbHnTe4P
   31ULqTWxu3DIZyqq57fPKa1ZXpwUalf5HGnEqdAEmjTVkrqy6kDP1aVfg
   pKXF1J++mPM3O/6JObno39hbyEnDWw4hpjR4MtKXlMGo0LQWkGkWN3T0w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369473744"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="369473744"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 21:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="902843404"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="902843404"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Aug 2023 21:23:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR3O6-0000rV-1F;
	Wed, 02 Aug 2023 04:23:06 +0000
Date: Wed, 2 Aug 2023 12:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <202308021233.ztWtV82e-lkp@intel.com>
References: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.5-rc4 next-20230801]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/drivers-fwnode-Extend-device_get_match_data-to-struct-bus_type/20230802-010931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230801170318.82682-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
config: i386-randconfig-r014-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021233.ztWtV82e-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021233.ztWtV82e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021233.ztWtV82e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/i2c-core-base.c:23:
>> include/linux/i2c.h:1038:2: error: redefinition of 'i2c_of_match_device'
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
   include/linux/i2c.h:1031:2: note: previous definition is here
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
>> drivers/i2c/i2c-core-base.c:146:11: error: call to undeclared function 'i2c_of_match_device_sysfs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
                           ^
   drivers/i2c/i2c-core-base.c:146:11: note: did you mean 'i2c_of_match_device'?
   include/linux/i2c.h:1038:2: note: 'i2c_of_match_device' declared here
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
>> drivers/i2c/i2c-core-base.c:146:9: error: incompatible integer to pointer conversion assigning to 'const struct of_device_id *' from 'int' [-Wint-conversion]
                   match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.
--
   In file included from drivers/i2c/i2c-smbus.c:11:
>> include/linux/i2c.h:1038:2: error: redefinition of 'i2c_of_match_device'
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
   include/linux/i2c.h:1031:2: note: previous definition is here
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
   1 error generated.


vim +/i2c_of_match_device +1038 include/linux/i2c.h

  1036	
  1037	static inline const struct of_device_id
> 1038	*i2c_of_match_device(const struct of_device_id *matches,
  1039			     struct i2c_client *client)
  1040	{
  1041		return NULL;
  1042	}
  1043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
