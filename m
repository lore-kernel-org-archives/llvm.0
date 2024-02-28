Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC0159587
	for <llvm@lists.linux.dev>; Wed, 28 Feb 2024 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709139953; cv=none; b=bRizY4kZhdvOVDATwvHZ8tF74gc2UumZ7jSp9Eobb67+cTUbP4jskMdCC8e2LVsYbEz3+coXtxtAVSsLoZtcrngnwTEu1RUJ3IyQTfeaHCiLxF4iKhcm8Z0bm4O4pazHfjEtN7juZvIizqZnlpyZ3BpjvKo5kQZq1Cl/hNRkFWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709139953; c=relaxed/simple;
	bh=6lEGMxDS1vjB0gRavEWmaOAWVfw+gz0J6O2sOpO+5zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYZFPLSCnDJJlSsMLPrLy6ozAtrmsSGSHFHm/BxdQhZk0N4O6Q9K7VjeXFLMqw/x9vPozWbOMUMNUnyTkLY4QMF/qngDn/Jmi/xFke10BC5LRptetEKijQ/ug0dhisBkbc4PSTdBQCmOoA90yjX2BS7GM8QSTDa/fXmE/0K0/HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCny91OP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCny91OP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E555BC433F1;
	Wed, 28 Feb 2024 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709139953;
	bh=6lEGMxDS1vjB0gRavEWmaOAWVfw+gz0J6O2sOpO+5zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCny91OPqm2pFLDL7tH3VsuW3roSPk/LOzau0Fo8hym13UdJNIJPoUsIK6Z2r4Y5S
	 Pqw9n60v4tqv41kisL0NsAe6qaOi/ondDoNhe1xdRL6JIGl/WRBh/VFLvdXV7QkRLy
	 03XzLoaW9EizdJfqUppIGKfpeD1g1C0LJd07zegel4b3JrZ07iYtVnN1ZqMl92hvAh
	 1LJfjFN9Bwgd4phpYEJXIcQT6yd7J2MM+iPLl/R4r1zzqYKWrriGqpYRFATeFFCpI9
	 lmwpRf8rSTD0g2sfO7cQqmYm5B6foLA/S6JHZWA0gyzhFrENdScDwM/cGaNDy7LRca
	 2Y7DEDWhgFCEg==
Date: Wed, 28 Feb 2024 10:05:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-19-init-3481-g8c2ae42b3e1c: Failure on
 aarch64
Message-ID: <20240228170551.GB2158263@dev-arch.thelio-3990X>
References: <1103948202.2736.1709131633065@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1103948202.2736.1709131633065@jenkins.jenkins>

On Wed, Feb 28, 2024 at 02:47:11PM +0000, ci_notify@linaro.org wrote:
> Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.
> 
> We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.
> 
> We track this report status in https://linaro.atlassian.net/browse/LLVM-1153 , please let us know if you are looking at the problem and/or when you have a fix.
> 
> In CI config tcwg_kernel/llvm-master-aarch64-lts-allyesconfig after:
> 
>   | commit llvmorg-19-init-3481-g8c2ae42b3e1c
>   | Author: Kupa-Martin <84517188+Kupa-Martin@users.noreply.github.com>
>   | Date:   Tue Feb 27 11:58:59 2024 -0300
>   | 
>   |     [Clang][Sema] Fix missing warning when comparing mismatched enums in … (#81418)
>   |     
>   |     …C mode
>   |     
>   |     Factored logic from `CheckImplicitConversion` into new methods
>   |     `Expr::getEnumConstantDecl` and `Expr::getEnumCoercedType` for use in
>   |     `checkEnumArithmeticConversions`.
>   | ... 2 lines of the commit log omitted.
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
> 37
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
> 22291
> 
> The configuration of this build is:
> CI config tcwg_kernel/llvm-master-aarch64-lts-allyesconfig
> 
> -----------------8<--------------------------8<--------------------------8<--------------------------
> The information below can be used to reproduce a debug environment:
> 
> Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allyesconfig-build/143/artifact/artifacts
> Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allyesconfig-build/142/artifact/artifacts
> 
> Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/8c2ae42b3e1c6aa7c18f873edcebff7c0b45a37e/tcwg_kernel/llvm-master-aarch64-lts-allyesconfig/reproduction_instructions.txt
> 
> Full commit : https://github.com/llvm/llvm-project/commit/8c2ae42b3e1c6aa7c18f873edcebff7c0b45a37e
> 
> List of configurations that regressed due to this commit :
> * tcwg_kernel
> ** llvm-master-aarch64-lts-allyesconfig
> *** Failure
> *** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/8c2ae42b3e1c6aa7c18f873edcebff7c0b45a37e/tcwg_kernel/llvm-master-aarch64-lts-allyesconfig/details.txt
> *** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allyesconfig-build/143/artifact/artifacts

Thanks a lot for the report, this is expected with that change. How we
want to handle this in the kernel is currently under discussion at
https://github.com/ClangBuiltLinux/linux/issues/2002.

Cheers,
Nathan
