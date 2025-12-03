Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887F634D4EE;
	Wed,  3 Dec 2025 16:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764780605; cv=none; b=ekvoec/YTbucQzZTKAA/RqP3D8M73FVrXFkxNPsgF8Ly0Dxe017PJotWdb/vI2jYnMCkgn82wBTHAu4zGM1fGNj/lwQz+5XHOdGuWNOg+vYofdEUpdZpkyxOhcfJ4DM2SfJBJYJC6Z8K+Ceq0AAfrRnoAu2N6KQ/OUl1U+Gki1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764780605; c=relaxed/simple;
	bh=WE/MGjDXYkfLp/ASxbUyC53LMNdsfobdCP7BxApY2r0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EElDUL3RfuRreLUxRAIL05tuFUHZ3JKqDsMFVHHnSl2cMaZiKd5RGy6/uzZIDNi5H9pNGriCnXDbd9zTXoFf+MevG9ncoDDR6aOU88Pm79CYxEl20gmw+rHnV5O6LlZeRhFcn+YLWEYHzhqNcxN49p/PiSKd8llonN9DtoHcL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOSDsoBa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOSDsoBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21D4C4CEF5;
	Wed,  3 Dec 2025 16:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764780604;
	bh=WE/MGjDXYkfLp/ASxbUyC53LMNdsfobdCP7BxApY2r0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kOSDsoBa4+of4dbFUeN3S+S0nuqVts/bOkUwD16XwQbjzVTj+NhYD0LIkxhGFWfm0
	 LHzLg4Lifd5kiuroMAtL4WmHEdGD+YAL3dHVIa7frayQuQO71IkhZzMpkHsQYrudGo
	 ZlVONlj3lmqwTjyJqgLLB35t9c7ZMyWsyknuCS2O1NBjhbCVPNc7XGO/rDPZz4YlPb
	 HjRpjmwl1C+zTO2EuQw4+DSnaDLHt1+DmRmzvS8nCUZfN+X+tUal9mwxUFTnzp19x8
	 C1DhWNMXK9YLwFFuFv46gAZaGCczke3v0ca5vq8FgRWm7Nu9Fwf++Fnfn5BSsNGTDM
	 QevwICvNEOOFw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251203141644.106459-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251203141644.106459-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning
 (again)
Message-Id: <176478060152.99790.2704238708778622367.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 16:50:01 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 03 Dec 2025 15:16:45 +0100, Krzysztof Kozlowski wrote:
> 'version' is an enum, thus cast of pointer on 64-bit compile test with
> clang W=1 causes:
> 
>   rockchip_pdm.c:583:17: error: cast to smaller integer type 'enum rk_pdm_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> This was already fixed in commit 49a4a8d12612 ("ASoC: rockchip: Fix
> Wvoid-pointer-to-enum-cast warning") but then got bad in
> commit 9958d85968ed ("ASoC: Use device_get_match_data()").
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning (again)
      commit: 57d508b5f718730f74b11e0dc9609ac7976802d1

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

