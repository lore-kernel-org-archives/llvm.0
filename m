Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0ED341069;
	Fri, 21 Nov 2025 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763720148; cv=none; b=D67cqmfR5yu7HZ1tOoPfMYuLPC/XyDkgDaMsaCeWmMZ01D+d59htDlAVN5U0GJ5Q9CVYq+letWd8MoHc/dUW6+UmXZf6W0jzNc2W9fHJsK4kKlyNpCQqX8WKXYu3baiDc6KwyoxVCTLqBjyHysbHjYzeAedM2eUuXtwYiAoKCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763720148; c=relaxed/simple;
	bh=VLkkzZbVSObgfRsPhSAAPnVORGcWgp2Cjevvl63/aWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eb60CrLzNrC48nRy9GVSSxJkWvxqzTkzrKcP+EcgWODYuFDSEvZf3a9uajm3iYbdUppS4kV6+F1VrOARBZdKnadPIHa4E9CcIFIPNzOWZRV7oGeOCcKQ4H37Tu5oWZsYtC0Fo6VX8yxB1nJTjL29w2CGSkT3Q9zWeaTcm47RVDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFl9cnap; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFl9cnap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763720147; x=1795256147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VLkkzZbVSObgfRsPhSAAPnVORGcWgp2Cjevvl63/aWw=;
  b=DFl9cnap5XNzo2iIRyubHZtT9zBKJ5ez5+xMGreuryhYUaQCwT+VHOwt
   4nupw0c7X8GFGImaZwZKWha/DQtHbyhel+iJD1SNcXMsxmCuxF4i9nc2d
   Nq5ZAeoPKRUtw2VoUfBbl7ZdqdaBldK+bi1kfP1nY7slhIYWIkdf+CX57
   pB6ncqo003vpSv7M22vZVne/BHyB/3Asqi5hSIQXaABT+mWkRo8Vk0t9r
   4gsRcawoN2fFuDGzJEAmKj9Y294KfaIcosxSFOZ0Yy0Chkk2yiecuoIpq
   EEfr4xuFHH70jQyaMdaeKPzY8gdLnj/TLYvmsm7W7YyaSVRoiIIJwbQZI
   Q==;
X-CSE-ConnectionGUID: CGMgdup+TsSy7vheaE700A==
X-CSE-MsgGUID: wwmvvZokRLCVgt5BFHpPGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65848578"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65848578"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 02:15:47 -0800
X-CSE-ConnectionGUID: ZWawT6pIRMuaivjbwwPtkg==
X-CSE-MsgGUID: E6hxrEk/Rnmhzy0e8i47xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191904417"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2025 02:15:42 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMOB2-0005D1-0B;
	Fri, 21 Nov 2025 10:15:40 +0000
Date: Fri, 21 Nov 2025 18:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	tglx@linutronix.de, yury.norov@gmail.com, maddy@linux.ibm.com,
	srikar@linux.ibm.com, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
	vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH 12/17] powerpc: method to initialize ec and vp cores
Message-ID: <202511211747.WJdFJoRB-lkp@intel.com>
References: <20251119124449.1149616-13-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119124449.1149616-13-sshegde@linux.ibm.com>

Hi Shrikanth,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on next-20251121]
[cannot apply to powerpc/next powerpc/fixes driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-docs-Document-cpu_paravirt_mask-and-Paravirt-CPU-concept/20251119-204931
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251119124449.1149616-13-sshegde%40linux.ibm.com
patch subject: [PATCH 12/17] powerpc: method to initialize ec and vp cores
config: powerpc-pasemi_defconfig (https://download.01.org/0day-ci/archive/20251121/202511211747.WJdFJoRB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211747.WJdFJoRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211747.WJdFJoRB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pseries_init_ec_vp_cores
   >>> referenced by smp.c
   >>>               arch/powerpc/kernel/smp.o:(smp_cpus_done) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
