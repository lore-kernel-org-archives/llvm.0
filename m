Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938473074A1;
	Fri, 22 May 2026 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779419272; cv=none; b=A/UuWlXtbRISV9pbBW0lrMDh/CERPGpP9khrk2bDMTy9hexZZIvDZRSxqLmk7kDSZ0NmvKqMGmzIQodCp/2cI4/YOegheYOmIuLZtG0SQ6M4i1BU5mI+kTfKBAw3AFv6TbBAMQP4P/0mUalhEDU/Wjrr81Jgnh7sH4tk2BPD+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779419272; c=relaxed/simple;
	bh=3iXB7lDdVFZ8IOSno/Fi8kq5m0oLLTt4vhC4yfqLGOw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=q5ErOb70xBpuAPip/0QBkBhgwTrCf48E2n+QP+UCXOqSD4HStMQhTDzhGXHoVNgNVdZJHBqUH+VZ72YNY8av0ssjHQFQCS+yimpdc8OdIGTyc5mbrd2MBXc1SqVO/Kt+LoCyU8fTNvQnSLMAkZ3YIQZF5j6/WlFtv/cwxHZoRN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ar4Nq8+9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ar4Nq8+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541DF1F000E9;
	Fri, 22 May 2026 03:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779419271;
	bh=5FG7KSvjKvo6OQmu17Ltjp3/qRFxGUfJVX6JnhSGvLU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ar4Nq8+9Jd68ONE0GOeo3VxrFeCzy55DkGzd3wTJIoFsqtSlJuPTv21tsC4PhI7YN
	 qv6oPlru7Tize6b5Ff/bwXmKFp04n2N2LSxtIaBVXc+I+8nX1J6c9PdvA/cfXOSU9B
	 xrLd+wOirbowSgRv7N8cdjgukcssXSGPP9Y105D4csGAulSiszB+Rsvcrd57FGB6PZ
	 4cvckmqbuNjHP8PcaZLqJWJ0/uMUgsZ7OlOn7dQ1BCkS4ug9uMFyI7VvbgduU8FmNi
	 55yBZ93ROCjt0G4YiApfZur2z7UI1i6UUdkB5svTOr9lQFrGW2NJkjQ4T/rhCMaabY
	 g9AYJ7gseS02w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199293930E40;
	Fri, 22 May 2026 03:08:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v4] riscv: Implement ARCH_HAS_CC_CAN_LINK
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177941928064.602940.14455551713912931345.git-patchwork-notify@kernel.org>
Date: Fri, 22 May 2026 03:08:00 +0000
References: <20260316-cc-can-link-riscv-v4-1-64c072b456dd@linutronix.de>
In-Reply-To: <20260316-cc-can-link-riscv-v4-1-64c072b456dd@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 16 Mar 2026 16:46:14 +0100 you wrote:
> The generic CC_CAN_LINK detection relies on -m32/-m64 compiler flags.
> These are not supported by riscv compilers.
> 
> Use architecture-specific logic using -mabi instead.
> 
> Prefer the 'd' ABI variant when possible as todays toolchains are most
> likely to provide a libc for that one.
> 
> [...]

Here is the summary with links:
  - [RESEND,v4] riscv: Implement ARCH_HAS_CC_CAN_LINK
    https://git.kernel.org/riscv/c/c586c8394c6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


