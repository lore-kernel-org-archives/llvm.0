Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C82EC8;
	Sat, 17 Jun 2023 21:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687036733; x=1718572733;
  h=date:from:cc:subject:message-id:mime-version;
  bh=b8ZbW5m2/zsP/tll3k8Qo4J3HMNfwtQUcP06PRYOINY=;
  b=WRJ2TsxqjZPKYxRAXA3ZpZ4PLC0qRIr5rEV2eWZGlC8yDglgFOGvu6Gy
   M8QdtdnaEha2v9iTxA+tM3VCUHp+JDnn19gFwtiMJsSa4RDUCaizxrprS
   4OK2gSwq3UqnRlHkd6jDb5sg1hHsDBiHUQ3jbYwaa5JjXyf0wMtbPL4Zd
   hsxyjPu0U6BxBgNmOHrsmjVIp6sgLZobfYCH6Lba4zdXjoIeA5Q61ymHx
   ZJP2RP0Z4opBHZ5YDZXWLKpfzjcuTFuh2vtuMXbk0RC83vDrja++Fli5R
   ZpUrvvFhNt0zDFOcWmrYGDQDswRHeXpiQ+JXTLpPSJWadMbrI37DOWqDV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339760316"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="339760316"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 14:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="837415649"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="837415649"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Jun 2023 14:18:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAdJq-00037E-1l;
	Sat, 17 Jun 2023 21:18:50 +0000
Date: Sun, 18 Jun 2023 05:18:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 1989/9999] net/netlink/af_netlink.o: warning:
 objtool: netlink_dump()+0xb5a: unreachable instruction
Message-ID: <202306180533.Hh40qofe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Eric Dumazet <edumazet@google.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Sasha Levin <sashal@kernel.org>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   a1f0beb13d9b8955e00caa48f909462fb70e6f73
commit: 3d55b195747c1259c994b868a509beae947a7c6e [1989/9999] netlink: reset network and mac headers in netlink_dump()
config: x86_64-randconfig-a001-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180533.Hh40qofe-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180533.Hh40qofe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180533.Hh40qofe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netlink/af_netlink.o: warning: objtool: netlink_dump()+0xb5a: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
