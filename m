Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4F19C56D
	for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 22:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734646829; cv=none; b=erxtovZHpi8T7OZ/pZ3LXNS8Yaiw+yZBLazBQnEvIgPcX/mVHtVFnlNyOQTb/6r//PkECkLi6DTPTpr+c2oPtAeliSiNLzkSrfEEBL5GGwJPEfaIIRYsa9e4JFRuB0V3ZH6WLP5epB3d7rkojYDc+uXqmQ70ac7REe+r8is7Pzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734646829; c=relaxed/simple;
	bh=gEXYLFycOm/YgLEyLsHYA/1G0FQ+WRam/qm/saDfAtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgETW75oV4Pix99GDB3il7KKGv64edbXQ0vOQYGbiHMGmgDqxdSvDVke21sWlvc+iD60QAbTbTAI+gU1FqcHP7Kd0C9IEQv8JVnTpFFWANekVWjz17bcSA5Q8qQr/fE8u3NDGNCkMcBW2G7Dix8AWSkIksWGLVKUCZUSEGKyvtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMk4HV+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMk4HV+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02975C4CECE;
	Thu, 19 Dec 2024 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734646826;
	bh=gEXYLFycOm/YgLEyLsHYA/1G0FQ+WRam/qm/saDfAtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMk4HV+teDuM+n9VjSPSF7nsUgYReInXgVWQL5EzVxu1VQRX8p5OazRAOMnoo1sxc
	 UM+qz8bcjGaw/9fND0NW5Znfc32dA8WJVFLPwn/ZKOJ1n/wMEMfLeXna5N/UoHh7bB
	 jCLuvfuxo6jovrfHEVyl4xstb//vafoXY7R206uYnaG5uNxklzxEEccs9iIcXY5OyS
	 GOAfjC1Hu6MjYeyckdlrcChoR+5umVKokuhpPXxxgzV2UeLQ73pSe+yl7fywDREne1
	 dWzJ6zvo1g+Gh3dst/pS9oPrH61QPeBYh2AENooTPOerGwAhblQwGgY8c0i9P+N88M
	 80XoxapAkBL0Q==
Date: Thu, 19 Dec 2024 15:20:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] v6.13-rc2-20-gce8fd0500b741: Failure on aarch64
Message-ID: <20241219222023.GB1259354@ax162>
References: <289107071.93101.1734581102392@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <289107071.93101.1734581102392@jenkins.jenkins>

Thanks for the report!

On Thu, Dec 19, 2024 at 04:05:00AM +0000, ci_notify@linaro.org wrote:
> Dear contributor,
> 
> Our automatic CI has detected problems related to your patch(es). Please find some details below.
> 
> In tcwg_kernel/llvm-master-aarch64-next-defconfig, after:
>   | commit v6.13-rc2-20-gce8fd0500b741
>   | Author: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   | Date:   Tue Dec 3 10:19:35 2024 +0100
>   | 
>   |     crypto: qce - use __free() for a buffer that's always freed
>   |     
>   |     The buffer allocated in qce_ahash_hmac_setkey is always freed before
>   |     returning to use __free() to automate it.
>   |     
>   | ... 3 lines of the commit log omitted.

I have sent a revert of that change:

https://lore.kernel.org/20241218-crypto-qce-sha-fix-clang-cleanup-error-v1-1-7e6c6dcca345@kernel.org/

Cheers,
Nathan
