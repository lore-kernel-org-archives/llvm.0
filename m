Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F582C0261;
	Mon, 17 Nov 2025 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395374; cv=none; b=qWZ7XL4238FU0GA/sEI30VJA82qRblcrE4nH1Xas/xGplBKq6370LimOU0CG9Ap4rccFrC6HNuh9zf8mrBSKaaKq0UihR0mxCO1cZmiSqYrAEt1StMQtADdyKt6RhuxjXdTQw+siXNN6Y6kqcST+TDVBnUyrpZ3QgTQyVvWmtqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395374; c=relaxed/simple;
	bh=wFMJOe56BQ48bez0EDn3Rz1HFLgGbsV/sBCjmqW/V8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQgKT19DIcSDzra7BoUU98Rh5ogFIgpWzC9jrfpkUaaRIzUcZOqBJwaXfeNefNDOHTgGD78BipRnu1U2WnodGeQUSShi7ShYOCt6UzcuF1FA53U9L6hfLIUjGmpY39XinwyPGjylZKPskwFhFlhHiaazC2dhEAYn2HaIgz3XIqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+spOels; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+spOels"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3BCC19421;
	Mon, 17 Nov 2025 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763395374;
	bh=wFMJOe56BQ48bez0EDn3Rz1HFLgGbsV/sBCjmqW/V8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M+spOelsD6hwxTlKECuLBu5zdumUYJDmu+uTLlpXX8iJHO62Ja2rB1zHDi4AahfKH
	 Ak2Url8Aeir5X1uEIbRxFWcWEbFK/OctsIZLAm4I7F1YA0CbUQE0CGXoj/heqyUSOI
	 /fnECluas/H2Y+R9aNUIZGvTOyFb0O13nRC4ts+IgOU6eDh1LyYosTtKqyrKmuKmQ7
	 +3w82LSGHAlEnxp+7w3QaUetQYwg13e6Q2G04MxFE4YyoxohUYygPeNlz+/f2kbn0I
	 +TrrPOaS1Hol13mb0GTt2kfqc5wLQdNC9JJPdlTeORwcdkxzSXmAnGHAYzEBaRYPAZ
	 45OBzVhN7Mk0Q==
Message-ID: <dcfddc3f-1077-409e-91ad-cb2e2fe52a9b@kernel.org>
Date: Mon, 17 Nov 2025 10:02:52 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [agd5f:ring_reset_fixes 2077/2293] ld.lld: error: undefined
 symbol: pm_hibernation_mode_is_suspend
To: kernel test robot <lkp@intel.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Infrastructure <z1.linuxinfra@amd.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <202511172106.E4boUsgt-lkp@intel.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <202511172106.E4boUsgt-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/17/2025 7:46 AM, kernel test robot wrote:
> tree:   https://gitlab.freedesktop.org/agd5f/linux.git ring_reset_fixes
> head:   c592ac07b510abe3ec2f196e6a429df959712063
> commit: 36646c96fac1f138384238f4348fecd2ed702540 [2077/2293] drm/amd: Fix hybrid sleep
> config: i386-randconfig-012-20251117 (https://download.01.org/0day-ci/archive/20251117/202511172106.E4boUsgt-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511172106.E4boUsgt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511172106.E4boUsgt-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: pm_hibernation_mode_is_suspend
>     >>> referenced by amdgpu_drv.c:2678 (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2678)
>     >>>               drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(amdgpu_pmops_thaw) in archive vmlinux.a
> 

FYI - based on this failure, this branch is missing:

https://git.kernel.org/torvalds/c/495c8d35035e
https://git.kernel.org/torvalds/c/bbfe987c5a28
