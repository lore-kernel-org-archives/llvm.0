Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BF4212EE0;
	Fri, 11 Oct 2024 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644656; cv=none; b=ui45tNGVvWhHOEixzcxGf4+a1olcwf3yRiKh3Wn8kQd38/VxHq9JFPX2JhD5/AwOKO0z2wIZ36ZTremaWK5mCTcpoxu6O6ZjA5QXkyF8OpFrFhA4+e2myRPDFHJ4iTLETABZkAlyp2j+keFeU0JkK89z3wyKQT2yfZcoeAob+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644656; c=relaxed/simple;
	bh=AIf2fGrcHVCjwQ9BTzN0E7Ks2RMw0PPWpd2+KhWrpmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HogBVWMIdQTcpwR9wVBKS/+mwTdrnlDRuYM3mjmWloaqp425hGN2AvM6ktQ1CnF4RqUPNRaeTbgQzHY3UaiC8U5bFesEj3AO2xpszHAxt7p285ujueGh16pviFkVZsoVhJ4QJrt7gTQrrvnlo4POwuIzHrrmVy++8MdD2r4EfbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdgERtEX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdgERtEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728644655; x=1760180655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AIf2fGrcHVCjwQ9BTzN0E7Ks2RMw0PPWpd2+KhWrpmg=;
  b=LdgERtEX6WqoVS+VGMVRH5X4R/9K10akoGdCBxwsOBAoH4hibhRYXHvV
   NnEbQrc/VCXg/wnOhF8nqxidBK7tAXkVEQBLbt6KQIZqix90c6VJq+vRI
   BG6uBDG3Uj9Hjgb6nfcg8pNrxHTztZPrBj7AbIrLTlCWm2RaRO+7/35uU
   eLT+DevkRcZzkJv183gjIpLriwZyq8nYSkgHvrDb6P7UoUzBhOcCh+BHl
   TdhwDe7AvYQBo27inSQUGbtxeWoZGB2uLfTcmAWSFQVlqNbslNTr7zK2N
   LKYdJhj9Sy5IS8DZDJZInfTKfAuw01tmdzEmdKuY6rj12oTkVcyfIxAGn
   g==;
X-CSE-ConnectionGUID: TG9/wF6FS3q2HN9QYLWhWw==
X-CSE-MsgGUID: LURmqedFRAmcRffHiZUQqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39169331"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="39169331"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:04:15 -0700
X-CSE-ConnectionGUID: yMaNfXsmQQezzxIjU8dynw==
X-CSE-MsgGUID: XEFYIAzsSKCPLYDNr8MznA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="107732129"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Oct 2024 04:04:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szDRK-000CDB-0C;
	Fri, 11 Oct 2024 11:04:10 +0000
Date: Fri, 11 Oct 2024 19:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, aliceryhl@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, dakr@redhat.com,
	linux-kernel@vger.kernel.org, lyude@redhat.com, airlied@redhat.com,
	miguel.ojeda.sandonis@gmail.com, boqun.feng@gmail.com
Subject: Re: [PATCH 3/3] rust: page: Add page_slice_to_page
Message-ID: <202410111810.hiN1ns3g-lkp@intel.com>
References: <20241007202752.3096472-4-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007202752.3096472-4-abdiel.janulgue@gmail.com>

Hi Abdiel,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abdiel-Janulgue/rust-page-Extend-support-to-vmalloc_to_page/20241008-052805
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20241007202752.3096472-4-abdiel.janulgue%40gmail.com
patch subject: [PATCH 3/3] rust: page: Add page_slice_to_page
config: x86_64-randconfig-014-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111810.hiN1ns3g-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111810.hiN1ns3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111810.hiN1ns3g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::alloc::VVec`
   --> rust/kernel/page.rs:6:32
   |
   6 |     alloc::{AllocError, Flags, VVec, flags::*},
   |                                ^^^^ no `VVec` in `alloc`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
