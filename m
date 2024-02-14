Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A954F82;
	Wed, 14 Feb 2024 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707918775; cv=none; b=A0WqOdjoqzs8s4iSlTKkIBLaPruJTQU6ohIzHzGdKvNSYNwYBiA60TAJdBFQETWN6R3QIK5CuCtHdRBBfyZYIsxJXzUcQdJQvufsXMgQ0nigB5PI4PudFzARlgdoP5We5k8yIyrkr5Uo4x3ahk7W0Tpn2wQspsKZUoxW8jScAto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707918775; c=relaxed/simple;
	bh=hnM5H6t/TDKcUCIU9bE+BigUE9DrkqB4qojlqwAW4+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dhmPwc2DvGNzibpx45Jhs/4vNDpokFlONeckM5BK4E/vAC6LSY5mGQXalJL3+PD8sccPQz0KycX8B/VraJYDZAr3733zmsz8TSlcZZKV2jj8rOD9ekEBEafDTZkgvZK88qqCUYqn1+5eiSt0afjTqPFJb9MktxpLXEBVXCW/QKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIRVg/xD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIRVg/xD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707918774; x=1739454774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hnM5H6t/TDKcUCIU9bE+BigUE9DrkqB4qojlqwAW4+k=;
  b=kIRVg/xD2d1iKF8kRWEGpet9lWN93LSouNceKifWQggN/6OBmwym8NZR
   VZ52k4nMEMGH/OcDWt0wSXgaNu5gIQocbkCV16hDuVvViF6VLLWI6L+fo
   wikGCekTflzb9CknAHWBU0Z5I5lsqfMH4ESQl+U1kMqIK+n8zEa6tC25S
   2ysIrwcH9+FlpqV610L55FmpRBtfJEUblAdV5YEblGG/6jr30o5s674fP
   ik3pgRsDn0IiM+baA8nmeziFpZ/AfxYx0LLJHL9Xsf6+EFYUtelM2qwsY
   Y9VKy9mUsKfVYqIqnl8aYgf8n6sP+PEGTRoAQ1KNwnTQmvexOGWjohWic
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2085670"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2085670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 05:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3557081"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Feb 2024 05:52:52 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raFgv-0008oG-1x;
	Wed, 14 Feb 2024 13:52:49 +0000
Date: Wed, 14 Feb 2024 21:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena 8/26] kernel/bpf/verifier.c:10728:9: error: call to
 undeclared function '__kfunc_param_match_suffix'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202402142129.az2ZcD8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena
head:   e2f7c21dbf74246dd26901ee619e1049beb2c82b
commit: d4d4715a53daf5ad2cfc736e5f7c5fcb6d2ff908 [8/26] bpf: Recognize '__map' suffix in kfunc arguments
config: arm-randconfig-004-20240214 (https://download.01.org/0day-ci/archive/20240214/202402142129.az2ZcD8O-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402142129.az2ZcD8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402142129.az2ZcD8O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/verifier.c:10728:9: error: call to undeclared function '__kfunc_param_match_suffix'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    10728 |         return __kfunc_param_match_suffix(btf, arg, "__map");
          |                ^
   kernel/bpf/verifier.c:10728:9: note: did you mean 'btf_param_match_suffix'?
   include/linux/btf.h:498:6: note: 'btf_param_match_suffix' declared here
     498 | bool btf_param_match_suffix(const struct btf *btf,
         |      ^
   1 error generated.


vim +/__kfunc_param_match_suffix +10728 kernel/bpf/verifier.c

 10725	
 10726	static bool is_kfunc_arg_map(const struct btf *btf, const struct btf_param *arg)
 10727	{
 10728		return __kfunc_param_match_suffix(btf, arg, "__map");
 10729	}
 10730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
