Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D6327442;
	Sun, 12 Oct 2025 01:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760233139; cv=none; b=eCkVjGaKXjC01ACE40uh7Hy4xCkt2PAfCIUCCh6Gt1GhZ1017Dcqx++jB3HhcRXlGn/Cr8l6nP3g0rwJzTjm4Gnly26GrxcRYq/SxReHAYp8q0BgXf1wXoCOdJSgkCmu1yfggNN7PUK83PCSLZaDEvbtWhhsmvTaUWHRJqKdYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760233139; c=relaxed/simple;
	bh=q0nucoZ4l6PAMnEzAW6nK6D5s0vtZz3WNq7GlDktzYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYSuEsuHSIXU/y7zp2WIklTOUSpUjqK89xJa7iUevgQwsysWlDRodFsr17ludHq99UpqZ5WidZqP3iOK5BUYuFEBkS5Fg9IpQXU2Vjb5AYfS1M4KhOb2BwBS0ptGg/UBq3qE74IC9ZENq9CGBoUK81Vk6OR/LYUADb/m4TAO0bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/IFmgF4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/IFmgF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760233138; x=1791769138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q0nucoZ4l6PAMnEzAW6nK6D5s0vtZz3WNq7GlDktzYw=;
  b=E/IFmgF4BkYGYlBYZVKV6VFeoZTLUpVwmZGAHMRKjxkS4SAIgeHiXYQl
   yuc/n1YtjbudwXbrI8+G1F7+SCzHBE+RZNYuj1UwPCs5+Se3xAP4lBQk3
   TUlrSiDURWoxGZjNOzoSKWQsFJIELsUjsUxGNBlUPsx/oNhLogcOh6yvF
   XPW3MR7MK/aTsRP82ILdaSFuXUIlLHkrQJqZ3VgHGb5GLf6/BQ6hg373i
   GNPNCiv4Z1hOkhQ0XzC/rQivMGppyAT2JyyMwdKgNsAPEoDX86mscXtWg
   8jc7NRlS1qRtjs1xDcZReJ8nCmy6D2siGNmT1xtwT/K6LrqaVxqi4a2l8
   g==;
X-CSE-ConnectionGUID: jLqTUX0kTkGvvSCnAIXDbg==
X-CSE-MsgGUID: 9nUbBCrMSr2FI9emNcopKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62507429"
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="62507429"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 18:38:57 -0700
X-CSE-ConnectionGUID: gGyGT34VTEGzk2+s8CKykw==
X-CSE-MsgGUID: PkRRYF4jSHuNuJ5HXfONbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="185665552"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Oct 2025 18:38:55 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7l2z-000471-0Y;
	Sun, 12 Oct 2025 01:38:53 +0000
Date: Sun, 12 Oct 2025 09:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>, martin.petersen@oracle.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, michael.christie@oracle.com,
	John Garry <john.g.garry@oracle.com>
Subject: Re: [PATCH v2 4/7] scsi: target: Add WRITE_ATOMIC_16 handler
Message-ID: <202510120950.61bjguTF-lkp@intel.com>
References: <20251010141508.3695908-5-john.g.garry@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010141508.3695908-5-john.g.garry@oracle.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/scsi-target-Rename-target_configure_unmap_from_queue/20251010-221915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20251010141508.3695908-5-john.g.garry%40oracle.com
patch subject: [PATCH v2 4/7] scsi: target: Add WRITE_ATOMIC_16 handler
config: arm-randconfig-001-20251012 (https://download.01.org/0day-ci/archive/20251012/202510120950.61bjguTF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120950.61bjguTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120950.61bjguTF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/target/target_core_mod.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
