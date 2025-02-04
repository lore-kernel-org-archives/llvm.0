Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F9223300;
	Tue,  4 Feb 2025 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676772; cv=none; b=JD4U2UftHEpp2rfdgNjko+yjhHbLIIiget2kIeZLbzodN5yOh11hVXKn9YYBjY+mJLGhnHcSx7QImleh5+4ukUYwXncFY798NY4XiqIT2R66qrP/yD6ebEjq5KbMhAxKz74eHoqWQhAXxPZr/RFuAtLc+OqAktyOiOXjHfJZ1rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676772; c=relaxed/simple;
	bh=vidSXqskwPzJaP9Rviva5ccLiBArtnYHFgi7x8hmfM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TSCwOJZTYPYH6DD4uq+eU70i4b4EBeosAD4LJUmrG54MWqnXPZHlvrQKC3+Ye+Jf39outsKwpfLXA97HL/QT93rTYrG4f0Lx/z+UymnrcSOrnvPGgz/6Z3rCSodWwjy04MBKy63hrnoe6clwcy0rr69Na4WGSfOKrWdCYpywNZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuKL8DT1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuKL8DT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738676771; x=1770212771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vidSXqskwPzJaP9Rviva5ccLiBArtnYHFgi7x8hmfM4=;
  b=JuKL8DT1v4EJJrncyhE5TR39GC3CmlE/Ibk7Fhk7dmw2r554SVwZ+Mpk
   qR0Ty+OmYy/9/Qk5T8oOgpxe+W+h4JEsErg5UIfMTaDUvDsAf06qdDrEV
   4pKuwp4bJlFHpO7LA3BihBDHI3O94OseQZA7ZjcDlMPKnA0/el1oQ+4o4
   CEUVh8IIJQw0oz8f51eVqO35CSLLFQMVof+yIMoaBWHutelZ0ai6kdhnu
   DRi8RuvfGhCdQwsssUJeajLc59SmMdbKXC2fGSXyqI0yWj7TL0Gm2yVBP
   kMJ8sDBM47IHtzBEoDICaJXdBOK9NTGGtYCrNU5/mCQAcpQ0aKn8TAT1w
   Q==;
X-CSE-ConnectionGUID: 6jmliAMnQwyglZOgTxqNlQ==
X-CSE-MsgGUID: hvppKQEeSIGcrlIw5ECaTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39463705"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39463705"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 05:46:08 -0800
X-CSE-ConnectionGUID: +k/050W9Q9ed/lbXoUWXTA==
X-CSE-MsgGUID: YqU6KvNvSQCagzOThndzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115590147"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Feb 2025 05:46:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfJFc-000sXK-0m;
	Tue, 04 Feb 2025 13:46:04 +0000
Date: Tue, 4 Feb 2025 21:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 12/13] arch/x86/kernel/kexec-bzimage64.c:344:10: error:
 invalid application of 'sizeof' to an incomplete type 'struct kho_data'
Message-ID: <202502042150.OfBc2oL8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   a75b813f58b0bc19b2c4b06bd62afc87f02dcb43
commit: dd730ee646a9855c98bf5e8ed8ccf1ee7c8fe122 [12/13] x86: Add KHO support
config: x86_64-buildonly-randconfig-005-20250204 (https://download.01.org/0day-ci/archive/20250204/202502042150.OfBc2oL8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502042150.OfBc2oL8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502042150.OfBc2oL8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/kexec-bzimage64.c:344:10: error: invalid application of 'sizeof' to an incomplete type 'struct kho_data'
     344 |                                      sizeof(struct kho_data);
         |                                      ^     ~~~~~~~~~~~~~~~~~
   arch/x86/kernel/kexec-bzimage64.c:344:24: note: forward declaration of 'struct kho_data'
     344 |                                      sizeof(struct kho_data);
         |                                                    ^
   arch/x86/kernel/kexec-bzimage64.c:516:10: error: invalid application of 'sizeof' to an incomplete type 'struct kho_data'
     516 |                               sizeof(struct kho_data);
         |                               ^     ~~~~~~~~~~~~~~~~~
   arch/x86/kernel/kexec-bzimage64.c:516:24: note: forward declaration of 'struct kho_data'
     516 |                               sizeof(struct kho_data);
         |                                             ^
   2 errors generated.


vim +344 arch/x86/kernel/kexec-bzimage64.c

   331	
   332		if (IS_ENABLED(CONFIG_IMA_KEXEC)) {
   333			/* Setup IMA log buffer state */
   334			setup_ima_state(image, params, params_load_addr,
   335					setup_data_offset);
   336			setup_data_offset += sizeof(struct setup_data) +
   337					     sizeof(struct ima_setup_data);
   338		}
   339	
   340		if (IS_ENABLED(CONFIG_KEXEC_HANDOVER)) {
   341			/* Setup space to store preservation metadata */
   342			setup_kho(image, params, params_load_addr, setup_data_offset);
   343			setup_data_offset += sizeof(struct setup_data) +
 > 344					     sizeof(struct kho_data);
   345		}
   346	
   347		/* Setup RNG seed */
   348		setup_rng_seed(params, params_load_addr, setup_data_offset);
   349	
   350		/* Setup EDD info */
   351		memcpy(params->eddbuf, boot_params.eddbuf,
   352					EDDMAXNR * sizeof(struct edd_info));
   353		params->eddbuf_entries = boot_params.eddbuf_entries;
   354	
   355		memcpy(params->edd_mbr_sig_buffer, boot_params.edd_mbr_sig_buffer,
   356		       EDD_MBR_SIG_MAX * sizeof(unsigned int));
   357	
   358		return ret;
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
