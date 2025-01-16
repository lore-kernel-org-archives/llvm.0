Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10161DE2CB;
	Thu, 16 Jan 2025 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025041; cv=none; b=gNs048ln+KR82Iku3aRRp8pfl+IPaZBwdFIgOcKPMBWopkO41hu1u2UUXty7ovsxAB0t612Axo3IvfB6pbvHLukizq66AshmtnaHimpv8GVl5eXlUFrufN0lr+6pQGbYmY6s/nDPWClxgdi03HRljWqznYcVaPnZcb054kKymGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025041; c=relaxed/simple;
	bh=+cwl+/TAusAxNpf5a0h0qk5ppnQfYx2bbBS+GsbDGiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jomj6maDReVeIzs8qntQzBmzFIBpm0/momqAWFxVOd6QSi6TtJGb1n6AkjNpW3VE4Qh3nJpsSzT5MD7iA8ZEPXG/uZg8/oY8DEZaGmdBTJSO5CcX4kW2rENHl9EFoGVoXvB/Ww9ARe+OeAIirsH7WhUS+mRGCuDtnM7knA/AeRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sp/NjVL6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sp/NjVL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1216C4CED6;
	Thu, 16 Jan 2025 10:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737025040;
	bh=+cwl+/TAusAxNpf5a0h0qk5ppnQfYx2bbBS+GsbDGiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sp/NjVL6+yPog7LojOU6wDzXSaoou2n//xaa4dP2R3pWA6eaKk7b/Tf2o+T2uc+i6
	 UjAr4zx/u3OGwHQ7psW29YhNLYed1NT/3d2Zm4GPkpuw23OnEw3qyhiNaOZrkD9DTF
	 sGdqALJgxEj2IvyGhAvfduwGvPRoeS4anj3bud70EttAIt3feOJK3+ZSTqwm58EbER
	 6NfjyJ/0NA1g8FIa9Bs8JhOYKf8dnkBIrBFgHU38pogEboUq/Pxw0uMVvceJZlrVLT
	 q0cl0UWIE4UajUzgQqp+YxcjRbOdHeXY46plw35ZEww3ZM+c5El91ae2M//BCJtygC
	 dmwXvw8kMfY8w==
Date: Thu, 16 Jan 2025 11:57:15 +0100
From: Joel Granados <joel.granados@kernel.org>
To: yukaixiong <yukaixiong@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: Re: [sysctl:sysctl-testing 8/16] mm/nommu.c:394:12: error:
 static declaration of 'sysctl_nr_trim_pages' follows non-static declaration
Message-ID: <j6n4ndo23wepa4vly2wcze23grybhucgd4mvk3crxmz6cfuk3m@d5dr4q2tafbt>
References: <202501150216.3RVz44uS-lkp@intel.com>
 <34e7c573-8af8-dab9-d435-ffa50e9efea2@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34e7c573-8af8-dab9-d435-ffa50e9efea2@huawei.com>

On Wed, Jan 15, 2025 at 04:14:09PM +0800, yukaixiong wrote:
> 
> 
> On 2025/1/15 2:39, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-testing
> > head:   2fc99f285719e0cce8df1fe21479cb9e6626c2fe
> > commit: 0450345eca3ca45264db9ab09d31281e001236b7 [8/16] mm: nommu: move sysctl to mm/nommu.c
> > config: arm-randconfig-001-20250115 (https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/config)
> > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501150216.3RVz44uS-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > > > mm/nommu.c:394:12: error: static declaration of 'sysctl_nr_trim_pages' follows non-static declaration
> >     static int sysctl_nr_trim_pages = CONFIG_NOMMU_INITIAL_TRIM_EXCESS;
> >                ^
> >     include/linux/mm.h:4082:12: note: previous declaration is here
> >     extern int sysctl_nr_trim_pages;
> >                ^
> >     1 error generated.
> Help me!
> 
> Hi all;
> 
>         I have deleted the line : "extern int sysctl_nr_trim_pages;" in
> patch8 of v5. Why still produce this error? I don't understand!
Because I messed up and re-introduced the line when I resolved a merge
conflict.

> 
> Due to the environment configuration of the server, I have not installed the
> necessary setup for compilation and testing as mentioned in
> download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/reproduce.
> But I compile the code with the config
> as same as https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/config,
> and didn't find the error.
That is exactly my experience as well. But this is why we have the CI
that does a bigger sweep of configurations that I/we don't have.

> 
> my environment as shown as below:
> Linux ubuntu-2288H 5.13.0-40-generic #45~20.04.1-Ubuntu SMP Mon Apr 4
> 09:38:31 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
> 
> The compile steps as below:
> 
> 1. export ARCH=arm;export CROSS_COMPILE=arm-linux-gnueabihf-
> 2. cp ../stm32_config.log ./.config
> 3. make ARCH=arm olddefconfig
> 4. make -j200
> 
> the content of stm32_config.log is same as https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/config.
> no error as shown above. the compile result as  below shown:
> 
> yukaixiong@ubuntu-2288H:~/linux_next/linux-next$ file arch/arm/boot/zImage
> arch/arm/boot/zImage: Linux kernel ARM boot executable zImage
> (little-endian)
> yukaixiong@ubuntu-2288H:~/linux_next/linux-next$ file ./mm/nommu.o
> ./mm/nommu.o: ELF 32-bit LSB relocatable, ARM, EABI5 version 1 (SYSV), with
> debug_info, not stripped
> 
> Can you tell me the reason for the error? It would be best if you could
> directly tell me how to fix it.
Not on your side. I introduced and fixed the error. No worries.

> Can I fix this error by "git send-email -in-reply-to xxxxx" so that I don't
> need to send a new version?
Please do *not* send a new version. Your V5 did not have the error and
there is NO need to resend.

Best


-- 

Joel Granados
