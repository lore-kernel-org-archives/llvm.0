Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA5511718;
	Sat, 16 Mar 2024 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710587268; cv=none; b=A4rlGniTuamUPiQgI3yO3prMvbLCbVc0V76MyBIOjyEcEFVdp7FuxkmS5Oig2i1ozWrfvMyQZ7rLu0X69mdc53UyqJe3TVPg9s1B8AMtUv0iwEvymiyweWLI5TjKCl2eLoM8bfwSy/CEO3Bp5PZc1HQdSv/GBtNQw5HZXR4QZbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710587268; c=relaxed/simple;
	bh=SIbJUOaCuO1muF7CulsKn0AgyH29CGVJfjRrkcHrxvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grLoaf3A4hccGAam2jDeOJI6Y1d3I+H2wyJRVLXMIMQFbstTIONrVZtoaKEHwdf5ZubPeIXmugOU1Kvj2uUD24lcRSQWh+hoJ1hBrYE4r0aiwpjW9CfgXAOhnEuvQ+3zb4hYUX/qv/dA1c9QNEXicqof0SsGs2vKgyb1i4cmII8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGiOu1/L; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGiOu1/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710587267; x=1742123267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SIbJUOaCuO1muF7CulsKn0AgyH29CGVJfjRrkcHrxvU=;
  b=AGiOu1/LsWHUichLt7K19Cq6cK2TBCvKTfHwqhyXbXFXULhn2L3L3vLb
   STPSeaoS4F1VT6hI2QlGjXwZim8tt7cPYHQVYE5TvMauqmkVbSs3r4pDw
   kvisrDrKwMPz087Quwt9kWZhWK/D/5JQkJzXt0n654XC1Bt0jhWxAcGMf
   DYTKDREDyWy9lJFr1kvOaiTK+WTLohTHFa3wbm1rfE+D1mOBddP3PqjRu
   KeHuX5u/XkRio+QkgvsHr9D7L6m0STCwwC9MDvfYxYVHMveLVbv8st98x
   ftpqMfllTgUGMZsARxIJtEmSz16fe2dUkekGHdC3Hl9K4xzz7BjspxY7x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16859704"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="16859704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 04:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="17417979"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2024 04:07:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlRt7-000FLD-0e;
	Sat, 16 Mar 2024 11:07:41 +0000
Date: Sat, 16 Mar 2024 19:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v15 12/21] security: add security_bdev_setintegrity()
 hook
Message-ID: <202403161802.hmWTZ21U-lkp@intel.com>
References: <1710560151-28904-13-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1710560151-28904-13-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master next-20240315]
[cannot apply to device-mapper-dm/for-next lwn/docs-next v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20240316-114235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/1710560151-28904-13-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v15 12/21] security: add security_bdev_setintegrity() hook
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240316/202403161802.hmWTZ21U-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161802.hmWTZ21U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161802.hmWTZ21U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfs/flexfilelayout/flexfilelayout.c:10:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:101:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:9:
   include/linux/security.h:1506:32: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
                                                enum lsm_intgr_type, type,
                                                                     ^
>> include/linux/security.h:1506:30: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
                                                enum lsm_intgr_type, type,
                                                                   ^
   fs/nfs/flexfilelayout/flexfilelayout.c:1230:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err;
               ^
   2 warnings and 1 error generated.
--
   In file included from fs/nfs/flexfilelayout/flexfilelayoutdev.c:10:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:101:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:9:
   include/linux/security.h:1506:32: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
                                                enum lsm_intgr_type, type,
                                                                     ^
>> include/linux/security.h:1506:30: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
                                                enum lsm_intgr_type, type,
                                                                   ^
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:55:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int i, ret = -ENOMEM;
                  ^
   2 warnings and 1 error generated.


vim +1506 include/linux/security.h

  1504	
  1505	static inline int security_bdev_setintegrity(struct block_device *bdev,
> 1506						     enum lsm_intgr_type, type,
  1507						     const void *value, size_t size)
  1508	{
  1509		return 0;
  1510	}
  1511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
