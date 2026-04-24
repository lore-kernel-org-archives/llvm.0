Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4137B3F165C;
	Fri, 24 Apr 2026 18:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777055594; cv=none; b=SL7bRjffbd7qT2ixKFeRB2FcFVMJibHvXfvvlE2t8kyI5e78U9V9WCLGiPpGBF7ETO4GhT1VEZXNBNLiqZIkL+nfCeaDPSBPMwb2zoP/St17WlC1yPoyTu3aCkz1iuGGW/6IYhxHnKuDjx2S8Fr4Rk0ql6Ud8XPzDQf6LMcjsWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777055594; c=relaxed/simple;
	bh=zTCRq+2zfmw7zKkjWSm04PNGr5LGaFZj5WfaGNSS6xw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ke1jX2n9meOEhC/XYEePF0L3bUwJ9XNwXe24TL2xQWfS43Mk3kyH0B4GVAYz++oFndSP3uv0Q2bfo+tUYuqlJV6e5OdxGYGWRDH0Lzc7SaKfTynOvDPySJywgT360s/m+kB859j49xHBO/INJjGDSqKSmPkbpLeB0T3VSgnFbg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRdT3m1f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRdT3m1f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D845FC4AF09;
	Fri, 24 Apr 2026 18:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777055593;
	bh=zTCRq+2zfmw7zKkjWSm04PNGr5LGaFZj5WfaGNSS6xw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PRdT3m1fFDPANuoekRshwYU7GrbYJlHBRQU/uoTvet0Um5yt155Fbo/YspYoYNHwp
	 fbvSByt6YewJ4s77en3yOqXdmhWSNkdQGY32LlAkWA8hCYQU0zdgr5t9LMfTJcBU46
	 +5lNZlLhMYMWIkmHpk9TvlAa09pu7Sy8wVSaown05uQpIW1t7lqJcTFC1Vo/a0ZI6e
	 GXai7CvRupoSmhzbPGFE1gi067ZfDmFVU5BrtdEry5PE3992LqyopAVaYRVmQz5Rik
	 4m/hpJjxSxe5Wba0jTtmc540EBew3mOWcaJqvOKm7QphWWmlhUt3lINz8jbYt0conc
	 uiemepY+ij+pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D0F538119C3;
	Fri, 24 Apr 2026 18:32:35 +0000 (UTC)
Subject: Re: [GIT PULL] Clang build fix for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260424000413.GA1031124@ax162>
References: <20260424000413.GA1031124@ax162>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260424000413.GA1031124@ax162>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git tags/clang-fixes-7.1-1
X-PR-Tracked-Commit-Id: 4f96b7c68a9904e01049ef610d701b382dca9574
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bbc4af7ad94c452c00e64fc400fc1317351969b4
Message-Id: <177705555418.1656274.1645363885163179892.pr-tracker-bot@kernel.org>
Date: Fri, 24 Apr 2026 18:32:34 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 23 Apr 2026 17:04:13 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git tags/clang-fixes-7.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bbc4af7ad94c452c00e64fc400fc1317351969b4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
