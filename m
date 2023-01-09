Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3183C0B
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 16:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECA7C433F1;
	Mon,  9 Jan 2023 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673282959;
	bh=crfH3DNuxnnnEgBLc4QnnpaR6XIAnGQOnWmoA6qkFFo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i7nz99UUUB6mq8L6gizntMmjWgzo0ggwV1fA/GkVuSeGE/DYjSDy4egfwgjFO7lkn
	 n3E1W93PxQVkOojQkLMT9IvVzW3BQ8k91d9Zvnssn4pVzbzmAejw923qZani6LdgTe
	 U2vuEB6YPEa57xrjp/pae4pMRCKio68lLDZ9yjcySuwPOYJ6wBQtbK3Im7i0hwz3KC
	 bKsTMg5FDAMq0S/Fsmth7TzthwKfInp33J8GtUk4/xxzgS6EqkWtBGeQL4fxx1P1u7
	 Kwk3yxKCGB+O/FcjS0A8hQFmP2MP+RB4/0+pGU5XZ2MyANpiYZejzq899YftK02PGc
	 xJ+PbTWkjkulA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Nathan Chancellor <nathan@kernel.org>
Cc: Syed.SabaKareem@amd.com, ndesaulniers@google.com, trix@redhat.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To:
 <20230105-wsometimes-uninitialized-pci-ps-c-v2-1-c50321676325@kernel.org>
References:
 <20230105-wsometimes-uninitialized-pci-ps-c-v2-1-c50321676325@kernel.org>
Subject: Re: [PATCH v2] ASoC: amd: ps: Fix uninitialized ret in
 create_acp64_platform_devs()
Message-Id: <167328295784.323147.10320883556735377893.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 16:49:17 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1

On Thu, 05 Jan 2023 17:43:39 -0700, Nathan Chancellor wrote:
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
