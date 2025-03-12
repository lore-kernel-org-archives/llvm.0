Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05E1C32;
	Wed, 12 Mar 2025 05:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741759048; cv=none; b=WeJfLG45Zr3pfnGHwEmMCmJU73GnbPjUSmQlt86nu9/wQWbajEzK7gTOxRL2mtJyyu/FytKd3jOJkQsiGX8ydd8rEXiErAs8xbMintJbK9YUzprhuSsQ0HjydERyZo0nSNT2r4czuB83olQobP0Vudbua+r3ENuXzT7EgRXW/RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741759048; c=relaxed/simple;
	bh=7/v4JVkTn+NkPhGPwtgahdcMMQDg9/rvMF8GXh/YpDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmdIxepQOs987tE1qfjQrUH9cQolBBUIyQhFkycSqlvYru1hZ7fpRwmoBtAclr52udpaRpAm8Uj5EmscegivM0OBQa8U7Ci0Os2+vxCWkSf760ssQg4RYSZO/JlYlE8zZdyofLuAKnDmuRhDEjjQtcO4p1zR3++5yk+l3D9P7iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trhC+lZ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trhC+lZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD15C4CEE3;
	Wed, 12 Mar 2025 05:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741759048;
	bh=7/v4JVkTn+NkPhGPwtgahdcMMQDg9/rvMF8GXh/YpDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trhC+lZ5Ldj1qWI0DMtowVTk61E6O33eBeURYG+Z62rAVOZsQVJR9E8vnhDDtA3dX
	 MJ7UspvtAeVBEmNi9JcR+3xHG7jWB2qY4fcwiMiKSmljfSe2fZvpj9UdhjBFjReLNy
	 9L39Mfl1/vOJz0QZ1ZrwvBkdfAwdXpwL38JHd2oBYZ08FuYcdyBIOoIvGNH82vEGB8
	 cHBbswbVaRJ1F/5VD6wY+gOO6mW3Gni3f2GCmtfpbncMOMw/dEHV7UG/Fr7qqmYRQB
	 c+ZNNkCU59jIyjxPQB7lusUF8qi18h5/iIHu2x6C0tOiChyLhgL4BUfAjvKHOINlcU
	 Tx7m7clvQhvvQ==
Date: Wed, 12 Mar 2025 07:57:24 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Stuart Yoder <stuart.yoder@arm.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9090/10334] ld.lld: error: undefined symbol:
 tpm_crb_ffa_init
Message-ID: <Z9EiRDuWfPOkcjXN@kernel.org>
References: <202503120916.TnY8Xobl-lkp@intel.com>
 <Z9EhqAxJjbsUiuC_@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9EhqAxJjbsUiuC_@kernel.org>

On Wed, Mar 12, 2025 at 07:54:52AM +0200, Jarkko Sakkinen wrote:
> On Wed, Mar 12, 2025 at 09:51:04AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   eea255893718268e1ab852fb52f70c613d109b99
> > commit: 9b2015ee9b5bba20097ea1e1f4188067624f4fa3 [9090/10334] tpm_crb: add support for the Arm FF-A start method
> > config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250312/202503120916.TnY8Xobl-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120916.TnY8Xobl-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202503120916.TnY8Xobl-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> ld.lld: error: undefined symbol: tpm_crb_ffa_init
> >    >>> referenced by tpm_crb.c
> >    >>>               drivers/char/tpm/tpm_crb.o:(crb_acpi_add) in archive vmlinux.a
> > --
> > >> ld.lld: error: undefined symbol: tpm_crb_ffa_start
> >    >>> referenced by tpm_crb.c
> >    >>>               drivers/char/tpm/tpm_crb.o:(__crb_request_locality) in archive vmlinux.a
> >    >>> referenced by tpm_crb.c
> >    >>>               drivers/char/tpm/tpm_crb.o:(__crb_relinquish_locality) in archive vmlinux.a
> >    >>> referenced by tpm_crb.c
> >    >>>               drivers/char/tpm/tpm_crb.o:(crb_send) in archive vmlinux.a
> >    >>> referenced 1 more times
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> Stuart, I did not go through this but this does not look correct even with
> a quick peak:
> 
> config TCG_ARM_CRB_FFA                                                                                                                                                         
>        ~~~~~~~~~~~~~~~
>        TCG_FTPM_FFA (and Kconfig put before TCG_FTPM_TEE)
> 
> 
>         tristate "TPM CRB over Arm FF-A Transport"                                                                                                                             
>         depends on ARM_FFA_TRANSPORT                                                                                                                                           
>         default y if (TCG_CRB && ARM_FFA_TRANSPORT)                                                                                                                            
>                                  ~~~~~~~~~~~~~~~~~
> 				 redundant given "depends on"
> 
>         help                                                                                                                                                                   
>           If the Arm FF-A transport is used to access the TPM say Yes.                                                                                                         
>           To compile this driver as a module, choose M here; the module                                                                                                        
>           will be called tpm_crb_ffa.                                                                                                                                          
> 
> So I'll drop the whole series from my tree for the moment and you'll
> have to respin.

Commit could use short summary in along the lines of:

"tpm: ftpm_ffa: <summary>"

BR, Jarkko
