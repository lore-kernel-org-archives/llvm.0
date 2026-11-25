Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622407;
	b=ggAWWsBTgd+udDkZXcYhDRMiIrryH8KvLhnRnvCpBvUePUvrkc9a3magQ0PKswtbF4q1
	 A4y9Uy5CBUMk8Z6M3veasV1ieFk3vvD6oOq7PbJkYDE9mreQL9ZbBoaJjufSbBFqHa2Yk
	 q9xiegN/tMjRm2LC3PRGj/Q5T9HE/QF3co7GBHZd3IkjLcO5+Yc52mUZbhs8mAvX9g6Fr
	 nZXeL4ncPa9+sxqEbrKvCNP9CK7vg+EfXDt+hv4VXJk7PXk1fZqHJNBuSlIkWSvuwlrYd
	 giz095UQs9cFnVV4lmHkGc06t+mmfULKuIL07xYEIolO4nz5Iktq7Mkj4TDPkrLGLHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622407;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=QAaHSZ7sMw5VUlTsCKc7k41y1p2NOueXz2lrjbHzvGo=;
	b=Px4OhSeuYOWTLaO9p4sTPFYfelH48+sZJ2zT4BCv03/GvgOFuaEHpz2YAMLmEjH0mAvk
	 iv0hbpy/MNclmD4qnHhQhZRHmSTuP8gfS/HjqUQwZ/WRDiuOPtIPPyyVEXCoKBN8LbLsF
	 b8ZElJEutHMnVDrRKM29+5QOmSup3o0rCXsw8TE6gYMeVa1D+OxNknr32Jsnx0RD6k0J4
	 PAYGHjCXvlxQsGserxGijs6ZU7WdgsTq/2WNLf7EnW3xhn0LYK1Mp4CR9FpifIGNJ7GJR
	 06o1cHpIBfXt5q17FB1XCBBH7j6DpCPWpVrmZ/mocnpaXJCN0WWAOqSgCdasaUDNhug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gVD7JS00;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53814606A32A;
	Wed, 25 Nov 2026 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gVD7JS00
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8086B1F000C6;
	Wed, 25 Nov 2026 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795622406;
	bh=QAaHSZ7sMw5VUlTsCKc7k41y1p2NOueXz2lrjbHzvGo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gVD7JS00ZFP1Kv/R8gr3EKQWnODMrTPWuer6Rh+p5A0QFvINzAuRQhip2b3MgE7o3
	 2FZryKHYsgXVEd460sTW/r6OP0dfKEfST6f5eWlCqru4eTlMjYgxhbwwrKV5nDehsP
	 cDPL2MoH+es0b1VC2fozucNxM87Ti5fU0V4MzuIzDGnTj+IOZPFymerwe9wp5kp26l
	 xc+rn5zZgzVRuXpHNPgshLjb2zoMLwZ6jHuKqb+kcfE9eAVvLgnLMTfp0g1rE7zmji
	 FexHXwvVh23gfuTTyC3ftKZAaGI5bAoVG52xn/FkZiUki7T1ATA1nmd4xmPv+VG+Ek
	 xHhW5go2vfn9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773CA3808209;
	Wed, 25 Nov 2026 16:00:06 +0000 (UTC)
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
Subject: Re: [PATCH net] ncsi: Initialize vid in set_one_vid() to handle
 concurrent VLAN removal
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179562240502.773214.12173450041451654164.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 16:00:05 +0000
References: <20261119171009.1534335-1-irogers@google.com>
In-Reply-To: <20261119171009.1534335-1-irogers@google.com>
To: Ian Rogers <irogers@google.com>
Cc: sam@mendozajonas.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, fercerpav@gmail.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 elkin@google.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 09:10:09 -0800 you wrote:
> set_one_vid() checks list_empty(&ndp->vlan_vids) before acquiring
> nc->lock and rcu_read_lock(). If ncsi_vlan_rx_kill_vid() removes the
> last VLAN entry in that window, list_for_each_entry_rcu() executes
> zero iterations and leaves vid uninitialized on the stack. The
> subsequent 'if (!vid)' check can then proceed and program stack
> garbage into ncf->vids[index] and an NCSI_PKT_CMD_SVF command packet.
> 
> [...]

Here is the summary with links:
  - [net] ncsi: Initialize vid in set_one_vid() to handle concurrent VLAN removal
    https://git.kernel.org/netdev/net-next/c/e20f88c4f08b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


