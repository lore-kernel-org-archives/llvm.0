Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571A635C1B2;
	Wed, 23 Sep 2026 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206739; cv=none; b=nFJq1yEGR8b4ppZWzSprCLiHahW5IbWyVvIdikJDsJUXLmREaBrdX4JFlxxhg5XalPvwqNUm264xJEt8H5Sg1Lbq/lbsvv2YoWjzPXRjc93kv/BXO92rkPqD3m1TxKGuxiB5IpneXrs3P4+5AoH6J+HroLtULW+K8+94phM+Ec8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206739; c=relaxed/simple;
	bh=NBHhoD7qjlnq5ZAE9rFBay5bykvIQHEcYezpSQSGEBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+ku4a1NgfiZAUEdQGr0CQFutP2FQTRPB69B/SDBtxgw/lt1bhCoeotRhgQ7BVLBs0ivBLlhz62mmkG8fY+cKjcSJxtvhBCJEI043jfIIZE2odFdOwT1PnFQhaanCam0DB4t8BINU3OYN7K/qiT2Q51hLpEnw/efbr18aNeGA/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5dwr5Tf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5dwr5Tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790206737; x=1821742737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NBHhoD7qjlnq5ZAE9rFBay5bykvIQHEcYezpSQSGEBE=;
  b=C5dwr5TfcDTLlWv+J4URz5FHUA40TN2Bzm+sPnq0S4PuitqpUt5cHLSI
   DF5IdhsO1f8WqIBBinLibmlinN834gaYsa9/ipAiNrOnTKZA36o3BoyX7
   On0qSNcjd9Y6QWL9+Y+iHGZ+CMBmgRU1wljfyUncNDOeuWRq0j3cF6eu5
   InQdp1aKFDoZIpoyvjVm76stdxONjV5cpnJbnm/S6QcJwQ4nBRF+Z3TeB
   pJp5bEL09wevzUcPlxE+/dHFaSLeHT7YZQwZAugI5uWba2KQbO5i8xJCF
   uPkj2fbzHTYtP37Ro4Fyj9nd9x0V/SK6ekoEpYJbwLgO+6PVahJMBSCBQ
   g==;
X-CSE-ConnectionGUID: Tulvb8JCTTGr7n7CDntzhA==
X-CSE-MsgGUID: QEZTirjHT5O62zau77guZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90080668"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90080668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 16:38:56 -0700
X-CSE-ConnectionGUID: ZRvL3iJaTzeldkG0YgYApw==
X-CSE-MsgGUID: +N3VFQ/PQfWE7u//3VlvmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="270324513"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 16:38:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9WY6-00000000Hxa-36FH;
	Wed, 23 Sep 2026 23:38:50 +0000
Date: Thu, 24 Sep 2026 07:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Samuel Thibault <samuel.thibault@ens-lyon.org>, w.d.hubbs@gmail.com,
	chris@the-brannons.com, kirk@reisers.ca, speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] speakup: Drop now-unused serialio operations
Message-ID: <202609240754.Q7KcTPuv-lkp@intel.com>
References: <20260922063047.1392828-1-samuel.thibault@ens-lyon.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922063047.1392828-1-samuel.thibault@ens-lyon.org>

Hi Samuel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v7.3-rc4 next-20260922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Thibault/speakup-Drop-now-unused-serialio-operations/20260922-083047
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260922063047.1392828-1-samuel.thibault%40ens-lyon.org
patch subject: [PATCH] speakup: Drop now-unused serialio operations
config: arm-randconfig-1002-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240754.Q7KcTPuv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240754.Q7KcTPuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240754.Q7KcTPuv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accessibility/speakup/serialio.c:20:37: warning: unused variable 'rs_table' [-Wunused-const-variable]
      20 | static const struct old_serial_port rs_table[] = {
         |                                     ^~~~~~~~
>> drivers/accessibility/speakup/serialio.c:24:38: warning: unused variable 'serstate' [-Wunused-variable]
      24 | static const struct old_serial_port *serstate;
         |                                      ^~~~~~~~
   2 warnings generated.


vim +/rs_table +20 drivers/accessibility/speakup/serialio.c

5e6dc548e453c68 drivers/staging/speakup/serialio.c Chen Gang      2013-10-31  19  
3ee0017e03cd790 drivers/staging/speakup/serialio.c Jiri Slaby     2012-03-05 @20  static const struct old_serial_port rs_table[] = {
c6e3fd22cd53836 drivers/staging/speakup/serialio.c William Hubbs  2010-10-07  21  	SERIAL_PORT_DFNS
c6e3fd22cd53836 drivers/staging/speakup/serialio.c William Hubbs  2010-10-07  22  };
defaa9ad58dfc56 drivers/staging/speakup/serialio.c Arushi Singhal 2017-03-14  23  
3ee0017e03cd790 drivers/staging/speakup/serialio.c Jiri Slaby     2012-03-05 @24  static const struct old_serial_port *serstate;
c6e3fd22cd53836 drivers/staging/speakup/serialio.c William Hubbs  2010-10-07  25  static int timeouts;
c6e3fd22cd53836 drivers/staging/speakup/serialio.c William Hubbs  2010-10-07  26  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
