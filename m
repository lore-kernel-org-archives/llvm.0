Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ED3A92D
	for <llvm@lists.linux.dev>; Wed, 22 Feb 2023 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1FADC4339E;
	Wed, 22 Feb 2023 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677100217;
	bh=wCQQEMkM7Jx3pn9FFGosm1zRw8TdEwhVF5bmgBxG7Zw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YiGkRhzzZ6Y4QBYUP1zV2oy64eR6ubK7rULwLt0ayty2l01r2/S40q2dbINMjz+dp
	 l5PJ/QkEWHWA9o54cMTdNAp68A4fk9PUJm9/NIv2DLqEk8v40w0n6w8sJkraXRP8O2
	 YtfJP3C7Jw5LIgx4d/ucY1OTtBKVoBXPCkpLgT4R5eZb6yizRyrPjU8iYQdB/PGuiy
	 N3ylqMUK21hpc0hi8yIg4VkLdigDDMLWQHVQIXafMGykroJrUyBQPjaS2s3FGbkfxd
	 Hs3iqdoyvCMxvJNZ3Wwq1IuW/i+TqZF9cICWjer+BeWEJAlpAIBBDGLRZhDNcARQz3
	 X2OiXYCWa3bzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8460EC395DF;
	Wed, 22 Feb 2023 21:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix cross compilation with
 CLANG_CROSS_FLAGS
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167710021753.10496.8520957116500555540.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 21:10:17 +0000
References: <20230217151832.27784-1-revest@chromium.org>
In-Reply-To: <20230217151832.27784-1-revest@chromium.org>
To: Florent Revest <revest@chromium.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, andrii@kernel.org, mykolal@fb.com,
 ast@kernel.org, daniel@iogearbox.net, kpsingh@kernel.org,
 masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri, 17 Feb 2023 16:18:32 +0100 you wrote:
> I cross-compile my BPF selftests with the following command:
> 
> CLANG_CROSS_FLAGS="--target=aarch64-linux-gnu --sysroot=/sysroot/" \
>   make LLVM=1 CC=clang CROSS_COMPILE=aarch64-linux-gnu- SRCARCH=arm64
> 
> (Note the use of CLANG_CROSS_FLAGS to specify a custom sysroot instead
> of letting clang use gcc's default sysroot)
> 
> [...]

Here is the summary with links:
  - [bpf-next] selftests/bpf: Fix cross compilation with CLANG_CROSS_FLAGS
    https://git.kernel.org/bpf/bpf-next/c/b539a287baaa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


