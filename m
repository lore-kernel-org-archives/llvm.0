Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AAC1EF18;
	Fri, 29 Mar 2024 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711725655; cv=none; b=i7lYKyctRSRRzLQioFa+45eIfUzxlOF/SA56+nCbSlWa2Hk7INCRgyA1syXrYwRXOwORXpB7qhpr+wXcRFzwEwalIthbG2yV3Zqqxp/5c3TpzubKac4zOQDqkIT5S7rL4RQknB4OZ429Qq8XYhVbqBrcPzlGMlGAmN20iDe28dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711725655; c=relaxed/simple;
	bh=elk4O8ldjRsGOOlvj7PoV+qUErEmIXYWvcH0D1uSAp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhfEfosI3vHnSDOr4wmpAb9VC4A8EgYj8nvtq5OSemCF4PQQRDcnPCK+g8Dr/GubzIDymndWRWweyYX+50wc9tpEOlSow/aGIjGVzqb5MDAfE4eOJ4nPsGosDOCR6RDO77zJRnCpRjwWWCC8LF+7rbeF8DFqqvHtvX3HM1hVtes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWu0qeVl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWu0qeVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D30C433C7;
	Fri, 29 Mar 2024 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711725655;
	bh=elk4O8ldjRsGOOlvj7PoV+qUErEmIXYWvcH0D1uSAp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWu0qeVlS2QpuPMgdJra37yWLdB9drjwN3jzr7XXD01dWbMJJOJ+Y2IvRN3sl0FVS
	 Bd4gfzAl+nkMDFwc3PDEYY7yJ7Ev7wYOMLROYMDVvXhpyhLOb4n2heZ9yjUnkzujjy
	 0bP8eeyOOuDE9l/TZlRhukEoTBw82QIPkA9863g7/K5Kvb5UXK1K4YcyDm2a1Sc+qq
	 2oTpJSHtl/qX8F/iCr41L/C/zDMxSKB+Vtw1TWwfbOFQn+BEH5SgraTSwyKBlTTJ8z
	 jqhsLUuT6ibTfh4PWgjePCpZdDN1Ju5axmNKQcvF63uQNoIE3iVq9Q0oSHlKsdodwX
	 Ef7s3Riaic//A==
Date: Fri, 29 Mar 2024 08:20:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [akpm-mm:mm-nonmm-unstable 53/62]
 lib/raid6/recov_neon_inner.c:7:10: fatal error: 'arm_neon.h' file not found
Message-ID: <20240329152053.GA2647510@dev-arch.thelio-3990X>
References: <202403291210.ioK7bfPA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403291210.ioK7bfPA-lkp@intel.com>

On Fri, Mar 29, 2024 at 12:27:57PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   b065e14a3960a495216a032e6d383c104147c9ef
> commit: aa73a95380b4ef76ccf00344b777d0d415026b7b [53/62] lib/raid6: use CC_FLAGS_FPU for NEON CFLAGS
> config: arm-randconfig-002-20240329 (https://download.01.org/0day-ci/archive/20240329/202403291210.ioK7bfPA-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291210.ioK7bfPA-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403291210.ioK7bfPA-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> lib/raid6/recov_neon_inner.c:7:10: fatal error: 'arm_neon.h' file not found
>        7 | #include <arm_neon.h>
>          |          ^~~~~~~~~~~~
>    1 error generated.

Looks like the CFLAGS for recov_neon_inner.o got lost. This resolves it
for me.

Cheers,
Nathan

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index c71984e04c4d..0e88bfe6445b 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -60,10 +60,12 @@ CFLAGS_neon1.o += $(CC_FLAGS_FPU)
 CFLAGS_neon2.o += $(CC_FLAGS_FPU)
 CFLAGS_neon4.o += $(CC_FLAGS_FPU)
 CFLAGS_neon8.o += $(CC_FLAGS_FPU)
+CFLAGS_recov_neon_inner.o += $(CC_FLAGS_FPU)
 CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
 CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
 CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
 CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_recov_neon_inner.o += $(CC_FLAGS_NO_FPU)
 targets += neon1.c neon2.c neon4.c neon8.c
 $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
