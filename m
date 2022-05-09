Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737F7B
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 10:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49070C385B0;
	Mon,  9 May 2022 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652090412;
	bh=29mSpAua4b8hjk9GKvTkGUR9JajuXItC18hWIP0Js8A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O11DO6mYOO600sMRMllIbjLkarWSnk5FMiBm79/PWIWaAuiYSyCCavJbhm0hg+KzO
	 DQhvNtMZW5ILPkNUbD5QfiTkLpLy2r8rN0C4RFyBUFqWqEyq0PHK/vo4GSiPM9XEIO
	 4ftwcJxqiiW+g9c41Dk/7ixHMPjSBQ+V+3VYAvp/yAkWglySpqoylz3rCT7ifKJ5rR
	 9jfF5PMeSRvJMI1TDFZyug/E5Oyzv3EXur/Pryk6tj+c9MaiGqWVnUMDvtCgduQBMS
	 u/c0O76qUzl4o/VEiQ5Id0B0eKAcdigpVH/e0S5/6MdV5VVSjbqPFjPWauHcBka19r
	 eYmpP52r2ieow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30B4DE85D8A;
	Mon,  9 May 2022 10:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 1/2] net: fix wrong network header length
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165209041219.866.7810964831911496184.git-patchwork-notify@kernel.org>
Date: Mon, 09 May 2022 10:00:12 +0000
References: <20220505054850.4878-1-lina.wang@mediatek.com>
In-Reply-To: <20220505054850.4878-1-lina.wang@mediatek.com>
To: Lina Wang <lina.wang@mediatek.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 matthias.bgg@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, hawk@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, edumazet@google.com, willemb@google.com,
 maze@google.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev

Hello:

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 5 May 2022 13:48:49 +0800 you wrote:
> When clatd starts with ebpf offloaing, and NETIF_F_GRO_FRAGLIST is enable,
> several skbs are gathered in skb_shinfo(skb)->frag_list. The first skb's
> ipv6 header will be changed to ipv4 after bpf_skb_proto_6_to_4,
> network_header\transport_header\mac_header have been updated as ipv4 acts,
> but other skbs in frag_list didnot update anything, just ipv6 packets.
> 
> udp_queue_rcv_skb will call skb_segment_list to traverse other skbs in
> frag_list and make sure right udp payload is delivered to user space.
> Unfortunately, other skbs in frag_list who are still ipv6 packets are
> updated like the first skb and will have wrong transport header length.
> 
> [...]

Here is the summary with links:
  - [v6,1/2] net: fix wrong network header length
    https://git.kernel.org/netdev/net/c/cf3ab8d4a797
  - [v6,2/2] selftests net: add UDP GRO fraglist + bpf self-tests
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


