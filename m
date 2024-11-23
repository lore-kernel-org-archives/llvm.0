Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B912018C932;
	Sat, 23 Nov 2024 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732359458; cv=none; b=oNKe9jENm/rigYUZa+WUvzvBlUzp7MkPFqaScHm+wxQCQ9JWOp4Ni0spx5G4jnrGfx4EdkUzvhdXzyicg/Kz86L5nxtPAPo87f60f0hhC7LMjxnioyPbimBxHILWzJprpYpo/WiIYLVQukoA3wYD/fjTAyRGDYeNNzjVfi6xKy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732359458; c=relaxed/simple;
	bh=MLNosuv8mhtr+GNnMJgsW8nTQ1F0oEMxCH1BcX+i0b8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OHnnRBOHkhz+uItmzSaOH0iicFc69hW42zxhYR1w8irA9RohVVoYEfL5h9WoQ/pjm+aryCDfcMlhPGFRGFArhSjrhl3PcfMWbWs/gjglNEJxggwAGR7jxoJrLghInKaGggNd4USFpelvqEVMYcZSkE6Iyj8BOYF3gkTi/JU6VnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oARJ4jkU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oARJ4jkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732359457; x=1763895457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MLNosuv8mhtr+GNnMJgsW8nTQ1F0oEMxCH1BcX+i0b8=;
  b=oARJ4jkUDthPrvoJPRySg6Q7uSjTuKWwcgwcB73q90lQMEAVc8ga7Bue
   3KeM6pt3i4/IcAY4JfyhsIKsQ2Ne6QxM3WnSQNOszW2M98Ro4+paEJSoB
   ct2TvOkPMCJVCTRy1cAqiYn3IlOeOo/GVzImQ8rQLBQ4RibsCmrq5WcgQ
   Y2WG45u4Xl3bjDYCKTYGHn0RlLcqXgPfZcbu+54F5AMN6VlbJn7ciZzcr
   n3aCtm/TRL/XNdMoiNzRo1Y60oRgo1xvPbO8m0j2MYqaRoslcNUQCMmQQ
   YJ68DyIdX3mtt1Bk+YX3z3bMDBE52rngqk/eB+G+SrBPrunueR/X6/LbO
   Q==;
X-CSE-ConnectionGUID: Gffw4npBT/G6aoUR5bKoNQ==
X-CSE-MsgGUID: La6erTbUSbmJz3BOcUcBmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32636245"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="32636245"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 02:57:36 -0800
X-CSE-ConnectionGUID: lqw87e/eRuadoxxfjA3A1A==
X-CSE-MsgGUID: x986CjWkSZy36SoO5R3UnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="91228966"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Nov 2024 02:57:35 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEnpU-0004a5-2F;
	Sat, 23 Nov 2024 10:57:32 +0000
Date: Sat, 23 Nov 2024 18:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/190-rust 123/169] error[E0308]: arguments to this
 function are incorrect
Message-ID: <202411231809.pyWJLzf2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/190-rust
head:   68a53019e107ce663269246902815de4cfdc7eb8
commit: 0a3c09b05d84448d10cadf0c61e49efcae8d6f44 [123/169] fixup! rust: io_pgtable: Add io_pgtable abstraction
config: um-randconfig-001-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231809.pyWJLzf2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231809.pyWJLzf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231809.pyWJLzf2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: arguments to this function are incorrect
   --> rust/kernel/io_pgtable.rs:162:13
   |
   162 |             (*self.inner_mut().ops).map_pages.unwrap()(
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   163 |                 self.inner_mut().ops,
   164 |                 iova as u64,
   |                 ----------- expected `u32`, found `u64`
   165 |                 paddr as u64,
   |                 ------------ expected `u32`, found `u64`
   |
   help: you can convert a `u64` to a `u32` and panic if the converted value doesn't fit
   |
   164 |                 (iova as u64).try_into().unwrap(),
   |                 +           +++++++++++++++++++++
   help: you can convert a `u64` to a `u32` and panic if the converted value doesn't fit
   |
   165 |                 (paddr as u64).try_into().unwrap(),
   |                 +            +++++++++++++++++++++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
