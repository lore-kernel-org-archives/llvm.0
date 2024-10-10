Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5905D1CEAD6
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 20:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728590809; cv=none; b=h6gVKefFP5+h7H37tvL41jNsi9SNWOW+IVT3iETTsc8WHxcJenEfa/VjWdnlOUhikl97OjmEHKng4LBzgXZPWR3p7LmmNirf2KOPSg1xGLqAyoivpAambNTAntA3jaTTbx//7o6H0m07R5DcjfMwIPxl+FLQXoefL/o7hheGgsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728590809; c=relaxed/simple;
	bh=ldTPRRZKRBJ5GB+hRVyfSXi2ehL2o0p5RYCW3Vi9srw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9WVwboa6sz6e6oKPhBzJWUHUpU9oOY29YnUr5QTDyE/3a9thNC+MS2oEdQXN7ASOKRZDla+7FPfEmG1QvCGzWeUTjMhQnTYOQ5TQ/+YiUajCHPd0Y+bdpKpO7KE6IDUgdTHG4hyKndhqWRxIPYdBk1gbN+TYII3C/56ERfxyec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=streVKfQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="streVKfQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB89AC4CED0;
	Thu, 10 Oct 2024 20:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728590808;
	bh=ldTPRRZKRBJ5GB+hRVyfSXi2ehL2o0p5RYCW3Vi9srw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=streVKfQsZc6pj0lr6nUnHQ2t43SI9q3TKw1LDEaqP9YhRQsvIvjOmvlzCkwqPdJQ
	 qzLTU3CtCUyXoRKZLh9Z/RtoJjltGdxWx5RDhFTEz7sBR8Das+F2gIVpLqbUShhOpU
	 I09a/3EFuZ6cKAEjQ9whY7dht29L66IXNkyU1J7N4DfHb2QxEIpsVuSbS7ejSFVc6O
	 /MPAHAv30ETJoMuRcf/XSqv3se2Gu1nzXlLLhulQip+8FTGnHeprpeN3wGpaPAYVl9
	 j/5XKmGuDImPG74beKKav/8P324/qi4j1VSsXl6MZqKHjfap7T+bPu9Tr/MeBTgWf9
	 6MkGdzYXvC9rQ==
Date: Thu, 10 Oct 2024 13:06:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-20-init-8119-gd2408c417cfa: Failure on
 aarch64
Message-ID: <20241010200647.GA1317667@thelio-3990X>
References: <637931286.20442.1728373223783@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <637931286.20442.1728373223783@jenkins.jenkins>

Thanks for the report, I have opened
https://github.com/llvm/llvm-project/issues/111903 for this.

On Tue, Oct 08, 2024 at 07:40:22AM +0000, ci_notify@linaro.org wrote:
> Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.
> 
> We understand that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.
> 
> We track this report status in https://linaro.atlassian.net/browse/LLVM-1390 , please let us know if you are looking at the problem and/or when you have a fix.
> 
> In CI config tcwg_kernel/llvm-master-aarch64-lts-allmodconfig after:
> 
>   | commit llvmorg-20-init-8119-gd2408c417cfa
>   | Author: David Green <david.green@arm.com>
>   | Date:   Sun Oct 6 10:44:21 2024 +0100
>   | 
>   |     [InstCombine] Canonicalize more geps with constant gep bases and constant offsets. (#110033)
>   |     
>   |     This is another small but hopefully not performance negative step to
>   |     canonicalizing towards i8 geps. We looks for geps with a constant offset
>   |     base pointer of the form `gep (gep @glob, C1), x, C2` and expand the gep
>   | ... 2 lines of the commit log omitted.
> 
> The configuration of this build is:
> CI config tcwg_kernel/llvm-master-aarch64-lts-allmodconfig
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
> 24511
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
> 33835
> # linux build successful:
> all
> 
> -----------------8<--------------------------8<--------------------------8<--------------------------
> The information below can be used to reproduce a debug environment:
> 
> Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allmodconfig-build/214/artifact/artifacts
> Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allmodconfig-build/213/artifact/artifacts
> 
> Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/d2408c417cfa71f1786c909788560374eb1aca96/tcwg_kernel/llvm-master-aarch64-lts-allmodconfig/reproduction_instructions.txt
> 
> Full commit : https://github.com/llvm/llvm-project/commit/d2408c417cfa71f1786c909788560374eb1aca96

