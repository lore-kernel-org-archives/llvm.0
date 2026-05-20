Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A99374192;
	Wed, 20 May 2026 22:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316067; cv=none; b=Md/9zih0QFmV8PCk6egBKdYBFm54J1ZeQGtFgx1uWciHNIljikBpkz8vqvqNE9T3besxPu5skRKsoJT1Bk+do9TYmnDTL3t29A94wgaEcXf0YX++a6sODJUdrO0g38TrefWvyhtXQd8/6ADUj+4o4JOwp5jb6WlLFAKiQUaQNYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316067; c=relaxed/simple;
	bh=45e2iIXXwL+4GZlXJtvvyWj1J9e1ROrHdHdi57Hb3eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpUkDqQfcj+2ox61qdx6LX6PRYK666IaKx5KIvEP019bYxjHT9JwBahXOeCpjpmR2SBkhlg/n9nP5M71FzPThM/PumtoaTd8dHcxk71/L7qo7Vo5O/XBEtgEXqyLe3n2lPlQ9bMgsuGjMRS/PW9ycJfuivZO7VJ01kQVedytyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qz9fQrjk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qz9fQrjk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E229B1F000E9;
	Wed, 20 May 2026 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779316066;
	bh=j5GCAZK/Nq8zx5Np3k4/p1YoRM8+HwgPIuGzPsoBJ6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qz9fQrjklL4LH0FnY6wzBNhP74JgqNr4+DAfWOC4gUnEyp0oMK7sNVaoqtLYokajl
	 nHGXWkDBJUwozrV3QLFMF/xPEh644pyuIC9x6fI9QtiseTgCTCAqWXJnN8LCDx8xcz
	 5loghrKqhydTOAoVx2DFC6E1QHFXty406NKU12btl5VKzzBU6Lh4fkP3O4214+PXaS
	 9FBrNyy+T3I5gFR0SKgzqiVIYx6waDsSu4xp9P/v5ojrfMqGGt1oIDt4K5KjSgqKGn
	 QkJyj+E+lkPL3DR5C00WrkD043jy3ZsbEDVWh0pMr1TofTjKHSJ4iChFRMpicb7zq2
	 4dgK5xwjy0WiQ==
Date: Wed, 20 May 2026 15:27:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: kernel test robot <lkp@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 5548/6445] kernel/dma/contiguous.c:139:13:
 warning: variable 'numa_cma_configured' set but not used
Message-ID: <20260520222742.GA1607511@ax162>
References: <202605200341.a1HLq7XC-lkp@intel.com>
 <ag0_qU5BS9KBBiWK@U-2FWC9VHC-2323.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag0_qU5BS9KBBiWK@U-2FWC9VHC-2323.local>

On Wed, May 20, 2026 at 12:59:21PM +0800, Feng Tang wrote:
> On Wed, May 20, 2026 at 03:13:09AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   6a50ba100ace43f43c87384367eb2d2605fcc16c
> > commit: 38ce91195a7c6f76fa88ef5c03bad0bbabbf5556 [5548/6445] dma-contiguous: add kconfig option to setup numa cma area if not configured explicitly
> > config: s390-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605200341.a1HLq7XC-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> kernel/dma/contiguous.c:139:13: warning: variable 'numa_cma_configured' set but not used [-Wunused-but-set-global]
> >      139 | static bool numa_cma_configured;
> >          |             ^
> >    1 warning generated.
> 
> Thanks for the catch!
> 
> In this config, CONFIG_CMA_SIZE_PERNUMA is not set, which triggers the
> warning.
> 
> The patch below should fix it.
> 
> Hi Marek,
> 
> Could you help to squash this follow-on fix patch, or I can send
> you a modified new version of the original patch? Thanks!
> 
> - Feng
> 
> ---
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 42227c823893..f286d49bf068 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -136,7 +136,7 @@ static struct cma *dma_contiguous_numa_area[MAX_NUMNODES];
>  static phys_addr_t numa_cma_size[MAX_NUMNODES] __initdata;
>  static struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];
>  static phys_addr_t pernuma_size_bytes __initdata;
> -static bool numa_cma_configured;
> +static bool __maybe_unused numa_cma_configured;
>  
>  static int __init early_numa_cma(char *p)
>  {
> 

I know Marek already updated this but I think a better solution would
have been turning the '#ifdef' into IS_ENABLED(), as I don't see a
reason for this code to be ifdef'd, none of these variables are
undeclared or unusable when CONFIG_CMA_SIZE_PERNUMA is unset. This would
allow the compiler to always see the variable as used, regardless of the
value of CONFIG_CMA_SIZE_PERNUMA.

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 42227c823893..d6435c1eabe3 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -202,11 +202,10 @@ static void __init dma_numa_cma_reserve(void)
 {
 	int nid;
 
-#ifdef CONFIG_CMA_SIZE_PERNUMA
-	if (!numa_cma_configured && dma_contiguous_default_area
+	if (IS_ENABLED(CONFIG_CMA_SIZE_PERNUMA) &&
+	    !numa_cma_configured && dma_contiguous_default_area
 	    && nr_online_nodes > 1)
 		pernuma_size_bytes = cma_get_size(dma_contiguous_default_area);
-#endif
 
 	for_each_node(nid) {
 		int ret;
-- 
Cheers,
Nathan
