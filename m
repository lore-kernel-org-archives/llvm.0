Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E713018BBB0;
	Tue, 31 Dec 2024 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735679165; cv=none; b=uOM0chSycgshJxu1zGfO017o66gSQmLPu4ej7gCoCYMuLOQw81tkrMhPxq9mIN0OtfedcP3vhGWRFMGci3FBGt0Q6ZTs52yD/V1tBKi6Qavkl2Gvynl72iGNAV5evwLzcVHhAC1XDjJjhGjDjOJHzgEzVBDau+DnPWlORFVLW4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735679165; c=relaxed/simple;
	bh=tYdZtmtS1ieZ2bBERrT0nyI92uG/wV5sMcyOYVRWUq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tepAASwfiLT5mhDZGOlomzw2/qjdjlLKnckxmEk1vyeeL6S4IFjUbikydg8FYNol2+1ixGHZq55DGVnWJ3Yx8LI8U/157H+tShrvl6knvsViRnjOSgqGmY6u/xoBAXluGXBup6nomr/PEcwSbUHoKFLZbGDcQJX2C4AO0kD5z34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9r3HKiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9r3HKiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDF2C4CED2;
	Tue, 31 Dec 2024 21:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735679164;
	bh=tYdZtmtS1ieZ2bBERrT0nyI92uG/wV5sMcyOYVRWUq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K9r3HKiXfcntRSu2Cxpx/EXnxa798HbvIvicvZeh7gyTROKBEnexuiUVYYXt68Oiv
	 AmzIuWf4fGV1MGsC8rzKoXx2i0xwWgceGk8hcYdZMi1XjC8wDWz03Rc5W1un0eL+ZU
	 ewY4UOPFCjpmrujeK4asms5I8BNlp8vRRnqo8oEa77PB9AG0luf+2tOhk6bVDg0i4B
	 cMal7xHsCLNdkY/Sh77fKphF+D4A9KKtvexzCGVxmciBbZqxVz5xcgSI+++9Q/Pfrx
	 92ekFc83BoxE2f+tGSwsk5n1Zzh/oD9uw/MoIZ5mbPRNEHAtFONSwUVS5pMcQm56VT
	 P8kVD0/pAR5Uw==
Date: Tue, 31 Dec 2024 14:05:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>, peterz@infradead.org,
	jpoimboe@kernel.org
Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: vmlinux.o: warning: objtool: do_user_addr_fault+0x1052:
 __stack_chk_fail() is missing a __noreturn annotation
Message-ID: <20241231210559.GA534233@ax162>
References: <202412311010.rrcATd3z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412311010.rrcATd3z-lkp@intel.com>

+ objtool folks

On Tue, Dec 31, 2024 at 10:18:15AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
> commit: 7582b7be16d0ba90e3dbd9575a730cabd9eb852a kprobes: remove dependency on CONFIG_MODULES
> date:   8 months ago
> config: x86_64-buildonly-randconfig-006-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311010.rrcATd3z-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311010.rrcATd3z-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412311010.rrcATd3z-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    vmlinux.o: warning: objtool: x64_sys_call+0x23b9: __x64_sys_exit() is missing a __noreturn annotation
> >> vmlinux.o: warning: objtool: do_user_addr_fault+0x1052: __stack_chk_fail() is missing a __noreturn annotation

Is the solution to mark __stack_chk_fail() explicitly as __noreturn?
It is my understanding that __stack_chk_fail() should implicitly be
__noreturn, as GCC's documentation states that if a target customizes
the stack protector failure function, it should involve a call to a
noreturn function [1]. Should this warning take into account the
global_noreturn list to avoid warning in these cases? I suspect that
would take care of the other warning in in this configuration.

[1]: https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gccint/Stack-Smashing-Protection.html

Cheers,
Nathan
