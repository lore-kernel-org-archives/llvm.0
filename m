Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098697C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 02:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654741516; x=1686277516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=azADoCZr4T2Qk8IeCiGMP8wx1mPqqaIUSoDx0L8cJig=;
  b=kcu1OYJEOUg8x5dpq+xRN5V/8Ms++crcTdCCUdnX0EtHFUkCMDvjbXW4
   AezH4PECEOHLgCzzf/x2p9X1vxzyENIUDJMbd4Gm5YQ18VMdN//uVyR6P
   eekDYpq0kUPJpWlY+ACrf08t+G9Gd3ZtWel5L0uXUxTbtQweB/Z/gwXHJ
   jZHo90lDo+39rKbJoQV7I+P3lOTySunV6H0JODzLb9tc9Jnp5an4KhMj6
   QNDWyaeXu+0UsROi4rXoi1solDgJWCnAp3n26qV6T25YLQjHN2n9YReJ5
   zu7+y1U1/0A5PSkizAkdMuoMXHUgr1CLTV9bmYsleLTbMptxDNsd88I+1
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="363446723"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="363446723"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 19:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="615663373"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Jun 2022 19:25:11 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nz7rC-000FLh-Sm;
	Thu, 09 Jun 2022 02:25:10 +0000
Date: Thu, 9 Jun 2022 10:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Shreeya Patel <shreeya.patel@collabora.com>, jic23@kernel.org,
	lars@metafoo.de, robh+dt@kernel.org, Zhigang.Shi@liteon.com,
	krisman@collabora.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	alvaro.soliverez@collabora.com, andy.shevchenko@gmail.com,
	digetx@gmail.com, Shreeya Patel <shreeya.patel@collabora.com>
Subject: Re: [PATCH v5 2/2] iio: light: Add support for ltrf216a sensor
Message-ID: <202206090943.Zvfv6OBd-lkp@intel.com>
References: <20220608113553.32083-3-shreeya.patel@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608113553.32083-3-shreeya.patel@collabora.com>

Hi Shreeya,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Shreeya-Patel/Add-LTRF216A-Driver/20220608-194016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220609/202206090943.Zvfv6OBd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4809a7f42af19c3da77457e1aaf37ddd171fa779
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shreeya-Patel/Add-LTRF216A-Driver/20220608-194016
        git checkout 4809a7f42af19c3da77457e1aaf37ddd171fa779
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iio/adc/ drivers/iio/light/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iio/light/ltrf216a.c:193:5: warning: no previous prototype for function 'ltrf216a_check_for_data' [-Wmissing-prototypes]
   int ltrf216a_check_for_data(struct i2c_client *client)
       ^
   drivers/iio/light/ltrf216a.c:193:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ltrf216a_check_for_data(struct i2c_client *client)
   ^
   static 
   1 warning generated.


vim +/ltrf216a_check_for_data +193 drivers/iio/light/ltrf216a.c

   192	
 > 193	int ltrf216a_check_for_data(struct i2c_client *client)
   194	{
   195		int ret;
   196	
   197		ret = i2c_smbus_read_byte_data(client, LTRF216A_MAIN_STATUS);
   198		if (ret < 0) {
   199			dev_err(&client->dev, "Failed to read LTRF216A_MAIN_STATUS register: %d\n", ret);
   200			return ret;
   201		}
   202	
   203		return ret;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
