Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8330EF81;
	Fri, 23 Jan 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171222; cv=none; b=Qz3qo0SzVoIt6Iro7QpxarVSZhCV2YmUhCjN53OasSrOsXMdHn1doySNBYXuUM65floMlc692Lj4331x1gXTm7/rH5NsRM5ddj+94EYpgyAJpwlXW+7nSZINMmxygEf1zvDwP6K2a1ix5HPbC73ucS0u2x1rwfpPYqz2c0Dc2So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171222; c=relaxed/simple;
	bh=XA1SjaS2/7tkFIIRzJGUee57bJy4LE6ja09RafCZp9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PC40huaQDGrUcJgCuVpFyIC3FKYkk12Bke8YA/uMU749Lir06dPf7ELsbx9mWKpfRMoZsLvaEEary+qXp/reygM+cwdlFxYvNKYl8z3E2rAdKD8oUeFM3JG43l1B8I97kBlU4hQYFghu6XuwPLmbcxaSbpmEBR6GCU2qpJZux4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUvLUFUl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUvLUFUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769171222; x=1800707222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XA1SjaS2/7tkFIIRzJGUee57bJy4LE6ja09RafCZp9g=;
  b=lUvLUFUlAZBCEeji6JUCP4bk59HalqL+Or4vLPGS4a+tpgbpAC5JWEHO
   0ukw/r9MSsl0a6b2bTGiAORJjwrev4RPQYp/jBZvoBUuxwl3EYGLsuZZ6
   /FIFTFExLe5aYhEhIedQtGSzfUH8MillninPPMW61PVVP5r31fUpj6xFF
   RqrwNprbfCmKTfT2zI9YVPzZHDxSNecrPfuv6Q8G1Oym2fLDBmjZzZTpM
   mV2gRyfYuPVOnzcyer1J9ap059pOCnS2nHafX0Zxh+5d3cOi7/dhl/VvD
   yc8sHwVunBLvnHxjxK2p6FR6gB51ZX+47uz41P3LCIorB5NwMArbLPnWS
   A==;
X-CSE-ConnectionGUID: aBA7D6MnRpGb2Nd5TJCsuA==
X-CSE-MsgGUID: bu//7i8LSWK1sHqKE5z6hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87841454"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="87841454"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 04:27:02 -0800
X-CSE-ConnectionGUID: QzrIgEsERtSX4zO+kS9/Uw==
X-CSE-MsgGUID: W4E3+5+NR4iRaLuDbBSLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206274996"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2026 04:26:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjGFY-00000000TwY-3vMe;
	Fri, 23 Jan 2026 12:26:52 +0000
Date: Fri, 23 Jan 2026 20:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <someguy@effective-light.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hamza Mahfooz <someguy@effective-light.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Ce Sun <cesun102@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>, Alex Hung <alex.hung@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
	Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/amdgpu: implement page_flip_timeout() support
Message-ID: <202601232007.NAxTeBna-lkp@intel.com>
References: <20260123000537.2450496-2-someguy@effective-light.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123000537.2450496-2-someguy@effective-light.com>

Hi Hamza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hamza-Mahfooz/drm-amdgpu-implement-page_flip_timeout-support/20260123-085944
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260123000537.2450496-2-someguy%40effective-light.com
patch subject: [PATCH 2/2] drm/amdgpu: implement page_flip_timeout() support
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260123/202601232007.NAxTeBna-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601232007.NAxTeBna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601232007.NAxTeBna-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c:348:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     348 |         default:
         |         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c:348:2: note: insert '__attribute__((fallthrough));' to silence this warning
     348 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c:348:2: note: insert 'break;' to avoid fall-through
     348 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +348 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c

2656e1ce783a90 Eric Huang    2024-06-03  315  
2656e1ce783a90 Eric Huang    2024-06-03  316  void amdgpu_reset_get_desc(struct amdgpu_reset_context *rst_ctxt, char *buf,
2656e1ce783a90 Eric Huang    2024-06-03  317  			   size_t len)
2656e1ce783a90 Eric Huang    2024-06-03  318  {
2656e1ce783a90 Eric Huang    2024-06-03  319  	if (!buf || !len)
2656e1ce783a90 Eric Huang    2024-06-03  320  		return;
2656e1ce783a90 Eric Huang    2024-06-03  321  
2656e1ce783a90 Eric Huang    2024-06-03  322  	switch (rst_ctxt->src) {
2656e1ce783a90 Eric Huang    2024-06-03  323  	case AMDGPU_RESET_SRC_JOB:
2656e1ce783a90 Eric Huang    2024-06-03  324  		if (rst_ctxt->job) {
7bed1df814cd61 Eric Huang    2024-06-06  325  			snprintf(buf, len, "job hang on ring:%s",
7bed1df814cd61 Eric Huang    2024-06-06  326  				 rst_ctxt->job->base.sched->name);
2656e1ce783a90 Eric Huang    2024-06-03  327  		} else {
2656e1ce783a90 Eric Huang    2024-06-03  328  			strscpy(buf, "job hang", len);
2656e1ce783a90 Eric Huang    2024-06-03  329  		}
2656e1ce783a90 Eric Huang    2024-06-03  330  		break;
2656e1ce783a90 Eric Huang    2024-06-03  331  	case AMDGPU_RESET_SRC_RAS:
2656e1ce783a90 Eric Huang    2024-06-03  332  		strscpy(buf, "RAS error", len);
2656e1ce783a90 Eric Huang    2024-06-03  333  		break;
2656e1ce783a90 Eric Huang    2024-06-03  334  	case AMDGPU_RESET_SRC_MES:
2656e1ce783a90 Eric Huang    2024-06-03  335  		strscpy(buf, "MES hang", len);
2656e1ce783a90 Eric Huang    2024-06-03  336  		break;
2656e1ce783a90 Eric Huang    2024-06-03  337  	case AMDGPU_RESET_SRC_HWS:
2656e1ce783a90 Eric Huang    2024-06-03  338  		strscpy(buf, "HWS hang", len);
2656e1ce783a90 Eric Huang    2024-06-03  339  		break;
2656e1ce783a90 Eric Huang    2024-06-03  340  	case AMDGPU_RESET_SRC_USER:
2656e1ce783a90 Eric Huang    2024-06-03  341  		strscpy(buf, "user trigger", len);
2656e1ce783a90 Eric Huang    2024-06-03  342  		break;
c5da9e9c023893 Alex Deucher  2025-04-16  343  	case AMDGPU_RESET_SRC_USERQ:
c5da9e9c023893 Alex Deucher  2025-04-16  344  		strscpy(buf, "user queue trigger", len);
c5da9e9c023893 Alex Deucher  2025-04-16  345  		break;
7136aabf196b0a Hamza Mahfooz 2026-01-22  346  	case AMDGPU_RESET_SRC_DISPLAY:
7136aabf196b0a Hamza Mahfooz 2026-01-22  347  		strscpy(buf, "display hang", len);
2656e1ce783a90 Eric Huang    2024-06-03 @348  	default:
2656e1ce783a90 Eric Huang    2024-06-03  349  		strscpy(buf, "unknown", len);
2656e1ce783a90 Eric Huang    2024-06-03  350  	}
2656e1ce783a90 Eric Huang    2024-06-03  351  }
a86e0c0e94373a Lijo Lazar    2024-11-15  352  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
