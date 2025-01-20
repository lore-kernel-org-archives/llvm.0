Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945901EE7A7;
	Mon, 20 Jan 2025 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737397664; cv=none; b=V3obEDaTTyNJzl82HitarZLQX6IvjiC1kDCK9GSRbbR1pkfDGgag3BJHMbDWglBNTPvQpV2FKijR4VeFXTRI4Dw1B2VCC0O77WsR60YJEmaWuRknP1QJ9M112KOUY8S9s3yoO194SJmel4bJpglnsZp0jIflhh5l7t9GPRbbRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737397664; c=relaxed/simple;
	bh=dSRMbwEaYmsiqiKB0U7ewwV+0xKx65n0TKy+cSmTEUI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jXZROkBhb77fc9zrwtPL1M9NZ692t93ZT4DxvTAm1iE/axnYjHmEZ9zhFTvjyabr9VhxfzHOt7qdlsdmRx00rzEWKMj/Hm6friTbHY7Xzryn5Q8dMxxU0UOW3BegdcRuuPnzaYsRHtLXZsP/L4u2IUyB8cTYm05XtvZuToFB6OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKuQGfep; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKuQGfep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737397661; x=1768933661;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dSRMbwEaYmsiqiKB0U7ewwV+0xKx65n0TKy+cSmTEUI=;
  b=WKuQGfepzli0PXJsZsYHHUndmDnHIoXLLz0GwsduQKTCyqecvHRHn2Rb
   yQaze1M56AY+58az7KX0j0LqimhX5hGp5r1JtNwpvdtowEQAf79mjkxZf
   Io9v/5M7S31fABYcAx2TyhFZuET/mL1BFSdIMCSzCEmcFFJlF6nNmQz3n
   VtZwBPaOdOIMAbKZ2TvpAANlh1015VeriM6Qq7lCeHaYjh4zQi2tyM10D
   PUP6FThQifYvm4S5Stw+aehIDbRMUEYLjksosBd11+Jnvm2oGHoMCkVyG
   fbwFiZ0qeKwkOlVjz4XqLF0D4cmh7p5yRc1CE0JkBwX+XyQdu/c16HXd9
   g==;
X-CSE-ConnectionGUID: G0tp7ay0RJqLIXeVFE3JsQ==
X-CSE-MsgGUID: i34LcyrMRZWREOcyZ2AEjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="25404025"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="25404025"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 10:27:40 -0800
X-CSE-ConnectionGUID: uEsIJ+iORPe/ne0mf4/krg==
X-CSE-MsgGUID: EZs84cccSWO0o3FA5ZpGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137481944"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jan 2025 10:27:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZwUs-000Wrj-0n;
	Mon, 20 Jan 2025 18:27:38 +0000
Date: Tue, 21 Jan 2025 02:27:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 8818/10024] ld.lld: error: vmlinux.o:(function
 xiic_clear_rx_fifo: .text.xiic_clear_rx_fifo+0x16): relocation R_RISCV_HI20
 out of range: 529106 is not in [-524288, 524287]; references 'jiffies'
Message-ID: <202501210229.bcmK5upJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: 65a64ecb33575f2b1508a02197b8185c3a57311a [8818/10024] Merge branch 'for-6.14/block' into for-next
config: riscv-randconfig-002-20250120 (https://download.01.org/0day-ci/archive/20250121/202501210229.bcmK5upJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210229.bcmK5upJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210229.bcmK5upJ-lkp@intel.com/

Note: the linux-next/master HEAD 1573c8d4cb206a2d1454ff711e79f8df2353290b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(function xiic_clear_rx_fifo: .text.xiic_clear_rx_fifo+0x16): relocation R_RISCV_HI20 out of range: 529106 is not in [-524288, 524287]; references 'jiffies'
   >>> referenced by i2c-xiic.c:323 (drivers/i2c/busses/i2c-xiic.c:323)
   >>> defined in ./arch/riscv/kernel/vmlinux.lds:4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
