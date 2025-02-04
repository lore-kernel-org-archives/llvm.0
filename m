Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2819F204589
	for <llvm@lists.linux.dev>; Tue,  4 Feb 2025 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700126; cv=none; b=KtisJSg7F8ycSNrbl+aI0LQnyHYT8MisRFmZ1jMgR8Z3mVfgGM1PUfTOaZyHdXs5b+DOOOBoYhcVWKB7QRltArBUA4WRMuXqHZ7B239N8OzB/CXtspDd5YOIk/P+MzAOztOTyPscSnhCNRN6d3NMeil+Na030CSMI4IA50O1tG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700126; c=relaxed/simple;
	bh=kJonMXNY9VlAmafGbnGEKg0Jo8628XvCVNXk/loVX9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2dZC8NzeU2OYRSgNUnudLV3/sYvaWRNBKZNiyR7S3Jm8FY2w9S7ht5NFG2Vf3nLZQr/o69+X+lPtE/YUWdbdb1l1DPflD26lQCa7qIm2NlYVqXDY5aFBh+xVZTswfyuDr+BFAWXmVDKZc3BZ3Ay94uKQ2hUuRUSSRHb7WOnj3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQ9IhiRx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQ9IhiRx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB3FC4CEDF;
	Tue,  4 Feb 2025 20:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738700125;
	bh=kJonMXNY9VlAmafGbnGEKg0Jo8628XvCVNXk/loVX9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQ9IhiRxGMPVj7QTdLxIY3mNeHAIMD+/emAuqiNqwcOKyE/O+SKfYmTkKymhvYMap
	 4kB/G0qbccODRErgNzlG4F6kThrBxkDeR3plDulRrd+PaLlyH9Dcay/ybJj5Jb18Qm
	 AdP2Q1Aa0ZlMEXeC6si9wULIPsHWXJTUO1lB8ALBUci5brdPM7BbgI32nyljjog8eM
	 7UejotQ0g3p9krjXvr48bexOUmKY4ckZ7GR/noT4Ral1uEtdG2wmfcIRPYrU6hXko5
	 +dewYqnv74DRJgeiycjaiagutGAnh81FF8GJx9WhzPXGXOzUZTqLtqQIA0fULAohmO
	 IXapiCAaK+37A==
Date: Tue, 4 Feb 2025 13:15:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-21-init-262-gcff0a460ae86: Failure on
 arm
Message-ID: <20250204201522.GB3466315@ax162>
References: <1599984364.127113.1738492219737@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599984364.127113.1738492219737@jenkins.jenkins>

On Sun, Feb 02, 2025 at 10:30:18AM +0000, ci_notify@linaro.org wrote:
> Dear contributor,
> 
> Our automatic CI has detected problems related to your patch(es). Please find some details below.
> 
> In tcwg_kernel/llvm-master-arm-stable-allyesconfig, after:
>   | commit llvmorg-21-init-262-gcff0a460ae86
>   | Author: Bill Wendling <morbo@google.com>
>   | Date:   Thu Jan 30 15:36:13 2025 -0800
>   | 
>   |     [Clang][counted_by] Refactor __builtin_dynamic_object_size on FAMs (#122198)
>   |     
>   |     Refactoring of how __builtin_dynamic_object_size() is calculated for
>   |     flexible array members (in preparation for adding support for the
>   |     'counted_by' attribute on pointers in structs).
>   | ... 86 lines of the commit log omitted.
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
>   | 22473
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
>   | 22474
> 
> Used configuration :
>  tcwg_kernel/llvm-master-arm-stable-allyesconfig
> 
> We track this bug report under https://linaro.atlassian.net/browse/LLVM-1541. Please let us know if you have a fix.
> 
> If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.
> 
> -----------------8<--------------------------8<--------------------------8<--------------------------
> 
> The information below contains the details of the failures, and the ways to reproduce a debug environment:
> 
> 
> 
> Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-stable-allyesconfig-build/233/artifact/artifacts
> Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-stable-allyesconfig-build/232/artifact/artifacts
> 
> Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/cff0a460ae864505bc2a064c269ebe548aa35949/tcwg_kernel/llvm-master-arm-stable-allyesconfig/reproduction_instructions.txt
> 
> Full commit : https://github.com/llvm/llvm-project/commit/cff0a460ae864505bc2a064c269ebe548aa35949

Thanks, I think Bill fixed this with
https://github.com/llvm/llvm-project/commit/2eb44aa0a94a8d4230c1c9a0c306af16bfc92925

Cheers,
Nathan
