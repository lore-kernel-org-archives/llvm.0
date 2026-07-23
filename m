Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B952EACEF;
	Fri, 24 Jul 2026 00:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854729; cv=none; b=AVwDO24EKrQVN1U+/p1hoNWejBnwLh76cQRp4UxBS+L6G8FstZLsmC87141VOKiAbNFUgf/1JqkQa89tSCz+hGabHzLVD+kfFKrRmiPyUOob/49U/719rcPFZbsCpcUAvIDOvP+aQkFnuAVFNAizwE2FBATOWSh3mzUpFQ6ciUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854729; c=relaxed/simple;
	bh=kYBCVXLf+NvYTj8pUgG7apeorSCwZdX1V5DnRUMCi0I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EvO58U5swaBiiQwqpdUXAGGbI9MjlVT1ipyok8M4LlvsK1eBSp9V+VOmAJKexn2LMGyfue178u/AHXLKU2BvRWD6G7yT3cSqbYd9Lx5JyCps4qnsIbqf9IlTjii0SWXZGd9VyiHk26szjKhKBqBiE1VZ/XrH+8ZDneJYKPMUzg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYDbUcaI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYDbUcaI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4683B1F000E9;
	Fri, 24 Jul 2026 00:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854727;
	bh=SPeX5dS5ir8Rk4ckvl4IDqgZnwP8y5HoG5uK82k+lqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KYDbUcaIIGQjw40tH57SKb//BLcVE1Jya2O6qh6+ScF8cOQypuR4+PQc88Rlt9Kdu
	 IyG66cALObfNA+phfH42iMUqhPzrS4mh7mK35XMhUkB5URkl7yM9wriTQcoOwRwS9L
	 hgb78TrxxPmoy8txCbO+7xKabFBNRZY+npOYluDGiJzboOqt/oOIKZg51q7Ed+35Mb
	 NVVwoUo+XH/gCkQewnE3ajZJCB0atPvPORXFs7QHeFQf60qNd/2c7iFwSeWjs+fV/S
	 nIt/dZ0vyTjaUERWLL54sAwJS8oYbh5YKb1C1vjOFC6dFnlO27pcxc8uHC94qkDBXp
	 /MtCaGQ33cWnw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20260721225936.838299-1-rosenp@gmail.com>
References: <20260721225936.838299-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: mpc5200_dma: use platform helpers and devm
 cleanup
Message-Id: <178482675253.53486.16257111498577793844.b4-ty@b4>
Date: Thu, 23 Jul 2026 18:12:32 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kYBCVXLf+NvYTj8pUgG7apeorSCwZdX1V5DnRUMCi0I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrjEsU0CVHErtTExlQG1JeVX/nJjJijt52Ivd
 1V0eUCLcQKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK4xAAKCRAk1otyXVSH
 0OSGB/494g44wpgRez/RJ1m8jJMjYqFgn4Ro88HHluFktclOllqSRndNPt9gYwAmh75uueCE3Lq
 Y8mCLJ2b47vLJrLjAC2EWlZ7G+3XbJAILQ0UlK79g4iWtqzyBQ7g83MuwnlxDYLqOgqQQsg7i1d
 HOfco016qhLKbvYkxg05GqwY2O2MKTLP9U54jaaini/VvSu/9ZeNoFeK6NoTYqxECUylUrRPECz
 lqWB7uK4hBfbee7un7ToH0wYB9FRJHnoE+tYrkjohBkdL5KRZ7goc2WE4IgKfDUisEeEflan773
 Lxatwpe+s82VBDtyiXJjvY/bgjbINkxz0P+lwrRATAwby5rM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 15:59:36 -0700, Rosen Penev wrote:
> ASoC: fsl: mpc5200_dma: use platform helpers and devm cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: fsl: mpc5200_dma: use platform helpers and devm cleanup
      https://git.kernel.org/broonie/sound/c/3a065257412f

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

