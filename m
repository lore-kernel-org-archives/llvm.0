Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13D6AA4
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 21:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D897C43140;
	Thu,  4 Aug 2022 21:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659649814;
	bh=sNu4cQ1Hyi93m4J8qIuzka9O/eG+aHKU1ncgeyWSFlc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RoiOucp3wXFSMlvgvhD3nsCZ7CC46fLqs403sP/muO9qukSiKdlPtfqfgGvSTh8VR
	 B1nkpxcCbMo9UPYngSwl+JdZcm6LQlvbUPll+ce2+cl5n1UMPZPSX75qF5JPcuCbjG
	 Uq74ObF4tR6YZPTMXAAUb6rJVy8t0ndeJ78uZfeEvmvLNv69eV32uQiw2hnCWT2fjS
	 PD/+7HdEGbuj0hnrKMslEWM9p8PIM7fXAqNtVLqcy276+vNfF1xTUK6MzoFl8mf7gk
	 ishDxkPAPB6Lg8LZ5R3VIyQUm/vs5HhSSVYb/S1KL77x+5hwG/nu3ARIRnXMhKa1ZI
	 rYEJJh3worCdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E63D0C43143;
	Thu,  4 Aug 2022 21:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] libbpf: skip empty sections in
 bpf_object__init_global_data_maps
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165964981394.20332.4186974338092627002.git-patchwork-notify@kernel.org>
Date: Thu, 04 Aug 2022 21:50:13 +0000
References: <20220731232649.4668-1-james.hilliard1@gmail.com>
In-Reply-To: <20220731232649.4668-1-james.hilliard1@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: bpf@vger.kernel.org, jose.marchesi@oracle.com, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Sun, 31 Jul 2022 17:26:49 -0600 you wrote:
> The GNU assembler generates an empty .bss section. This is a well
> established behavior in GAS that happens in all supported targets.
> 
> The LLVM assembler doesn't generate an empty .bss section.
> 
> bpftool chokes on the empty .bss section.
> 
> [...]

Here is the summary with links:
  - libbpf: skip empty sections in bpf_object__init_global_data_maps
    https://git.kernel.org/bpf/bpf-next/c/47ea7417b074

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


