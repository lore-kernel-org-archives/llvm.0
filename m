Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F79F9D6;
	Sun, 15 Dec 2024 23:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734305981; cv=none; b=NuhcWpVjkWEWXmAdAURz/y3YEuC5g8kHCKZN6P7Rm1uRkF9CS5QGO5HxkVrbz5iuiARUoccrKr+J0GDSryJkELC9NQyyu6Eu4sv5UiTrbZFyYXz+BHZNP6BXms2ifIaXXeo/K96XKWljY0e4rw1tyu1pjqBhjn03nWdPVNYSMuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734305981; c=relaxed/simple;
	bh=VmrIpKFLIIwz97cB+vwHnD+yNjdMqIwNZAd8RvwMTaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cSsH0g1wVeYDZIxuQ8ehvyoPVF45htvdLTCG5MdzAgWp3NA2IA8HvO9yztTqMbHhKO27TZxYd75j/RalTX2ailC5IENC334ledZ8FQGUVKXbVa8FNG7ngCAo+uPJQ1LdY7A2XoJN1SknP2rdY1pyMCt8NuQnZD9jdBkriyajQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDtFXw/J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDtFXw/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734305981; x=1765841981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmrIpKFLIIwz97cB+vwHnD+yNjdMqIwNZAd8RvwMTaA=;
  b=fDtFXw/JAmxq3ncDiPgRriBneHurb9HDWHi0Gxd43NOjI3hUwvFUESV4
   CbGIoGF+huV5JmUr4gneT9OtAIPw7GceeEImfE7Rz+bjKNVylAc0ioOMh
   kJGkDhVuMmo2sm+w87Njt8Ik4aFpxC4W8zkD1gVx2wogIJ4pKoC7owvvW
   CpwebKCLrbamhDBtJsaYjoGVhkcIh4tE5dRomYHyylE8NjJWwgD6QVhiI
   JgRozl92dFrkyOJeWoUXUY1nYoeBo1gUUkAV5ScEWZW1no84IzA+GqZxE
   FRvYjhunkdujfLULl9mrrROKqIe9fhASsd/3cno/MQ0NnzbMbnAhlV98N
   A==;
X-CSE-ConnectionGUID: mfZriJJaRjuvR9g3nSHR9w==
X-CSE-MsgGUID: +z0D5u97SUGeJtcOcmX62w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45167184"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45167184"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 15:39:40 -0800
X-CSE-ConnectionGUID: 6Y0o1VO0QJiI4ZqxlshpJg==
X-CSE-MsgGUID: 0SMi0FPESr+uDfJww/Pjsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="97270987"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Dec 2024 15:39:38 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMyD2-000DuI-0p;
	Sun, 15 Dec 2024 23:39:36 +0000
Date: Mon, 16 Dec 2024 07:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_imsic_imp_v2 15/18]
 drivers/irqchip/irq-riscv-imsic-state.c:219:30: error: no member named
 'timer' in 'struct imsic_local_priv'
Message-ID: <202412160744.hqkoC7cI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_imsic_imp_v2
head:   f91932baa72fea7864a1c699072e15e13ef45064
commit: 67f6ccaa232fd93009a9f128691a4459ea86fa39 [15/18] irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector
config: riscv-randconfig-002-20241216 (https://download.01.org/0day-ci/archive/20241216/202412160744.hqkoC7cI-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412160744.hqkoC7cI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412160744.hqkoC7cI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-riscv-imsic-state.c:219:30: error: no member named 'timer' in 'struct imsic_local_priv'
                   if (!timer_pending(&lpriv->timer)) {
                                       ~~~~~  ^
   drivers/irqchip/irq-riscv-imsic-state.c:220:11: error: no member named 'timer' in 'struct imsic_local_priv'
                           lpriv->timer.expires = jiffies + 1;
                           ~~~~~  ^
   drivers/irqchip/irq-riscv-imsic-state.c:221:25: error: no member named 'timer' in 'struct imsic_local_priv'
                           add_timer_on(&lpriv->timer, smp_processor_id());
                                         ~~~~~  ^
   3 errors generated.


vim +219 drivers/irqchip/irq-riscv-imsic-state.c

   208	
   209	void imsic_local_sync_all(bool force_all)
   210	{
   211		struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
   212		unsigned long flags;
   213	
   214		raw_spin_lock_irqsave(&lpriv->lock, flags);
   215	
   216		if (force_all)
   217			bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
   218		if (!__imsic_local_sync(lpriv)) {
 > 219			if (!timer_pending(&lpriv->timer)) {
   220				lpriv->timer.expires = jiffies + 1;
   221				add_timer_on(&lpriv->timer, smp_processor_id());
   222			}
   223		}
   224	
   225		raw_spin_unlock_irqrestore(&lpriv->lock, flags);
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
