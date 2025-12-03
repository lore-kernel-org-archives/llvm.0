Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7BF34AB17;
	Wed,  3 Dec 2025 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764780608; cv=none; b=qes9WxCWfa2lLDkvEdNpballckiiIJUNO+QcGghrDVwNV+WG4hZzXwugGDfkkNKl3liMd2SG3kDSrmiVQcdSJ7j0TaeKc0ZmowMcNHzDQTw7cXBZs/AaGqUBiH/itPxrDIS0Q7gApaNemw7aO1vBribph/+fp3B6vcjOIhg01MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764780608; c=relaxed/simple;
	bh=Jme4OIMFQWmcFaNdH5RpMFIgiX8Pu9xb+81Duw4/IsM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gIj04PKbCy8ygL6xaQmhFtmx6Wj9enaJKIYf0NBlRn1u1broVMPqgQAQg7IgZAtJV/fTZ8+6k3sL6spiwMopLOrKO1rqFpRbLHh6CHMZIdBWmO0qnEx7HVykoodME90/EzCBjDv4ABBPrbTgu0n2U+RqCrGBACGE7AJWyiiqzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SamwXuUi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SamwXuUi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA68AC116B1;
	Wed,  3 Dec 2025 16:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764780606;
	bh=Jme4OIMFQWmcFaNdH5RpMFIgiX8Pu9xb+81Duw4/IsM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SamwXuUiWG/1X+14lMHPvEvek41+DUPIbPDnGWPW8ECbAL4lora+cI70tyJZjP0S9
	 EShT2i0wAr8VLsTA/P26OxUXFqIy1l62ayOcTVK0/ocaD43FXdFlqxEpx7rd1eSekF
	 5s8KIlkgWtNSG+9w/lCz/zMFiHIYCWO88wNtNJsAdb9/35tz++3qKCKXHa+CO9ziC/
	 X/0d20DQ8Rbi4HVy5UlE1ads94ra5SGOyzmY7aofzcr+9yLazJk/r80ZhAIMlDPxEw
	 fYfgpnX1URWjGE62qrwV06j6Cp+WdmW1JC9w+IIqEiIb1JCioXj3DTzPoYfOXbl7qa
	 DeMGmdQ961OtA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251203140611.87191-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251203140611.87191-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: codecs: nau8325: Silence uninitialized variables
 warnings
Message-Id: <176478060449.99790.11642224793852548654.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 16:50:04 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 03 Dec 2025 15:06:12 +0100, Krzysztof Kozlowski wrote:
> clang W=1 builds warn:
> 
>   nau8325.c:430:13: error: variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized]
> 
> which are false positive, because the variables will be always
> initialized when used (guarded by mclk_max!=0 check).  However
> initializing them upfront makes the code more obvious and easier, plus
> it silences the warning.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: nau8325: Silence uninitialized variables warnings
      commit: 2c7e5e17c05f1d5e10e63e1baff2b362cd08dcd6

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

