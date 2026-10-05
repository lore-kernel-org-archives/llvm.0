Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B8D31AA8F;
	Mon,  5 Oct 2026 05:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791178402; cv=none; b=cccHUfa6bbEC5jovSQ8a0jDukpepSWD/S5Ahlxeqawutb+/O29C0Z7PsEgEXQAwRX41+eBS/e+BcHgx7aSo5lIumxaDYyAMZFjL17UgEGnD76Twaco1i3KKHmfQEfuRANcDzEQ730+SHTwLlhNcsiVFPMoC4j5DZmULf1CEJ8FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791178402; c=relaxed/simple;
	bh=FyPpeY+oUZm/pBITlkKVCIRhfZUZEAWKjSOQpWMW1VU=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLUkIbioKzZOl8UnUNhp7srhsS470ujN847kKKwnz66z5Mnp1zLZPWMw66XDIfoTPhranYgDlNWMx8W+Gdhet4ZOqZvpkAoZubMVlbF5ykTeeG3hRczVqXpc+ISXFZ/RCmIAg9w7v/c7qZsvC5dkSBe1nkGCUkS3p2OZRhjyRqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icYnKgH4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icYnKgH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791178401; x=1822714401;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=FyPpeY+oUZm/pBITlkKVCIRhfZUZEAWKjSOQpWMW1VU=;
  b=icYnKgH4ueGlYTj1D2rjEq3GMc/I/8rjTEoJpHl8kpC7IdoC3fBq4Jjz
   fMn6zSQzzxBSYQBRhRNAm/tytaVq0SAtuupznuEVzJF1+FI9knUHMeJw1
   p02qE6GXAoDI9R584W0rhT7PH+Hc1ypB/WnrjQaYbdsTCKnztgaj3WbXD
   2KIPzhm66VcbgPDWEQpM1BiOaSTJw6gaP1rnJr4ExQhaVR3kcl2+OIVTK
   qGWN03BVVgeiKvo0rXepKNGqcI3r8VYH4McM1WeCJiZyLp+AbtuYO0DZb
   WkEEEtLv6932MC42mMqxYctMSeFu2WfFv0GWzfy9nqsM4rrwxP3SMlK1Z
   A==;
X-CSE-ConnectionGUID: euL0ETzySlynQV6pdbLanA==
X-CSE-MsgGUID: pQ/1FsZTSOeJDSN2A3TLVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91947072"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91947072"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 22:33:18 -0700
X-CSE-ConnectionGUID: wWapcYSvTvqjqfvHuUaIhw==
X-CSE-MsgGUID: Z4/HRb9vRVuNIzAaX6VKSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="280001311"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Oct 2026 22:33:17 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDbK7-000000000ZJ-1mXi;
	Mon, 05 Oct 2026 05:33:15 +0000
Date: Mon, 5 Oct 2026 07:32:23 +0200
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
Message-ID: <202610050705.Z7tuheXs-lkp@intel.com>
References: <202610050705.Z7tuheXs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610050705.Z7tuheXs-lkp@intel.com>

Hi Bill,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Bill-Wendling/gpiolib-annotate-struct-acpi_gpio_mapping-with-__counted_by_ptr/20261002-124225
base:   
patch link:    https://lore.kernel.org/r/202610050705.Z7tuheXs-lkp%40intel.com
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261005/202610050705.Z7tuheXs-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050705.Z7tuheXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610050705.Z7tuheXs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/bli.c:5:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:18:
   In file included from include/linux/nvmem-provider.h:16:
>> include/linux/gpio/consumer.h:670:55: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     670 |         const struct acpi_gpio_params *data __counted_by_ptr(size);
         |                                                              ^~~~
         |                                                              ksize
   include/linux/compiler_types.h:392:64: note: expanded from macro '__counted_by_ptr'
     392 | #define __counted_by_ptr(member)        __attribute__((__counted_by__(member)))
         |                                                                       ^~~~~~
   include/linux/slab.h:602:8: note: 'ksize' declared here
     602 | size_t ksize(const void *objp);
         |        ^
   In file included from drivers/firmware/efi/libstub/bli.c:5:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:18:
   In file included from include/linux/nvmem-provider.h:16:
>> include/linux/gpio/consumer.h:670:55: error: 'counted_by' requires a non-boolean integer type argument
     670 |         const struct acpi_gpio_params *data __counted_by_ptr(size);
         |                                                              ^~~~
   2 errors generated.


vim +670 include/linux/gpio/consumer.h

   667	
   668	struct acpi_gpio_mapping {
   669		const char *name;
 > 670		const struct acpi_gpio_params *data __counted_by_ptr(size);
   671		unsigned int size;
   672	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
