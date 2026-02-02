Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3112F746D;
	Mon,  2 Feb 2026 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770059631; cv=none; b=kpup8r1JDodW4A969xUKSeSFEweoANWt1oZoSwuRbl4FyMH1mxp40Qpr+r05ni3fT+D4T6rUWnHEPkaa6i5Osws0E7xX+YSj9PgH9DcmcmRP4iwnDjZo4WKh7Qbhv2Xa03xGV2l8VfByGz1EGy1EyrqpzLyjQt7etmTcWVjGDgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770059631; c=relaxed/simple;
	bh=bVNExOecclgFUYczf53ULyUIujXLZbcCGWlArLy5Srg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B20sQwUSGA2YY0vdtiUZcL973GesFR9nOtF1Q8lYVQE1q+Ze8metjBTc57u0d2WsROdtqpYT6wRg8vCwAHwIGjKzZ6Ux25Bznpn8hND/iies0Z8y78arZVjohTQC3mxALdUYXh4iNLW0gNRWM1D1lXTVHrCQuzb3LlS+f2lScic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qo2fkX6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qo2fkX6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460A6C116C6;
	Mon,  2 Feb 2026 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770059631;
	bh=bVNExOecclgFUYczf53ULyUIujXLZbcCGWlArLy5Srg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qo2fkX6zhNO6/ZZPfsT8pTBSn1FSKNP/wNRp/EdO9cTMiPLJ/eGxI1hE2ANyGtNzX
	 QITb/IWbFQcM4r8psiYTvSpQqbQpK4V13ZBGX9r30D0a/hQ1685/7Tpui/FrMn7WpV
	 k+w0yrEqANMg39VBGvxKgmsIXBJHIhxrpDbM3cBShUptCBsuUFiJbIRXjqB+HEbgCc
	 9Y1pZjNDXa5zjR67NSYuKezM7oNUubB7Rv54usQsKE+5H0eCjIvregkNuoYC9Dwxa7
	 hur9/BMjEOL+fv7de+8QFvepcTwn0S30cRRU6mnhtZ2CoWWjS0uIiuShvhjcPS3Fg1
	 dL9TTdPYbcGlQ==
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Marco Elver <elver@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
Date: Mon,  2 Feb 2026 19:13:42 +0000
Message-ID: <177004685649.2187917.2406852216797394665.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260130132951.2714396-1-elver@google.com>
References: <20260130132951.2714396-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 30 Jan 2026 14:28:23 +0100, Marco Elver wrote:
> While investigating a Clang Context Analysis [1] false positive [2], I started
> to dig deeper into arm64's __READ_ONCE() implementation with LTO. That rabbit
> hole led me to find one critical bug with the current implementation (patch 1),
> and subtle improvements that then enabled me to fix the original false positive.
> 
> Patch 1 fixes a bug where READ_ONCE() on types larger than 8 bytes (non-atomic
> fallback) incorrectly qualified the pointer rather than the pointee as volatile.
> This resulted in a lack of "once" semantics for large struct loads.
> 
> [...]

Applied first patch only to arm64 (for-next/core), thanks!

[1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
      https://git.kernel.org/arm64/c/bb0c99e08ab9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
