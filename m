Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01571306D2B;
	Thu, 21 Aug 2025 15:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790916; cv=none; b=MhuVNxv6nVEOKlxaYTfRE4eba2S84thgrgiYib1fksQlDcldKN7abSU62OcH0qzl2M8XdvowM2CbFSxVMYEmIEOGqdYuRlD59ce+ZuQ3pDpR6t/RbjjjPqVRNph8VBb3W/SAi6vzHK1tNI+6cDso+ir7LfVd0777vWBRAIfM5Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790916; c=relaxed/simple;
	bh=H6FymCyX3zttd1fv8B07vYL1jBQbCibbvO+W+weuLB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeoiZ2TMnCBFBpXpCqHFCiRCFUTAUkB/vbwdCkcYP0/4ck3+Qp+ievwTIaic5ZKTneYamDtO/sE84YTxoaRVhygmu4DxPohgUYVnMCAGuuB+odqs7vEP8ip6U3cm58fN/pigC4U1nzKfVZk2Q9MUn7NmmdADcE/M7MsJWuLjJI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nT/sHpTf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nT/sHpTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755790915; x=1787326915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H6FymCyX3zttd1fv8B07vYL1jBQbCibbvO+W+weuLB8=;
  b=nT/sHpTf04E2Gj3bQq9oYlgF3AA2noEXOiQtyCLN9m48fdZMhHM2c2kL
   ua7gwcp3VFz5nlD/jVYA1q9NyD8gG6ojvDMnsHlLJk7o1dXV97k1D9obI
   QK0vbgLH7zrkfbVfmzbjVzbVbpJwmx8Dr6KSqt1FadmgXGjr2DjXW+eb6
   Fr26jaQRCMkoJNzhdskSDAqXq3Y7cP63ZYrX+rXx+1ZdtwCRd1Qi9Tzwe
   EUi5GMLEYDXGFDwH+Rm2Lei8nvxPnoY86x7LqiHEREof92qD7+XNuFauw
   KDR7/VO5L+3T5hhVrbzOZBXUvkrPDGhgrArhVVsv3zLfWP3kDlO2agpHh
   w==;
X-CSE-ConnectionGUID: pC77Q8YoR0SknMu9KS2RFg==
X-CSE-MsgGUID: NGBeafBrQ+CTGII5EAulLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57287782"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57287782"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 08:41:54 -0700
X-CSE-ConnectionGUID: lQ9aarQrTu2EaW0pOZX6HA==
X-CSE-MsgGUID: H+XEDi3gQFW9Pwghmar78g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168358824"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Aug 2025 08:41:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up7PS-000KRX-0Y;
	Thu, 21 Aug 2025 15:41:32 +0000
Date: Thu, 21 Aug 2025 23:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, andreyknvl@gmail.com, arnd@arndb.de,
	bp@alien8.de, brauner@kernel.org, bsegall@google.com,
	corbet@lwn.net, dave.hansen@linux.intel.com, david@redhat.com,
	dietmar.eggemann@arm.com, ebiederm@xmission.com, hpa@zytor.com,
	jakub.wartak@mailbox.org, jannh@google.com, juri.lelli@redhat.com,
	khalid@kernel.org, liam.howlett@oracle.com,
	linyongting@bytedance.com, lorenzo.stoakes@oracle.com,
	luto@kernel.org, markhemm@googlemail.com, maz@kernel.org,
	mhiramat@kernel.org, mgorman@suse.de, mhocko@suse.com,
	mingo@redhat.com, muchun.song@linux.dev, neilb@suse.de,
	osalvador@suse.de
Subject: Re: [PATCH v3 11/22] mm: add and use unmap_page_range vm_ops hook
Message-ID: <202508212332.AB4FbJgR-lkp@intel.com>
References: <20250820010415.699353-12-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820010415.699353-12-anthony.yznaga@oracle.com>

Hi Anthony,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[cannot apply to tip/sched/core trace/for-next tip/x86/core tip/x86/mm kees/for-next/execve linus/master v6.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anthony-Yznaga/mm-Add-msharefs-filesystem/20250820-091021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250820010415.699353-12-anthony.yznaga%40oracle.com
patch subject: [PATCH v3 11/22] mm: add and use unmap_page_range vm_ops hook
config: arm-randconfig-004-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212332.AB4FbJgR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212332.AB4FbJgR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212332.AB4FbJgR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __unmap_page_range
   >>> referenced by shm.c:604 (ipc/shm.c:604)
   >>>               ipc/shm.o:(shm_unmap_page_range) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
