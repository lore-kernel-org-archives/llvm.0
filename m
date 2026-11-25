Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621206;
	b=xaTWS+6d3P9vPQkJSTIxAIw1wRgigdut93e1OGQLE9tE+31+9QD+znc8qydQ2ILbVGoh
	 WIyZyPuDzj/wQdo5N8u4sDnGBIeEyofGncmO3h6VW2pekFEjwaXbkR+ggg8QmROnXVzbV
	 WF9uxrJrVRZBaIEejYBNO6ZQC67NxNEITIqeic1YJbI6jqi/4TOpP1WFlEhdf9tWVBk4r
	 lKswfeAiXGcdurqwAQsXoBNba4ogN928wE8xdI3T90Xtxs77kVS3USS4k4E2d3/QVjk7d
	 C6wK8jOWilC3u1dJkUmp4y1izn+4sLnT5lHLhqd+neH9E13iu/Llq8Z9/3mBiLYREBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=JilttFuISU4lz75pSyDaY9HWz5jlv4i6yj7CHFO7pLY=;
	b=Pv4cl9RNRi/pvjzwN4MCfPBHf7GiW6tdjyBCK1pXJ1evBYGq63P/dtINRC2uc5+coFmb
	 NkLnseTsujBLmojz8fEFZXP+9DX1EQsUZSnvj2Y59MBgJjv5AM0kepOJhigviCuzsYyMt
	 BQYqMQHIXYmPrQ35ymoKDupEP9C4tmLl8xTkjPufw+WFqZaUiJfV4PrMKe1v7Cfz76bPP
	 KMkyjC2IAdjEgWwgM+vEu9nEyqKHTVzlrsf3MMz22x5LYJmXAmtyrQrbhdV2qX4hgR4sl
	 qSUvPK0QdwgYNcwnYZwTHnrwBC+Yt9KwhNXddj07a8DJ0Tr1BFoXUPuRhGSF1Gjn2vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nl8F94FS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8048606A33B;
	Wed, 25 Nov 2026 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nl8F94FS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3BD1F00A3D;
	Wed, 25 Nov 2026 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621206;
	bh=JilttFuISU4lz75pSyDaY9HWz5jlv4i6yj7CHFO7pLY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nl8F94FShIwGcAewqeQ0HDOOsVTX/meREn5SrtdEBK/T+xF0q2s3xbgNq04LLk8Rc
	 fqnUiELjYu9Q0iUNqOJoDD78jnUllGxFz2O1nXrAAGJPGjPMJPtf+k/10bpfsvNSII
	 QKbpUz4AAxvE8qNskCTEjscG3plOy8Qmg9lfFo0Ykp0quvJ7oANmnYeo6VZuX5weBG
	 rJE9z3qXmxxpWwX281G05doEs4p7v4py1kyvLfz7f3l1zJalsMUnYW7PAAAaMbCMPa
	 FH8g+BN1lpkfVgLd7c3ZBCOYOnTEHx91T0RHSQADFpp6fOIGmMNF8cqI5bRm/blYqs
	 m+9M7k4phSdWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7751B3808209;
	Wed, 25 Nov 2026 15:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] qed: Fix missing bar_id comparison in
 qed_hw_bar_size()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179562120528.634550.8981460796989687102.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 15:40:05 +0000
References: <20261119170412.1511344-1-irogers@google.com>
In-Reply-To: <20261119170412.1511344-1-irogers@google.com>
To: Ian Rogers <irogers@google.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 09:04:12 -0800 you wrote:
> When PGLUE_B_REG_PF_BAR{0,1}_SIZE reads back as 0 on older management
> firmware with multi-hwfn devices, qed_hw_bar_size() logs that it assumes
> 256 KiB for GRC (BAR_ID_0) and 512 KiB for DB (BAR_ID_1), but evaluates:
> 
>   return BAR_ID_0 ? 256 * 1024 : 512 * 1024;
> 
> Because BAR_ID_0 is enum constant 0, the ternary condition is always
> false and qed_hw_bar_size() unconditionally returns 512 KiB even for
> BAR_ID_0, doubling the computed GRC BAR offset for the second hardware
> function.
> 
> [...]

Here is the summary with links:
  - [net] qed: Fix missing bar_id comparison in qed_hw_bar_size()
    https://git.kernel.org/netdev/net-next/c/8301cdd07d43

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


