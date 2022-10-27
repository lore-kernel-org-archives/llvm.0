Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A07B
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 20:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CA62C433D7;
	Thu, 27 Oct 2022 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666903832;
	bh=A4E5bckZc2Ra37LNVj7x6T/9k58cNSMtXpbZePCSihk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Rb+F7adZJy2QkXeTMgATWrkFonZsdM/ZUKGYeKWEvM4hjtbq+d3eCMvJLenGQiQZH
	 kAvVTkEkpA16fq2r5ugirNvQDGpweD3yYaLd9g9UfMe/1VE5nzO/V7bjRims2fkD6O
	 pOIpM8IlZsbiy6oa0+hNz69M3/EGio4Su+iRD/Lfpv/XxhBgFBIcXno9B+ZGdngrWh
	 MYbD6QSJYOx6BJoRg7wXl0ifjDbG649TQez2uyzgVYM1M5UniDUNJ4BjwHm2ItBwWC
	 zm9mhds5sQf02byc9hWeSPSWDH9aKRV8XJuAXK6vkPbgWLtSTcoCgZ8dXhqtXERVRU
	 xAnHQmIGz6Drg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56F18E270D9;
	Thu, 27 Oct 2022 20:50:32 +0000 (UTC)
Subject: Re: [GIT PULL] hardening fixes for v6.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <202210271203.1CABE4152@keescook>
References: <202210271203.1CABE4152@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202210271203.1CABE4152@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.1-rc3
X-PR-Tracked-Commit-Id: 72c3ebea375c39413d02113758319b74ecd790bd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2eb72d85acf3357e6d7c88febcc0ad553805364b
Message-Id: <166690383235.21870.10456103204204237625.pr-tracker-bot@kernel.org>
Date: Thu, 27 Oct 2022 20:50:32 +0000
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Daniel Latypov <dlatypov@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 27 Oct 2022 12:03:27 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2eb72d85acf3357e6d7c88febcc0ad553805364b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
