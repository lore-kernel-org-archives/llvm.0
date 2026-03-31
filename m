Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E9426D3F;
	Tue, 31 Mar 2026 17:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979800; cv=none; b=BAIE1VD26WkdE6bhuFehXoDTAkkkhaO1x4UzdyMpa7FHVyJDFwaYp7BRodSK/wX1yF3yZNANfsrmjSia10JAAU54JWJR4S9ckayjYgLTudr6yZuEn7jQoKDfqh++zo6qnFJN4u+gMRoqPF+rOwgJ6+hfe6OeguXfSTu0Jo5qHEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979800; c=relaxed/simple;
	bh=3+B6h/PL7nDhBjmHj9/aqlW/xpmgvBEfww9mmYBnOgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pJbvizs0t4HQyzEKMm6gv0+bqDqJZocumW84VSrtJAOuswXXXz+hyTj/Ff4m59Bv8LBF7/SBKjFwx3cNO7hMVLYznY8qqt6PSYWJBDXFFRIwLLDz7gjcuB5llMWeTbfJsq54tKsySU1fgixbMHWPyRLDEm6ejoENGYCmVuHiFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIt6pfJs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIt6pfJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774979796; x=1806515796;
  h=date:from:to:cc:subject:message-id;
  bh=3+B6h/PL7nDhBjmHj9/aqlW/xpmgvBEfww9mmYBnOgU=;
  b=YIt6pfJsr+U3eer0XbAfLDN2Nykhnhy7bbX1NDT5PsvmQB3f+qZxDl2G
   YP5x+9GfacTpvgmuNdzgBLIa7DQrhmgh0pxfjBFpNwj4TvffUY37BZAmv
   r7Eb/+warcVixZ7zRmll+q4kPQsWfF3she4MqIuTaZ13SaoNqirM8SLKZ
   mokbByQxoyqf933hMSHxazyyTpdW6f+lrOR1nNWKjGOshum6vDWSfNnRW
   W1J/9y+onS1cd9kEYFrw6fj3SYaLPTfHkB1muPDsAKlADn1fyWaMzmTQs
   PenW5tHRzpPTnnk+t3Zvvl7qYPJTjsTUHVDoQuCgjemjW/WnZuma5ZvNR
   w==;
X-CSE-ConnectionGUID: I2QNuLCeRNKqOKLFD6H/Og==
X-CSE-MsgGUID: k8As7q4qQF2qCYg5nMX5vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87078474"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87078474"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:56:35 -0700
X-CSE-ConnectionGUID: FPqnKCf5Q1izUUOdinz9cQ==
X-CSE-MsgGUID: PhcGa9q9S0mY7pItNblCiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230501586"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 10:56:33 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7dKI-00000000469-3vPW;
	Tue, 31 Mar 2026 17:56:30 +0000
Date: Wed, 01 Apr 2026 01:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 26/26] Warning: fs/nfsd/nfs4xdr.c:4302
 function parameter 'nf' not described in 'nfsd4_encode_dir_attr_change'
Message-ID: <202604010108.w7vSkchn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   41363e319407643cd357c31a12fd344cfc9eaf48
commit: 41363e319407643cd357c31a12fd344cfc9eaf48 [26/26] nfsd: add support to CB_NOTIFY for dir attribute changes
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260401/202604010108.w7vSkchn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010108.w7vSkchn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010108.w7vSkchn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/nfsd/nfs4xdr.c:4236 function parameter 'nf' not described in 'nfsd4_encode_notify_event'
>> Warning: fs/nfsd/nfs4xdr.c:4302 function parameter 'nf' not described in 'nfsd4_encode_dir_attr_change'
   Warning: fs/nfsd/nfs4xdr.c:4236 function parameter 'nf' not described in 'nfsd4_encode_notify_event'
>> Warning: fs/nfsd/nfs4xdr.c:4302 function parameter 'nf' not described in 'nfsd4_encode_dir_attr_change'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
