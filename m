Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0066F408637;
	Thu, 11 Jun 2026 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781191139; cv=none; b=lBuuwXbygZZxG45RWRAWt4544yRE7Fi0rDrBSY5A/vw4oZTmLbY6F0jKHQN63rwzxH+ZkK4JNp8O1OY7VypVhzoa6Kmq9rh7xsG9nfSDjj90GpAjkICKLr4memtlCVOuDdfKWtBlhV8gOZnOd2AMNU3Usg58buSb1caDQ4TMuoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781191139; c=relaxed/simple;
	bh=DN0B0za8v+kiPRPL9bCEEB1MG1wZscC2VrLNbxDC20A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jNeVJYQIb2S3yWG7wL6m/www2Mq8eqNVZWdOAOtNNPiba85jtqPpMFjLPHjbV0NnIz+NZJRZFW8EZkm6FqGIDvY4Heub396NAay/E0Vqjm6YoiEBXi3b7JhoeZhZ+WdPqux8Iy/UHSazYzNpsIzmr7rOm6ppuBl81CVggmHWdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAlKpYx6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAlKpYx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781191139; x=1812727139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DN0B0za8v+kiPRPL9bCEEB1MG1wZscC2VrLNbxDC20A=;
  b=KAlKpYx6PsTVfpkMtKijcApkcC5YR31SdVGeXwOYcNyEBq589wvg7D/v
   s69MDjNj6SCjOlmGc83P/K3TMMssu1WxUCyRXCcQqCgBJL+CB4dekxD5o
   4UAzhfCeL72mscNrpTKbWAD+i/GgfWt0bmQ01lkrlLMzceIe0Hf2eOy/P
   bfm3ye+LTsLy074lyCllIHnlMAW/xsqZ1LyrNVNQQ9T2vgiNO8ESPu23D
   1FJbbafb0goHqQlZ7g1rpkO8VSLAzQVLrjauocRqz3CvaVQ29WfA92KV5
   VjR/JZSrHJBLMtlGLCgHowvsKmzCEiC51MzTMsL0jAikBiYdG/fwVdqWM
   A==;
X-CSE-ConnectionGUID: Q2cJDqaRQvC58SwIV9LpeQ==
X-CSE-MsgGUID: lj3uvVrrSamlYm0fqgZeow==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85846835"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="85846835"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:18:56 -0700
X-CSE-ConnectionGUID: G9aZmjN4QJuI36RU1IX2qQ==
X-CSE-MsgGUID: Ih4afP4oRgCsCTQ9nGL3Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246385758"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Jun 2026 08:18:54 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXhBD-0000000042l-0AtZ;
	Thu, 11 Jun 2026 15:18:51 +0000
Date: Thu, 11 Jun 2026 17:18:27 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micha=C5=82?= Grzelak" <michal.grzelak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_bios.c:3899:20: warning:
 variable 'vspeo' is uninitialized when used here
Message-ID: <202606111734.HRShsb0i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Micha-Grzelak/drm-i915-bios-search-for-VBT-57-by-default/20260609-035533
head:   37e5f3711f75121bd6a54baa6a92299c51fc313c
commit: 703adad1fcf91efe93f2e1bf885dd23d33cc642c drm/i915: override Snps's VS/PE when requested
date:   3 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260611/202606111734.HRShsb0i-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111734.HRShsb0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111734.HRShsb0i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_bios.c:3899:20: warning: variable 'vspeo' is uninitialized when used here [-Wuninitialized]
    3899 |         entries = (void *)vspeo->entries;
         |                           ^~~~~
   drivers/gpu/drm/i915/display/intel_bios.c:3891:35: note: initialize the variable 'vspeo' to silence this warning
    3891 |         struct intel_ddi_buf_trans *vspeo;
         |                                          ^
         |                                           = NULL
   1 warning generated.


vim +/vspeo +3899 drivers/gpu/drm/i915/display/intel_bios.c

  3883	
  3884	const struct intel_ddi_buf_trans *
  3885	intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
  3886				 bool has_dp, bool is_uhbr)
  3887	{
  3888		struct intel_display *display;
  3889		union intel_ddi_buf_trans_entry *entries;
  3890		int num_columns, num_rows, level, idx;
  3891		struct intel_ddi_buf_trans *vspeo;
  3892		const u32 *tables;
  3893		size_t offset = 0;
  3894	
  3895		if (!validate_vspeo(devdata, has_dp))
  3896			return NULL;
  3897	
  3898		display = devdata->display;
> 3899		entries = (void *)vspeo->entries;
  3900		tables = display->vbt.vspeo.tables;
  3901		num_columns = display->vbt.vspeo.num_columns;
  3902		num_rows = display->vbt.vspeo.num_rows;
  3903		idx = is_uhbr ? 5 : 4;
  3904	
  3905		offset += idx * num_rows * num_columns;
  3906	
  3907		for (level = 0; level < num_rows; level++) {
  3908			u32 vswing = tables[offset];
  3909			u32 pre_cursor = tables[offset + 1];
  3910			u32 post_cursor = tables[offset + 2];
  3911	
  3912			entries[level].snps.vswing = vswing;
  3913			entries[level].snps.pre_cursor = pre_cursor;
  3914			entries[level].snps.post_cursor = post_cursor;
  3915	
  3916			offset += num_columns;
  3917		}
  3918	
  3919		return vspeo;
  3920	}
  3921	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
