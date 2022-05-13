Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF1817E7
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 01:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652403628; x=1683939628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+1Fqogl6MRxCjd5uyzI3/s5nb7F3MKz0w+tdYBiDPk=;
  b=U7xO3zTBYaeINxqRx8NCAu0WYQltTV1/sAp5R6ov6eSdntWkZyBn5dtZ
   ESz9aBEYtcKvBARUOJ5QRlRIT/vzO0eSA1/RfJBenFcoF9vkKHiRYghXP
   EoNMaCEE5v3QQT2PbzFqZQNFN5DkziCxJr9n+wzH/0tFU4U7htEMyVWHZ
   me2QpnHwD/+IhWXGHAfd2eMPvTa1c8LRFKNYDv6wZNR+Ik72WiJbPQCzU
   9X7u/f2CNqmyQ6Xneu5xrGq/I44KgWWOkUMaG5E/GQ5RHJMC22vAvyXRB
   mMgoOMpCXSUAngizqn6yCyn6p3V1gkPdUKT1cv7V6RSBr0N7bMP77PLEr
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="257722911"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="257722911"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 18:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="603623377"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 May 2022 18:00:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npJfH-000L7m-5u;
	Fri, 13 May 2022 01:00:19 +0000
Date: Fri, 13 May 2022 09:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, jic23@kernel.org,
	lars@metafoo.de, robh+dt@kernel.org, tomas.melin@vaisala.com,
	andy.shevchenko@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH V5 3/5] iio: accel: sca3300: modified to support multi
 chips
Message-ID: <202205130824.ObRAkagG-lkp@intel.com>
References: <20220512160312.3880433-4-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512160312.3880433-4-Qing-wu.Li@leica-geosystems.com.cn>

Hi LI,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/LI-Qingwu/iio-accel-sca3300-add-compatible-for-scl3300/20220513-000857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: hexagon-randconfig-r041-20220512 (https://download.01.org/0day-ci/archive/20220513/202205130824.ObRAkagG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/15579266e58d7cdf4ff8e7ad7a4fa30a0bd3a589
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review LI-Qingwu/iio-accel-sca3300-add-compatible-for-scl3300/20220513-000857
        git checkout 15579266e58d7cdf4ff8e7ad7a4fa30a0bd3a589
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iio/accel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iio/accel/sca3300.c:288:54: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
                   if (sca_data->chip->avail_modes_table[i] == reg_val&0x03)
                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/iio/accel/sca3300.c:288:54: note: place parentheses around the '==' expression to silence this warning
                   if (sca_data->chip->avail_modes_table[i] == reg_val&0x03)
                                                                      ^
                       (                                              )
   drivers/iio/accel/sca3300.c:288:54: note: place parentheses around the & expression to evaluate it first
                   if (sca_data->chip->avail_modes_table[i] == reg_val&0x03)
                                                                      ^
                                                               (           )
   1 warning generated.


vim +288 drivers/iio/accel/sca3300.c

   276	
   277	static int sca3300_get_op_mode(struct sca3300_data *sca_data, int *index)
   278	{
   279		int reg_val;
   280		int ret;
   281		int i;
   282	
   283		ret = sca3300_read_reg(sca_data, SCA3300_REG_MODE, &reg_val);
   284		if (ret)
   285			return ret;
   286	
   287		for (i = 0; i < sca_data->chip->num_avail_modes; i++) {
 > 288			if (sca_data->chip->avail_modes_table[i] == reg_val&0x03)
   289				break;
   290		}
   291	
   292		if (i >= sca_data->chip->num_avail_modes)
   293			return -EINVAL;
   294	
   295		*index = i;
   296		return 0;
   297	}
   298	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
