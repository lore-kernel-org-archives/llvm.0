Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A1D1E834F
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192132; cv=none; b=nadIDSul/nWsxE/x1hHVjV4s76hS3ZE+ZKDZZfvhWea1nvNSZHacVmlqXpCh8TMNcL2+tClCbhRT8zO+7AVexhILA1lcOuKgg5GesSSs2IhAACj8MmbglN7egZWXWZq+saw9VX6w03En2R0Oh0WwoAGkzf/32NqJd+JI9cHC+h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192132; c=relaxed/simple;
	bh=AUjAt8EQvv7yejaoyrYJsZyAHUvStK4j2ZTL5LLS9j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CapR+CUNXDce414fGeRcAe2dfQ1CqCJYpN6Tmm313U7hQXP1ZCCM/TFlG823jSzergCY09R89qkNYwGIQIfPndIya2a8S82Wfq+agoCfuSxV0LiIkgCZ7vaf+V6ZWnUBCntfV7y3iXc/4k6yybwGkcfDvpSiPeHxg2qEMIy6ZSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzTwS7MW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzTwS7MW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878CFC4CEE4;
	Fri, 28 Mar 2025 20:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743192132;
	bh=AUjAt8EQvv7yejaoyrYJsZyAHUvStK4j2ZTL5LLS9j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzTwS7MWPOYZlfcpNJdFf6Ea/6GoxYPabkq31+VT8ow25GBBzGiHZ2+lUb8W9ztp/
	 paU/cPlDT01uI1Z92375OLQkAaOoKG8b6Uepqh7XicPrBFAW48PlhpUoqP8yFLxsUg
	 jI5pNZvuHrxT4FfsaA61gNpAnkA9fWbehiivO3fo6R9hFHqNXKy2wQ6TXX4a3ZULA5
	 oas/BwCQhGukLvIHrsiy/CemnyttPn29u3mPjVy1LsYmCo3BK/e7mEVW8+1rP1K5zy
	 m8AUu3t9qrSjSNicVDtmVAmDhpCIm4ESV2BQACxVoQRH1Opi+miR0p9wmxeYbWrYky
	 b1VPuIHPucNBA==
Date: Fri, 28 Mar 2025 13:02:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-21-init-6198-g9694844d7e36: Failure on
 aarch64
Message-ID: <20250328200208.GB426640@ax162>
References: <1405005597.178104.1743175727731@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1405005597.178104.1743175727731@jenkins.jenkins>

On Fri, Mar 28, 2025 at 03:28:46PM +0000, ci_notify@linaro.org wrote:
> Dear contributor,
> 
> Our automatic CI has detected problems related to your patch(es). Please find some details below.
> 
> In tcwg_kernel/llvm-master-aarch64-stable-allmodconfig, after:
>   | commit llvmorg-21-init-6198-g9694844d7e36
>   | Author: Henry Jiang <h243jian@uwaterloo.ca>
>   | Date:   Mon Mar 24 09:49:31 2025 -0400
>   | 
>   |     Reland "[Transforms] LoopIdiomRecognize recognize strlen and wcslen #108985" (#132572)
>   |     
>   |     Reland https://github.com/llvm/llvm-project/pull/108985
>   |     
>   |     Extend `LoopIdiomRecognize` to find and replace loops of the form
>   | ... 12 lines of the commit log omitted.

Thanks a lot for the report. I sent the third version of the patchset
that should resolve this issue this morning so I hope it will be moved
on soon:

https://lore.kernel.org/20250328-string-add-wcslen-for-llvm-opt-v3-0-a180b4c0c1c4@kernel.org/

Cheers,
Nathan
