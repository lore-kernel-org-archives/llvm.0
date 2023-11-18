Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9312582;
	Sat, 18 Nov 2023 06:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbQZ8ZaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700289231; x=1731825231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CifJ4bCTttMoFJ4+KJqxI/k/1BSNMX+SU6KP3cRH6vE=;
  b=SbQZ8ZaTrBpHUqlVJbaC6gZp87A3nOJnsaRIUviqbCqKx5W9nO/7kzZQ
   blGxoBEBms2YAkH9KqlK57wmxKEMkYG1S614QYxyHHswxio5F1MEpppDA
   9X4TPlM7f2poVPE6N+B13bgJZQCq/4rPPAO7KI9uHJjckBRxasuRR9OXh
   emlItxBMEOHmcmuJjO7FB9GDjZi/ExnbTu6G5vcVcnZkZ+hY2wq2YlPFm
   KKux133UcIB9DImiVbmxccLVZ03mKJ9DY2iTuFWkwJUpiFn6a23+pXIiy
   JW9CpJIYK6CpzItw5DVMqteYI2NGyx6AfeXLdY5I4/af1MdYIYFVopi0s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="376458007"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="376458007"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 22:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="939350356"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="939350356"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Nov 2023 22:33:48 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Etl-0003bT-2w;
	Sat, 18 Nov 2023 06:33:45 +0000
Date: Sat, 18 Nov 2023 14:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: marc.ferland@gmail.com, krzysztof.kozlowski@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, marc.ferland@sonatest.com,
	jeff.dagenais@gmail.com, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] w1: ds2433: introduce a configuration structure
Message-ID: <202311181436.TyinUJiw-lkp@intel.com>
References: <20231117192909.98944-4-marc.ferland@sonatest.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117192909.98944-4-marc.ferland@sonatest.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7475e51b87969e01a6812eac713a1c8310372e8a]

url:    https://github.com/intel-lab-lkp/linux/commits/marc-ferland-gmail-com/w1-ds2433-add-support-for-registering-multiple-families/20231118-034145
base:   7475e51b87969e01a6812eac713a1c8310372e8a
patch link:    https://lore.kernel.org/r/20231117192909.98944-4-marc.ferland%40sonatest.com
patch subject: [PATCH 4/7] w1: ds2433: introduce a configuration structure
config: hexagon-randconfig-001-20231118 (https://download.01.org/0day-ci/archive/20231118/202311181436.TyinUJiw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181436.TyinUJiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181436.TyinUJiw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/w1/slaves/w1_ds2433.c:269:21: error: initializer element is not a compile-time constant
     269 |         .size = config_f23.eeprom_size,
         |                 ~~~~~~~~~~~^~~~~~~~~~~
   1 error generated.


vim +269 drivers/w1/slaves/w1_ds2433.c

   264	
   265	static struct bin_attribute bin_attr_f23_eeprom = {
   266		.attr = { .name = "eeprom", .mode = 0644 },
   267		.read = eeprom_read,
   268		.write = eeprom_write,
 > 269		.size = config_f23.eeprom_size,
   270	};
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
