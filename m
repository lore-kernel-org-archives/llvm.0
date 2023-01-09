Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767833D6
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 16:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241C3C433F2;
	Mon,  9 Jan 2023 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673282949;
	bh=vfToooFvqG7PPIh4+IgqDfsebCiWzTMy8pkLwP+eTLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dTZ4S4m0Kixw+/ADbnK/a9lxMmzQ94LmS1Z0eEq/i7EruP1hlAt81aajr5fwcRNL5
	 pOe/qFU5fQrbC3YDNIrtf8kwCZ2gRziMWn/OJXEed2A8OQOSFNcQ2ees5Li5P207ee
	 K/OpgSs6fJRl/z5g7grnlJDAoCwaNoSPN9ngl+DIeGdT6RUWHbcWA8wpufWGHVf/TH
	 +d7hDCYszE6gHjpqBwAPwHzMeyi9Gmv1H0gxd8GztsrKkI2/+rjCgDjOy0bV/mrpVA
	 z03ZwJ58N6JEuKglO24N5iDEZPXIOvhDD/sqliSpfEjtxoV12W8/ATmgS3Y9AXsPA0
	 CU2OT9vfCG6LQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Nathan Chancellor <nathan@kernel.org>
Cc: Vijendar.Mukunda@amd.com, Syed.SabaKareem@amd.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
In-Reply-To:
 <20230105-wsometimes-uninitialized-pci-ps-c-v1-1-4022fd077959@kernel.org>
References:
 <20230105-wsometimes-uninitialized-pci-ps-c-v1-1-4022fd077959@kernel.org>
Subject: Re: [PATCH] ASoC: amd: ps: Fix uninitialized ret in
 create_acp64_platform_devs()
Message-Id: <167328294786.323147.5948330744390772644.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 16:49:07 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1

On Thu, 05 Jan 2023 08:53:32 -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>   sound/soc/amd/ps/pci-ps.c:218:2: error: variable 'ret' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>           default:
>           ^~~~~~~
>   sound/soc/amd/ps/pci-ps.c:239:9: note: uninitialized use occurs here
>           return ret;
>                  ^~~
>   sound/soc/amd/ps/pci-ps.c:190:9: note: initialize the variable 'ret' to silence this warning
>           int ret;
>                  ^
>                   = 0
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: Fix uninitialized ret in create_acp64_platform_devs()
      commit: de1cae22898cf10aacc735a21d799b5bbce4496c

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
