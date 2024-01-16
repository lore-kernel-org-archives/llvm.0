Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4CA67C4A;
	Tue, 16 Jan 2024 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705445739; cv=none; b=VcwA/nANt3H5KIRnShFRoW0o+ZWnvBTemDnuichZpfZGbpW1YtnGVXIrXY5p3gFn0FwPKCS3O0mqCi8MJHhN5IKsjn6S/D/ehIfJC/aT204nYuemFN7p/L87D3BAPWZCouM74+piLdLxcGivzv00XKE8FxTcMRUMQFgWslU6lYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705445739; c=relaxed/simple;
	bh=71axzYVePkdOhXMyOm7/PfyST3HfK/W4XQ2iKAJiU0s=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=N3iZiE6BHXrfy6ylrcz7lb/T8Q5MZuXwXx3Hrjt/ScmJGZQ6m4E0N6i/8N+cZJ9wepdTMW7Bhnc0LCYpzMMWiDJF6Cfd7uKSUejNe9zMv6oeLD82bDef8Avtk8PqIb9jyaXs5Cs79yIEWwbIsi29IRaFOmMzQT8Npj9AeWNx36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLGsK5J+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLGsK5J+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445C7C433F1;
	Tue, 16 Jan 2024 22:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705445738;
	bh=71axzYVePkdOhXMyOm7/PfyST3HfK/W4XQ2iKAJiU0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLGsK5J+EP+401FSdThFWDtXa1RvlnNZRWk8bybGaNlA8eOPFr/thZBeSr7cyvV18
	 CVUCSl5fQeyaIK/0XLCKar8Up6SjXQEiJbK+s7DZkAHap/kZsRkZO8NRYvyVRjd/hn
	 I3btsF6mhppjjjWDTgPxG/qx4+tGAFqE2hNpR70VRTHaIV92AkQMWL+f/ep81BPC5e
	 1XdFB/YFrG4hmRfTLD/pk+RsFFSOVMfJCn3wkGPI55ICwNVrq0HZ3d2gnQAhwkyD94
	 3ouQrx7i2vILyFrFEbzlaVmde8pKtFY+n7QL9F5wFD6yObxSc0m1phRNcaXRaWOPsZ
	 4jkcvksR4VuEQ==
Date: Tue, 16 Jan 2024 15:55:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yury Norov <yury.norov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 22/23] lib/group_cpus.c:352:16:
 error: array initializer must be an initializer list
Message-ID: <20240116225536.GA3108998@dev-arch.thelio-3990X>
References: <202401140117.pwAcsXAT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401140117.pwAcsXAT-lkp@intel.com>

On Sun, Jan 14, 2024 at 01:40:11AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   3d69c575710800c9a4a58e94c157697310e32027
> commit: a868f9c8816cb72f983d1ff940b0938737fe8ee7 [22/23] lib/group_cpus: fix initialization section in group_cpus_evenly()
> config: i386-randconfig-011-20240113 (https://download.01.org/0day-ci/archive/20240114/202401140117.pwAcsXAT-lkp@intel.com/config)
> compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140117.pwAcsXAT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401140117.pwAcsXAT-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> lib/group_cpus.c:352:16: error: array initializer must be an initializer list
>      352 |         cpumask_var_t npresmsk __free(free_cpumask_var) = NULL;
>          |                       ^
>    1 error generated.

Not a compiler specific error, as evidenced by the GCC report:

https://lore.kernel.org/202401160231.mSAgDn9b-lkp@intel.com/

Neither configuration has CONFIG_CPUMASK_OFFSTACK, which is not going to
be enabled for most configurations, as it is not user selectable without
CONFIG_DEBUG_PER_CPU_MAPS and there are only a few conditions where it
is force selected. In other words, I suspect this error is going to be
quite widespread if it hits -next. I can still reproduce it at the
current mm-nonmm-unstable, commit 08be2d243fb7 ("lib/sort: Optimize
heapsort with double-pop variation").

Cheers,
Nathan
