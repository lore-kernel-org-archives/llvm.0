Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CE21DF96C;
	Thu, 17 Oct 2024 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729182631; cv=none; b=bn+FToRc77otFnxOs3PIGnJ8uQgeQma9CrSJk8Hiq1liAGA64aZbXQjtbN2MhYja9uO4CTsMC6mNl+J9hN2n0F4XL2QOAN+Wc2gdu2CV4YDrJo4qErCkn3DjXIR13NLtK4uEgH72lQQ/mbHmp4p4kdOpWXbeqV5x5oN9KIO3ojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729182631; c=relaxed/simple;
	bh=KH8o1h7M6XpFzHWRszjgrArk3aExRlRWHv7xNLYme7Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PWH3+S7RnCo3zTTuvXRZOZ74KNQK64PFoOFM5CjQdvXJJ/NWkQFiJAKVELjbHJyBHuwIU8CJjQhx8MZGgB1mzrCsDXFs3x6Xb50pZdcGVUx2McGX5sqC8+GcM8qsuhI1iXD5emWKiENx5pMddDtdJKritxO+SfZcQdwpbeRQJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArAZ9c+I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArAZ9c+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D6EC4CECD;
	Thu, 17 Oct 2024 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182630;
	bh=KH8o1h7M6XpFzHWRszjgrArk3aExRlRWHv7xNLYme7Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ArAZ9c+IdoghXXrlY3tLFBAVCWiI0Y3XQYprK57xOgHXiKn4jyful/WcYoqBjSZeX
	 /Jj3r0ZKrKmX0ogEX3MyMXQ+4B1bl9H74dRlNsJxZCRmTT+V8oYWV9IsPPlzcvqVEv
	 JRAm8kRzDsarLBLsL5Pk+Zi/f2rLCwGSH1AQqSGdzc4JEuf+Kt/8vAtUH6iUwvcjRG
	 UZiqx7UKH1OsV4pqUORI8BM5+YiA9q8qmsLvzaLSSGqJpH10EFTVSls+E/KcUQrE2Z
	 7eDoZHJsqSSk9VQJ8i9rWEciGlGlZWkJlMRHWOdSnT7N0J7UFzVJh36kvJDy8xq+ju
	 zrqmkVk67DpEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 715943809A8A;
	Thu, 17 Oct 2024 16:30:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <172918263598.2528145.14698302036420162335.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 16:30:35 +0000
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
In-Reply-To: <20241001-playlist-deceiving-16ece2f440f5@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 jmontleo@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  1 Oct 2024 12:28:13 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> During the discussion before supporting rust on riscv, it was decided
> not to support gcc yet, due to differences in extension handling
> compared to llvm (only the version of libclang matching the c compiler
> is supported). Recently Jason Montleon reported [1] that building with
> gcc caused build issues, due to unsupported arguments being passed to
> libclang. After some discussion between myself and Miguel, it is better
> to disable gcc + rust builds to match the original intent, and
> subsequently support it when an appropriate set of extensions can be
> deduced from the version of libclang.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: disallow gcc + rust builds
    https://git.kernel.org/riscv/c/e52d5050a0d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


