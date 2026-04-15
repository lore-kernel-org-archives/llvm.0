Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450BF2FE59B;
	Wed, 15 Apr 2026 03:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776225156; cv=none; b=HaFHLACMVD4fvcS97Y5v+iCDq2wcW+2wALIXT6QZ7kg3p0WSPMxVXvV1r/ur1AxDwV1V7Ak8BrdngFJGNw9wMh3rLxQqJhZK0MfY8YHGJce6PN4FAeTR03e+yzOle5OVL6r8hoUjIOAAwuooP6zC7wfn8bA8rxhdD0sGBZErNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776225156; c=relaxed/simple;
	bh=m99qQZ4dx7BtKKpohQv3Y87bczeOuN8Pk/9zrNr5G/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8JNk01G6YXxbj/98kC0DLxqn5Tp2Z1zqEzK04wAgLpz7BgibmfNZR53NFWAHkFu8o/9O7zscSM178NjuGxFxG/1H4lBs++huZ/b48br5aZzq9EO7k0OmL/+9VUubRVV5jN4FWk6mgiEVQ2JxwlDyhvFSHfboSmEyafLtaQSeUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grq5wOz4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grq5wOz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776225153; x=1807761153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m99qQZ4dx7BtKKpohQv3Y87bczeOuN8Pk/9zrNr5G/Q=;
  b=grq5wOz4UKwvSEaY3Ny//gwTL8l7cN9GfL5obi5PLtARk/wBPltwVicb
   EKt/KHxSQOjIEca4+2Wj6gT9X7XSADNoXqWpAYEhQJ4eHa2976t8xusqX
   3wk53GMDaYAmRGKkhpFFT1xfZ1v/BmODUSSo0/egnHvI4OEj7L9sVkXME
   Fa6NbRAPXK9tLUjhKM6Ph6M1VLwVS0bFZ1lh7yCsMFVjbwHadPhdqQ3g5
   88aCUQCmZv8ZcbWKwttFUJjgW6k0h4M+ecE5zFjEjhRcHNr8HdwvgnSkB
   g55Ha3o3hrvIFGt80Dm+Wm3iWnaU5fOS0nSWen5kYBi9QkxB6GRzraGsS
   A==;
X-CSE-ConnectionGUID: hVIyKJg5Qse6FIknVSZCPQ==
X-CSE-MsgGUID: KRrtHfH1RKCXN15j900Vlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81075962"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="81075962"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 20:52:32 -0700
X-CSE-ConnectionGUID: Hyw66PRaSJ2o2KSC0fSSww==
X-CSE-MsgGUID: St9lG8kbRIe3aaTcAhVb/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225590728"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 20:52:29 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCrIg-0000000007F-2owl;
	Wed, 15 Apr 2026 03:52:26 +0000
Date: Wed, 15 Apr 2026 11:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	yoelvisoliveros@gmail.com, len.bao@gmx.us,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <202604151159.fZkPsdWl-lkp@intel.com>
References: <20260412000226.2711800-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412000226.2711800-1-m32285159@gmail.com>

Hi Maxwell,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/staging-octeon-remove-SPI-POW-PKO-and-Helper-typedef-enums/20260415-004127
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260412000226.2711800-1-m32285159%40gmail.com
patch subject: [PATCH] staging: octeon: remove SPI, POW, PKO, and Helper typedef enums
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604151159.fZkPsdWl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151159.fZkPsdWl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151159.fZkPsdWl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/octeon/ethernet.c:23:
   In file included from drivers/staging/octeon/octeon-ethernet.h:41:
>> drivers/staging/octeon/octeon-stubs.h:1270:15: error: use of 'cvmx_helper_interface_mode' with tag type that does not match previous declaration
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |               ^
   drivers/staging/octeon/octeon-stubs.h:225:6: note: previous use is here
     225 | enum cvmx_helper_interface_mode {
         |      ^
>> drivers/staging/octeon/octeon-stubs.h:1273:9: error: returning 'int' from a function with incompatible result type 'struct (unnamed struct at drivers/staging/octeon/octeon-stubs.h:1270:22)'
    1273 |         return 0;
         |                ^
   2 errors generated.


vim +/cvmx_helper_interface_mode +1270 drivers/staging/octeon/octeon-stubs.h

  1269	
> 1270	static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
  1271									   interface)
  1272	{
> 1273		return 0;
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
