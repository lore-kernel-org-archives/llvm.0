Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE8AD59;
	Wed, 17 Jul 2024 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721211669; cv=none; b=FuBxToIYWxwv5Vg3pzh4Z2Hn70rnYorKkx7msA+mgNH9V89wOv/aYneKXHdGICGM66MUalB7YgvZA7Xt/bWKndukHDfKsaTX4AHu+IG6mzXcMwl6wFRq9l9F0ko2RAGz3hD+ZBqIasiLSj566H34+0/4irO6OdUKJBn2uuBJEww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721211669; c=relaxed/simple;
	bh=LBOlMVwghqKC8GMqoLC/+pL4yb6+YR9xShmJvsBMFWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDdEgOUEQ4V7BgOFXWuHB3ct6WYXWrPzeThDiuvKEV3RZERElupn6N2dQt2nNOOpqFzuf88SRCZ41zWb9e/Ue98zI/uiO0I64c9Ri1sOfi3x0YRgxcyTbSYytuj6tOgY8ZAYzXpUbMA4qTcWDJpoO5q1vCgMeHrKt2VWVsuJlFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jlh31msv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jlh31msv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721211667; x=1752747667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LBOlMVwghqKC8GMqoLC/+pL4yb6+YR9xShmJvsBMFWs=;
  b=Jlh31msvQfPd7MRJ5oCZ6kMBuzTw6UeNm7XUd1qQ9FvnO0xrO9Mc6fMK
   oNuoPMo+hlC9rIeoSUTyM3Gaw00mMgxylizhbH6vsyx13xLQsRo3FPubM
   z5dGem6ymLQA8XCtS+mM2ItU2AxGNabNSGgatce0IFI4UfaS5t6QlnyIk
   ++7ffUt6qrHb6sAXeVQd7C64ypFRujaE3JDvPVNaJ4BoksVo72yIeAYHu
   ubIeJIuPAJhp/JjkPF8o+iB37PaardhxaL8Zx8fKoQdHnXB0RMgAHGSog
   BABxy0ldgI9ur2avFXCG2pLNKiTsOgIWqEilaC1yKQkEfnyWd5784U70B
   g==;
X-CSE-ConnectionGUID: lV1iVkYvSs6vOMeXhsMJag==
X-CSE-MsgGUID: lEtxA/r9RqKrnqT4UJ5Zug==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44129815"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="44129815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 03:21:06 -0700
X-CSE-ConnectionGUID: SxPUUzNSS/+T70age9xqdg==
X-CSE-MsgGUID: ig6xZ82aRNi15DbONGcCvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50288938"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2024 03:21:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU1mR-000gEh-1v;
	Wed, 17 Jul 2024 10:21:03 +0000
Date: Wed, 17 Jul 2024 18:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 08/13] virtio_net: xsk: bind/unbind xsk for tx
Message-ID: <202407171813.IA5TpEmg-lkp@intel.com>
References: <20240716064628.1950-9-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716064628.1950-9-xuanzhuo@linux.alibaba.com>

Hi Xuan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio_ring-introduce-vring_need_unmap_buffer/20240716-145043
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240716064628.1950-9-xuanzhuo%40linux.alibaba.com
patch subject: [RFC net-next 08/13] virtio_net: xsk: bind/unbind xsk for tx
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240717/202407171813.IA5TpEmg-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407171813.IA5TpEmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407171813.IA5TpEmg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/virtio_net.c:57:37: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct virtio_net_common_hdr' [-Wtentative-definition-incomplete-type]
      57 | static struct virtio_net_common_hdr xsk_hdr;
         |                                     ^
   drivers/net/virtio_net.c:57:15: note: forward declaration of 'struct virtio_net_common_hdr'
      57 | static struct virtio_net_common_hdr xsk_hdr;
         |               ^
   1 warning generated.


vim +57 drivers/net/virtio_net.c

    56	
  > 57	static struct virtio_net_common_hdr xsk_hdr;
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
