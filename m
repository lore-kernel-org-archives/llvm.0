Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA3D3C2782;
	Fri, 31 Jul 2026 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487810; cv=none; b=Yu/Gv+ga6YndBHs1et1OKHqVSsgLo78qjudBx9X33XypXIvC8pkyodqKL0raIF7untIeTEWSJ+BlyXH+d7OwN5BcReJJDw5EFJUN04Y2FxIOsT8RiSb91vED0RAbwREkKbGFV5Q1+P3PkSr4xexLXYnG6eILT1kEkccRooEbwqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487810; c=relaxed/simple;
	bh=efFvxx0Sf5/uBKdHLDWArSx0o3Soq7XtOh6af59DdaM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SDSrBM7Mu5IeISNxGRkoGBVgzKkA4nT/R3bnClv+GkZGP5rBOoD6HhOS0h3q3PuyLtqULKbc9CT8vAJC9cYiCrD9k/kAyCcqTx06zrtGQjeDditBXraRJRnx8lu0Cx46DhAPJJhnK1EOJln8MMLsFomBYy3uC3jIulhEnBDUHe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuaWibms; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuaWibms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785487808; x=1817023808;
  h=date:from:to:cc:subject:message-id;
  bh=efFvxx0Sf5/uBKdHLDWArSx0o3Soq7XtOh6af59DdaM=;
  b=UuaWibmsgPzmTu09xcq3bfuxD/U+3VAu8upe3DTS541C8mJSMKWla5ZY
   Tdizz+q0SblKY8AB8/khtpaiAU8nE/nBBNMgJSmRRDo5txxzr672L2QZy
   LOWvcMkpHE1zsmUsmAjZig9Vsgpn+keNb89Q6KNwnM/vpPjOkvzCQKsCF
   qKKomhB1U0mv6G2LVyToUFCYh3ceb3gL6Ixv4h/5SNGG8RHjDTDgQhe+W
   5OQtAdZYTNSAO/91XAZwyX1Q8oRqDukzxb48AzsOSp/iLI9JQ0A7EM6co
   kqeBI6OD85P5c9W5bJO1S7oVEyqEzy+BOAFUyrIvLCX1C7FHg7zjnoVld
   w==;
X-CSE-ConnectionGUID: t2RMZpqMRFSQ2CCTA0tPkw==
X-CSE-MsgGUID: vIUVErO/QJCjknzGP2b4lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="111658384"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="111658384"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 01:50:08 -0700
X-CSE-ConnectionGUID: o3LJWZSfSviqtB/GRkgirQ==
X-CSE-MsgGUID: 5QYkGO1/TGCS/YsZDmyN6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="258740593"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2026 01:50:07 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpiwO-000000002ak-0vm2;
	Fri, 31 Jul 2026 08:50:04 +0000
Date: Fri, 31 Jul 2026 10:49:33 +0200
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-7.2.y 57/58] .gitmodules: warning: ignored
 by one of the .gitignore files
Message-ID: <202607311021.MX9Pqvk2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   b975acfb39259020dffed242fcfba388a6f4e354
commit: aadf585168240b41fc8faa32e9b150829831a44a [57/58] ODROID-COMMON: net/wireless: add Realtek Wifi drivers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260731/202607311021.MX9Pqvk2-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311021.MX9Pqvk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311021.MX9Pqvk2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .gitmodules: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
