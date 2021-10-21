Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B6F2C80
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 10:06:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6177D6120F;
	Thu, 21 Oct 2021 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634810763;
	bh=9dHLzT9dyxG4Ac+xbm9Odo3IEuQuon0iJA/vxZgXkZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WseqPkhOFNQaRUL9OYeXCTR7gDKf3hn3zVV4+swzga3ateyI3dnCDHHSHcZ3OEvtL
	 WThU4gS7QoQTXDei5utmJbRxr8YkBSsXfDLx868zt20Q/1pWK4BPSuresYqdL56ci9
	 0CCDSP6bCRgDCcQRlB6tslBPbzHqjsz3B6VXJSU7MvxUnceF/QMYTuZA0ugJ8vhHza
	 YLGmZsRo9v25p//RE/gvyTXrvwJpFrMU2pNahkRfizoh7r4RDdA4LQAom8xd6dpNxn
	 S1VAHXyJO1WYDWbsH0vVZPnl/ZnMPTCg53XKmcJNCPjYJJyQwVmn3SvUF8Ypx4zrVL
	 G4y1df/zKyS3g==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] compat vdso cleanups
Date: Thu, 21 Oct 2021 11:05:49 +0100
Message-Id: <163480870098.3876753.5822557497525627978.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019223646.1146945-1-ndesaulniers@google.com>
References: <20211019223646.1146945-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 19 Oct 2021 15:36:42 -0700, Nick Desaulniers wrote:
> Four fixes for compat vdso, the first three are related, the fourth is
> standalone.
> 
> The first three fix a warning observed for `mrproper` targets when
> $(CROSS_COMPILE_COMPAT)gcc is not in the $PATH.
> 
> The fourth makes is so that CROSS_COMPILE_COMPAT is not necessary to
> select COMPAT_VDSO when using clang+lld.
> 
> [...]

Applied to arm64 (for-next/vdso), thanks!

[1/4] arm64: vdso32: drop the test for dmb ishld
      https://git.kernel.org/arm64/c/1907d3ff5a64
[2/4] arm64: vdso32: drop test for -march=armv8-a
      https://git.kernel.org/arm64/c/a517faa902b5
[3/4] arm64: vdso32: suppress error message for 'make mrproper'
      https://git.kernel.org/arm64/c/14831fad73f5
[4/4] arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd
      https://git.kernel.org/arm64/c/3e6f8d1fa184

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
