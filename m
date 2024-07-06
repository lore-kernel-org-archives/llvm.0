Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5AB22309;
	Sat,  6 Jul 2024 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720258062; cv=none; b=nSU4Gp7bUU0ziz95u+kl6FL8pU7TwcoXioT45JC0MM1IFgNep9CTjtrMpdeM0Eaw2hppmAcFmElmcowCOpXv8nWa6pjRpYnVWq/g9WExf9Fl17HznqA8ujVDHOzL2Mrk4FCNPh7WGouNsdpJeyeCzwLTHK2Jw2pRDUUGLp5W4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720258062; c=relaxed/simple;
	bh=zJxqkkgpkYWfglPragPLn3buWTOXDky4ofBj2wUdfTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQOrdmsVV4AaXDvsWST5M9wYCCoGIFGP5vsSLSghysNcUKt1IzCowCOWa06XKyWCDRuUHuIOBCCUF6/E+uoSqPxTYfvnpRedsdyOjVcjlcTnkDCfbMTx/slItw0WHI9LJInY5dCY9g9VMGU1xvBU70tcDW2mwB4SUcr7qLto0SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdIbf/Om; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdIbf/Om"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720258061; x=1751794061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zJxqkkgpkYWfglPragPLn3buWTOXDky4ofBj2wUdfTM=;
  b=TdIbf/OmtyAhAIpnrI7bjRtqvCtfa7Q9kumh1ZTym+sF1QFe85n2KmMj
   bHW9dY2Lc0wGAk0+2EWBo6QvD6Fw1POKZtTgQIm3r7L5onwDwzZw5UqMJ
   Q5+yeAWL7tTGFaj8fgbqjcflTmvwMC08uyprOSrjNAfl3qgwdZlpkVUUw
   bhRHTztwRZMiA7c3QN6LxJCPurxt6hei0IqaYjk6B6PVWheA62MGAJSaL
   aTSSkL5srAsDYqb0zrbaCllqFsLNfupGK987LrLZgjSUvgy584wlUzcRq
   iVFhJWNz6WfoLeQlqpNZei1QiTjHXdS+hjQKpRMhyO01jf/i6hAUJ63bb
   Q==;
X-CSE-ConnectionGUID: bzX1IcDRTIazY1v+1BNyfQ==
X-CSE-MsgGUID: vfRjSn85Ro2gBr3P3ebmwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28919114"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="28919114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 02:27:39 -0700
X-CSE-ConnectionGUID: ecxtjR05SMiJs6sjQbeFUw==
X-CSE-MsgGUID: MCNO2jV5SZ2+sYFoe7ksVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="47017844"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jul 2024 02:27:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ1he-000TYS-1K;
	Sat, 06 Jul 2024 09:27:34 +0000
Date: Sat, 6 Jul 2024 17:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tariq Toukan <tariqt@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Gal Pressman <gal@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
	Rahul Rameshbabu <rrameshbabu@nvidia.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next 07/10] net/mlx5: Implement PTM cross
 timestamping support
Message-ID: <202407061720.xkyGAPIS-lkp@intel.com>
References: <20240705071357.1331313-8-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705071357.1331313-8-tariqt@nvidia.com>

Hi Tariq,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tariq-Toukan/net-mlx5-IFC-updates-for-SF-max-IO-EQs/20240705-205245
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240705071357.1331313-8-tariqt%40nvidia.com
patch subject: [PATCH net-next 07/10] net/mlx5: Implement PTM cross timestamping support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240706/202407061720.xkyGAPIS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061720.xkyGAPIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061720.xkyGAPIS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c:33:10: fatal error: 'asm/tsc.h' file not found
      33 | #include <asm/tsc.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +33 drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c

  > 33	#include <asm/tsc.h>
    34	#include <linux/clocksource.h>
    35	#include <linux/cpufeature.h>
    36	#include <linux/highmem.h>
    37	#include <linux/log2.h>
    38	#include <linux/ptp_clock_kernel.h>
    39	#include <linux/timekeeping.h>
    40	#include <rdma/mlx5-abi.h>
    41	#include "lib/eq.h"
    42	#include "en.h"
    43	#include "clock.h"
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
