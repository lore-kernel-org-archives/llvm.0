Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0224A069;
	Tue,  4 Nov 2025 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762270353; cv=none; b=ffzvXw7qyUTgcyMvwLdzHeO6nCrarJNabFWByMzBtXoxhZYWPCZkQN87UkqFMLX7Ae+9NYX3UrPp5rCewoXFzxvEebBwHUlZWPlOxKKy9GN6DPVPrMaLD3MI+keOamSGKf9oSuvCPetGyuW93dT41dZeZXQ8HaWmGm7W6M7EUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762270353; c=relaxed/simple;
	bh=s/kB+iSurW7zoiDDtbH95+4Fk8pV2slaHdvSG1EPNCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3gJ5nTR7p7D8JReBrpiSbgo/MbOVqlcrLXrpQvbuVGI9vtGw+1a1MPG1NgFXzqiVKWpX3BLoQ7gploFwFUnmWkklf0OOIbtyEOjN2/QcLey6So68QNR6zc07zC0ME5v8JAzjqdc119gXzcnSR+EMJt21Bwx767QuRnYvrO3dmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0/qPKtf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0/qPKtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762270349; x=1793806349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/kB+iSurW7zoiDDtbH95+4Fk8pV2slaHdvSG1EPNCE=;
  b=G0/qPKtfKATck/Eh2s4QirZByp4XjCm09Qb7XiFw6szuVC8Prlhsbfnh
   k+kS8kqQeuGOQFla9yJWb72Bpw9uBX+2LUo1s/HrB4mZCFHrkiuRk9v7G
   Lx2bHuV6q2l3EO7VRmoy7oshibrZu6eXf6Mok27TL2YS925+RCfFV9tlQ
   yryIfY6frOtI0WF+X2Qh+8UwRBvZchG1gcUY5ea6TnEjd2qiXWyz09hbb
   8XDpYt9s4n8vezUkjw/bGS54MDfihwipGFwZ9ldJEAeSC+nFQNJGgXDHg
   BM5f4HdXl3crlvPjekfwBs3rs8mRcTmb12pBaz7t7nDRI4/RYKkrDBPt2
   A==;
X-CSE-ConnectionGUID: orw/cFF1RFCHejysgDMmwg==
X-CSE-MsgGUID: Eb4OBlS6Ri6oqRGKm1IzOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63572210"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="63572210"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 07:32:27 -0800
X-CSE-ConnectionGUID: pBo2mrM5T42UlzXUvw/0yQ==
X-CSE-MsgGUID: j+rctOb1RECHOKpGmNsLGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="187339081"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2025 07:32:24 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGJ0W-000RXo-0f;
	Tue, 04 Nov 2025 15:31:56 +0000
Date: Tue, 4 Nov 2025 23:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Subject: Re: [PATCH v1 1/3] spi: microchip: rename driver file and internal
 identifiers
Message-ID: <202511042322.bDgHrd9d-lkp@intel.com>
References: <20251103160515.412706-2-prajna.rajendrakumar@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103160515.412706-2-prajna.rajendrakumar@microchip.com>

Hi Prajna,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on linus/master v6.18-rc4 next-20251104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prajna-Rajendra-Kumar/spi-microchip-rename-driver-file-and-internal-identifiers/20251104-001544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20251103160515.412706-2-prajna.rajendrakumar%40microchip.com
patch subject: [PATCH v1 1/3] spi: microchip: rename driver file and internal identifiers
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251104/202511042322.bDgHrd9d-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042322.bDgHrd9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511042322.bDgHrd9d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-mpfs.c:620:3: error: field designator 'remove_new' does not refer to any field in type 'struct platform_driver'
     620 |         .remove_new = mpfs_spi_remove,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +620 drivers/spi/spi-mpfs.c

   612	
   613	static struct platform_driver mpfs_spi_driver = {
   614		.probe = mpfs_spi_probe,
   615		.driver = {
   616			.name = "microchip-spi",
   617			.pm = MICROCHIP_SPI_PM_OPS,
   618			.of_match_table = of_match_ptr(mpfs_spi_dt_ids),
   619		},
 > 620		.remove_new = mpfs_spi_remove,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
