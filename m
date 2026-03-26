Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE153451D9;
	Thu, 26 Mar 2026 22:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774565369; cv=none; b=FT4oB9C2c+mL/++lt60yhVjudW38Gy9hrqGmmLdmMBTmvzUtor01E2tUfjFP/zeS7whN92cg5AW7eWElmUW2jOWUVBgOvC4WA0mCBYK28/DS1npZrkjC5d4n/SDSwnnvC+OaRc1EfNKDexLCtiHa48PkXmhAzw1dSg6coNL5K6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774565369; c=relaxed/simple;
	bh=Nkssu31T4ASGATxhou3Hn/jkOwEBY1N+E/b79UGlPgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtifJ8GwjLYz3GTeavwsw6kqmQxPWOYXhYKFuSIzGZmK7ocn/v0dtHcTGTMv8qWHkgdhwiOHBg3IWnkJv1tUw8PnD0L9gA+QN/nAwfNktetWYM6RIpPpcEZQajjk8zG078P81hhMQoZoDVArQT+49zD79L6sXiO4DzPvAczCcKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYi2DL0P; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYi2DL0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774565366; x=1806101366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nkssu31T4ASGATxhou3Hn/jkOwEBY1N+E/b79UGlPgE=;
  b=jYi2DL0PeZaXGUwu7uLLWwLAdn3UJ2u1E8YWdSpKhl7zGGyqEipGWwCE
   B1naxsHFJcPjvCWxLqGAkiyLf5y5sFeJnOwZtPI6fslpcXZyOfhKw1ZKF
   ApsZdcSqkmgXrKwozNxNztD1YbDRhKlU91p1V5I7KJavmwWgoISCbpoBj
   jaCXLYIwdwiAX67z/1KWZSilXv3tvwyR2X+umB2lf19BbbEyXDkXjAaLv
   9G5c+szvWDzNPVHxcut0J2XiJLq7/MEScSel1Gd97Y7M0f+u6OzmbVRrj
   vkoJM5peWQykSdBqpSWCAy4Vdczftts2NtrPPpKcPaCbFBW8026ySZ7M7
   Q==;
X-CSE-ConnectionGUID: oZC7BkLiRrqK0ChU6FdXQw==
X-CSE-MsgGUID: EnAYz2NVStqF7eaw/4oGdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93023070"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="93023070"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 15:49:25 -0700
X-CSE-ConnectionGUID: OpYG/3SsSgepX3OMdGdPcw==
X-CSE-MsgGUID: m/x6tl02R7CjOiWo68fqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="229920793"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 15:49:23 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5tVw-000000009Rx-3AwL;
	Thu, 26 Mar 2026 22:49:20 +0000
Date: Fri, 27 Mar 2026 06:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosry@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>
Subject: Re: [PATCH v4 2/6] KVM: x86: Move guest_mode helpers to x86.h
Message-ID: <202603270611.WB2i1rjQ-lkp@intel.com>
References: <20260326031150.3774017-3-yosry@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326031150.3774017-3-yosry@kernel.org>

Hi Yosry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3d6cdcc8883b5726513d245eef0e91cabfc397f7]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KVM-x86-Move-enable_pmu-enable_mediated_pmu-to-pmu-h-and-pmu-c/20260326-191518
base:   3d6cdcc8883b5726513d245eef0e91cabfc397f7
patch link:    https://lore.kernel.org/r/20260326031150.3774017-3-yosry%40kernel.org
patch subject: [PATCH v4 2/6] KVM: x86: Move guest_mode helpers to x86.h
config: x86_64-buildonly-randconfig-004-20260327 (https://download.01.org/0day-ci/archive/20260327/202603270611.WB2i1rjQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270611.WB2i1rjQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270611.WB2i1rjQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/svm_onhyperv.c:11:
>> arch/x86/kvm/svm/svm.h:520:6: error: call to undeclared function 'is_guest_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     520 |         if (is_guest_mode(&svm->vcpu))
         |             ^
   arch/x86/kvm/svm/svm.h:578:6: error: call to undeclared function 'is_guest_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     578 |         if (is_guest_mode(&svm->vcpu) && !nested_vgif_enabled(svm))
         |             ^
   arch/x86/kvm/svm/svm.h:639:6: error: call to undeclared function 'is_guest_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     639 |         if (is_guest_mode(&svm->vcpu))
         |             ^
   arch/x86/kvm/svm/svm.h:802:9: error: call to undeclared function 'is_guest_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     802 |         return is_guest_mode(vcpu) && (svm->nested.ctl.int_ctl & V_INTR_MASKING_MASK);
         |                ^
   In file included from arch/x86/kvm/svm/svm_onhyperv.c:12:
   In file included from arch/x86/kvm/svm/svm_ops.h:7:
>> arch/x86/kvm/x86.h:169:20: error: conflicting types for 'is_guest_mode'
     169 | static inline bool is_guest_mode(struct kvm_vcpu *vcpu)
         |                    ^
   arch/x86/kvm/svm/svm.h:520:6: note: previous implicit declaration is here
     520 |         if (is_guest_mode(&svm->vcpu))
         |             ^
   5 errors generated.


vim +/is_guest_mode +520 arch/x86/kvm/svm/svm.h

0b97f929831a70 Sean Christopherson 2026-02-18  509  
0b97f929831a70 Sean Christopherson 2026-02-18  510  static inline void svm_mark_intercepts_dirty(struct vcpu_svm *svm)
0b97f929831a70 Sean Christopherson 2026-02-18  511  {
0b97f929831a70 Sean Christopherson 2026-02-18  512  	vmcb_mark_dirty(svm->vmcb01.ptr, VMCB_INTERCEPTS);
0b97f929831a70 Sean Christopherson 2026-02-18  513  
0b97f929831a70 Sean Christopherson 2026-02-18  514  	/*
0b97f929831a70 Sean Christopherson 2026-02-18  515  	 * If L2 is active, recalculate the intercepts for vmcb02 to account
0b97f929831a70 Sean Christopherson 2026-02-18  516  	 * for the changes made to vmcb01.  All intercept configuration is done
0b97f929831a70 Sean Christopherson 2026-02-18  517  	 * for vmcb01 and then propagated to vmcb02 to combine KVM's intercepts
0b97f929831a70 Sean Christopherson 2026-02-18  518  	 * with L1's intercepts (from the vmcb12 snapshot).
0b97f929831a70 Sean Christopherson 2026-02-18  519  	 */
0b97f929831a70 Sean Christopherson 2026-02-18 @520  	if (is_guest_mode(&svm->vcpu))
0b97f929831a70 Sean Christopherson 2026-02-18  521  		nested_vmcb02_recalc_intercepts(svm);
0b97f929831a70 Sean Christopherson 2026-02-18  522  }
0b97f929831a70 Sean Christopherson 2026-02-18  523  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
