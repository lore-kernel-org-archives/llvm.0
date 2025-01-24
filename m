Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F7A4D8DA
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737726925; cv=none; b=bVckioBkREeppAtp8DdAX+GtICOsnraGLknzBZOtq5HhM3A7QGhdjmXty8qDOw21gMFrxf7+/or+TOKBxhjAcvG+S9chmaMzU/4abUmVbyEm/uPbo0x5112cJoGIS/HT+xjTUI0Sd6zvQtEU70aGqjFCSU94KKQj+LzW0g2BewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737726925; c=relaxed/simple;
	bh=a2mjlcNJ6Ulz6xXxtNxQXGSj/QcazXRE4HjOleqyyVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSmNBr6RKv/5ekasC5knwEg+cWB1faRCMsisgHRvpEZViYom3yF+0UDdlGRHE147BtTKfqe2R+A0oztbrbOdNLyjeexHQtkVldQyuRuUUk0XV4LniPQXqbKwsdCgaBw9XxFRmRoFjwJDgAgpMC9sPWmKi0tUtlE3I0GctKEDBw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jd88naVX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jd88naVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAC1C4CED2;
	Fri, 24 Jan 2025 13:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737726924;
	bh=a2mjlcNJ6Ulz6xXxtNxQXGSj/QcazXRE4HjOleqyyVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jd88naVXtW+z5vzrS+DnU5ckUob7b/QjvanSKazU31C/AD0W23qjfhmfhYZ+zhvy/
	 yNG5D0wjH/QIS2uDvKlcj5RBcrdjxnAujrvZQcR6XUpCPMIiL4ttqcPl3TjO83C/Li
	 CepT6j5BqDp0+v08FgcCuM6aGJfkbEmO0ml8ayNK+mFp/SYqpGB6/gBZRzw+x6CrFd
	 Gboc6aMF2CgxqM+HzVjqft/yYIBEOrkJYaIJU/xdROtPn7/Wlf3dASfvCUUUK+epR9
	 ASLmg2yyzbsJfODGAkK5SvokAouaKVBW+Xp2z6x+orZQmH+EJmjh3Z1by6rMl+1OkT
	 tB4PoMCuP0MPA==
Date: Fri, 24 Jan 2025 06:55:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-20-init-18802-gee99c4d4845d: Failure on
 aarch64
Message-ID: <20250124135521.GA2502091@ax162>
References: <1238599551.120293.1737701750619@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1238599551.120293.1737701750619@jenkins.jenkins>

On Fri, Jan 24, 2025 at 06:55:49AM +0000, ci_notify@linaro.org wrote:
> Dear contributor,
> 
> Our automatic CI has detected problems related to your patch(es). Please find some details below.
> 
> In tcwg_kernel/llvm-master-aarch64-stable-allmodconfig, after:
>   | commit llvmorg-20-init-18802-gee99c4d4845d
>   | Author: SivanShani-Arm <sivan.shani@arm.com>
>   | Date:   Thu Jan 23 09:46:59 2025 +0000
>   | 
>   |     [LLVM][Clang][AArch64] Implement AArch64 build attributes (#123990)
>   |     
>   |     - Added support for AArch64-specific build attributes.
>   |     - Print AArch64 build attributes to assembly.
>   |     - Emit AArch64 build attributes to ELF.
>   | ... 2 lines of the commit log omitted.
> 
> Produces Failure:
>   | Results changed to
>   | # reset_artifacts:
>   | -10
>   | # build_abe binutils:
>   | -9
>   | # build_kernel_llvm:
>   | -5
>   | # build_abe qemu:
>   | -2
>   | # linux_n_obj:
>   | 40
>   | 
>   | From
>   | # reset_artifacts:
>   | -10
>   | # build_abe binutils:
>   | -9
>   | # build_kernel_llvm:
>   | -5
>   | # build_abe qemu:
>   | -2
>   | # linux_n_obj:
>   | 25849
> 
> Used configuration :
>  tcwg_kernel/llvm-master-aarch64-stable-allmodconfig
> 
> We track this bug report under https://linaro.atlassian.net/browse/LLVM-1530. Please let us know if you have a fix.
> 
> If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.
> 
> -----------------8<--------------------------8<--------------------------8<--------------------------
> 
> The information below contains the details of the failures, and the ways to reproduce a debug environment:
> 
> 
> 
> Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allmodconfig-build/252/artifact/artifacts
> Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allmodconfig-build/251/artifact/artifacts
> 
> Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/ee99c4d4845db66c4daa2373352133f4b237c942/tcwg_kernel/llvm-master-aarch64-stable-allmodconfig/reproduction_instructions.txt
> 
> Full commit : https://github.com/llvm/llvm-project/commit/ee99c4d4845db66c4daa2373352133f4b237c942

Thanks for the report, this change needs adaption on the kernel side:

https://lore.kernel.org/20250124-arm64-handle-arm-attributes-in-linker-script-v1-1-74135b6cf349@kernel.org/

Cheers,
Nathan
