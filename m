Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A6219D07D;
	Fri, 14 Jun 2024 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718387932; cv=none; b=USpiHbWVpr9krboZk8rq4VE67Cf++k2nkeBzSKzvd26KMYl2esPPcoS8WSw107nfRLeSU9g0x2qTKJ/nTWh/Z3TGRKqgx+Tn/boENaOtyvynhmEe7kFeiHKR0u/kosD2PGwLG2jlFG39/vzp4q6eo94ykvOnKDtVwvS8OYv14FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718387932; c=relaxed/simple;
	bh=eChIr1LlxrUP/mAmM/O+lhzcLRO4TtfiN9ixmuqza+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c1dcBzhclwKCHnQNFxzPJgrSFz3QRLO1N2MmBRzL5Ttt56ikZcRzaM7NnDN22Wm0NpCVU1I68IUsitTsD05QFWyIh1Yyf3PVg247/ET6f0LEX8UED1tngoooQ6g0NA2wgsT7+NJ8wmYcSSLms5RNpM4ietbEAVCNZVNTj1MlwN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQb/SynC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQb/SynC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718387929; x=1749923929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eChIr1LlxrUP/mAmM/O+lhzcLRO4TtfiN9ixmuqza+M=;
  b=jQb/SynCheZaC/TcM02kY+Rj12YcUg5icY3RGWSjeNOZpc3v5xiQC+sA
   h0Xr7nfiOIIr3ZbXaLHh3TRDR6ZU1Xr/9fNf9ScJyZCY+8Uu3idGpHiK2
   9WoKpSxBqlqomIarFXgscx7P3J/C/ywAKMooQ1Lq8es8fDUUWYlJ01cd/
   Np82Zqclykgj8GEKUq0HFXNlNkcGbooHZHTuo2iLNWqPFKfy5QkvyA5aO
   Dv4Y3QQghrAGOf2uHo6/1/f5uJl2OFmOyArMJlPx04/Dhy60uw+HRwXXk
   jNiciThWkGupX8kLpkMZMiY7uCIs4q9Nq8nDt8CacYah6Vff6E87PkxFU
   A==;
X-CSE-ConnectionGUID: 41P2aN2jQ76ElVJaSh6Oaw==
X-CSE-MsgGUID: O021WDQHRTiMxytn7EoQbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26705558"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="26705558"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 10:49:15 -0700
X-CSE-ConnectionGUID: ZTA04kCLTYqS+MdOuTuDjQ==
X-CSE-MsgGUID: rDvt6F7LQjGWAVwMuhiGdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="71776365"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jun 2024 10:49:13 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIB31-0001bR-11;
	Fri, 14 Jun 2024 17:49:11 +0000
Date: Sat, 15 Jun 2024 01:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Panis <jpanis@baylibre.com>
Subject: [mediatek:v6.10-next/dts64 53/53] Error:
 arch/arm64/boot/dts/mediatek/mt8188.dtsi:673.32-33 syntax error
Message-ID: <202406150109.433ozpQh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.10-next/dts64
head:   2f950510411a33d98eea28c22d7880eeb48adb61
commit: 2f950510411a33d98eea28c22d7880eeb48adb61 [53/53] arm64: dts: mediatek: mt8188: add default thermal zones
config: arm64-randconfig-004-20240614 (https://download.01.org/0day-ci/archive/20240615/202406150109.433ozpQh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150109.433ozpQh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150109.433ozpQh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8188.dtsi:673.32-33 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
