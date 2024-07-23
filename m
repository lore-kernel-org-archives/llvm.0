Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DE013C8F9
	for <llvm@lists.linux.dev>; Tue, 23 Jul 2024 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721764031; cv=none; b=cUhILQo3eXCG9TPnug3tg/fo84RjL/ovlwIoRPWWGjfq8SegsLvazvBvXgtJE5Usyvp7wjGqdESiAC3m0G9FAMupHQJkYZkreiCyUCNzZns9CeyCmCxdRDbxlEK+df56vlXNrImNb7vtjYd9Z+TTklfBxJR/AFD2YcSN9U0eWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721764031; c=relaxed/simple;
	bh=/96w8Cqg2yXRG4+FMaYPprhOrqo4vEcA5b/kxHn0Cb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFhK/VTPaLr+A9IS6FINBPVYkwztzZwwl9aLIr5PJ2/YXmwXMYssVybicAAQMvLg9WuAU7zC/gp7AMvaRnuvl4I/PhX/yyXBeiUZKyVZYOF94Sncys/2d/ye/MaHx+d6nY2IZYU0ey2CBgLPJUl0Qc5DI1RHjVx5AVkE3gdF6Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttBSL6GM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttBSL6GM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202A8C4AF09;
	Tue, 23 Jul 2024 19:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721764031;
	bh=/96w8Cqg2yXRG4+FMaYPprhOrqo4vEcA5b/kxHn0Cb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttBSL6GMt/0C064MJ9IAP6TjQTgZFGXEdspo1NA0hLWSBcr7Sw3g/e4SUrU5Lf18g
	 BEenJ97WBWK4HHvwvhrScYs5Yd3gvcITSGs1dJarTW/MA/d59bSV7GYHWuASvsUoyR
	 pAS31k4SHVbA2aarY4Tft2M7GKlEZ/i4OOkE/cORUhhd3bhZb0sOMwp1JtLuXOEec0
	 tFJD5hPl5gyXT48jVM3REITUFuBRVBcsRSdAdIXRvRyjoq9cT/nCOVN/ScqKeigDzh
	 cjHuL+36cZQtcTpu9TN4ygrtQCPiMH035xeEYIjWaXMg6E/TKbmOpOtTkWpi3wSR4Y
	 21hsJG02kiigw==
Date: Tue, 23 Jul 2024 12:47:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-19-init-18145-g1f6f97e2b64a: Failure on
 aarch64
Message-ID: <20240723194709.GA893682@thelio-3990X>
References: <1017473160.129075.1721657581027@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1017473160.129075.1721657581027@jenkins.jenkins>

On Mon, Jul 22, 2024 at 02:12:58PM +0000, ci_notify@linaro.org wrote:
> Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.
> 
> We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.
> 
> We track this report status in https://linaro.atlassian.net/browse/LLVM-1287 , please let us know if you are looking at the problem and/or when you have a fix.
> 
> In CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig after:
> 
>   | commit llvmorg-19-init-18145-g1f6f97e2b64a
>   | Author: Bill Wendling <5993918+bwendling@users.noreply.github.com>
>   | Date:   Thu Jul 18 22:11:56 2024 +0000
>   | 
>   |     [Clang] Loop over FieldDecls instead of all Decls (#99574)
>   |     
>   |     Only FieldDecls are important when determining GEP indices. A struct
>   |     defined within another struct has the same semantics as if it were
>   |     defined outside of the struct. So there's no need to look into
>   |     RecordDecls that aren't a field.
>   |     
>   | ... 4 lines of the commit log omitted.
> 
> Results changed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 22903
> 
> From
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 22904
> 
> The configuration of this build is:
> CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig
> 
> -----------------8<--------------------------8<--------------------------8<--------------------------
> The information below can be used to reproduce a debug environment:
> 
> Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/202/artifact/artifacts
> Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/201/artifact/artifacts
> 
> Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/1f6f97e2b64a9c4c51712d32b53e07d2a20e0cc0/tcwg_kernel/llvm-master-aarch64-stable-allyesconfig/reproduction_instructions.txt
> 
> Full commit : https://github.com/llvm/llvm-project/commit/1f6f97e2b64a9c4c51712d32b53e07d2a20e0cc0
> 
> List of configurations that regressed due to this commit :
> * tcwg_kernel
> ** llvm-master-aarch64-stable-allyesconfig
> *** Failure
> *** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/1f6f97e2b64a9c4c51712d32b53e07d2a20e0cc0/tcwg_kernel/llvm-master-aarch64-stable-allyesconfig/details.txt
> *** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/202/artifact/artifacts

This should be fixed with
https://github.com/llvm/llvm-project/commit/6db5f4fd2a287de9d20adc7a44cfcc66fc462c9c.

Cheers,
Nathan
