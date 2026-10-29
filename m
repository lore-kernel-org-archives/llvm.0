Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257259;
	b=aN3fGksoApZUeY2qtWdEeritTSfEngcaEJJPG5NPvTZNIgdTw1qxPqTYBS6FaXJVm64+
	 XITmksYTFdLMOv8zyoDmcsvsUsEPky5m8SPfhtLvLkkT2Fl8XVsbrvNMnEYsVNOlVjB++
	 wajFT2TaFiKtQAHT6scdkRXQVx3jwtVmXcbbpNaIoG8sh0piove6J6ugXeXetpCuL5edr
	 vJazJ98xYsBh8/wv611nBWar9Uv9XtB03XziPgrwBH5niumB8RPCukznXSaaO950vI0ne
	 MXwGZpFLA0yMJtmDWDyo4q9pxxwtIrEDrWzT2sGy1shOTWeV7vb41DontP+9gUFJVvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257259;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ZuN5MwAENUFjH9htip5mrQQ6tsKd1OWYru7lWDeA8gE=;
	b=jYmyHMl4Z3Vz3ndmHnh4+E/sj0ZvbAsoeJHUb4MDC9Lfx3PhJNwMgBSOp6IJ0sUKInyS
	 iHIPHzLZegjsqPhRD6QX3W8Q9N1P+DPg3e9jrPYSCDCxw8XCdZFwRg0lABGR5pPBUeXN7
	 tHBjYL0aFeSAPo0Xr7vRPugaTgKXQRGUo8S6L29HgpD7cQxCFCH7RK4TFlkMYR8LAXggu
	 pBXWzeztf//ujcmTyKMZhwkWcf57HKf7MYOm/SJw5nb/SGSx45lZ6nRAMVALL+2iyVMPa
	 mEUEGv+gHB7hMcocSg24nsHp8HdkMj3B3f4vYTKiYktQq8iOpBJkuunv8XEayT2/AQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H9eCC52t;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AC9606A31C;
	Thu, 29 Oct 2026 07:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9AC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H9eCC52t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793257258; x=1824793258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RsYIa3SqFjpZb1UpYbTUmweoNbFTAIhFfW6r4GISlO4=;
  b=H9eCC52t7MSNlgANPVWjfqnqTp4NwRo7GO09RErj5ZQfepDc40YdRXi1
   MuPfdxIrSyfdshyqn+JnM99yb2G9COG2T/u44DpOh1Tv+Oiyodmuclq9Y
   aum4n7cDBJftxRTud9YXt6WfsHzvlCaTlffoYdat0ZbnEYKvjvaWZN4j1
   m3ac/LSWKf5DKpoyn41Kly791nP0mdzoMPs1eR4740Ld1O4El8Ye5ay/G
   YUUqlHs39W+YWI0JykmFTXvSHD/46LQIVuu/QBsWAQB1iP1QeXa2ZR7Qm
   UifVcaBV1jNHJ+k4M+fjK4dbsq/xBbZQEtg1kG6Llng94qXg4APY/jB4P
   A==;
X-CSE-ConnectionGUID: nrnk5IBnT66Q620XISmhQA==
X-CSE-MsgGUID: 5Dr+crpTRgKS1Jg498Ru3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1880188"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1880188"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 00:00:57 -0700
X-CSE-ConnectionGUID: Qzg3tDeBSbqe5NpeZV+b0g==
X-CSE-MsgGUID: VdkRB7fnTnmInUtVd2+VTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5584505"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 00:00:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMK84-00000000ZiS-1BTl;
	Thu, 29 Oct 2026 07:00:52 +0000
Date: Thu, 29 Oct 2026 15:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: wuqianhai@loongson.cn, bhelgaas@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	wuqianhai <wuqianhai@loongson.cn>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, tzimmermann@suse.de,
	javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] PCI/VGA: Fix boot device detection after framebuffer
 relocation
Message-ID: <202610291418.tlsEIHSu-lkp@intel.com>
References: <20261028094634.766723-1-wuqianhai@loongson.cn>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028094634.766723-1-wuqianhai@loongson.cn>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.3 next-20261028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wuqianhai-loongson-cn/PCI-VGA-Fix-boot-device-detection-after-framebuffer-relocation/20261028-174634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261028094634.766723-1-wuqianhai%40loongson.cn
patch subject: [PATCH] PCI/VGA: Fix boot device detection after framebuffer relocation
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20261029/202610291418.tlsEIHSu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291418.tlsEIHSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291418.tlsEIHSu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: screen_info_apply_fixups
   >>> referenced by vgaarb.c
   >>>               drivers/pci/vgaarb.o:(vga_arb_device_init) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
