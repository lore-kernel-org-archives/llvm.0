Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B184685
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663189986; x=1694725986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tNF5VMNITd4yfX3fKOm9kTIPe91lRZ0YOZ6C7sFSjiI=;
  b=B52gfYUauxQg+ztJAtiyoOkPLley6mPlVaW1XG8VOdg1UrVlEmIwFDVo
   K0KWowwtAQ8v+Ku1kbzeg0s/+2QXpedTku5TeVXD6vEZrRZmJb7MWlHy9
   a2QW7RUTZ4tqkhjemEwEHjshDeD1C262ekLGGL9DKXIWFFhynKY7pI+O4
   fmEt2THF0+XSf5thYEATZeKV9ruGmgIeBBA0pMoPaowYRE+O8nT8k1RuT
   LR6AxgC6/fUs7YPEhFqy9/IsKn97h593GboZkohydJhZtcKdbaNeAcXPc
   3YlSd3N9SHjV8UX0dqDjwMbK0/nnwEeOFNGAAJUAYpdL+iB2Gp/9n4PhQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="324801586"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="324801586"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 14:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="650220215"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Sep 2022 14:13:02 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYZgs-0000Zo-0Y;
	Wed, 14 Sep 2022 21:13:02 +0000
Date: Thu, 15 Sep 2022 05:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: [steev:c630-6.0.0-rc5-only-batt 2/15]
 drivers/power/supply/yoga-c630-ec.c:225:24: error: implicit declaration of
 function 'FIELD_GET' is invalid in C99
Message-ID: <202209150504.Q9XVY3rZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux c630-6.0.0-rc5-only-batt
head:   f3c03af09a0ea482d28346e1aeb98de01632080c
commit: cf2451d68e7599a6869e1a218a588811d94e4839 [2/15] power: supply: Add Lenovo Yoga C630 EC driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220915/202209150504.Q9XVY3rZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/cf2451d68e7599a6869e1a218a588811d94e4839
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev c630-6.0.0-rc5-only-batt
        git checkout cf2451d68e7599a6869e1a218a588811d94e4839
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/power/supply/yoga-c630-ec.c:225:24: error: implicit declaration of function 'FIELD_GET' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   ec->adapter_online = FIELD_GET(LENOVO_EC_ADPT_PRESENT, val);
                                        ^
   drivers/power/supply/yoga-c630-ec.c:391:6: error: implicit declaration of function 'FIELD_GET' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (FIELD_GET(LENOVO_EC_USB_EVENT_MUX, event))
               ^
   2 errors generated.


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
