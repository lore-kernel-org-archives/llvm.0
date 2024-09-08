Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C700139587;
	Sun,  8 Sep 2024 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725785064; cv=none; b=Jv3E+l9cDJHiUnMNlAWieGNgaXKKrUYXzuS+WeuHRn2k4/DBIesJaoLvwYUrO2gVoE+QXfR1BU7Xy/UJYKwkoXbkilZ2uI7fInHAUnxX2Ft3y4zV+V7prWH59s/yui9jvKXNOLOOVQUc8+ZafrvZE5636zsV54pCnj7DzaXRjYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725785064; c=relaxed/simple;
	bh=n+3JF9/VjdM3/kbehCdSSMf7u9TQ19AadDjNf+CtvDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHSEj0N8BqBe4AflDrCp3NVad0/pW3s+H5nBKEK3shw5Jz1kcxxPXn/akpWOOH5ZV7QgqBLCBVyO6CwlPP4SBNf6kNzVjHrYQyo8xsOyiYfN+LY1OSWzqD4mazYe0XlqxLDaNlAR1mHyhos4QuEWGuHcngwA8tQBelZXSDhu0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dl4mcL8V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dl4mcL8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725785062; x=1757321062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n+3JF9/VjdM3/kbehCdSSMf7u9TQ19AadDjNf+CtvDY=;
  b=Dl4mcL8V9oKmJK7N9kytwC0/arz4ekhtNFaxwRNUsF4ZFuQs+boFZAet
   n9UrkrDwssJ+EEOQ2qAIgFxorT8IsTb68YEZ4UF/7w418x6+n5hqQP1kO
   /2R2gyRjvbrMthBuOgp9hAnHbA8T2TiauO0bA2uCgQQsgptF8Wk/4WHVh
   EMaW6j4pNCzyC2iaDSS7yvMmtrxhrHPIqNoM1MDcf9fa1PNNug0H08777
   HojfH6euOQKzrXFEo55Z5SehhmkxIMCZpoxuNsT82eT0d8tU/ay+Htupl
   BpLQ+qNb95WgnHtVHF7XCuYtE47//zGkjzQRJbmsf7zxNo0W6f9IU5tvX
   A==;
X-CSE-ConnectionGUID: qkVjqZB8TJG9q3AVCbmjVw==
X-CSE-MsgGUID: eFu97Uf9S9O/5R1dqbAFlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="27413553"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="27413553"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 01:44:21 -0700
X-CSE-ConnectionGUID: cEYFmIu6TdGVgwin59YjeQ==
X-CSE-MsgGUID: uz2qSEs+SRmydEn5004fkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66013644"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2024 01:44:19 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snDWr-000DNP-0t;
	Sun, 08 Sep 2024 08:44:17 +0000
Date: Sun, 8 Sep 2024 16:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol
 '__sancov_gen_cov_switch_values'; recompile with -fPIC
Message-ID: <202409081658.d1dItwXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d1f2d51b711a3b7f1ae1b46701c769c1d580fa7f
commit: f79dc03fe68c79d388908182e68d702f7f1786bc kconfig: refactor choice value calculation
date:   8 weeks ago
config: riscv-randconfig-001-20240908 (https://download.01.org/0day-ci/archive/20240908/202409081658.d1dItwXr-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409081658.d1dItwXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081658.d1dItwXr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '__sancov_gen_cov_switch_values'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:71 (arch/riscv/errata/sifive/errata.c:71)
   >>>               arch/riscv/errata/sifive/errata.o:(errata_cip_1200_check_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '__sancov_gen_cov_switch_values'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:71 (arch/riscv/errata/sifive/errata.c:71)
   >>>               arch/riscv/errata/sifive/errata.o:(errata_cip_1200_check_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
