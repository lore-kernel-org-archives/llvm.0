Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D6610957;
	Sat, 13 Apr 2024 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713011678; cv=none; b=kFyQFp16pHkBP0gpeWJJKFwGxcNk+TeQH7iOCFvhie2VxCOAybJ2V0Ewwz2bY5lmVUTsIKGGfGlzkLq6t1LCYNnZLZ4tJzLDYZWaKa48GczSPcgYz9iMRv7U9H5yfG5mIpk349nKJ+/IwCjrt9V9jeDycvZagTTw3rqlobPyNuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713011678; c=relaxed/simple;
	bh=OasVLfhyhlO8PumuGV36K+75fqRTyfj9IdQr+Qt894s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8BBXoenBztQo8gQlT6LItCP/TM8BYkJLvFE+MIdDcyx5o9y3z1lf+vYrSO/rwgGHRNHJsvByx7Nz7lAj9Yq9gKzFVqYu5HIlTIOQpwYW911utPf5kB+OvLeeeY/L/ddmh25yKopHYGRXzOhL94ixD3eUzme6BhRyfxWwgubyOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0nArk2b; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0nArk2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713011675; x=1744547675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OasVLfhyhlO8PumuGV36K+75fqRTyfj9IdQr+Qt894s=;
  b=U0nArk2byvk8KA1Mse2tUEyUNZOwyLA1mAf/8VSgEM9PJLvbbh4kNjEy
   tHcgVapKxhMVZpFc5Dchid9txTJL5lXsj2k3hJlX2XrnrJHHI5wkugOez
   734yAal6x+VyZyrsN/T7IzEAeHbVcLGS0FAOZ83OaUeBSl2QfrNFnvnAT
   5grzy26LewxZ6Des7PiK5OWSprfG/eZsoqlfSPZfrlj0VfS9Orz8uwiAv
   crQKVy7d7fCcLuv7yY9Gw0GcYFBuMe0a7m2iUjLpdeNqhGZO4zkYjGtdm
   rEIG9IAocAGLRCvovzafS2z95X+36bBk3NKj+2Qi/03DoL7zfpk9y2scR
   g==;
X-CSE-ConnectionGUID: cfEqJz+8SrexE4pzW+akRQ==
X-CSE-MsgGUID: eqklq/VDSp+bQKnJ8P/eZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19019794"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="19019794"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 05:34:34 -0700
X-CSE-ConnectionGUID: H9HDjfwQQZOfevqC+6DgWw==
X-CSE-MsgGUID: B6pltDILQ8mP9/7Mfmrxqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="25910386"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Apr 2024 05:34:34 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvcaV-0002Wq-26;
	Sat, 13 Apr 2024 12:34:31 +0000
Date: Sat, 13 Apr 2024 20:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Luis <miguel.luis@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] ACPI: processor: refactor acpi_processor_remove:
 isolate acpi_unmap_cpu under CONFIG_ACPI_HOTPLUG_CPU
Message-ID: <202404132034.7uJtpbGD-lkp@intel.com>
References: <20240409150536.9933-5-miguel.luis@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409150536.9933-5-miguel.luis@oracle.com>

Hi Miguel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v6.9-rc3 next-20240412]
[cannot apply to rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miguel-Luis/ACPI-processor-refactor-acpi_processor_get_info-evaluation-of-processor-declaration/20240409-231441
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240409150536.9933-5-miguel.luis%40oracle.com
patch subject: [RFC PATCH 4/4] ACPI: processor: refactor acpi_processor_remove: isolate acpi_unmap_cpu under CONFIG_ACPI_HOTPLUG_CPU
config: i386-randconfig-001-20240413 (https://download.01.org/0day-ci/archive/20240413/202404132034.7uJtpbGD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404132034.7uJtpbGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404132034.7uJtpbGD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_unregister_cpu
   >>> referenced by acpi_processor.c:534 (drivers/acpi/acpi_processor.c:534)
   >>>               drivers/acpi/acpi_processor.o:(acpi_processor_remove) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
