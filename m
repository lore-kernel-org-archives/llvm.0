Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A033B6C9;
	Tue, 10 Feb 2026 08:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712835; cv=none; b=V3JWSuN9wLDvfz4tcUepoDg4x5cR1XvpDICHJUqRRLYcNHVNSkEnJD9N1uNR5aLvYWDGKN1vNkpuQgEuSVLxNhw7+nMUCkAJS2f/2w5sE1kZNQoMcSGJl0pp7ysR3CY7vBA73WBiL/uCmo41rpG9vz2T98YNcbs58yqY3VSfPCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712835; c=relaxed/simple;
	bh=cEWD0HKxMC5TFNqsMONA9RsZ0ta5n7ps1wactfIdARQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=akTV2DfWPcFMJgsdzDec/TBKPkkhXA3VXOlOcMvC55bWcwLsRkKxuIZ0+e6Ewmi83k3V88oHbCL/O2lWwprWgzQaQh/M46Y2MWHyJXMo6Ni0x5MJvsTf889MwV68tBYbH78D+8GbZ8QW0BOKIkPUsjI+U2l3i4Ld0hid/FpE/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIBITWTa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIBITWTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770712834; x=1802248834;
  h=date:from:to:cc:subject:message-id;
  bh=cEWD0HKxMC5TFNqsMONA9RsZ0ta5n7ps1wactfIdARQ=;
  b=JIBITWTa6VoWjhk8DwkCCD3CXNNJC+6s/vU9280ifILf4AwR05+YbJCx
   CILXWnZ5pELVbJFZjMSdNdORRZ//ghfjNttOGk2tsARUiREPiIQBuhQ5K
   yLu7PUrQ3WMEcZxH5Ve18eKNYSMtP5cP7dnVk+qbI4IzRAYJJ5O3aNNBL
   pOH7503Ejt//EJYrLc55D8ParTQariBH0ajbaLtVBjzhlELdwA8KLxkX0
   /F7uDjLyEmTteF/79+9edzKbInOfehEHagOoiG3nOmwNstpLP5MHTi6FK
   Cvbc5xUCAuLWQXbduirqoMqlBQyE4Ii1Ly1G06VPlNfyFfyQiXA4kc/Q8
   A==;
X-CSE-ConnectionGUID: 8JsGW5nyRam0HhWgp69gog==
X-CSE-MsgGUID: /Pk0lkgCR261R35Lhibu/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82158557"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82158557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:40:32 -0800
X-CSE-ConnectionGUID: w3oK8nc+QmeyBjgCQzrAxw==
X-CSE-MsgGUID: 3U1//rYLRWSZcBYdfCnhXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211383770"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 00:40:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpjIK-00000000opG-3Jlu;
	Tue, 10 Feb 2026 08:40:28 +0000
Date: Tue, 10 Feb 2026 16:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-slaunch 38/41]
 drivers/firmware/efi/libstub/efistub.h:1243:18: warning: declaration of
 'struct boot_params' will not be visible outside of this function
Message-ID: <202602101625.89LFgfHU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: a64c42672d622dc2867904b9857ef64a890610bd [38/41] x86/efistub: EFI stub DRTM launch support for Secure Launch
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260210/202602101625.89LFgfHU-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101625.89LFgfHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101625.89LFgfHU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/alignedmem.c:6:
>> drivers/firmware/efi/libstub/efistub.h:1243:18: warning: declaration of 'struct boot_params' will not be visible outside of this function [-Wvisibility]
                                  struct boot_params *boot_params,
                                         ^
   drivers/firmware/efi/libstub/efistub.h:1264:47: warning: declaration of 'struct boot_params' will not be visible outside of this function [-Wvisibility]
   efi_status_t efi_secure_launch_prepare(struct boot_params *boot_params,
                                                 ^
   2 warnings generated.
--
   In file included from drivers/firmware/efi/libstub/tpm.c:11:
   include/linux/tpm_eventlog.h:169:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
   In file included from drivers/firmware/efi/libstub/tpm.c:14:
>> drivers/firmware/efi/libstub/efistub.h:1243:18: warning: declaration of 'struct boot_params' will not be visible outside of this function [-Wvisibility]
                                  struct boot_params *boot_params,
                                         ^
   drivers/firmware/efi/libstub/efistub.h:1264:47: warning: declaration of 'struct boot_params' will not be visible outside of this function [-Wvisibility]
   efi_status_t efi_secure_launch_prepare(struct boot_params *boot_params,
                                                 ^
   3 warnings generated.


vim +1243 drivers/firmware/efi/libstub/efistub.h

  1239	
  1240	struct grub_slaunch_protocol {
  1241		efi_status_t
  1242		(__efiapi *set_image)(struct grub_slaunch_protocol *this,
> 1243				       struct boot_params *boot_params,
  1244				       u64 base, u32 header_offset);
  1245	
  1246		efi_status_t
  1247		(__efiapi *launch)(struct grub_slaunch_protocol *this);
  1248	};
  1249	typedef struct grub_slaunch_protocol grub_slaunch_protocol_t;
  1250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
