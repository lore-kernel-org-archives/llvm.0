Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219F03C8728;
	Wed, 20 May 2026 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269819; cv=none; b=h5DzyZrtlm8HtCdkrXrKdqyWypjeXO8Wr5gXaPnEUq8YZNPPItilEk52QbUgakjXGi5qxMSXBtCmKMljanb2MwYdQ9pAwyJa0QaJ80543/7Z8Lm2bQpQXSE1PqEUPk+rU+T1zNi7/OCek9olyREKs/5V9z7SAvjoDYHWNGNoT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269819; c=relaxed/simple;
	bh=MKx+Ty10TaoeZJ5q8WkDOwfGzFRcJF9CsGFBUgLYLdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkkan9M9ObTWJoLfW3xhY8FSYfgXAhnBuR4iatV7D8C15jNHCpfTpcMqwpPswyqFCyI3emikW0o4OrDjH8LVJQqQ4P7PlSBjV64Tf75VQSKIEhEEtUXGIH0amqQCvV0QVOq7jqGBoZoTeQk/5NmRlVUbn9KSvPkV9kkbFxfqJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TX/RVl0s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TX/RVl0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779269814; x=1810805814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MKx+Ty10TaoeZJ5q8WkDOwfGzFRcJF9CsGFBUgLYLdg=;
  b=TX/RVl0stWQkNEymj3Za5b/AERonXgxSKIc4fMUTMttIuOPy+GmtVJ9H
   ui32rP2xS9t0dqgKiBoLIx1gIvSncgKAr4gjGA15yQQh1PLKmVmZqtyHf
   IcT1UvcdsAvrvZu7dB63ykv5ISHlCXWqEwFzyB4s3Zj6mW31x01qdrtcG
   ghJcuaMow2S1knCXMbfW/ne9TgaCoGN+F5BcQ0aJ551jIE8pOn0nREhvu
   YNxZnTMxa40F98vf9RGec+yH81mniYjJ8wrPMZgqlCBKjeNNnwmyArlt8
   JU4nEwXkgHCTqa4zhkQw7YfHp7MRcK04uYYKYDaJTsQZSCF/yCPd14ugj
   g==;
X-CSE-ConnectionGUID: 9Mv5ANmVRFKYiAlhSKdkgw==
X-CSE-MsgGUID: E/WqcoAiTh61ix47bKTxiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79310767"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="79310767"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 02:36:53 -0700
X-CSE-ConnectionGUID: ZmIhuF4bRAyagXLFbJ3g+Q==
X-CSE-MsgGUID: j2qBrrkfT1Ou413/Rh0Dww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="239113754"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2026 02:36:51 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPdLf-000000002v7-3LdC;
	Wed, 20 May 2026 09:36:24 +0000
Date: Wed, 20 May 2026 17:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/core: remove extraneous dummy helper functions
Message-ID: <202605201724.StvoCZ6d-lkp@intel.com>
References: <20260519203629.1341667-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519203629.1341667-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.1-rc4]
[also build test ERROR on linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/RDMA-core-remove-extraneous-dummy-helper-functions/20260520-044317
base:   v7.1-rc4
patch link:    https://lore.kernel.org/r/20260519203629.1341667-1-arnd%40kernel.org
patch subject: [PATCH] RDMA/core: remove extraneous dummy helper functions
config: hexagon-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201724.StvoCZ6d-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201724.StvoCZ6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201724.StvoCZ6d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: _ib_copy_validate_udata_in
   >>> referenced by siw_verbs.c:1373 (drivers/infiniband/sw/siw/siw_verbs.c:1373)
   >>>               drivers/infiniband/sw/siw/siw_verbs.o:(siw_reg_user_mr) in archive vmlinux.a
   >>> referenced by siw_verbs.c:1373 (drivers/infiniband/sw/siw/siw_verbs.c:1373)
   >>>               drivers/infiniband/sw/siw/siw_verbs.o:(siw_reg_user_mr) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
