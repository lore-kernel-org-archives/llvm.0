Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55553CA483;
	Fri, 29 May 2026 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780098047; cv=none; b=dsoaVkL1mYlAddaD2Wu7B6G6ovhAR41n8FbZMSAg36wpx5ubdkzhsLIP4gf2SI2IsPVgYDGBYxCeGGHLtvT5cIwW+KkU8LDSyNqTrntyV8EEyJPLN1QRBcpoqEaoiYJC6vSwK9MD9M+tBxRGnujkY/18gEIDkeB1WbH+V2xfJos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780098047; c=relaxed/simple;
	bh=ValZ1goH3R6tug2i6kPBtlMtN+Q96bcHT44Q6eieLK4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fOXLdr6uOhswPI01b8Z3pvIREdAkCgDRuo8KSffOmg+hRd34X8W5qKyZdwW7MJ9/FB6ZdoxOIT6NJdEgriyhhiz3ed0HUQASKY2zyBjE1mA0dBA9bzQ3lGQ3q76wyBbbwUVXMmnCv+kwxukHGN74wwEVKj5fnm2GJuj6WKqbhPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQlrirH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQlrirH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B7C1F00893;
	Fri, 29 May 2026 23:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780098041;
	bh=0XWQad8NDmSaPKTw6Ur0oz/DxR8jqZHSq3kyV7kK8lo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kQlrirH5mBPpPS03f/04SJCvzwaj+vGKdNKcpu3MRQMcQn/o57r8nkxlVTnJzWxqA
	 oCkYl3z8hk18GfYX5z+PCTrZttavWf23YzkQK3LXmBwMZqYbZQEOoG5bZDebyZANN6
	 s8fKxzG/o4mPpiI0N8vy/cr9ABkUMpZ20HKtWSwgY8iTXsQkdGT4dZbdeVi/Ydw9IY
	 nCJX/set/z7P0Sr97XCIbjO2nvwADmxHFPb8D9cHcGYrinz+qy7Uq0u2cDkNvwmeNJ
	 PWe8nx4s9S9lxi9NqptiodGCUnYINFGLEwp0WoRi+SMKIGWIKz+7hI5EEXF5pW7UxE
	 UEoOgnDIVLI/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A0139301A3;
	Fri, 29 May 2026 23:40:46 +0000 (UTC)
Subject: Re: [GIT PULL] Clang build fix for 7.1 #2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260529210055.GA2415550@ax162>
References: <20260529210055.GA2415550@ax162>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260529210055.GA2415550@ax162>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git tags/clang-fixes-7.1-2
X-PR-Tracked-Commit-Id: 175db11786bde9061db526bf1ac5107d915f5163
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 77590cacabb3bffba7e2e95c359889bc44241b68
Message-Id: <178009804518.2001479.12892510812940026458.pr-tracker-bot@kernel.org>
Date: Fri, 29 May 2026 23:40:45 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 29 May 2026 14:00:55 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git tags/clang-fixes-7.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/77590cacabb3bffba7e2e95c359889bc44241b68

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
