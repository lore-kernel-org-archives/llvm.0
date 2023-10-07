Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F74171AF
	for <llvm@lists.linux.dev>; Sat,  7 Oct 2023 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rVCTmleu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC631C433C8;
	Sat,  7 Oct 2023 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696672572;
	bh=cjSdvgy+F3bHC3Fhr8uA8IIadAj6KK16Go6VF12lU2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVCTmleuVvB22ihcWk3W/QbC/+xIuFctv++xzEOPVxIs9jR7W+lhvBfwcMXOGi5Iv
	 KOS66jaEybXkUmgxUtDOFGGNhZo2fO6t2nE2xstK+zepuG8MXM4jj5E8Fxb2HEg5hb
	 giXyywUTzTUIej41T42iTl3uBRcfmWz78lVtDP+k=
Date: Sat, 7 Oct 2023 11:56:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 5.10] drm/mediatek: Fix backport issue in
 mtk_drm_gem_prime_vmap()
Message-ID: <2023100700-cosponsor-risotto-2a0a@gregkh>
References: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>

On Fri, Sep 22, 2023 at 08:51:17AM -0700, Nathan Chancellor wrote:
> When building with clang:
> 
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c:255:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
>     255 |                 return -ENOMEM;
>         |                        ^~~~~~~
>   1 error generated.
> 
> GCC reports the same issue as a warning, rather than an error.
> 
> Prior to commit 7e542ff8b463 ("drm/mediatek: Use struct dma_buf_map in
> GEM vmap ops"), this function returned a pointer rather than an integer.
> This function is indirectly called in drm_gem_vmap(), which treats NULL
> as -ENOMEM through an error pointer. Return NULL in this block to
> resolve the warning but keep the same end result.
> 
> Fixes: 43f561e809aa ("drm/mediatek: Fix potential memory leak if vmap() fail")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> This is a fix for a 5.10 backport, so it has no upstream relevance but
> I've still cc'd the relevant maintainers in case they have any comments
> or want to double check my work.

Now queued up, thanks.

greg k-h
