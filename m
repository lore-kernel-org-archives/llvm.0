Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E911DDEE;
	Tue, 11 Jul 2023 22:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689114569; x=1720650569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iyikq8/xj7rfBbLmA81rzEtrl/IRTtISoZsUerkQX0M=;
  b=c0fhlwP1CAEHvOk/tjYwirKLeXV715L+6J4ThzZ/9TZcGMo0t1gAoa6Q
   i1EQpu/t/AXRg3an5m8JMTEKix61G5MgDRGNhHZa0bPvNs2Vy5VetR6BN
   qujXttf8NGgNzBMZr+7dp+9PlUeoKn5DicaYm6STmMEK+CDmvxxhUY3R8
   bN1J4y6DhjorSL/QAzNSVWuJP0MrpfyGZEoVYPvect6dmjh6sjzvwyTQP
   RFECCI6APGBvaAp5ytOj173Y5tCjx28VNim8o1+r+VK53XaOWZJ/UkFhJ
   lRg4QbdCEksOZfA0k8/dic/tymD+PhBflvAw5zGEkd3PsLVY7dEszncNV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344351866"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="344351866"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 15:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834883013"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="834883013"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 15:29:24 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJLrH-00059r-1f;
	Tue, 11 Jul 2023 22:29:23 +0000
Date: Wed, 12 Jul 2023 06:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Victor Erminpour <victor.erminpour@oracle.com>
Subject: [oracle-dtrace:v2/6.4 12/13] ld.lld: error: no input files
Message-ID: <202307120654.dutWBnN4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 2c782a4cc99b3be018204839775f690968a4124a [12/13] ctf: generate CTF information for the kernel
config: hexagon-randconfig-r045-20230711 (https://download.01.org/0day-ci/archive/20230712/202307120654.dutWBnN4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120654.dutWBnN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120654.dutWBnN4-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: set maximum concurrency to 16, specify --threads= to change
>> ld.lld: error: no input files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
