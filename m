Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E091A7E;
	Tue,  1 Aug 2023 03:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690860272; x=1722396272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G51An+UOcZdd/1cd0HK6KxXN3B51gud4QnR4LTE8fak=;
  b=PXgn0xoIPmK8bT3nwf293nDHiJx0DA1N9MJZAWgRkMd5CdUWQWDQLBIr
   2jjUdOERrX1ujUp9Umz3teK002ukJm0eBQd8fKav9WBLBo4PKkiIwaBp2
   9LziGutqmTfIik28llAdg35YjubahqY8A6YeSHWvJfNz3RQxxc8Ru8WsG
   2fgRK1D3p5Av+WvwhLzq5v5/IsjgTUNeitzF0UlG6Ks2bZYc2vZtks/Kb
   1K96KXsPdByg8fwY4oR4zm9H1sI25ulKu4p9tMiBZ3mdBOcGQAgkP/XDL
   QLmuEALjjkZLUcneam6J5EchbBcd5wj54oEDxPuZh4B8YBhJuE1tFvHod
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="433022079"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="433022079"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 20:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798496273"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="798496273"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2023 20:24:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQfzo-0005aE-2n;
	Tue, 01 Aug 2023 03:24:28 +0000
Date: Tue, 1 Aug 2023 11:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Wang <wangzhu9@huawei.com>, linux@armlinux.org.uk,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	u.kleine-koenig@pengutronix.de, arnd@arndb.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	wangzhu9@huawei.com
Subject: Re: [PATCH -next] drm/i2c: tda998x: remove redundant of_match_ptr
Message-ID: <202308011156.JV5BlEpl-lkp@intel.com>
References: <20230731130257.94751-1-wangzhu9@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731130257.94751-1-wangzhu9@huawei.com>

Hi Zhu,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230731]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Wang/drm-i2c-tda998x-remove-redundant-of_match_ptr/20230731-210417
base:   next-20230731
patch link:    https://lore.kernel.org/r/20230731130257.94751-1-wangzhu9%40huawei.com
patch subject: [PATCH -next] drm/i2c: tda998x: remove redundant of_match_ptr
config: i386-randconfig-i012-20230731 (https://download.01.org/0day-ci/archive/20230801/202308011156.JV5BlEpl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308011156.JV5BlEpl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308011156.JV5BlEpl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i2c/tda998x_drv.c:2106:21: error: use of undeclared identifier 'tda998x_dt_ids'; did you mean 'tda998x_ids'?
                   .of_match_table = tda998x_dt_ids,
                                     ^~~~~~~~~~~~~~
                                     tda998x_ids
   drivers/gpu/drm/i2c/tda998x_drv.c:2095:35: note: 'tda998x_ids' declared here
   static const struct i2c_device_id tda998x_ids[] = {
                                     ^
>> drivers/gpu/drm/i2c/tda998x_drv.c:2106:21: error: incompatible pointer types initializing 'const struct of_device_id *' with an expression of type 'const struct i2c_device_id[2]' [-Werror,-Wincompatible-pointer-types]
                   .of_match_table = tda998x_dt_ids,
                                     ^~~~~~~~~~~~~~
   2 errors generated.


vim +2106 drivers/gpu/drm/i2c/tda998x_drv.c

  2100	
  2101	static struct i2c_driver tda998x_driver = {
  2102		.probe = tda998x_probe,
  2103		.remove = tda998x_remove,
  2104		.driver = {
  2105			.name = "tda998x",
> 2106			.of_match_table = tda998x_dt_ids,
  2107		},
  2108		.id_table = tda998x_ids,
  2109	};
  2110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
