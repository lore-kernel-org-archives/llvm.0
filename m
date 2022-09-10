Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F155A6B
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 16:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496FDC433D6;
	Sat, 10 Sep 2022 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662827115;
	bh=U49F4RWLdEMctW5sh3MyojpP0CFDGlilr0z0ho/Wh/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTqQgckH96IQQJD+isQYEBRo56vkPhx8mwUf8xhjgPoxVrh92Df4tX0wETfuZUbvU
	 C7YOWS5LFnciRq2s6DjlHeHdBIORKIiq0qVvX93l8XH55q9K74Xyc7EeZwdq+/LMa+
	 t5Gx/6y9WesCygiCn4tVH0Nq0vp4TqKSqKbq70LBd/ygVydWlPV9SeGdMAdtLtm4AY
	 5MV91C4lFAJTdxRuBdjsB0xaiFcvDmMviQ8rXZq8zGsV3iOFT1+pRIQ5iWL+B8Q7eK
	 d7yEtJj2qS3tk49jNM6cIy1XU7VxsQ3NUer5Gb45KrzvVCAKcfdPoCtA2PCfrrFrHr
	 mwZYgSy/jZ2xA==
Date: Sat, 10 Sep 2022 09:25:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Lior Nahmanson <liorna@nvidia.com>, llvm@lists.linux.dev,
	arnd@linaro.org
Subject: Re: [TCWG CI] Failure after v6.0-rc3-809-ge467b283ffd5: net/mlx5e:
 Add MACsec TX steering rules
Message-ID: <Yxy6acl4o5mgYuv8@dev-arch.thelio-3990X>
References: <1519354944.16715.1662826543195@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519354944.16715.1662826543195@jenkins.jenkins>

On Sat, Sep 10, 2022 at 04:15:42PM +0000, ci_notify@linaro.org wrote:
> Failure after v6.0-rc3-809-ge467b283ffd5: net/mlx5e: Add MACsec TX steering rules:
> 
> Results changed to
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 21252
> # First few build errors in logs:
> # 00:56:42 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:487:6: error: variable 'tx_rule' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
> # 00:56:42 make[5]: *** [scripts/Makefile.build:249: drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.o] Error 1
> # 00:57:00 make[4]: *** [scripts/Makefile.build:465: drivers/net/ethernet/mellanox/mlx5/core] Error 2
> # 00:57:00 make[3]: *** [scripts/Makefile.build:465: drivers/net/ethernet/mellanox] Error 2
> # 00:57:00 make[2]: *** [scripts/Makefile.build:465: drivers/net/ethernet] Error 2
> # 00:57:00 make[1]: *** [scripts/Makefile.build:465: drivers/net] Error 2
> # 00:57:10 make: *** [Makefile:1853: drivers] Error 2

Thanks for the report! I noticed this a couple of days ago and sent
https://lore.kernel.org/20220908153207.4048871-1-nathan@kernel.org/

Cheers,
Nathan
