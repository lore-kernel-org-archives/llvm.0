Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07927280E;
	Fri, 24 Oct 2025 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333085; cv=none; b=HuDKzb/LW/QGbcZQxTK49WQNpRbK2eA9qr6F7iezXHp7LldaVKKNca9lbW9EQWbY1+wmHQG64fcKbL5tAEtgAYaQGiv2Q4PatNN1JxQDMb1aJNUD6XUCkSLaJ6uR5f33eDpdTlrrDvDxbH5PQz1bNSol4Vg9Fhe90KFDU0YdHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333085; c=relaxed/simple;
	bh=huTDz8f81rALXhF6I8LCkj0hTPSr9oc3eKFwWicKBEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAWaTopb/6PqJsdGPx5eMecEElF/21R//U9L3d7wna5sYBxTRaia5AwZ6IYBnlwnReU8OMosx1tUR9x+7cZBgiIMvKNZahD8L+BVjuVk10kyheHl0kTNG5PwwHp1FY9BBa6wLgtVbnZc/7FSKxyKceJNCWhBS2mT/H4BqWcZCsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dkz2gRFY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dkz2gRFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761333083; x=1792869083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=huTDz8f81rALXhF6I8LCkj0hTPSr9oc3eKFwWicKBEw=;
  b=Dkz2gRFYAIxxh4QlFw5rLdswjs6EAhqATkAdkV81rmDUHteMu8mqHFb/
   nwA9wC1VsHJmQ3r5Z5moyLt+cKTB5HQNonrVMugxpOU2NrX1Rh5aTy/Ww
   yvv6FNNA/rECoanSTrGJxTtmPaLrjoB4L88fsG4iKLoxrCxBa8Rx1gsLW
   GwMPAzR765z58rdUhMTwFvPORuEIjRLHxz2J0k4DgML5hhiUSVvzAy0c9
   Fpvpm3co0+AOgQSIPycsF3vs//xjZfshqGYjQgvfc8/5dlPDf2kX9jLrP
   ODiB8rHxQi5y5bnEFT0xSRBKRG80jhTzbAD1SmJo+d4otBT10e4nuHfJd
   A==;
X-CSE-ConnectionGUID: mMJkTDFSStCymXBY3ANhsg==
X-CSE-MsgGUID: gyYP3ae6S6aifZXguuO+vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63425126"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63425126"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 12:11:22 -0700
X-CSE-ConnectionGUID: ULWw6uP7Q6OENcghUUggQQ==
X-CSE-MsgGUID: 512bIhasTR6Wyqiuwp2MJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="184403689"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Oct 2025 12:11:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCNBy-000Enx-1X;
	Fri, 24 Oct 2025 19:11:16 +0000
Date: Sat, 25 Oct 2025 03:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-janice-v6.18-rc1 9/11]
 drivers/input/misc/isa1200.c:423:3: error: field designator 'probe_new' does
 not refer to any field in type 'struct i2c_driver'
Message-ID: <202510250319.9WqUFHAz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-janice-v6.18-rc1
head:   ccd3929e54f44ccae885d803cc472204f661c886
commit: 5e4f8e741997d1d027479597bf5265607888bcb1 [9/11] Input: isa1200 - new driver for Immersion ISA1200
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251025/202510250319.9WqUFHAz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250319.9WqUFHAz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250319.9WqUFHAz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/misc/isa1200.c:423:3: error: field designator 'probe_new' does not refer to any field in type 'struct i2c_driver'
     423 |         .probe_new = isa1200_probe,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +423 drivers/input/misc/isa1200.c

   416	
   417	static struct i2c_driver isa1200_i2c_driver = {
   418		.driver = {
   419			.name = "isa1200",
   420			.of_match_table = isa1200_of_match,
   421			.pm = &isa1200_pm,
   422		},
 > 423		.probe_new = isa1200_probe,
   424	};
   425	module_i2c_driver(isa1200_i2c_driver);
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
