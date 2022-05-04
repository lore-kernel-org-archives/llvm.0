Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1A72117
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 20:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651696265; x=1683232265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5GhRSMdpdVf05QfepV3o9U0aOcougHdLRETdtU1BceE=;
  b=C8p/liYf2qr1kjxjfPoUVfxBTEp01Iiv5NtVh7amBMPBktxWM7EjkzXn
   gJWcTFq7ltB7VyAGjv/GL2jjNWJ51CaNCdCcel1a+mxjeaEQsRKBtzqqq
   nOPvAiONyoSiIoXsizft7dOGR/0o6hW31FxeGM8zIik3eCzLhtERMXuXl
   /OzBd6H1vEB2JrIBvqFgJvBuRYyUq78BPSpjHwI+lolx05xbt3Ic1LDtm
   dJ51+NXSSGIHfdMFFuGvazEbQH3jSHriSXr8E4bvIUj4C2nZWouPnmK4w
   UF9FIJBUEYpSoRBlBuSu5Mg4T5Q9acEJo4o9L3OUWvoSP4hL1khAXejYL
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="248426551"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; 
   d="scan'208";a="248426551"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 13:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; 
   d="scan'208";a="568271596"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 May 2022 13:31:01 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmLeG-000BlC-Rr;
	Wed, 04 May 2022 20:31:00 +0000
Date: Thu, 5 May 2022 04:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: Markuss Broks <markuss.broks@gmail.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Markuss Broks <markuss.broks@gmail.com>,
	Lin Meng-Bo <linmengbo0689@protonmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] input/touchscreen: imagis: Add support for Imagis
 IST3038B
Message-ID: <202205050459.Cn4Mj5ny-lkp@intel.com>
References: <20220504152406.8730-4-markuss.broks@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504152406.8730-4-markuss.broks@gmail.com>

Hi Markuss,

I love your patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on linux/master linus/master v5.18-rc5 next-20220504]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Markuss-Broks/Add-support-for-Imagis-IST3038B/20220504-232637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: hexagon-randconfig-r022-20220502 (https://download.01.org/0day-ci/archive/20220505/202205050459.Cn4Mj5ny-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a22f360f66c82a3bc53d9861a62d2d2e5abe897c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Markuss-Broks/Add-support-for-Imagis-IST3038B/20220504-232637
        git checkout a22f360f66c82a3bc53d9861a62d2d2e5abe897c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/imagis.c:366:39: warning: unused variable 'imagis_3038b_data' [-Wunused-const-variable]
   static const struct imagis_properties imagis_3038b_data = {
                                         ^
>> drivers/input/touchscreen/imagis.c:374:39: warning: unused variable 'imagis_3038c_data' [-Wunused-const-variable]
   static const struct imagis_properties imagis_3038c_data = {
                                         ^
   2 warnings generated.


vim +/imagis_3038b_data +366 drivers/input/touchscreen/imagis.c

   365	
 > 366	static const struct imagis_properties imagis_3038b_data = {
   367		.interrupt_msg_cmd = IST3038B_REG_STATUS,
   368		.touch_coord_cmd = IST3038B_REG_STATUS,
   369		.whoami_cmd = IST3038B_REG_CHIPID,
   370		.whoami_val = IST3038B_WHOAMI,
   371		.protocol_b = true,
   372	};
   373	
 > 374	static const struct imagis_properties imagis_3038c_data = {
   375		.interrupt_msg_cmd = IST3038C_REG_INTR_MESSAGE,
   376		.touch_coord_cmd = IST3038C_REG_TOUCH_COORD,
   377		.whoami_cmd = IST3038C_REG_CHIPID,
   378		.whoami_val = IST3038C_WHOAMI,
   379	};
   380	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
