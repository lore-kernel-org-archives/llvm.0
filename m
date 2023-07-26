Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF709A93A;
	Wed, 26 Jul 2023 23:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690414025; x=1721950025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQkyKNy11yFXmLyJKmlTgCkMAApShkwDI3IEcsQ7TXM=;
  b=dSGDpBWQ3dq62PkI/E3LW18QdCDejm5syAGz3AEyPJq3i/MDHWlMAJ/y
   UpwlSh/Fj3XSj0rDo0tJPue1JM/xylcYpRmiv07llvTgPBridqBnSRTDq
   8+QE1LBpSanZnFfdAwfMZ77BRwX0wNaZUXpYaa1WeyXphTCJq6ZEFaRUh
   qT017vI6sDKXP+IcsXluvrgC4Y0+/JObKNxeLBAE4JLxQNrtRSZ6wKOzz
   GV6XLcL6ldsQgty7s3KJ6U/VYl+5QuMsfC+MBh6OgPoNQd7lqIgOurK1e
   cnDLstNI1vwvDlVWZFGt/dSd7HwPrhe+OpdQrPJaYaHtSBPitR3qMCPFR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370832130"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="370832130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 16:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057417094"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="1057417094"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 16:26:55 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOnuA-0001RL-2r;
	Wed, 26 Jul 2023 23:26:54 +0000
Date: Thu, 27 Jul 2023 07:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-event-ext 7/11]
 kernel/trace/trace_probe.c:647:9: error: incompatible pointer to integer
 conversion returning 'void *' from a function with result type 'int'
Message-ID: <202307270746.hoJf8GGv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
head:   e4bb6f2230fbe828dad040af0befb139a5a5733b
commit: 33d45869bbad8c03d268d0634be77d860bbbc611 [7/11] tracing/probes: Support BTF field access from $retval
config: arm64-randconfig-r023-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270746.hoJf8GGv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270746.hoJf8GGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270746.hoJf8GGv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_probe.c:647:9: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
     647 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +647 kernel/trace/trace_probe.c

b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  644) 
33d45869bbad8c Masami Hiramatsu (Google  2023-07-17  645) static int query_btf_context(struct traceprobe_parse_context *ctx)
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  646) {
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06 @647) 	return ERR_PTR(-EOPNOTSUPP);
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  648) }
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  649) 

:::::: The code at line 647 was first introduced by commit
:::::: 18b1e870a49671745c31434b18bcfdd6f20cb6a1 tracing/probes: Add $arg* meta argument for all function args

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Masami Hiramatsu (Google) <mhiramat@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
