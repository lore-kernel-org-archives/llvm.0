Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148183C38;
	Fri, 20 Jan 2023 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674239245; x=1705775245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bK/QfWInN9l3kz5q4PkVtOoQHNxxsyUB2TiL2Yk9kJ0=;
  b=VxMToYYwWpsRgF5n1nr84yJzmbagMU1C2AiK57JidYL3jerQ31SpgwS0
   pvVi6pWTE9WMSCBK02ol6uA2Hbdi0isj7xPRZBiFzj1jWK6EUfyOSIWob
   5LULO8C+8U1qtNDaij2ab8HfkOHr+nPPD+06xfmasGxYM27aCIPuvEWXC
   AvZedJW10aNp6PdcTnWPpZSGopgNjN+syIB5TzIN/Q9bDTK4ZekNO3+A1
   bVpsgdKi1WXO+wate5WRS3FMocdI2IK7iytnzAhq+zkSNGIU8+0EzXIZD
   aUX6TW+YpSzNXG46EaibP44ms+Skb3b9g4cdJUBnyUYXu6HUzfeC4beH0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305325485"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="305325485"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 10:27:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="691145006"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="691145006"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jan 2023 10:27:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIw6d-0002o3-2q;
	Fri, 20 Jan 2023 18:27:15 +0000
Date: Sat, 21 Jan 2023 02:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: XU pengfei <xupengfei@nfschina.com>, jdelvare@suse.com,
	linux@roeck-us.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	XU pengfei <xupengfei@nfschina.com>
Subject: Re: [PATCH 1/1] hwmon: powr1220: remove unnecessary (void*)
 conversions
Message-ID: <202301210219.P2QHV5eM-lkp@intel.com>
References: <20230111043729.3792-1-xupengfei@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111043729.3792-1-xupengfei@nfschina.com>

Hi XU,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/XU-pengfei/hwmon-powr1220-remove-unnecessary-void-conversions/20230111-123826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230111043729.3792-1-xupengfei%40nfschina.com
patch subject: [PATCH 1/1] hwmon: powr1220: remove unnecessary (void*) conversions
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230121/202301210219.P2QHV5eM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2eb252eb3b198f857b200cd1b3aee679a7129baa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review XU-pengfei/hwmon-powr1220-remove-unnecessary-void-conversions/20230111-123826
        git checkout 2eb252eb3b198f857b200cd1b3aee679a7129baa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hwmon/powr1220.c:177:24: error: initializing 'struct powr1220_data *' with an expression of type 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           struct powr1220_data *chip_data = data;
                                 ^           ~~~~
   1 error generated.


vim +177 drivers/hwmon/powr1220.c

   172	
   173	static umode_t
   174	powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
   175			    attr, int channel)
   176	{
 > 177		struct powr1220_data *chip_data = data;
   178	
   179		if (channel >= chip_data->max_channels)
   180			return 0;
   181	
   182		switch (type) {
   183		case hwmon_in:
   184			switch (attr) {
   185			case hwmon_in_input:
   186			case hwmon_in_highest:
   187			case hwmon_in_label:
   188				return 0444;
   189			default:
   190				break;
   191			}
   192			break;
   193		default:
   194			break;
   195		}
   196	
   197		return 0;
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
