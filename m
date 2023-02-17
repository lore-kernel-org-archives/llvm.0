Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A98E361
	for <llvm@lists.linux.dev>; Fri, 17 Feb 2023 01:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17458C4339B;
	Fri, 17 Feb 2023 01:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676595619;
	bh=8w5Cvm+JJNB9gVAPmcED8ftOX539Epn1aCKmjUjpJ0k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hnl+ICGSiR0iNbNJhH8p8PznwUzvCb9WTtsz5jslMrN/tKJeaFepMys1z9L5Ivw8u
	 xCLDXZy0CR/qrs6r745FRfMZx9ReJppe4zXyQvvI0QwkUGERZYTL8gQ5RuTiT9jxtN
	 SBC4E8r0jdQ4sE/nPN5/S5K0sjIJCALT/VGLtqfJPitaIvM0cWLRPcoG9w4+njz/tS
	 H6egi0/bCcTKTeC1pOhjLkTolHM4rh8W3oO7jbnu/zlRX+Pci5WU3v06fZw9iSfcqd
	 vl/XSRpCZRr8PWWANt2ZCCCERCOxZsph/c9+/f1vKxsrRZB4DNMMVuvFCP8tAMTwn3
	 ztN54Pu/FoUcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DE20BE68D2E;
	Fri, 17 Feb 2023 01:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] Fix typos in selftest/bpf files
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167659561890.14337.623959612136351580.git-patchwork-notify@kernel.org>
Date: Fri, 17 Feb 2023 01:00:18 +0000
References: <20230216085537.519062-1-awkrail01@gmail.com>
In-Reply-To: <20230216085537.519062-1-awkrail01@gmail.com>
To: Taichi Nishimura <awkrail01@gmail.com>
Cc: andrii@kernel.org, mykolal@fb.com, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 shuah@kernel.org, davem@davemloft.net, kuba@kernel.org, hawk@kernel.org,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 iii@linux.ibm.com, ytcoode@gmail.com, deso@posteo.net, memxor@gmail.com,
 joannelkoong@gmail.com, rdunlap@infradead.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Thu, 16 Feb 2023 17:55:37 +0900 you wrote:
> Run spell checker on files in selftest/bpf and fixed typos.
> 
> Signed-off-by: Taichi Nishimura <awkrail01@gmail.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c  | 2 +-
>  tools/testing/selftests/bpf/prog_tests/trampoline_count.c   | 2 +-
>  .../testing/selftests/bpf/progs/btf_dump_test_case_syntax.c | 2 +-
>  tools/testing/selftests/bpf/progs/dynptr_fail.c             | 2 +-
>  tools/testing/selftests/bpf/progs/strobemeta.h              | 2 +-
>  tools/testing/selftests/bpf/progs/test_cls_redirect.c       | 6 +++---
>  tools/testing/selftests/bpf/progs/test_subprogs.c           | 2 +-
>  tools/testing/selftests/bpf/progs/test_xdp_vlan.c           | 2 +-
>  tools/testing/selftests/bpf/test_cpp.cpp                    | 2 +-
>  tools/testing/selftests/bpf/veristat.c                      | 4 ++--
>  10 files changed, 13 insertions(+), 13 deletions(-)

Here is the summary with links:
  - [bpf-next] Fix typos in selftest/bpf files
    https://git.kernel.org/bpf/bpf-next/c/df71a42cc37a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


