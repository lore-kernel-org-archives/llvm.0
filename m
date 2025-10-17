Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F723278D;
	Fri, 17 Oct 2025 04:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760676912; cv=none; b=Igtz5dXopYtw6hhcsknPYpSnmmPxBg/a+/liRwu1zDJHtlFgiAqddBuy+cABsmnv70GaG3WBK6MpWbqO+imFjNk6nfWAaPmHqnIhLsiQYHUdzeeUBETyxNo2Kz0Zx3f/nApJvV7wjqv+iHXPHNoIKAcII3IYSfuFhHJ84HA1jno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760676912; c=relaxed/simple;
	bh=fn8NpPJ2f9VxDdJUQ2bR9bOX0u2vLeDNJA6tQajjX4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQc3YmLbB1CnhlQsvJnoAAhbHRlKZLYh55wU5jN8U7HVE89LzN3BG349/2rA838zqbtY/bG627IkiZOAN6PCjYVXhKG5gVZIUPCrX1JaFOys35MNnHOFgeso7oqTC6j7RTzEfNqbwTc4ofZoxWwGaCbG3odpy2e53Dc2ZZmjX/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ma8lkv2K; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ma8lkv2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760676911; x=1792212911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fn8NpPJ2f9VxDdJUQ2bR9bOX0u2vLeDNJA6tQajjX4A=;
  b=Ma8lkv2KBAnsQ+V2fnWNA97mjD1jESle3qVgAG87rDAqBgFDHxZs61TK
   ogvsn+C1vonJX8ZSio7XMF81EU1zNvhGqTEmO9F0Qpfs1UmtBcuoj5zio
   Y9rCVeTdQlnngsBp3UlMCAosGF46ZJ4XIWDMFyuzw4il3x3E3LSp5YkAu
   kRXmdgf5FludjE0uH//kf50lC54mDjYWT1/xRed1h3R1XRYeBbz09EDUv
   KWwljbXab1iFTUh3kiI8okyRZeQSy6eNhmqZPL8n01hLgFYJ7OqD5OP01
   9bNebQsl4mDnmzE+HXDHoNtEOFbaci+tvqpw4ZWqViHqQWhD7Vj9vA/qY
   Q==;
X-CSE-ConnectionGUID: E2NWqf2XRcSULpmUpY0ZNA==
X-CSE-MsgGUID: bCtVYVg+TaOHnbf5dFIEbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62928201"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62928201"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 21:55:10 -0700
X-CSE-ConnectionGUID: 0fn64XxWRVC7PLLf2jzQtA==
X-CSE-MsgGUID: U60XfcmsSR6sKL6108NZPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="181836214"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Oct 2025 21:55:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9cUb-0005Xl-2I;
	Fri, 17 Oct 2025 04:55:05 +0000
Date: Fri, 17 Oct 2025 12:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/l1tf_mitigation_mitigation 4/5]
 arch/x86/kvm/vmx/vmx.c:313:29: error: too many arguments to function call,
 expected 0, have 1
Message-ID: <202510171237.1TqLZkoc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/l1tf_mitigation_mitigation
head:   6b03b37c78d0bdc369aa93991cfa0f209cf20964
commit: 111c111ee261f0d902f2a33b0193cb68c687b8e9 [4/5] KVM: VMX: Disable L1TF L1 data cache flush if CONFIG_CPU_MITIGATIONS=n
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251017/202510171237.1TqLZkoc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171237.1TqLZkoc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171237.1TqLZkoc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:313:29: error: too many arguments to function call, expected 0, have 1
     313 |         return vmx_setup_l1d_flush(vmentry_l1d_flush_param);
         |                ~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:306:12: note: 'vmx_setup_l1d_flush' declared here
     306 | static int vmx_setup_l1d_flush(void)
         |            ^
   1 error generated.


vim +313 arch/x86/kvm/vmx/vmx.c

   305	
   306	static int vmx_setup_l1d_flush(void)
   307	{
   308		/*
   309		 * Hand the parameter mitigation value in which was stored in the pre
   310		 * module init parser. If no parameter was given, it will contain
   311		 * 'auto' which will be turned into the default 'cond' mitigation mode.
   312		 */
 > 313		return vmx_setup_l1d_flush(vmentry_l1d_flush_param);
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
