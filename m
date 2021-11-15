Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D402C80
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 23:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7B8146124B;
	Mon, 15 Nov 2021 23:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637017209;
	bh=N8vy7Ciqk3MUgXenShMP/984Gc3+qw7T2saMQMt4meQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o5ILMxlQKhBlia8NToVIE/JiaA+lzdTYNM02/IaXtZxIfeNBN3h3IHVRga4kOnFBN
	 8RLq351UP05ECIqSCKjSCZc9zborUmxl2c7B4pqZW/eKvE1ZuXLguXpKGkcVpRx3ZT
	 J8VfnxVseZPlEWSobch4MptDZHhtnMTyLZmoNJ4YuxApJNesZeLV1J7oIS9mBjCMms
	 sduBa4sxE+K5Au3G+tLOu/8a2o96MAOX6AJBtB+IMV4YHLTLRiyGwJBbKaZ0nFgJQs
	 k7XdKeiOHHuboHAnMkir+OCps24pz2R8A2h6Vw+ySDoSizWgd0dMWxeEEXTpYshjTK
	 41uLR/q9K+EkQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6AE5C6095A;
	Mon, 15 Nov 2021 23:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf] samples: bpf: fix build error due to -isystem removal
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <163701720943.28601.12990584204511867827.git-patchwork-notify@kernel.org>
Date: Mon, 15 Nov 2021 23:00:09 +0000
References: <20211115130741.3584-1-alexandr.lobakin@intel.com>
In-Reply-To: <20211115130741.3584-1-alexandr.lobakin@intel.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: ast@kernel.org, daniel@iogearbox.net, jesse.brandeburg@intel.com,
 maciej.fijalkowski@intel.com, michal.swiatkowski@linux.intel.com,
 andrii@kernel.org, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, adobriyan@gmail.com, masahiroy@kernel.org,
 ardb@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev

Hello:

This patch was applied to bpf/bpf.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Mon, 15 Nov 2021 14:07:41 +0100 you wrote:
> Since recent Kbuild updates we no longer include files from compiler
> directories. However, samples/bpf/hbm_kern.h hasn't been tuned for
> this (LLVM 13):
> 
>   CLANG-bpf  samples/bpf/hbm_out_kern.o
> In file included from samples/bpf/hbm_out_kern.c:55:
> samples/bpf/hbm_kern.h:12:10: fatal error: 'stddef.h' file not found
>          ^~~~~~~~~~
> 1 error generated.
>   CLANG-bpf  samples/bpf/hbm_edt_kern.o
> In file included from samples/bpf/hbm_edt_kern.c:53:
> samples/bpf/hbm_kern.h:12:10: fatal error: 'stddef.h' file not found
>          ^~~~~~~~~~
> 1 error generated.
> 
> [...]

Here is the summary with links:
  - [bpf] samples: bpf: fix build error due to -isystem removal
    https://git.kernel.org/bpf/bpf/c/6e528ca494d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


