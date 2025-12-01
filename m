Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B801121C17D;
	Mon,  1 Dec 2025 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764616256; cv=none; b=hjU3l8YA1EQHeK8R6mqE3x6cDvkLfH8V7Ge2gYR5IPYJmxP20NivCkJNFHKD8OxZjDF9+RXofgcDbjjUZ7SrX2wLAUNf1vFMTGeLqz+0KeZA5i61Y9u2vuVWYgt1NMxsvbkH21yU33rTXSc1cw0emVyz9c7fVTOW10p6QflMTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764616256; c=relaxed/simple;
	bh=3uLftGmXOJVyk3JM6exrsoORdteRFaEjZfuhX0PK5Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxTH2rJIA3gdailvYFk8hquo8Z3VzZlRhlyOcaNvraOB2Cpu54bZ1KBLZyd+rRxesMm/d8x0KTlopLwvu9Q3O4zR3sxvfSg7tFDLpmeu2MpVVcCb86Z/JV9ZMtQ9VPoKCRhVLwd0lirjY4td9hnSAtIl0zNnyV6EpdCep01IsLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPBV4eFB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPBV4eFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AA3C4CEF1;
	Mon,  1 Dec 2025 19:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764616256;
	bh=3uLftGmXOJVyk3JM6exrsoORdteRFaEjZfuhX0PK5Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPBV4eFBZt3lu0SaKfidmAoDBiMG70orPFB2cKx/G0UQ9ROBSvdLAs7Sr/LucVAJe
	 xq6i9jQTqmdHtOETnFDMPgDlUoZ/qV+eL0ZuxdJTjDotoH5N3B60P7Dhwoc4ltGQS3
	 kzaqGZNWVOTwmTVl4sgpcK7J2s26CGYDQFKP15nbb5BHx3I0ynzex9RdZX8p3T0ICd
	 nyQGHmAWRIJpauTDiZFo0mfsbcLRyqZ5AyhU6MJKnZy5N4oS08M1ZgjPuZABT9cjto
	 JqLHj06CEzlP91WCSn0nxXx2z3h8W8VEwCMcDcjKO88ASOm68K3FeY/fZfOYcHA1wG
	 Cg1lLyO9zFs8A==
Date: Mon, 1 Dec 2025 12:10:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Seven Lee <wtli@nuvoton.com>, Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 11929/12398]
 sound/soc/codecs/nau8325.c:430:13: warning: variable 'n2_max' is
 uninitialized when used here
Message-ID: <20251201191052.GA2727778@ax162>
References: <202511271353.g6GYVUt6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511271353.g6GYVUt6-lkp@intel.com>

On Thu, Nov 27, 2025 at 01:50:44PM +0800, kernel test robot wrote:
> Hi Jaroslav,
> 
> First bad commit (maybe != root cause):

