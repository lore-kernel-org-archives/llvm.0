Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE782562
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 22:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 676F3C3411F;
	Tue, 31 May 2022 22:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654037413;
	bh=1ffP4TkVvgi6sPn0mAOKdWQJeMzHw+Y5jSkgORcq0E4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FQGC0vPJHF2v812MbjsSI7JBhC+nkrsu62q1PtPwswLKAXkeCQEWYtmdJQvFoQlgR
	 xR8M+hUEhlUStAGR26lDRluxMU5FZCrE6uyak8qQ3Xmarg0aQ1ajvHEDDSgLYsNPCX
	 Jkws8dJocrLartPwQQQiRRbf/PmLPfKwPm01/EpgaBS7u5tJCWKacrGazjswn6l6pa
	 EvCktRAykqz4V74M7LiS0bAbWItLZDrSaubQVxdP6nW91nCihi+VE7qmugEL2yFBAp
	 A9wFT2mqi61r4B42BzxHM78OPlNYXescDTc8gxt7p1gYY5R/2RFYA6UlPwsEuOkb9q
	 YuQQ6oSwIJo8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B243F0394F;
	Tue, 31 May 2022 22:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] libbpf: Fix determine_ptr_size() guessing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165403741330.9645.14080630675434689339.git-patchwork-notify@kernel.org>
Date: Tue, 31 May 2022 22:50:13 +0000
References: <20220524094447.332186-1-douglas.raillard@arm.com>
In-Reply-To: <20220524094447.332186-1-douglas.raillard@arm.com>
To: Douglas RAILLARD <douglas.raillard@arm.com>
Cc: bpf@vger.kernel.org, beata.michalska@arm.com, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com, songliubraving@fb.com,
 yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Tue, 24 May 2022 10:44:47 +0100 you wrote:
> From: Douglas Raillard <douglas.raillard@arm.com>
> 
> One strategy employed by libbpf to guess the pointer size is by finding
> the size of "unsigned long" type. This is achieved by looking for a type
> of with the expected name and checking its size.
> 
> Unfortunately, the C syntax is friendlier to humans than to computers
> as there is some variety in how such a type can be named. Specifically,
> gcc and clang do not use the same names for integer types in debug info:
> 
> [...]

Here is the summary with links:
  - [v3] libbpf: Fix determine_ptr_size() guessing
    https://git.kernel.org/bpf/bpf-next/c/8a140f1b12f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


