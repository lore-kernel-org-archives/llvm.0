Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637561F4608;
	Mon,  9 Jun 2025 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504909; cv=none; b=R2arfshzECXEzfJrtHboDMXgLiGBKHMFjPc+3vH79pYBEXq3oQeslexBmNN7eVQNN0FRfNRlyVamYm9MZqAXDw65W49Nv8o5ok4g27smKmjE4pXti6iFBW0JRAP6/t7b1+KHr3+qMKJClixf7pQ4j5nD3gBaXk89FFWaSLM2qxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504909; c=relaxed/simple;
	bh=5G2/1zHpI2UKUztRiHV6T8X/a2coeCiyQkrQjfPAv9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0vl3eLrCDcK/xlAtZxox2etkGGviibA8FOiz7GlaDEbUUa7FXfv4VpuQnLhjrG+cB4vjzAEySWM7CyjBqBdhKpzENI1KlPYq7lmjy57MI00toioBl79/1SMVT6cQ0f9sDJY5YDbmNIuWyfqIkQo6R8iRyLWZA8/+Ig95trhjmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwBjR5QF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwBjR5QF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7431C4CEEB;
	Mon,  9 Jun 2025 21:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749504909;
	bh=5G2/1zHpI2UKUztRiHV6T8X/a2coeCiyQkrQjfPAv9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwBjR5QF0kRSkAzCbYQm/eI2+bpg+qwqleE+I5PQjdiZwxANgL7GUVGQrpk36FWHo
	 8oDLKuQg3RjCJEbb4xZVIKBKCtXdQNu2u0NZNSBcPbaSxZbN+QD/93S1UDqq7UUofA
	 zIbEnPfadNoYWS7440kNY4V07j4R2FkKp3EsHdFIsxDUwmubrBcKVsHd2wrzBlvDzS
	 +NS4tmxYbOxHR91q901sHbxLl3SbES3ImEdrupEWL2V+LNcWWKhIInr01DGRytGqsH
	 J2h3LCddOSlHtT04pR3pc3cu+uyXGp5LiWL2vxY7DIpemG+BV7aiwku2Gw6hiytMVp
	 iQYoVigsHsE6g==
Date: Mon, 9 Jun 2025 14:35:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 15/21] drm/i915/flipq: Provide the nuts and bolts code
 for flip queue
Message-ID: <20250609213505.GA1634981@ax162>
References: <20250609141046.6244-16-ville.syrjala@linux.intel.com>
 <202506100537.aqJUNf0d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506100537.aqJUNf0d-lkp@intel.com>

On Tue, Jun 10, 2025 at 05:19:17AM +0800, kernel test robot wrote:
> Hi Ville,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on drm-intel/for-linux-next]
> [cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.16-rc1 next-20250606]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-dsb-Use-intel_dsb_ins_align-in-intel_dsb_align_tail/20250609-223955
> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> patch link:    https://lore.kernel.org/r/20250609141046.6244-16-ville.syrjala%40linux.intel.com
> patch subject: [PATCH v4 15/21] drm/i915/flipq: Provide the nuts and bolts code for flip queue
> config: x86_64-buildonly-randconfig-005-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100537.aqJUNf0d-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100537.aqJUNf0d-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506100537.aqJUNf0d-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/i915/i915.o: warning: objtool: intel_flipq_add(): unexpected end of section .text.intel_flipq_add

Given that this is clang-20, this is likely due to the potential divide
by zero that happens if intel_flipq_elem_size_dw() returns 0 in the
intel_flipq_add() -> intel_flipq_size_entries() call path. I suspect
returning 1 instead of 0 would avoid this.

Cheers,
Nathan
