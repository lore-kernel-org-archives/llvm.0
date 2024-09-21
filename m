Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CD13C9B8
	for <llvm@lists.linux.dev>; Sat, 21 Sep 2024 21:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726953040; cv=none; b=klaW/oG0KikBrAPIMBMLNtoIZZekPqrwgs/LlGpnUGH+I8Y0Pkk1J/k2XO48Or0alJUAoj+G47jkapJEIzqC+wTwKK4xfRKQj1m9Uf2gFheegnRoFxAPPHvFeGU3LMnB3tcCEm4exYdmh3AxunK++jC94WIikqtj1rs9Kfkq06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726953040; c=relaxed/simple;
	bh=CTzsm2RnqHgqBUtsvH2HPyfXMAChl63+qZf8z2YKNgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NleepNKqs9YS002Cb4ptGDbJJzrQ5iVDBmDUIPt/iUN5BkaNrTisWnQKe8bwkPxpbdlX/8LPBmoR3gfm8m2Ta7IzM8KAxvYhV0t5HCsiF2+M70XX2ePIswLig4ZUaCXNECQ/462CdSBwqiKGgrL5BhUcazdal7BW9zu+NhuIZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p70v63oB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p70v63oB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E34C4CEC2;
	Sat, 21 Sep 2024 21:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726953040;
	bh=CTzsm2RnqHgqBUtsvH2HPyfXMAChl63+qZf8z2YKNgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p70v63oBfmIwRgi2+fFBURv/oLzosaOj3cCmjRzoqc5f9b8tVobH6hH20EFtQQjDe
	 J+bpp58oIP6NXvX2cRZLKysALnaiHALkZH9wLxkEEosbFBVSaPiH0+5vhxa/Sz1RYw
	 o5aCKP2hng9SZc29tkZjsFky4vKs+LkVqI3uf9rtneu7ojA7kAbh21vqWgEDb5e9wB
	 1WO9pW80MHWKDEzOszU5JDakqvajgt0nSCtO35mz8061XnGN2GH+gPo2Lzlj7W3HW1
	 7PSxf7U1ZnYecBJou/fh2DgpaJ3TA5BsF/dLeVOLL1zWj7CXrXUJCRbl+fWVCzCQil
	 c2Wwt4k9rB8dg==
Date: Sat, 21 Sep 2024 14:10:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-20-init-6434-ga861ed411a35: Failure on
 aarch64
Message-ID: <20240921211038.GA140179@thelio-3990X>
References: <736663489.4818.1726911549829@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <736663489.4818.1726911549829@jenkins.jenkins>

On Sat, Sep 21, 2024 at 09:39:09AM +0000, ci_notify@linaro.org wrote:
> We track this report status in https://linaro.atlassian.net/browse/LLVM-1362 , please let us know if you are looking at the problem and/or when you have a fix.
> 
> In CI config tcwg_kernel/llvm-master-aarch64-lts-defconfig after:
> 
>   | commit llvmorg-20-init-6434-ga861ed411a35
>   | Author: Florian Hahn <flo@fhahn.com>
>   | Date:   Fri Sep 20 11:22:03 2024 +0100
>   | 
>   |     [VPlan] Add initial loop-invariant code motion transform. (#107894)
>   |     
>   |     Add initial transform to move out loop-invariant recipes.
>   |     
>   |     This also helps to fix a divergence between legacy and VPlan-based cost
>   |     model due to legacy using ScalarEvolution::isLoopInvariant in some
>   |     cases.
>   | ... 4 lines of the commit log omitted.

Thanks for the report. I suspect this should be fixed by
https://github.com/llvm/llvm-project/commit/bd8fe9972e3f17776e4e05e69e13ab8271d34132,
based on the fact that there is a similar report on the pull request
upstream.

Cheers,
Nathan
