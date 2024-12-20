Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D421A7AE3;
	Fri, 20 Dec 2024 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684182; cv=none; b=aQOYaOAi1FXkVbOAp1e8W6RouUmvsfa52LNqH7Erc82xPXagvSibGchOSAgXOVcVCNbfjC6mLXVzIt7N680ZP+1bBt6VUxM3bMeZ/egfpud58okPdeYww0nynY8LQClZ2aSRbBL8BF0Gro26M5G9BGtry+n57psbNN0UpmE4l70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684182; c=relaxed/simple;
	bh=VCv78L4mZGTH84kiPzt2lwX1HtDS+Zy6CMiElRoIiDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iqDLpAwzLE5y53c/qCB1OOEYlbCuP/azgrXKPtZjTk8HTRaauRMDYyQ2aNcUbLp9GkgqXPCdM7awLWza2jAdjJxK0Gji6qQADoXOazmOQ1Qqrt71+zglJUrPaxDLEQtwuPzS9cI4k8b16JcNIYHrldsOZcei7Gnpkh1susF2UaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAoposeR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAoposeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734684181; x=1766220181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VCv78L4mZGTH84kiPzt2lwX1HtDS+Zy6CMiElRoIiDM=;
  b=nAoposeRYqFbLQh2aAUAuxFFy3VtJ9SqLkWbrRyTRz0bfmaofYe4pjC8
   tXpViVPN11d1Zy4iwDcs2cU0WpXARGWJrOn430jSACH7dkiu+28zawl4C
   agm2nU3SN5FD2Erm9ybV8F6ztL7NdPKfyCWIqg3L0mzWUzcIqp6ebeRJ3
   eHszyqGZLcdzhvA/V1HxhYgKWxjovdjtzoheXc+A1xWm+dtDXdpKJUG0n
   uL/WnzzgVMNPoLtgWAKO6UqUyaHMdfj+n9iiApQtuuwYNzXTAecxR650z
   Q4McQphinEFXEUrutbx4yxfyhr5zj2fL2fSoOXIFjwLbEauXYLOcfTaVY
   w==;
X-CSE-ConnectionGUID: QebMlayWQ1+E/tvXoiC25Q==
X-CSE-MsgGUID: Z8VB7mxPTe62aUnJv5KG4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35375623"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35375623"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 00:43:00 -0800
X-CSE-ConnectionGUID: TTHtGL4xQiWUCWXCGYcK9w==
X-CSE-MsgGUID: 0ZB+aNecRfGsK80DtUtZNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98282689"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2024 00:42:58 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOYb2-0000zL-1F;
	Fri, 20 Dec 2024 08:42:56 +0000
Date: Fri, 20 Dec 2024 16:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __apply_fineibt+0x849 (section: .text.__apply_fineibt) -> poison_endbr
 (section: .init.text)
Message-ID: <202412201614.F1kJs3gM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 04505bbbbb15da950ea0239e328a76a3ad2376e0 x86/fineibt: Poison ENDBR at +0
date:   1 year, 5 months ago
config: x86_64-buildonly-randconfig-003-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201614.F1kJs3gM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201614.F1kJs3gM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201614.F1kJs3gM-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x200 (section: .text.__apply_fineibt) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x383 (section: .text.__apply_fineibt) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x4fc (section: .text.__apply_fineibt) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x5d2 (section: .text.__apply_fineibt) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x623 (section: .text.__apply_fineibt) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x6f0 (section: .text.__apply_fineibt) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x749 (section: .text.__apply_fineibt) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x813 (section: .text.__apply_fineibt) -> text_poke_early (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x849 (section: .text.__apply_fineibt) -> poison_endbr (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
