Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B4443E3B;
	Thu, 15 Oct 2026 21:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099531; cv=none; b=DZ2ZAtS12dWyyznnMbR/q3uFiLLkhKnyNLsPVQRhEtdQXYsQcAglsfoFNGhTBLjX4SbPP4RQv7PYzTVj8vk5gzEoaf05MeUFKVTJ57OFifvZJ5EVf6Lm1Eh0UMgmbTvAJS8A6ux4nvDaAhd60QP9pubtLZuwApuZvdP5uZ59MVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099531; c=relaxed/simple;
	bh=jgHtsMpPFB4Z9TWMvS6irJPcZDzd0toIbmE5qbqa/Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/LZiuq1R0u45ezPnJX8fJN0W0G8cT6zNVQyi4TNVN6YdVtAwxzfBOcAmv/egi6RgVyvdiAMgBxaUJcdE+iUIb4H3CrXTLDUdNuBF/Eu+bFassRqBtKB7Gc/COkFsSGpKrCc1J1QOvUSXLxRDRTuap9qPzIiN+EhosfvR1B5Ggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmI3HG99; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmI3HG99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5371F000C4;
	Thu, 15 Oct 2026 21:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792099530;
	bh=JtlG37bFDT1nJGArYVo1/AEcEyqGhLzCSN7KTgGMzBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UmI3HG99wlr47IcaLawHsU/ZmxyrsxU2dpyCm3mJe6O4RnExTHiafIYdkOWr61eo8
	 X9C8oxMZ7ylKM6WOtJXzuRtywcIiPT0WIoZ0/s2WvtK6DkrplnrRvID4RItxnk4HPv
	 SPvEIIUgsOsD1Jo4HTWcxXVciEh76w77YHnBWqzxMc+jEubgLfzRXh4vtl/b86ubJs
	 MuuXzJt7zxZq5mz4R8ttG1yopj4DalhTiyV5BsLXGMhZgV1KiaRK5hqxzxizOb2ag0
	 ioSnjncTvc0d+gLM8hvXoRKZLY4fYxpi+OFm55KLxHqPcLjKFQKu9zP7gGBVelip9f
	 I6HClOU07AUkw==
Date: Thu, 15 Oct 2026 14:25:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
Message-ID: <20261015212525.GA322951@ax162>
References: <202609040258.xw9R4qaZ-lkp@intel.com>
 <20261008162013.GA1660409@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008162013.GA1660409@ax162>

On Thu, Oct 08, 2026 at 06:20:17PM +0200, Nathan Chancellor wrote:
> Hi Rong,
> 
> This is the build report I mentioned at LPC, please take a look. The
> original report is available at:
> 
>   https://lore.kernel.org/202609040258.xw9R4qaZ-lkp@intel.com/
> 
> but I have also included it below.

This should be fixed by commit 4bcfe2902199 ("iommupt/kunit: Use
if_changed_rule for the kunit") in Linus's tree (same root cause,
different error from what I can tell).

  https://git.kernel.org/linus/4bcfe29021993cb167fd9bbdb849f7d7247a166f

> On Fri, Sep 04, 2026 at 02:32:03AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   940de590b839f71d6dc846160534bf202401b8b7
> > commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
> > date:   3 months ago
> > config: arm64-randconfig-003-20260830 (https://download.01.org/0day-ci/archive/20260904/202609040258.xw9R4qaZ-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260904/202609040258.xw9R4qaZ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202609040258.xw9R4qaZ-lkp@intel.com/
> > 
> > All error/warnings (new ones prefixed by >>):
> > 
> >    warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
> > >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
> >     [-Wlinker-warnings]
> > >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
> >     [-Wlinker-warnings]
> > >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
> >     [-Wlinker-warnings]
> > >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
> >     [-Wlinker-warnings]
> > >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'

-- 
Cheers,
Nathan
