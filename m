Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB9396570;
	Thu, 12 Mar 2026 04:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773289301; cv=none; b=ZcbhdR9uymD5+MbGI1tLdLmKQMJ7rirOl8H+vQCUN30+xAyZESCehtceve72HQ1Y7tFsWWzofNSIhjlqdcy4GFTjp/7C+SsT8Bei2+MQVIeXPdGwrvVee8o8A7Nc7Tn9FOD4iV5iGP65jmWEqQ+Zuat4vilaG/fk5jYQgb8xFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773289301; c=relaxed/simple;
	bh=7bD8IEomgLkpBjekMzW1r7IdMHdkv+QsIfsDdwgT6Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inwrqviRqmUYvQMlQgITyg6WMzZQFCM0BhOooTyPFQF1uRMzWYvcm6FgptVsWHKEJdUJIT+/0U/2V7zN7OYkplZGV4AmiQFFBsIeXdVFNCvJRHBTn3YUs8t/k3Y4HVVrtg5/L68ggBOQRUoCzwFRrMXjD4QS3vM21WpMCuLNPY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnIzO1eU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnIzO1eU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773289300; x=1804825300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7bD8IEomgLkpBjekMzW1r7IdMHdkv+QsIfsDdwgT6Mo=;
  b=EnIzO1eU53vWoS3QK5yswGinATwGhaBJlKnMx9equP+VCnV/yIDCNZGn
   NNMOrN+4zTcwfROzM8xH8kuHkHKc411t1KJ5iAZZaGWzwELt9+Gc0uJvV
   ZxQgfy54bQzmmokFNvqinE2/06ZHT9g8NEfY4+xk3MqDa1v7PF3bcDcbp
   FrYGKDmJPs4SQiVI1Zf9YaDu1BOWkHSWspJpAU6U6eL2NMTli1Lbl3b4C
   bYLhitY4UOA5M59OaTWfDibRbkyzm/uIu3nyjdzmloW/x5fdekZTZcang
   +UbOAxwZn9AU6EGquHQaYIrF70L913uJOqtauQ6+HTzBgg26H4LNg1els
   w==;
X-CSE-ConnectionGUID: zse3EUfhSEuHwN9wlA2lfg==
X-CSE-MsgGUID: yMafNy9JRwuNKuW3vUReIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74562528"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="74562528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:21:38 -0700
X-CSE-ConnectionGUID: W0MSw16FRyC1s0N38dWxbg==
X-CSE-MsgGUID: q4mLhQcPRhWf4DVFpQI/eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="218131647"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Mar 2026 21:21:33 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XYA-0000000024N-2uQ2;
	Thu, 12 Mar 2026 04:21:30 +0000
Date: Thu, 12 Mar 2026 12:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <technoboy85@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] e1000e: add basic XDP support
Message-ID: <202603121251.DVGQwVSr-lkp@intel.com>
References: <20260311191437.3581-2-teknoraver@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311191437.3581-2-teknoraver@meta.com>

Hi Matteo,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Matteo-Croce/e1000e-add-basic-XDP-support/20260312-032318
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260311191437.3581-2-teknoraver%40meta.com
patch subject: [PATCH net-next 1/2] e1000e: add basic XDP support
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260312/202603121251.DVGQwVSr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121251.DVGQwVSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121251.DVGQwVSr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: page_pool_create
   >>> referenced by netdev.c
   >>>               drivers/net/ethernet/intel/e1000e/netdev.o:(e1000e_setup_rx_resources) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: page_pool_alloc_pages
   >>> referenced by netdev.c
   >>>               drivers/net/ethernet/intel/e1000e/netdev.o:(e1000_alloc_rx_buffers_xdp) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
