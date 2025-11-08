Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9383537E9;
	Sat,  8 Nov 2025 04:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762576453; cv=none; b=gff1ZWD8B5rHQgPlMS4iF3bWGU2i4RcYYcPM/5LHSKkFzx7SK4YbPVd5TGrT9IB5AgeMrp3mvcfjQfS3ltWUiT3WVKa6y8JDr6mmCay7eCh5EQtYeYHsQTurKO0DIFcDkITxzmtPLUAXO+9nMKqvqqBK2IoGkKju3DDNW/BI6to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762576453; c=relaxed/simple;
	bh=IAcbFLuLzQW4Bw/7g8vt43kLZjmjYXHtqupc9zRbID8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b/Rz73juqzaZsv9Fdi9VnRhGv5WeishTj4/fY2bO4B9agJ/Eq2C1I1GMQ91p6y21/a3U8eT9K3ifA2WMg9LLwfYwTnCGF071YSPGjZjWms9olOe96NNOfkDE8oZCzmIcjHfCL8Vruu4yv84CmHxPmdyhpxJdrscoMDtVledXhhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYYgvKXm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYYgvKXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762576452; x=1794112452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAcbFLuLzQW4Bw/7g8vt43kLZjmjYXHtqupc9zRbID8=;
  b=cYYgvKXmqGNJWKM2dShyjs6qQ/qKAILcz+NaE5LBI7y2yi/qHd7SyWXX
   uMz22wQeBYdZWDFJadJkZAlwSCXWW16YEV3zyJ7uNNbZ5teCnt/7F1Krv
   v6liKzflLnjMB84w7wIoouMhTR29irdN0OfSRkKuFfo0R9FUmB+LNh9iL
   lv7nZqwC3OEQ2cMrIy6YU1vb+Lax9qiwiHeHXxFd2VUkDorGsadpdrK32
   0z1P9rTvMBa1IWboRjv0/hk42SlQQauwAMbl6orTghuW9UMjh+LQEUA1D
   Ng56Q2wCjWKZIqDvf8C8Kdd6Y4jQmrvAnpU31I440GIJXvitFpXSKUyYc
   Q==;
X-CSE-ConnectionGUID: rOEQdA/5T/mGovaeod/sKw==
X-CSE-MsgGUID: K9zNlNppTNeadIy2vGdOTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64816481"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="64816481"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 20:34:11 -0800
X-CSE-ConnectionGUID: CDB2eoXFRRO+m0RxSI1vYA==
X-CSE-MsgGUID: AgFRzZMhRoWHBSuAQJCNBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="188378681"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2025 20:34:10 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHaeN-0000jb-27;
	Sat, 08 Nov 2025 04:34:07 +0000
Date: Sat, 8 Nov 2025 12:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_prolog 6/8] arch/x86/kernel/uprobes.c:1496:36:
 warning: unused variable 'opt_xol_ops'
Message-ID: <202511081235.47OiimUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_prolog
head:   0a54bb564fac2eaf528c88c5d6abc55213a4f073
commit: d61886bf13325710a187aeed37cef10307a87c36 [6/8] opt
config: i386-defconfig (https://download.01.org/0day-ci/archive/20251108/202511081235.47OiimUi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081235.47OiimUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081235.47OiimUi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/uprobes.c:1488:36: warning: unused variable 'mov_xol_ops' [-Wunused-const-variable]
    1488 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~
   arch/x86/kernel/uprobes.c:1492:36: warning: unused variable 'sub_xol_ops' [-Wunused-const-variable]
    1492 | static const struct uprobe_xol_ops sub_xol_ops = {
         |                                    ^~~~~~~~~~~
>> arch/x86/kernel/uprobes.c:1496:36: warning: unused variable 'opt_xol_ops' [-Wunused-const-variable]
    1496 | static const struct uprobe_xol_ops opt_xol_ops = {
         |                                    ^~~~~~~~~~~
   3 warnings generated.


vim +/opt_xol_ops +1496 arch/x86/kernel/uprobes.c

  1487	
> 1488	static const struct uprobe_xol_ops mov_xol_ops = {
  1489		.emulate  = mov_emulate_op,
  1490	};
  1491	
  1492	static const struct uprobe_xol_ops sub_xol_ops = {
  1493		.emulate  = sub_emulate_op,
  1494	};
  1495	
> 1496	static const struct uprobe_xol_ops opt_xol_ops = {
  1497		.emulate  = optimized_emulate,
  1498	};
  1499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
