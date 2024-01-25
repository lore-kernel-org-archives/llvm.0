Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9F10A24
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 23:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706223612; cv=none; b=Qm6l00ZXOxkYPEKkSupTuy+2w/XhUC0Tqfy8gNZH/RBAANQ4Fp1bFeuINRObruXV+Z2miW4UD0vFVUL5+3LzJGzD1kiJzqaiSLnAkFCNDpu/wWq34vza0nH/9zzeuBCfrbQgpyRCohbFNXj2n/6/CtmD1VEttjUzW7yM/4f6Dmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706223612; c=relaxed/simple;
	bh=v9M1CMgjfI/NK6zYm3eL/prf4BGnVttQGvaLpjkwEvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG1ndSSZo8rl+MpNeIXjc7EeXNma3NwpP6iteSq5Vmk71nEuSFLigQ5RUthJAY6b9raAMoiS53mI4pqib06BIRlbVO/v70H1rEQ9cJhHHBNpWzjheYZme55RxhrwWr5CF6ihmYMMVl3V/dnhEZWZwoKCk3bYefa8PSJTlKePYe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lyl8kJ7R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lyl8kJ7R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE92C433C7;
	Thu, 25 Jan 2024 23:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706223611;
	bh=v9M1CMgjfI/NK6zYm3eL/prf4BGnVttQGvaLpjkwEvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lyl8kJ7RZJxL/tlVDCcFvl0Q18Ta87BafQImpdlcmEJNJhnFh2PsL+JSiQybrELrl
	 DGvEw44zKFrCeEElPy5jGf5Trnv85jxrO5hXGEzuDADu/K3ZzDjvH8xrU8bJ1zJatV
	 fLfx6GqfSB6iVBoPqLVSYoPniHYzp8QVsi5CdZMzfGWeb8JYmULtU9HG7InUUuCSkM
	 /cfWFMM2Xwn6Xsq/X6J/Q4EYdeYyJYLVozjE2ZL+LdY58OmgIHBJe7NeMDQcqAb8cg
	 F1+GkWkBdbtZHdEDK+lwaDCMVJjoze0wy4NcwyPyPf/jbY6bXtXSgj2+2cvfDLewQU
	 7FQQscOGw376w==
Date: Thu, 25 Jan 2024 16:00:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-19-init-59-g90ba33099cbb: Failure on
 aarch64
Message-ID: <20240125230010.GA2667233@dev-arch.thelio-3990X>
References: <1845612181.12064.1706214056026@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1845612181.12064.1706214056026@jenkins.jenkins>

On Thu, Jan 25, 2024 at 08:20:54PM +0000, ci_notify@linaro.org wrote:
> Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.
> 
> We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.
> 
> We track this report status in https://linaro.atlassian.net/browse/LLVM-1105 , please let us know if you are looking at the problem and/or when you have a fix.
> 
> In CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig after:
> 
>   | commit llvmorg-19-init-59-g90ba33099cbb
>   | Author: Nikita Popov <npopov@redhat.com>
>   | Date:   Wed Jan 24 15:25:29 2024 +0100
>   | 
>   |     [InstCombine] Canonicalize constant GEPs to i8 source element type (#68882)
>   |     
>   |     This patch canonicalizes getelementptr instructions with constant
>   |     indices to use the `i8` source element type. This makes it easier for
>   |     optimizations to recognize that two GEPs are identical, because they
>   |     don't need to see past many different ways to express the same offset.
>   |     
>   | ... 14 lines of the commit log omitted.
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
> 22291
> # First few build errors in logs:
> 
> # 00:05:24 ./include/linux/fortify-string.h:493:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
> # 00:05:25 make[4]: *** [scripts/Makefile.build:243: net/xfrm/xfrm_user.o] Error 1
> # 00:05:32 make[3]: *** [scripts/Makefile.build:480: net/xfrm] Error 2

This one is the new warning tied to the above LLVM change, I filed
https://github.com/ClangBuiltLinux/linux/issues/1985 for that a little
bit ago.

> # 00:15:32 ./include/linux/fortify-string.h:493:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
> # 00:15:32 make[5]: *** [scripts/Makefile.build:243: fs/smb/client/cifsencrypt.o] Error 1

This one is https://github.com/ClangBuiltLinux/linux/issues/1966.

Cheers,
Nathan
