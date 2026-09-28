Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B54EF13A;
	Mon, 28 Sep 2026 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624086; cv=none; b=JtZLcRgMfFpMeqP4XGHc5XPhMFWwsEmbN6z8B2jiOQwpHZh10cBToe8uHGJiSLJgBPPFLFomNZxGVMvrP8cXHs71zJsbN1IcgVMRqf46/C3BT19Y6A+C7fCiE1cHEAKseWhqYNL3zBmD0zN9TCwFe2/nl6rPRp+SmB7hGaYRBY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624086; c=relaxed/simple;
	bh=V/YXGiGxhcBrgsAqqJgs/KU2Y2HCiZumCGJxED0jrQ4=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw4o//fGdbzIaMsKPK+7Zk6j+3yWzqEO8bImxg6G3+Dpw9NIFATs7eObQNN1KqTy3/jXGAszxVJxhX8VIw/7s+0o0MpDaHBSZkR20f4/XkuywZU9NTa874eCcdprIsJkbPLN1f+Qz8N6f7oIHh6qu3Iicc2qCB0QU86uIrkzyK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQ1KNE5M; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQ1KNE5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790624084; x=1822160084;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=V/YXGiGxhcBrgsAqqJgs/KU2Y2HCiZumCGJxED0jrQ4=;
  b=TQ1KNE5MEJ5jDyNE0MFsZ9tJB+OJaCvEBlTLLpQAKrGZkd6iVc4TQEtz
   5uljMjaprDbdMNhHi1jhLBIn3hFNyQY3ur650CFXMUY6jTqrhRb7FUOVr
   zID/EClYCsx831Sf53i5l+cwudXZfKI2a/QXlEqextuldf0W5hSaCNGXp
   B11759gzlGtaSZ/DOT6ASp66BXNqtWXfOawE6ooI15LA1DfHGjEJDKJVJ
   gp7dtNhw8D/SgRekLHux8oYZVI+kmCm43anotRW8uaf+lxdujHUhMmm8A
   Ltu6/PPY9+9lnJXnDZgYGL4AstnQgCXNQSy2qsAwjkUVGJEkUteTuD48U
   g==;
X-CSE-ConnectionGUID: QUnVGAtoT0ilKsoJOsJVsQ==
X-CSE-MsgGUID: QEcW+bSiT0iptVtXMw45bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="113120740"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="113120740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 12:34:43 -0700
X-CSE-ConnectionGUID: hHZiQKJ0T1C6dni9FOtN2A==
X-CSE-MsgGUID: vKJdrH/RRh6W29E7s4fodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="304644055"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Sep 2026 12:34:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBH7Y-00000000OP1-35U9;
	Mon, 28 Sep 2026 19:34:40 +0000
Date: Tue, 29 Sep 2026 03:33:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
Message-ID: <202609290353.Ok95CKe3-lkp@intel.com>
References: <202609290353.Ok95CKe3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609290353.Ok95CKe3-lkp@intel.com>

Hi Bill,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Bill-Wendling/gpiolib-annotate-struct-acpi_gpio_mapping-with-__counted_by_ptr/20260928-063824
base:   
patch link:    https://lore.kernel.org/r/202609290353.Ok95CKe3-lkp%40intel.com
config: x86_64-randconfig-1011-20260928 (https://download.01.org/0day-ci/archive/20260929/202609290353.Ok95CKe3-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290353.Ok95CKe3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290353.Ok95CKe3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/smbios.c:5:
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
   In file included from drivers/firmware/efi/libstub/smbios.c:5:
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
