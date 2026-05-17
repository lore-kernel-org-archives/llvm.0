Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA3313E07;
	Sun, 17 May 2026 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778999183; cv=none; b=NkHwpTTYHFksFIwNLV6qdxbA05fM4F7EA2IFgyfRO5YRMbPQscASI2eZ7mKngQfjl8dUS0vyqpEvRirnuCs/WdQwPW6A7OaGU7tKdBBSI4NI0Ds4WYJmNVebLaCNkzICtW4T+l9xNs1VY+WapFITb2rmzTt78yObXBzXJNI36Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778999183; c=relaxed/simple;
	bh=Wf1JZP90i3OaZ2KJvbePcH9zwwvdOsWpnrVP4OF5sgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZB+7dRtfGAO2pvy7nLcULMegFeucohLPhxVHIJ2NbHneg4SijafU9x0uDLy9Y7HKffhvptN9OyubbbguV2sf3+yeC+/1HBbDghVqE0KPII5hYWHMhsW+NOoBqHlLEpYzFIwDUOYStcGkJ6KTh7NMAwdpWWCD8N5gwvqJUvI7SZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Df9teTpH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Df9teTpH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778999181; x=1810535181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wf1JZP90i3OaZ2KJvbePcH9zwwvdOsWpnrVP4OF5sgE=;
  b=Df9teTpHNbJEH1STUlvqwd9mlxIoiadErghVpPePxGTFmRI0qkKZnsXl
   2IumNPSDqrR+HpuTxnXV+AfRyYFp7fz6pNLUJ4l0c9BDZl7yziVmQMnOw
   76D45YSa+wsJclkhHfhpKTjadP7BEIS18VtB+FU5B/OFPteNzxJtPkS67
   fZJb2nBF8v+S3k+BY2k6dqqgiWKoBP0JlcKBnId1Gh1Bmf8FjoQlXRzkE
   82eeqjFhJQztF0sB+dOD23XDRbDAdbFlidSexhJjK+epNbPc94cl9+70e
   ghzdbJkZxCreh/QtLjKjckYPC6UBGHf6bxwWy4aqRj8IlW+1Ugn/80a9l
   A==;
X-CSE-ConnectionGUID: D9vnJ6IbSsOzoVJaNjLiDw==
X-CSE-MsgGUID: JORCBYx0QHqm2VhfBLJNog==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="67416316"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="67416316"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 23:26:21 -0700
X-CSE-ConnectionGUID: 246+PfvgSiaPFM/JTF1UJQ==
X-CSE-MsgGUID: 3IqONLX/RoOWyijuLQxZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244073016"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2026 23:26:19 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOUx6-000000001P0-2rDk;
	Sun, 17 May 2026 06:26:16 +0000
Date: Sun, 17 May 2026 14:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: remove unnecessary architecture-specific
 <asm/asm-offsets.h>
Message-ID: <202605171414.zrSQqMbq-lkp@intel.com>
References: <20260517030408.100043-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517030408.100043-1-enelsonmoore@gmail.com>

Hi Ethan,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm/for-next]
[also build test ERROR on arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next soc/for-next linus/master shawnguo/for-next v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Nelson-Moore/ARM-remove-unnecessary-architecture-specific-asm-asm-offsets-h/20260517-110530
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
patch link:    https://lore.kernel.org/r/20260517030408.100043-1-enelsonmoore%40gmail.com
patch subject: [PATCH] ARM: remove unnecessary architecture-specific <asm/asm-offsets.h>
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260517/202605171414.zrSQqMbq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171414.zrSQqMbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171414.zrSQqMbq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/lib/ashldi3.S:30:
>> arch/arm/include/asm/assembler.h:22:10: fatal error: 'asm/asm-offsets.h' file not found
      22 | #include <asm/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +22 arch/arm/include/asm/assembler.h

^1da177e4c3f41 include/asm-arm/assembler.h      Linus Torvalds  2005-04-16  19  
^1da177e4c3f41 include/asm-arm/assembler.h      Linus Torvalds  2005-04-16  20  #include <asm/ptrace.h>
80c59dafb1a9a8 arch/arm/include/asm/assembler.h Dave Martin     2012-02-09  21  #include <asm/opcodes-virt.h>
0b1f68e836bcf1 arch/arm/include/asm/assembler.h Catalin Marinas 2014-04-02 @22  #include <asm/asm-offsets.h>
9a2b51b6ca93fc arch/arm/include/asm/assembler.h Andrey Ryabinin 2014-06-18  23  #include <asm/page.h>
7af5b901e84743 arch/arm/include/asm/assembler.h Linus Walleij   2024-03-25  24  #include <asm/pgtable.h>
9a2b51b6ca93fc arch/arm/include/asm/assembler.h Andrey Ryabinin 2014-06-18  25  #include <asm/thread_info.h>
747ffc2fcf969e arch/arm/include/asm/assembler.h Russell King    2020-05-03  26  #include <asm/uaccess-asm.h>
^1da177e4c3f41 include/asm-arm/assembler.h      Linus Torvalds  2005-04-16  27  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