Indeed, this appears to be a problem from commit c0a3873b9938 ("ASoC:
nau8325: new driver"), it was simply not visible before the driver was
actually hooked into the build system.

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
> commit: cd41d3420ef658b2ca902d7677536ec8e25b610a [11929/12398] ASoC: nau8325: add missing build config
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251127/202511271353.g6GYVUt6-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271353.g6GYVUt6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511271353.g6GYVUt6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> sound/soc/codecs/nau8325.c:430:13: warning: variable 'n2_max' is uninitialized when used here [-Wuninitialized]
>      430 |                 *n2_sel = n2_max;
>          |                           ^~~~~~
>    sound/soc/codecs/nau8325.c:389:52: note: initialize the variable 'n2_max' to silence this warning
>      389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
>          |                                                           ^
>          |                                                            = 0
> >> sound/soc/codecs/nau8325.c:431:11: warning: variable 'ratio_sel' is uninitialized when used here [-Wuninitialized]
>      431 |                 ratio = ratio_sel;
>          |                         ^~~~~~~~~
>    sound/soc/codecs/nau8325.c:389:44: note: initialize the variable 'ratio_sel' to silence this warning
>      389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
>          |                                                   ^
>          |                                                    = 0
>    2 warnings generated.

This warning seems legitimate even though it seems like there is no harm
at runtime?

> vim +/n2_max +430 sound/soc/codecs/nau8325.c
> 
> c0a3873b9938bf Seven Lee 2024-03-27  384  
> c0a3873b9938bf Seven Lee 2024-03-27  385  static int nau8325_clksrc_choose(struct nau8325 *nau8325,
> c0a3873b9938bf Seven Lee 2024-03-27  386  				 const struct nau8325_srate_attr **srate_table,
> c0a3873b9938bf Seven Lee 2024-03-27  387  				 int *n1_sel, int *mult_sel, int *n2_sel)
> c0a3873b9938bf Seven Lee 2024-03-27  388  {
> c0a3873b9938bf Seven Lee 2024-03-27  389  	int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
> c0a3873b9938bf Seven Lee 2024-03-27  390  
> c0a3873b9938bf Seven Lee 2024-03-27  391  	if (!nau8325->mclk || !nau8325->fs)
> c0a3873b9938bf Seven Lee 2024-03-27  392  		goto proc_err;
> c0a3873b9938bf Seven Lee 2024-03-27  393  
> c0a3873b9938bf Seven Lee 2024-03-27  394  	/* select sampling rate and MCLK_SRC */
> c0a3873b9938bf Seven Lee 2024-03-27  395  	*srate_table = target_srate_attribute(nau8325->fs);
> c0a3873b9938bf Seven Lee 2024-03-27  396  	if (!*srate_table)
> c0a3873b9938bf Seven Lee 2024-03-27  397  		goto proc_err;
> c0a3873b9938bf Seven Lee 2024-03-27  398  
> c0a3873b9938bf Seven Lee 2024-03-27  399  	/* First check clock from MCLK directly, decide N2 for MCLK_SRC.
> c0a3873b9938bf Seven Lee 2024-03-27  400  	 * If not good, consider 1/N1 and Multiplier.
> c0a3873b9938bf Seven Lee 2024-03-27  401  	 */
> c0a3873b9938bf Seven Lee 2024-03-27  402  	ratio = nau8325_clksrc_n2(nau8325, *srate_table, nau8325->mclk, n2_sel);
> c0a3873b9938bf Seven Lee 2024-03-27  403  	if (ratio != NAU8325_MCLK_FS_RATIO_NUM) {
> c0a3873b9938bf Seven Lee 2024-03-27  404  		*n1_sel = 0;
> c0a3873b9938bf Seven Lee 2024-03-27  405  		*mult_sel = CLK_PROC_BYPASS;
> c0a3873b9938bf Seven Lee 2024-03-27  406  		*n2_sel = MCLK_SRC;
> c0a3873b9938bf Seven Lee 2024-03-27  407  		goto proc_done;
> c0a3873b9938bf Seven Lee 2024-03-27  408  	}
> c0a3873b9938bf Seven Lee 2024-03-27  409  
> c0a3873b9938bf Seven Lee 2024-03-27  410  	/* Get MCLK_SRC through 1/N, Multiplier, and then 1/N2. */
> c0a3873b9938bf Seven Lee 2024-03-27  411  	mclk_max = 0;
> c0a3873b9938bf Seven Lee 2024-03-27  412  	for (i = 0; i < ARRAY_SIZE(mclk_n1_div); i++) {
> c0a3873b9938bf Seven Lee 2024-03-27  413  		for (j = 0; j < ARRAY_SIZE(mclk_n3_mult); j++) {
> c0a3873b9938bf Seven Lee 2024-03-27  414  			mclk = nau8325->mclk << mclk_n3_mult[j].param;
> c0a3873b9938bf Seven Lee 2024-03-27  415  			mclk = mclk / mclk_n1_div[i].param;
> c0a3873b9938bf Seven Lee 2024-03-27  416  			ratio = nau8325_clksrc_n2(nau8325,
> c0a3873b9938bf Seven Lee 2024-03-27  417  						  *srate_table, mclk, n2_sel);
> c0a3873b9938bf Seven Lee 2024-03-27  418  			if (ratio != NAU8325_MCLK_FS_RATIO_NUM &&
> c0a3873b9938bf Seven Lee 2024-03-27  419  			    (mclk_max < mclk || i > *n1_sel)) {
> c0a3873b9938bf Seven Lee 2024-03-27  420  				mclk_max = mclk;
> c0a3873b9938bf Seven Lee 2024-03-27  421  				n2_max = *n2_sel;
> c0a3873b9938bf Seven Lee 2024-03-27  422  				*n1_sel = i;
> c0a3873b9938bf Seven Lee 2024-03-27  423  				*mult_sel = j;
> c0a3873b9938bf Seven Lee 2024-03-27  424  				ratio_sel = ratio;
> c0a3873b9938bf Seven Lee 2024-03-27  425  					goto proc_done;

n2_max and ratio_sel are only assigned in this if block, which ends in
an unconditional jump to proc_done...

> c0a3873b9938bf Seven Lee 2024-03-27  426  			}
> c0a3873b9938bf Seven Lee 2024-03-27  427  		}
> c0a3873b9938bf Seven Lee 2024-03-27  428  	}
> c0a3873b9938bf Seven Lee 2024-03-27  429  	if (mclk_max) {
> c0a3873b9938bf Seven Lee 2024-03-27 @430  		*n2_sel = n2_max;
> c0a3873b9938bf Seven Lee 2024-03-27 @431  		ratio = ratio_sel;
> c0a3873b9938bf Seven Lee 2024-03-27  432  		goto proc_done;
> c0a3873b9938bf Seven Lee 2024-03-27  433  	}

which will always skip this if block, so if this if statement is taken,
these values are genuinely uninitialized.

However, as far as I can tell, if the first if statement is not taken,
mclk_max will be 0, so it seems like this if statement is never taken
and is dead code? At the same time, won't 'mclk_max < mclk' always be
true unless mclk itself is 0, so what purpose does mclk_max serve
otherwise? Was it intentional that the first if statement ends in a jump
to proc_done? It looks like the value of n2_max is never actually used
outside of this dead if statement.

> c0a3873b9938bf Seven Lee 2024-03-27  435  proc_err:
> c0a3873b9938bf Seven Lee 2024-03-27  436  	dev_dbg(nau8325->dev, "The MCLK %d is invalid. It can't get MCLK_SRC of 256/400/500 FS (%d)",
> c0a3873b9938bf Seven Lee 2024-03-27  437  		nau8325->mclk, nau8325->fs);
> c0a3873b9938bf Seven Lee 2024-03-27  438  	return -EINVAL;
> c0a3873b9938bf Seven Lee 2024-03-27  439  proc_done:
> c0a3873b9938bf Seven Lee 2024-03-27  440  	dev_dbg(nau8325->dev, "nau8325->fs=%d,range=0x%x, %s, (n1,mu,n2,dmu):(%d,%d,%d), MCLK_SRC=%uHz (%d)",
> c0a3873b9938bf Seven Lee 2024-03-27  441  		nau8325->fs, (*srate_table)->range,
> c0a3873b9938bf Seven Lee 2024-03-27  442  		(*srate_table)->max ? "MAX" : "MIN",
> c0a3873b9938bf Seven Lee 2024-03-27  443  		*n1_sel == CLK_PROC_BYPASS ?
> c0a3873b9938bf Seven Lee 2024-03-27  444  		CLK_PROC_BYPASS : mclk_n1_div[*n1_sel].param,
> c0a3873b9938bf Seven Lee 2024-03-27  445  		*mult_sel == CLK_PROC_BYPASS ?
> c0a3873b9938bf Seven Lee 2024-03-27  446  		CLK_PROC_BYPASS : 1 << mclk_n3_mult[*mult_sel].param,
> c0a3873b9938bf Seven Lee 2024-03-27  447  		1 << mclk_n2_div[*n2_sel].param,
> c0a3873b9938bf Seven Lee 2024-03-27  448  		(*srate_table)->mclk_src[ratio],
> c0a3873b9938bf Seven Lee 2024-03-27  449  		(*srate_table)->mclk_src[ratio] / nau8325->fs);
> c0a3873b9938bf Seven Lee 2024-03-27  450  
> c0a3873b9938bf Seven Lee 2024-03-27  451  	return 0;
> c0a3873b9938bf Seven Lee 2024-03-27  452  }
> c0a3873b9938bf Seven Lee 2024-03-27  453  

Cheers,
Nathan
