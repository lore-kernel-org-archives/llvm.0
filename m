Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF23376E1;
	Sat, 27 Apr 2024 02:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714185868; cv=none; b=KTKeREXPqmsTKRvBo+paEcwgzs171GPyJd16g/sOMFb94oQ1qtlzbXTcYqQL7jpZ8wsV3mYarfG4zpaBJAMpaALxPrvBB4d3NcyS6U7NfkAYHAJVGYlnGmKsAD8XSn1tGj6YrtfAwsmIZtibruZwnn7QfDF7+RT9VmMJ1VUDIxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714185868; c=relaxed/simple;
	bh=qkrYL1LnJX01BbmP4vKe9fzC867vlBxEr4GWvPFQafk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOaK/AGwLR+VNsPHBNhOViNWfGBc8aI3bEmmqBeFsRw4sys4lc/oeCxifwDifh33jGFgWlQSXqEdGm8xXI3fLCmHFAxTHPbXhjH+TpJhxNj++qPnkVybtw0udRm5GWEpde6YR8hkL3zOnnnRJRfNguDi26wyGPTpTpi1ZLqOmSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANoO81yk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANoO81yk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714185865; x=1745721865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qkrYL1LnJX01BbmP4vKe9fzC867vlBxEr4GWvPFQafk=;
  b=ANoO81ykJUVbWQH1VDDFEEPQPzaAsHegDobPkvmh8LX2NVvT34f4PBvc
   0JSRMUkrsB6eQQiqw7Sxbgxgy5zSseR4/qxUSheXUoi8FPueRXoo3PEVE
   4OCe8DGkFX2+DjUePmY2ncJeWi7/28qqyCIHGGXABvc6+nDTQKlgS8jUH
   oPbIlm8RUJVZdSps3mUP4CDueidNS4nKbvDVcM3gTCi/duK4swilQkspr
   Vd2VVNNIu+0W3r4K4GKycVRhcX2Dle/Rk0nEKvoCP7CjzQK/GdUuCBwv3
   zSJHBiHy2/qMR/FOoTY3roE3sc9y8EWwDsfyzlfz+V/PA3sSUymGbDiCn
   A==;
X-CSE-ConnectionGUID: ikVKoqW0QW+a7ELNh9w2tg==
X-CSE-MsgGUID: Wh6CldQhSG2fAAzgR3SWbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="20618537"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="20618537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 19:44:24 -0700
X-CSE-ConnectionGUID: wrHFTpiOR2i91sUQ1VZIJA==
X-CSE-MsgGUID: E5sNqbW6QeifjYxcNCZZEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="25565554"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2024 19:44:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0Y31-0004b4-0x;
	Sat, 27 Apr 2024 02:44:19 +0000
Date: Sat, 27 Apr 2024 10:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ramona Gradinariu <ramona.bolboaca13@gmail.com>,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org, nuno.sa@analog.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ramona Gradinariu <ramona.bolboaca13@gmail.com>
Subject: Re: [PATCH 3/7] iio: imu: adis16475: Re-define ADIS16475_DATA
Message-ID: <202404271034.fsyc7qe2-lkp@intel.com>
References: <20240426135339.185602-4-ramona.bolboaca13@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240426135339.185602-4-ramona.bolboaca13@gmail.com>

Hi Ramona,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.9-rc5 next-20240426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramona-Gradinariu/dt-bindings-iio-imu-Add-ADIS16501-compatibles/20240426-215728
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240426135339.185602-4-ramona.bolboaca13%40gmail.com
patch subject: [PATCH 3/7] iio: imu: adis16475: Re-define ADIS16475_DATA
config: arm-randconfig-004-20240427 (https://download.01.org/0day-ci/archive/20240427/202404271034.fsyc7qe2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271034.fsyc7qe2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271034.fsyc7qe2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/imu/adis16475.c:16:
   In file included from include/linux/iio/imu/adis.h:12:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iio/imu/adis16475.c:734:34: warning: unused variable 'adis1650x_timeouts' [-Wunused-const-variable]
     734 | static const struct adis_timeout adis1650x_timeouts = {
         |                                  ^~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/adis1650x_timeouts +734 drivers/iio/imu/adis16475.c

fff7352bf7a3ce Nuno Sá 2020-04-13  733  
fff7352bf7a3ce Nuno Sá 2020-04-13 @734  static const struct adis_timeout adis1650x_timeouts = {
fff7352bf7a3ce Nuno Sá 2020-04-13  735  	.reset_ms = 260,
fff7352bf7a3ce Nuno Sá 2020-04-13  736  	.sw_reset_ms = 260,
fff7352bf7a3ce Nuno Sá 2020-04-13  737  	.self_test_ms = 30,
fff7352bf7a3ce Nuno Sá 2020-04-13  738  };
fff7352bf7a3ce Nuno Sá 2020-04-13  739  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
