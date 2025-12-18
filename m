Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CD82DA75B;
	Thu, 18 Dec 2025 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045269; cv=none; b=j9KB94Y6vTpkIfQtq1H4pablF6cwG+62JAAb2lCYrpwvsDyZIWpkgulIAG12foWQ4qPTGQt1orPEDfv/6MFb0DhsBIJ0PntsBM/g2FAfWGIXHrrrDQnxM1uX4CIMeVWhiafrye6PA5lLaIRpo2KIN2pDR0YlZ9Kssh/BWVAG4PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045269; c=relaxed/simple;
	bh=14gY+Zc1p3HwVRsTSgMA78u73WvDD7wU1U0G11fiKTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TL9Zagb5uTAp0tYpezc6z4HqPx3XHJuzpo4ULdrFTKzybqXTMYzFbMia9Jf5onyH6mlEyIIuJr1YgJ9qC3559bon9/BXf5F89kFEbD2PaVr7CDk294Wbc4xuv8Lf/C8mlOJeJPeqptw0rwvhjjQdcGq9GXq2vqnUX0CaWpwpCJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLFQO/Tz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLFQO/Tz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766045268; x=1797581268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14gY+Zc1p3HwVRsTSgMA78u73WvDD7wU1U0G11fiKTo=;
  b=HLFQO/TzxvQg++oZruoB9iZu/zKv+fUoBEaeVjP/RrH0m5HVpa7CT2no
   0X866rsUd1g2pPje2wBmA5XQIPg8EtgoQ9I9TGoYN+lt7lGPskkP581wE
   Uxjms3aIoLeqzp0QviXE70MDj8liExYWU4r4E/rif02jPtpr0IsxAVLrM
   jZq7iWkrCEz8fsls0HZOvhWyM0jwJuuh1CiBB5bot8HZGqQkkPg2Coi56
   v0FX5N4WjLJiabr3aoUaaYqU0YnqwhYgtiPisvv3Omx1Vrso1hynmyuMO
   o18+egb6EXdB4KDQzxe7Ozl/9LeRY5b/jQvQtzxaNaCNiz4GaPgnLDv8b
   A==;
X-CSE-ConnectionGUID: XLB9FNfsRUSxkhTvWjLEKA==
X-CSE-MsgGUID: AEks0EEQRruNOf9coPtE2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67187775"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67187775"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 00:07:47 -0800
X-CSE-ConnectionGUID: s0eG5tcXREGumC82roQDkQ==
X-CSE-MsgGUID: sl+PnTamSgmfVL34L/a1nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198599185"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Dec 2025 00:07:46 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW931-000000001nv-34xy;
	Thu, 18 Dec 2025 08:07:43 +0000
Date: Thu, 18 Dec 2025 16:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/dovec_consolidate 21/24] Warning:
 kernel/sysctl.c:958 function parameter 'k_ptr_op' not described in
 'proc_ulong_k2u_conv_kop'
Message-ID: <202512181539.YS7kV2m4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/dovec_consolidate
head:   96185449a89d542ae186d3a530dfd59920e7773a
commit: 8ce0559763f13a61d67e832563e660b5891b7b60 [21/24] SQUASH with  proc_ulong_k2u_conv_kop
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251218/202512181539.YS7kV2m4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181539.YS7kV2m4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181539.YS7kV2m4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sysctl.c:475 function parameter 'u_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'negp' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr_op' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'k_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'negp' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr_op' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:537 function parameter 'negp' not described in 'proc_int_conv'
   Warning: kernel/sysctl.c:896 function parameter 'negp' not described in 'proc_ulong_conv'
>> Warning: kernel/sysctl.c:958 function parameter 'k_ptr_op' not described in 'proc_ulong_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'u_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'negp' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr_op' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'k_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'negp' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr_op' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:537 function parameter 'negp' not described in 'proc_int_conv'
   Warning: kernel/sysctl.c:896 function parameter 'negp' not described in 'proc_ulong_conv'
>> Warning: kernel/sysctl.c:958 function parameter 'k_ptr_op' not described in 'proc_ulong_k2u_conv_kop'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
