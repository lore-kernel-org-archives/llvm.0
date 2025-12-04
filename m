Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35182741AB;
	Thu,  4 Dec 2025 21:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764882100; cv=none; b=l/IWUO8Xb0eYyo/xo8ROd6FF7NfrWuqyw2E7mlxwvWCxdhqmag8Hxzi5GrEZeltxUM1HuHTmE9QmVBZX/qEy1TduvMWOhN97d0iMdgRT0GKoa3QGcZwCrdKCBTPibt1UQA7VcnQYHYtY1cSjv1ET6PEssWGWxJVl8E0HSidFkuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764882100; c=relaxed/simple;
	bh=XZw8fzlP/viFVVllDH+mpIRabBhIZRalz+LvirKo5kU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uq42CWwHHzTFh72lVLnoW80iRrdbTx2MK3ThNXMs6cZkUrpwKAArp1ErjWN9DfV9Zioimf72RBWFGGheSq5u28Pe2wGfPCQW3xeqSMimPhtFrCrdUko9SfxAR3LPrWNcEGA28AizvIe0rBJ+AfdqVN4kxaYu5uWNRAXgToBjOsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bb4jNI0O; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bb4jNI0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764882095; x=1796418095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XZw8fzlP/viFVVllDH+mpIRabBhIZRalz+LvirKo5kU=;
  b=bb4jNI0OoLW3Gb0pSBA8HUqT3GkCP/VfM/Yv+8iGNwcOcni+j7OjLYzZ
   Mu6rjc8jgWjhJxgCHYIfh9YovL/ZsN4WizZIbMAr5ZMsG5x9v9dCJjUsg
   t0/hXdzwQ6QB49WepxhqwvPz8YOFeKbKdAPlfapdRDl6zFqQJFJIVZhNB
   LG55TmrXiB1+L8mkzIMdlUI57aC/7b+p+E0AyLydR9SmW5ZiElu4/JjdJ
   QmTPrFS+3LqrTWU5wudEioTFySe9WIylMxxQQotzqlS9v/FJJjlEDcr5f
   sLpOOTIvsbClXb8Zw68mvQvCwQglvjF0hJd1xntXKZqe/4EQaLk6ijB2j
   A==;
X-CSE-ConnectionGUID: ghhrCvgmR7WZtVsHEF7/TA==
X-CSE-MsgGUID: JQ8LNc8YSOmVTAbCdzRDPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84319727"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="84319727"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 13:01:34 -0800
X-CSE-ConnectionGUID: obWrp6NhRDagWybX7INLaA==
X-CSE-MsgGUID: xkZKaGUyQ/qCQoaASFVVAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="200217534"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2025 13:01:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRGSB-00000000ED1-17s5;
	Thu, 04 Dec 2025 21:01:31 +0000
Date: Fri, 5 Dec 2025 05:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/no-macro-conv 24/25] Warning: kernel/sysctl.c:470
 function parameter 'u_ptr' not described in 'proc_int_k2u_conv_kop'
Message-ID: <202512050411.tXi6Eq7E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/no-macro-conv
head:   60075afc9fabecdb5b1015df21a05df3b2d50562
commit: 71c0b361117fe4d62c3c9ebe9a0893d137af3aea [24/25] sysctl: Remove INT converter macros and add explicit functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251205/202512050411.tXi6Eq7E-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050411.tXi6Eq7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050411.tXi6Eq7E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sysctl.c:370 function parameter 'u_ptr' not described in 'proc_uint_u2k_conv_uop'
   Warning: kernel/sysctl.c:370 function parameter 'k_ptr' not described in 'proc_uint_u2k_conv_uop'
   Warning: kernel/sysctl.c:370 function parameter 'u_ptr_op' not described in 'proc_uint_u2k_conv_uop'
   Warning: kernel/sysctl.c:388 function parameter 'u_ptr' not described in 'proc_uint_k2u_conv'
   Warning: kernel/sysctl.c:388 function parameter 'k_ptr' not described in 'proc_uint_k2u_conv'
>> Warning: kernel/sysctl.c:470 function parameter 'u_ptr' not described in 'proc_int_k2u_conv_kop'
>> Warning: kernel/sysctl.c:470 function parameter 'k_ptr' not described in 'proc_int_k2u_conv_kop'
>> Warning: kernel/sysctl.c:470 function parameter 'negp' not described in 'proc_int_k2u_conv_kop'
>> Warning: kernel/sysctl.c:470 function parameter 'k_ptr_op' not described in 'proc_int_k2u_conv_kop'
>> Warning: kernel/sysctl.c:496 function parameter 'u_ptr' not described in 'proc_int_u2k_conv_uop'
>> Warning: kernel/sysctl.c:496 function parameter 'k_ptr' not described in 'proc_int_u2k_conv_uop'
>> Warning: kernel/sysctl.c:496 function parameter 'negp' not described in 'proc_int_u2k_conv_uop'
>> Warning: kernel/sysctl.c:496 function parameter 'u_ptr_op' not described in 'proc_int_u2k_conv_uop'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
