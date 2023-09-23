Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC881D682;
	Sat, 23 Sep 2023 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695479892; x=1727015892;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=m0LbyftualtJNSMv+9w+F5ke/dxsnjl8/rKq+vXQFGQ=;
  b=GMgAsEHZksop4fgn1iEi2XObSwx4uX9kGzeHW6s/dNpskUUcVYlLG5aO
   J7pRhvLLBOR1CpsfZSrckgzn3eg/jesQg5OwOraaIXr/u8hLXfr1jvxSQ
   QZQ96KWTwvzvK/kvfpf8Eo4vla8OZdNkDjVTYVlDmPb+jQ8j/0jDfU8Wv
   wds6K9WZjM/FcweYQnQUC1M7r3/PQKuu1o54awY7Bv9uFquUaSqH/NFE7
   MOG8w6jBkirKkzXODyahR+tpl8858tIgDiQXGaLgSWmNjzA/qORAAeBWQ
   HMIz4QXegnLLouASos0OSOuNdCVoIe4XEoo8mcHCJU48IUneZLSAdcHJC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="371340226"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="371340226"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 07:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="777181746"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="777181746"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Sep 2023 07:38:11 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk3li-0002Ty-2R;
	Sat, 23 Sep 2023 14:38:03 +0000
Date: Sat, 23 Sep 2023 22:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/030-misc 22/24] error: Found argument
 '--blocklist-type' which wasn't expected, or isn't valid in this context
Message-ID: <202309232238.VCcGgqlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   d919825a8bd8b095f84447c913739f39b4f4c8b5
commit: 2dc7e1e94502d46de601eee15011c47b19883df8 [22/24] rust: Fix for new =
bindgen
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230=
923/202309232238.VCcGgqlA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8d=
fdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20230923/202309232238.VCcGgqlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309232238.VCcGgqlA-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> error: Found argument '--blocklist-type' which wasn't expected, or isn't=
 valid in this context
   Did you mean =1B[32m--=1B[0m=1B[32mblacklist-type=1B[0m?

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
