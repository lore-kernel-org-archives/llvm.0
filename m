Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CBD305E33;
	Thu, 13 Nov 2025 04:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009429; cv=none; b=Hz3URCXjL9SlK+yZkCIRU3X9XBTPrMhL9CvwMR/H8x4EqhHLyYEfCwdkDyfhgE17fMjfjy9diiaEQVr7RA+5f8biB5bhzUW4yqTV/AZZ6/6RJFKpwG7+EvHqNWpX17gXn+oM0L5CDmtIaOf8eUKao2ZH0UA7s6tCuN8nXCkFW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009429; c=relaxed/simple;
	bh=OwNiD+LA708Bkt76Ibt9Y8BhTcH5rbaAndgqlLkl4H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+yoQhOOKXA603jYOSGubPHfK0Mg6Gb7Xz1G7Bxl4Xm7iIKFt4fNwRwUCLvd9tABX4J7kjCnVdYtQHY952catvuAeMQQ3/yO1747Krvjqfog9xAQgLYNJ18xJin9M8OLo38t17zDzbEAw19O6qSrAalwerelVRdcR36HIPIAscY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jd669u0Z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jd669u0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009428; x=1794545428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OwNiD+LA708Bkt76Ibt9Y8BhTcH5rbaAndgqlLkl4H4=;
  b=Jd669u0Z71HefsC3+TBQc9dWHK76Yk3cV+p365N3+AEsaiWpoCzJF83P
   RAuIe6ZqDmH7tHUPyupHL3j3PtL3EkuWNmutzHLG+tsS0QZxBvOqQ/RHl
   YTKLIP0HiphxG7YvXgPCCdzZOjOSUqB/8VOnpJkvyyXJa/XmYJR1ylRp8
   bvqdZLpgNQyXRMZNviimMwqdC8krOwY9/zEtrY1RnmHI6t34Vxn2UhDfg
   6syG4cCvqTrW9fa733XXBAQrHs4wBQ8OESY2khtbjD+0BCtjw5Kh9VA87
   ntHh9PJpC5LJjydZhHrrUm0ld9WwFbXzAddnsBaeZYwgwd6j+26ZZZVR1
   g==;
X-CSE-ConnectionGUID: pB0zQ6CvRpO/vW0gkZZ+9g==
X-CSE-MsgGUID: uCX+3uiYSROUQ+qB1JiVcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68947843"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="68947843"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:50:23 -0800
X-CSE-ConnectionGUID: uGOZoOpJQZWcQ0afR6xfOA==
X-CSE-MsgGUID: eq8a2LoDTSCyyUsRhxQNkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="212789109"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2025 20:50:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPHm-0004sk-2O;
	Thu, 13 Nov 2025 04:50:18 +0000
Date: Thu, 13 Nov 2025 12:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v1 2/2] devres: Move devm_alloc_percpu() and related to
 devres.h
Message-ID: <202511122250.550UBJAu-lkp@intel.com>
References: <20251111144104.910241-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111144104.910241-3-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.18-rc5 next-20251112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/devres-Remove-unused-devm_free_percpu/20251111-230827
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20251111144104.910241-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 2/2] devres: Move devm_alloc_percpu() and related to devres.h
config: i386-buildonly-randconfig-004-20251112 (https://download.01.org/0day-ci/archive/20251112/202511122250.550UBJAu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511122250.550UBJAu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511122250.550UBJAu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpio/gpiolib-devres.c:9:
>> include/linux/device/devres.h:113:6: error: variable has incomplete type 'void __attribute__((btf_type_tag("percpu")))' (aka 'void')
     113 | void __percpu *__devm_alloc_percpu(struct device *dev, size_t size, size_t align);
         |      ^
   include/linux/compiler_types.h:60:19: note: expanded from macro '__percpu'
      60 | # define __percpu       __percpu_qual BTF_TYPE_TAG(percpu)
         |                         ^
   In file included from drivers/gpio/gpiolib-devres.c:9:
   include/linux/device/devres.h:113:14: error: expected ';' after top level declarator
     113 | void __percpu *__devm_alloc_percpu(struct device *dev, size_t size, size_t align);
         |              ^
         |              ;
   2 errors generated.


vim +113 include/linux/device/devres.h

    98	
    99	/**
   100	 * devm_alloc_percpu - Resource-managed alloc_percpu
   101	 * @dev: Device to allocate per-cpu memory for
   102	 * @type: Type to allocate per-cpu memory for
   103	 *
   104	 * Managed alloc_percpu. Per-cpu memory allocated with this function is
   105	 * automatically freed on driver detach.
   106	 *
   107	 * RETURNS:
   108	 * Pointer to allocated memory on success, NULL on failure.
   109	 */
   110	#define devm_alloc_percpu(dev, type)      \
   111		((typeof(type) __percpu *)__devm_alloc_percpu((dev), sizeof(type), __alignof__(type)))
   112	
 > 113	void __percpu *__devm_alloc_percpu(struct device *dev, size_t size, size_t align);
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
