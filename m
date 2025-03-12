Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A81DF721;
	Wed, 12 Mar 2025 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741758893; cv=none; b=Y/nf9I8jXjolRJh2qhL3vxLpraFfiCVHXaU6+Bh6NzPsne686JXn6XRXcyn3Y5rGaszAXJL6oXADZ1VvzD2tSlVPahwz3F8p1hwzk9ojpe242db/pGy17rWc4ox2Ms2NINfcq96e1h9dVWzCTwsxuVrIa/Z7A/z4G4S9x0JRDfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741758893; c=relaxed/simple;
	bh=vyWxhQdRY//26aG3d6bJ2kK9sfRyVEIOrkSJuEV2uY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZKH93v2yY0eTJ0dZVnBsboS5rPgORJW/74JiSdSGpi6ffEzLGPWd3fjlG4y/hBjBnXtAg1TPxF5YqV++kpk5VJ5DhdN+yaLIt97PVexkgD12liqcgkXwisi6d73jaD2Uh3eNccsEurVsKPZlyqdfxFV2BrNWrtMOOYvjxkAAJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhNDAQk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhNDAQk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32031C4CEE3;
	Wed, 12 Mar 2025 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741758892;
	bh=vyWxhQdRY//26aG3d6bJ2kK9sfRyVEIOrkSJuEV2uY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhNDAQk+LA2hbygFLud2kv3tvQY4bP+TGRzBDuPen37RP200k4WnHD8TMs0TePmga
	 4N0RUSsq0NMpV+58FSIl6nvPyvIRnw6E59tMm7uAPlQF7Ply1N8ElJiXSsQZiLJRMA
	 Y+XiKDevK0eaqNHlnyxmloW4zfkZgYHyQ5GO8Ol8H8we9K3dxMKnQhr2leDS0C7Shr
	 cwZ50Tpjsqa9TUF0ugPMlrK5FkkgL0xm9dbgcPHR2AG/ceV/7Wr8JM6euzEl9kYdsP
	 fszL0FBGmgnu6bSRaAF8gFfMOMQUXq8914MXdCoBF5WZT7ftfPo3CYeNHK3vKSyoRP
	 Ak8ID3r9cBA0w==
Date: Wed, 12 Mar 2025 07:54:48 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Stuart Yoder <stuart.yoder@arm.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9090/10334] ld.lld: error: undefined symbol:
 tpm_crb_ffa_init
Message-ID: <Z9EhqAxJjbsUiuC_@kernel.org>
References: <202503120916.TnY8Xobl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503120916.TnY8Xobl-lkp@intel.com>

On Wed, Mar 12, 2025 at 09:51:04AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   eea255893718268e1ab852fb52f70c613d109b99
> commit: 9b2015ee9b5bba20097ea1e1f4188067624f4fa3 [9090/10334] tpm_crb: add support for the Arm FF-A start method
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250312/202503120916.TnY8Xobl-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120916.TnY8Xobl-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503120916.TnY8Xobl-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: tpm_crb_ffa_init
>    >>> referenced by tpm_crb.c
>    >>>               drivers/char/tpm/tpm_crb.o:(crb_acpi_add) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: tpm_crb_ffa_start
>    >>> referenced by tpm_crb.c
>    >>>               drivers/char/tpm/tpm_crb.o:(__crb_request_locality) in archive vmlinux.a
>    >>> referenced by tpm_crb.c
>    >>>               drivers/char/tpm/tpm_crb.o:(__crb_relinquish_locality) in archive vmlinux.a
>    >>> referenced by tpm_crb.c
>    >>>               drivers/char/tpm/tpm_crb.o:(crb_send) in archive vmlinux.a
>    >>> referenced 1 more times
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Stuart, I did not go through this but this does not look correct even with
a quick peak:

config TCG_ARM_CRB_FFA                                                                                                                                                         
       ~~~~~~~~~~~~~~~
       TCG_FTPM_FFA (and Kconfig put before TCG_FTPM_TEE)


        tristate "TPM CRB over Arm FF-A Transport"                                                                                                                             
        depends on ARM_FFA_TRANSPORT                                                                                                                                           
        default y if (TCG_CRB && ARM_FFA_TRANSPORT)                                                                                                                            
                                 ~~~~~~~~~~~~~~~~~
				 redundant given "depends on"

        help                                                                                                                                                                   
          If the Arm FF-A transport is used to access the TPM say Yes.                                                                                                         
          To compile this driver as a module, choose M here; the module                                                                                                        
          will be called tpm_crb_ffa.                                                                                                                                          

So I'll drop the whole series from my tree for the moment and you'll
have to respin.
              
BR, Jarkko
