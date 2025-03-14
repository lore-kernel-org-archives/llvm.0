Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DFE2036FF;
	Fri, 14 Mar 2025 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970830; cv=none; b=Cd5W2X6D60XJoaF+ckJJA/HvIr/dJ/ITuJn0PZsgL1KeHyTSEvU2qfLtuItqNEml9PgDP81waUkHzttADuvHYSeadt6YjjtFj9Rwe5FkxcWqCzgvkPsr7T9vbB42KQlqfDLqoqMZNnAdrjtMXth0OoMBhFtBlA3ZwMkR6DX9+dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970830; c=relaxed/simple;
	bh=HYB98YMhPurGnuqME5Vkp3FZMILpUip8QBLmYxs4gis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BFYHjjxlf29MZhyjP28AGRb9nPnIw0k3VoFy9tVfiY2JmBd4cjPuaf1bNs9EloFfD9kT5WU/wB0W/7VM8IQpxQw9ZVV617/PGsCsAqqD+D96M8y/sQvksGQj6WAjJCMj+FtNB+JR6HsDHzIF7WZsklW3DNXK6Fjlty29QfXtfkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGXa6VVY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGXa6VVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741970828; x=1773506828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HYB98YMhPurGnuqME5Vkp3FZMILpUip8QBLmYxs4gis=;
  b=WGXa6VVYMIkQ0JGa1eUmA3yTef7mRyJrh/CN1aLTZ06Z9jqsqJjq2uJP
   8Rrn8ZADRUItlcxxm/n44ji6dD9Xby9NwrI1hqjVF0tCI/sF4UKvlmaHA
   8oiY06ATYS3wIkuld8kd2IORcyMKkgXmVGKCJ9PqI6DUfxoCQrHK91I8t
   SoxP+zdAf4bD/uLW7Ztqe41WHfIj252Pkjs3YokKaAf81Dc4p5V7ncZ0f
   y1g5E2yoLZ53QAJrSJmpMTmwfQVVgMKJxMulcBu+fl+bthvG0vK0nV0iX
   xmjax17JBJ6IhlAdnNKdfAoKhVDpMk3GdawcQSb1BiAFCp+50YrA6zZNP
   A==;
X-CSE-ConnectionGUID: LtRGn4y5SYSUCr4c6HyF+g==
X-CSE-MsgGUID: DGchfC7/QySCOi1Km8Y8jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43261070"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43261070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 09:47:07 -0700
X-CSE-ConnectionGUID: js6QUOXdTRapRsEBxuabUA==
X-CSE-MsgGUID: lOh73XW9SlKUb0CjGk3y0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126383971"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Mar 2025 09:47:06 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt8Bb-000AfW-16;
	Fri, 14 Mar 2025 16:47:03 +0000
Date: Sat, 15 Mar 2025 00:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 9687/11207] ld.lld: error: duplicate symbol:
 amp_rt1019
Message-ID: <202503150052.OfLBb5o2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: 6e60db74b69c29b528c8d10d86108f78f2995dcb [9687/11207] ASoC: amd: acp: Refactor acp machine select
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250315/202503150052.OfLBb5o2-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503150052.OfLBb5o2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503150052.OfLBb5o2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: amp_rt1019
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(amp_rt1019) in archive vmlinux.a
   >>> defined at acp-i2s.c
   >>>            sound/soc/amd/acp/acp-i2s.o:(.data+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: amp_max
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(amp_max) in archive vmlinux.a
   >>> defined at acp-i2s.c
   >>>            sound/soc/amd/acp/acp-i2s.o:(.data+0x34) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp63_acp_machines
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(snd_soc_acpi_amd_acp63_acp_machines) in archive vmlinux.a
   >>> defined at acp-pdm.c
   >>>            sound/soc/amd/acp/acp-pdm.o:(.data+0x840) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp70_acp_machines
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(snd_soc_acpi_amd_acp70_acp_machines) in archive vmlinux.a
   >>> defined at acp-pdm.c
   >>>            sound/soc/amd/acp/acp-pdm.o:(.data+0x9D0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: amp_rt1019
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(amp_rt1019) in archive vmlinux.a
   >>> defined at acp-legacy-common.c
   >>>            sound/soc/amd/acp/acp-legacy-common.o:(.data+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: amp_max
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(amp_max) in archive vmlinux.a
   >>> defined at acp-legacy-common.c
   >>>            sound/soc/amd/acp/acp-legacy-common.o:(.data+0x34) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp_machines
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(snd_soc_acpi_amd_acp_machines) in archive vmlinux.a
   >>> defined at acp-legacy-common.c
   >>>            sound/soc/amd/acp/acp-legacy-common.o:(.data+0x70) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_rmb_acp_machines
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(snd_soc_acpi_amd_rmb_acp_machines) in archive vmlinux.a
   >>> defined at acp-legacy-common.c
   >>>            sound/soc/amd/acp/acp-legacy-common.o:(.data+0x520) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp63_acp_machines
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(snd_soc_acpi_amd_acp63_acp_machines) in archive vmlinux.a
   >>> defined at acp-legacy-common.c
   >>>            sound/soc/amd/acp/acp-legacy-common.o:(.data+0x840) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp70_acp_machines
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(snd_soc_acpi_amd_acp70_acp_machines) in archive vmlinux.a
   >>> defined at acp-legacy-common.c
   >>>            sound/soc/amd/acp/acp-legacy-common.o:(.data+0x9D0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp63_acp_machines
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(snd_soc_acpi_amd_acp63_acp_machines) in archive vmlinux.a
   >>> defined at acp-pci.c
   >>>            sound/soc/amd/acp/acp-pci.o:(.data+0x840) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
