Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DF617BB17;
	Wed, 29 May 2024 23:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717024228; cv=none; b=syLEQZv4nhKoOSe1esoRm+dY2fc7os3Zm6veo1jquVXdGCZVj1ZyDovTeSucPxYL9k0kh9Fb64I6jAkH4sd6tyixvExxNAjvQG4jp7+McZAEjekfufrtcuvJRyAPVjklml/71ilxcJGg6OeQIMe3h8zaJpLKtroDbzm9J5a7Pfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717024228; c=relaxed/simple;
	bh=vzWcn7Aw091UVdTPFhmX1lM4t/jWNKg7Zc+z6URoDl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU0a/jrCRH2ycqk3qLeLbAPqv7LwLBKWEMgEaj0vUqYemUnwEpmykVsU+K6gkAjLQkvJ2yEQG9C5hcicFn5FC9Fm6AvC7BlcQMyVPwpPerpfRXjphtsffLXqiuj2MDcBLYx7VY87UkzW76y5fDyrkNNbYv4FGrUTF0xBgFJWhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pi0fHrBX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pi0fHrBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717024226; x=1748560226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vzWcn7Aw091UVdTPFhmX1lM4t/jWNKg7Zc+z6URoDl4=;
  b=Pi0fHrBX7+aPAMNZBWhQNeLSCvW+0PdGI5KNX3zdYBz01Bvey6RCMqnt
   sHvOTCQBSe3+fM7wu11d/JMGw1CNE/xTS6qCbFz48T0C4h1avEq+wsL+R
   JWWvb6Sd+CZgbVaMB+qVcT1DR3zCs33JiRdzHPQRNRFMPEeaYMBngC3je
   DFMLgbS02KudVSi/cITN6bicnvggX9NWSMVZDe8BxNFYALRcnw0T966fF
   1quIPhRisD7JX0vpj+IxdiZqlciAA2qX7JNi4iktGWYvK4gGg4IPJtTUv
   +Pj1B1MPObS+2bVdJPXkt53aiEyOsVMdc8g6oWMaNfbH4/AIgGjHB3gXw
   Q==;
X-CSE-ConnectionGUID: OlQo8ChiTFS7wbj+gS3q+Q==
X-CSE-MsgGUID: wkuk6sXJTquA9j83d2EDdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="11763894"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="11763894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 16:10:26 -0700
X-CSE-ConnectionGUID: FT9yY/amRni9wzGldubA2g==
X-CSE-MsgGUID: dsspOyF2TfK9+7eXjWqogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35663200"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 May 2024 16:10:21 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCSR1-000EJ3-0U;
	Wed, 29 May 2024 23:10:19 +0000
Date: Thu, 30 May 2024 07:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Chris Lu <chris.lu@mediatek.com>
Subject: Re: [PATCH v2 3/3] Bluetooth: btusb: mediatek: add MediaTek ISO data
 transmission function
Message-ID: <202405300602.AUh9Yu96-lkp@intel.com>
References: <20240529062946.5655-4-chris.lu@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529062946.5655-4-chris.lu@mediatek.com>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on next-20240529]
[cannot apply to bluetooth/master linus/master v6.10-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-net-add-hci_iso_hdr-function-for-iso-data/20240529-143216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240529062946.5655-4-chris.lu%40mediatek.com
patch subject: [PATCH v2 3/3] Bluetooth: btusb: mediatek: add MediaTek ISO data transmission function
config: i386-randconfig-014-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300602.AUh9Yu96-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300602.AUh9Yu96-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300602.AUh9Yu96-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: btmtk_isopkt_pad
   >>> referenced by btusb.c:2267 (drivers/bluetooth/btusb.c:2267)
   >>>               drivers/bluetooth/btusb.o:(btusb_send_frame) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
