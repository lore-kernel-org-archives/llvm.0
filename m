Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C250E1869
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 18:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62C5AC3411D;
	Wed, 22 Jun 2022 18:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655921412;
	bh=RdMpY98Dovcj8Z5McfPbAv7/dxekKq/qt1Sdz8M2fns=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M1lnBRZaS91Spw1v4oBV9+wAMRBYZpEKHBZlajh/I4BZwsxJzUq/TN9FYY7dTowck
	 7+XYe0koh8xbcF9qhQfI/hA1fEDchj3QWRnqtfkTv+9B5zIN9fueH47uAqbCy8rCxG
	 D5q0LIP7vLum99NLJIhVaCxA6s2PDrJmAR0YbcAebZVNwxWzZyR8qjtubKkKGDfeMw
	 MUtdS5clzwM/Vo28yYszTNtQbe8QjUXLvQQXc264lUxGBcPXZq5PaY36A8sq9caJG5
	 jFVzNz75LQxpk8mljr6k9eIbV6IOgQh84y+sPRut1RbPi55soJGFQJ5DX4Hgf77lR+
	 7RklIbc4+3DuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 480A7E7386C;
	Wed, 22 Jun 2022 18:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] hinic: Replace memcpy() with direct assignment
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165592141229.24504.12499679747935394239.git-patchwork-notify@kernel.org>
Date: Wed, 22 Jun 2022 18:10:12 +0000
References: <20220616052312.292861-1-keescook@chromium.org>
In-Reply-To: <20220616052312.292861-1-keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
 trix@redhat.com, leon@kernel.org, jiri@nvidia.com, olteanv@gmail.com,
 simon.horman@corigine.com, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 15 Jun 2022 22:23:12 -0700 you wrote:
> Under CONFIG_FORTIFY_SOURCE=y and CONFIG_UBSAN_BOUNDS=y, Clang is bugged
> here for calculating the size of the destination buffer (0x10 instead of
> 0x14). This copy is a fixed size (sizeof(struct fw_section_info_st)), with
> the source and dest being struct fw_section_info_st, so the memcpy should
> be safe, assuming the index is within bounds, which is UBSAN_BOUNDS's
> responsibility to figure out.
> 
> [...]

Here is the summary with links:
  - hinic: Replace memcpy() with direct assignment
    https://git.kernel.org/netdev/net/c/1e70212e0315

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


