Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C791C683;
	Wed, 28 May 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445632; cv=none; b=pNOrmf0IDlAHhVy61ToTlqEdz84HXQ7HJmTFSQtmpdnpM69+D+qKNwWUNHkwQuyqwKFKDSdEtzg0fFioNlw6B7C4R0vo/cPHqbkfMNJpdKtDztkXVuKLYdQSZHjhUex0cld1ye1SYhMTvSNUmZBLp+TtBQTjzoEzcGS73LXfBLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445632; c=relaxed/simple;
	bh=7kMewkxZlUWW4+bCvliPeiqKR3NQUaJBPhldiiPxuUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sViWfoybSEpG10zeyfYvmppR2LdFZCAIfk5fyqJ/tljJnZGXXfjzTRGx3kMPQsvBo6z6yr3mOjWnw2q/mTTvFGZNYUOmjs216sqsgIsoEjINs4eHie6/SGtOqJofQ0Rjxez12XKtG52ajcSHFVPfugJ22RrcPoHeF+y5QBrkVdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfeYWw+I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfeYWw+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7212BC4CEE3;
	Wed, 28 May 2025 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748445631;
	bh=7kMewkxZlUWW4+bCvliPeiqKR3NQUaJBPhldiiPxuUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfeYWw+ItskaFQwbqlhdYRfDg3VkTIxXU90vLe/qmizxzp5EsO+aJWvlyMoiW6EzG
	 21Tk/v/SMF6BWyf6rE2urLh0bw61JxRpmqCAT5XOw2FVZDIWTVltl62/PRYGdxfrmA
	 Lk92FECvg5yOFI4wL3CsaPqdKK5V9LU2cC3qX5D//RhfwCAnKQ9vR6MXcpEFhsmIQQ
	 CkPzXubek1qLQ+RjCM2vLVRDOAAgDj+TkqZpUxbV2EulTn68c+zW2GogWUdM7wlO1X
	 /c++aadK9dZjmFdx8XcM/KxoXHNq7TKK+wSx23GRkkrZBn7gTgbQzMFWg7KRK7eKbl
	 KDvthTtS8hxeg==
Date: Wed, 28 May 2025 17:20:26 +0200
From: Alexey Gladkov <legion@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 5/6] kbuild: Move modules.builtin.modinfo to another
 makefile
Message-ID: <aDcpuudVTzuzMESp@example.org>
References: <1910073cfee59df4a3edb7f724214eeb4b8a3faa.1748335606.git.legion@kernel.org>
 <aDcNzoM9NF3SN+WH@rli9-mobl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDcNzoM9NF3SN+WH@rli9-mobl>

On Wed, May 28, 2025 at 09:21:18PM +0800, kernel test robot wrote:
> Hi Alexey,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on masahiroy-kbuild/for-next]
> [also build test ERROR on masahiroy-kbuild/fixes linus/master v6.15 next-20250528]
> [cannot apply to mkp-scsi/for-next jejb-scsi/for-next mcgrof/modules-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Gladkov/scsi-Define-MODULE_DEVICE_TABLE-only-if-necessary/20250528-020814
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> patch link:    https://lore.kernel.org/r/1910073cfee59df4a3edb7f724214eeb4b8a3faa.1748335606.git.legion%40kernel.org
> patch subject: [PATCH v3 5/6] kbuild: Move modules.builtin.modinfo to another makefile
> :::::: branch date: 19 hours ago
> :::::: commit date: 19 hours ago
> config: x86_64-randconfig-003-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282010.7mkEeiON-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282010.7mkEeiON-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202505282010.7mkEeiON-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> make[3]: *** No rule to make target 'modules.builtin.modinfo', needed by '/tmp/kernel/x86_64-randconfig-003-20250528/clang-20/0f04dfcaa62efc3a521b20ba0b39b2a78c4389db/lib/modules/6.15.0-rc7-00019-g0f04dfcaa62e/modules.builtin.modinfo'.
> >> make[3]: *** No rule to make target 'modules.builtin', needed by '/tmp/kernel/x86_64-randconfig-003-20250528/clang-20/0f04dfcaa62efc3a521b20ba0b39b2a78c4389db/lib/modules/6.15.0-rc7-00019-g0f04dfcaa62e/modules.builtin'.
>    make[3]: Target '__modinst' not remade because of errors.
>    make[2]: *** [Makefile:1909: modules_install] Error 2 shuffle=3457807955
>    make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3457807955
>    make[1]: Target 'modules_install' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2 shuffle=3457807955
>    make: Target 'modules_install' not remade because of errors.

Original patch series was for v6.15:

base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca 

But I separately tried testing the patchset with the brunch [1] and the
attached config and could not reproduce the problem.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=for-next&id=40617439d572645207c1866dfb086de0be438a14

-- 
Rgrds, legion

