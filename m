Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793448435;
	b=WrMgm4885GRA1qtIdOIBJfQ+inkqeB24OPb5otxdsGsYBow34sRyxyLbM1ikCuwHYGh/
	 yYXfLYI/b0xd+g/doJWF1YDUKRL6Zm9+BNfJp3z2YaMJfsBrbDC1+8sOH4IYnTsi1V8dM
	 aWF/HBuLN7n/qDHhkezsOXOoedP7GY9dH3qD0arxWILbxRwQ9VUMkwnRlVckgE+Ljgzzk
	 eSqWFOJ7XJkhSE5p4ygGFM+PBjGr9wmqQV6HjQT6akkCHhM3wIPoN7Sh2GXu5hVqKlByE
	 nZSVNxZG9c3GWOISQVZWJwNQUWoPLGFO3SWA3WYefirIttyqTuitHT7hQmHKcPG5MuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448435;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+l1RRgq+C9AayOmwqqNeY+nzGv5HKvLpPKk8tw/PkoQ=;
	b=nLp34cnyTL0ulKRA0VT/YSkdv1o+7cqZsx42PUahUKUDR94b7id9LGxBX3POc06tlxpd
	 77F8Q9DDjYYv3J5/eu41n/49CEMmDa6mOOmYlMWb9u4G9AC08MMMLJslL0TlHDQAmZoqS
	 g5VLeWD1KMQ/FVGNEVmFX7sgDQyox7G2K3Hu7CtWsKu3NkYxhaF1x4mNTxczN5m9XW3iG
	 YokTpOaNLo8sQt3r1vwOeImE1xWwUbwKQi4LBoxsG+EuaO770j5qosG1JTEclQfbMMUW2
	 J9zXWBrL9O8b37ajkLeTvZ3A062DFB/cU5NkisFkKgH3HA5e7icRKM4sSKTrpNFB/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k5pQxOSG;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D53606A31D;
	Sat, 31 Oct 2026 12:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D53606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k5pQxOSG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793448434; x=1824984434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2NOLA5XLr0F+d2rcxhw0zW65IDgq0qHt9PrC2igHtR4=;
  b=k5pQxOSG7azQND/AcZuzs3XsntWJI61kUbDswhhMOGyutMUU6dciBlII
   MkCVebYpkno1KGjFYuJVi2mFUgHC9UdkRbTMIiFsvXVxCsCLffkCD2rjW
   ljkYQE2SXqNxbncc0HEWXT/DgKEbBAK1ERzMdBweU3HStxTd3KrXEDLeJ
   fXZMb5vwRji6EMsjS1LgwuNaxxmI4UvPxIV9wlU32SOILkn+rQTa2mMRy
   fCRcXGXmbj0o4MB+rtlcStzheZAqHw4Pe8ehaoiA3c1YlPRTEsL58qkly
   GXqX8lKlp2rGQQCtkr2EAiF/i6coMoPJqpIAoWn6lKhNPWY7Urx0NPgzu
   w==;
X-CSE-ConnectionGUID: 4b5p85oKR/6E16lXjWkluA==
X-CSE-MsgGUID: innpXHaySayPPcCMsOVeyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2111056"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2111056"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 05:07:13 -0700
X-CSE-ConnectionGUID: aRmGSsk1R1ugqt8b3FW5xQ==
X-CSE-MsgGUID: IYxRFdnZT1CpmNC+dmjNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="7493584"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 31 Oct 2026 05:07:09 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN7rV-00000000coK-1izy;
	Sat, 31 Oct 2026 12:07:05 +0000
Date: Sat, 31 Oct 2026 20:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jgg@ziepe.ca,
	alex@shazbot.org, pbonzini@redhat.com, seanjc@google.com,
	bhelgaas@google.com, jjohnson@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	johannes@sipsolutions.net, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, vkuznets@redhat.com,
	kevin.tian@intel.com, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Message-ID: <202610311919.NWIUCtPb-lkp@intel.com>
References: <20261029163713.1366077-3-jtornosm@redhat.com>
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
In-Reply-To: <20261029163713.1366077-3-jtornosm@redhat.com>

Hi Jose,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master next-20261030]
[cannot apply to kvm/queue kvm/next ath/ath-next kvm/linux-next v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jose-Ignacio-Tornos-Martinez/vfio-add-helper-to-find-PCI-device-by-vendor-device-ID/20261029-173706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261029163713.1366077-3-jtornosm%40redhat.com
patch subject: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
config: x86_64-randconfig-1011-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311919.NWIUCtPb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311919.NWIUCtPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311919.NWIUCtPb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vfio_file_find_pci_device
   >>> referenced by vfio.c:405 (arch/x86/kvm/../../../virt/kvm/vfio.c:405)
   >>>               vmlinux.o:(kvm_vfio_pci_msi_alloc)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
