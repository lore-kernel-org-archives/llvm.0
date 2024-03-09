Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5274594A;
	Sat,  9 Mar 2024 21:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710019604; cv=none; b=NQXrxfxhGYhCsxqtNTZu1DqeH6MGP2hptmDLI0dlcQLVMt4+sH32Ex26Rzy4tGe4m47vAelHdlVbN4h9u4es8T75yAiNRsxVv6CXeqmGPoA4kGDLVri10zKMkloyOwkesNUJBurxGkw0qVY2xZzh4+K0bpejtDzyTTaI3tAZ5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710019604; c=relaxed/simple;
	bh=Z/zz0OEUdHFBRzbOx1LZ8k8idWDRPBZt6kXIIFAnwPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LScCqD/MbT8bX62pF9oQVtyq2IwqtxGcCl16uiSR/vfskZTq1aD2IeJzxLSys1EhrbLEPnXbjaX0AbLHHbT9clLq4XqjB+FkQzIqfDUV9y0ksgbEWf7XevAoKNRoPOjeGBbXTVbrVUjOA/eLUS0uMzNQUzMlMgD3ejjJvbIvrxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4kHHEYJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4kHHEYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710019602; x=1741555602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/zz0OEUdHFBRzbOx1LZ8k8idWDRPBZt6kXIIFAnwPk=;
  b=E4kHHEYJTzPjmYPoK4OlIArGUhp6jXFlocfxsnW/5sbSSoxhaPVg7Kig
   zU9X6RjDndR3gDufIx0EDloy4yz8U4BzEfPl7CO1Id/2wuW4VCmyu4KEE
   iWNJXZA6FF0mQzNjbN827WVOSaiVJHISZ2CoTM/oZUv02wULRgSO7FdBJ
   Ivv1OCUIA2DoDCJjfXG1wW+FzCQHw4PNWoziaCkXFn3Uh2CJKCFXCylOD
   GF9gPGWQPgFAEXU9cnKrlN/bg0Qg8/F4i1fpeAKASaArk8HzD6w5MYFYv
   mCVwSnQlCDI/e9Y9FoxIBeyT3P4TDp+65iXBl7MsSAdvZa0qkmWN9YLrU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="22178562"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="22178562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 13:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="10702524"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Mar 2024 13:26:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj4DG-0007fD-17;
	Sat, 09 Mar 2024 21:26:38 +0000
Date: Sun, 10 Mar 2024 05:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 49/62] include/net/libeth/xdp.h:36:15:
 error: static assertion failed due to requirement '!(sizeof(struct
 xdp_buff_xsk) % __alignof(struct libeth_xdp_buff))': !(sizeof(struct
 xdp_buff_xsk) % __alignof__(struct libeth_xdp_buff))
Message-ID: <202403100511.4xsZI0aX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   f896c293302a9ec5710485e2bff89b49bb4a77d2
commit: 3161fd810043b6d1e6e65c6b2702230c99f37f6f [49/62] libie: add a couple of XDP helpers
config: i386-randconfig-003-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100511.4xsZI0aX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100511.4xsZI0aX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100511.4xsZI0aX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/libeth/tx.c:4:
>> include/net/libeth/xdp.h:36:15: error: static assertion failed due to requirement '!(sizeof(struct xdp_buff_xsk) % __alignof(struct libeth_xdp_buff))': !(sizeof(struct xdp_buff_xsk) % __alignof__(struct libeth_xdp_buff))
      36 | static_assert(!(sizeof(struct xdp_buff_xsk) %
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      37 |                 __alignof__(struct libeth_xdp_buff)));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +36 include/net/libeth/xdp.h

    22	
    23	struct libeth_xdp_buff {
    24		union {
    25			struct xdp_buff		base;
    26			void			*data;
    27		};
    28	
    29		const void			*desc;
    30		u8				priv[];
    31	} __aligned_largest;
    32	static_assert(offsetof(struct libeth_xdp_buff, data) ==
    33		      offsetof(struct xdp_buff_xsk, xdp.data));
    34	static_assert(offsetof(struct libeth_xdp_buff, desc) ==
    35		      offsetof(struct xdp_buff_xsk, cb));
  > 36	static_assert(!(sizeof(struct xdp_buff_xsk) %
    37			__alignof__(struct libeth_xdp_buff)));
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
