Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84B20DD4E;
	Mon, 19 May 2025 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685708; cv=none; b=SHYhS0O9KqPT7kZ1Q9mJQrDfdtDX9aYyPnViPNAIB9Pc0sKQa7FOVd4/+pfRmQLGtMq+t2ePjKvLK7IVMwI5tlLAJayHJqFglXADjZsVX2T/NjQy+X6rInhrs3KwD82N83CE2nmhXJNKFuNwd3ffTpBRo1laq0mjZ8Ljdk75SNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685708; c=relaxed/simple;
	bh=F5Gt0Tuzbd2ufuMvEhYiI5SgctKPEuNduoIuNi0m7Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1voLw9ZXWSIragcvmfC7jdYAzRwqQRd2o8/c3TliwzUPA509F5D/LZ8KMKlFUh4HiL/cn5OkiIDimtNE4ig2QokxAFNW7E8CIYloxj2Eveu9Bkm8hQvc9xY1PLMlznlwmUkafGTBv2KyaFwqGm5dOocOsGWbL36Jfb62uk9MrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AteSoAyG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AteSoAyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747685706; x=1779221706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F5Gt0Tuzbd2ufuMvEhYiI5SgctKPEuNduoIuNi0m7Eo=;
  b=AteSoAyGgJm/m+dD+lBw9UbA4RLJRnpV1AhjxGRw/dwePvm2OzcLsGXC
   IaiFoEhNb+AS6jsJyFpDct4NJW7YD5uDGEDfe8c6hha367N91+T6KxMMx
   igPcOq8PC9SHGSiKmazpttDv0R3D3xUJ5X4W0kejhQGtk3I4d6OGKPUU/
   L1Lan3lM9pw4G3qu15T/RUL0JHF46aIpP/7Xow9VcrNQK6Y5CxKyvjeEl
   fkhqRyMAeaZJE5DI410XYe0ojIovPN10ybzDAB863cDI9JGm62t6/vOL/
   UVx2UOSCViZ0Zqf4M69nrcYKOpoBmy7hEfkSy3jNxNNKdEdrXMXZK6x7m
   Q==;
X-CSE-ConnectionGUID: JOlLTorMQB+nWEL79lVrPQ==
X-CSE-MsgGUID: RH4GjB2mS423V72hyhav4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49531505"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49531505"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 13:15:05 -0700
X-CSE-ConnectionGUID: JSyUSxWuRtGBLTrHBe7gRA==
X-CSE-MsgGUID: Fda4hPOcQNSC/utZOW72/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139982792"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 May 2025 13:15:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH6t3-000LoK-0X;
	Mon, 19 May 2025 20:15:01 +0000
Date: Tue, 20 May 2025 04:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>, Fuad Tabba <tabba@google.com>,
	linux-doc@vger.kernel.org
Subject: [weiny2:fuad-mroth-2M 11/35]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:778: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202505200432.4ITQ6uW3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git fuad-mroth-2M
head:   e7a0e768b14b70e6723b2800c0d108cf449c534e
commit: 20151d3e5ed777116e8ee5787115779b68afa70c [11/35] KVM: x86: Compute max_mapping_level with input from guest_memfd
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250520/202505200432.4ITQ6uW3-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200432.4ITQ6uW3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200432.4ITQ6uW3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:778: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Returns the mapping order for this @gfn in @slot.


vim +778 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   776	
   777	/**
 > 778	 * Returns the mapping order for this @gfn in @slot.
   779	 *
   780	 * This is equal to max_order that would be returned if kvm_gmem_get_pfn() were
   781	 * called now.
   782	 */
   783	int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot, gfn_t gfn)
   784	{
   785		return 0;
   786	}
   787	EXPORT_SYMBOL_GPL(kvm_gmem_mapping_order);
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
