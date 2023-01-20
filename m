Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2737533C8
	for <llvm@lists.linux.dev>; Fri, 20 Jan 2023 16:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B24C4339B;
	Fri, 20 Jan 2023 16:59:09 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0/6] kselftest/arm64: Build fixes for clang
Date: Fri, 20 Jan 2023 16:59:07 +0000
Message-Id: <167423393396.2326323.15344511841886361523.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111-arm64-kselftest-clang-v1-0-89c69d377727@kernel.org>
References: <20230111-arm64-kselftest-clang-v1-0-89c69d377727@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Jan 2023 19:51:47 +0000, Mark Brown wrote:
> This series provides a few small build fixes and Makefile tweaks which
> allow us to build the arm64 selftests using clang as well as GCC.  I
> also fixed one minor issue I noticed in the MTE Makefile while doing the
> updates there.
> 
> 

Applied to arm64 (for-next/kselftest), thanks!

[1/6] kselftest/arm64: Fix .pushsection for strings in FP tests
      https://git.kernel.org/arm64/c/aa58ace3499a
[2/6] kselftest/arm64: Remove redundant _start labels from FP tests
      https://git.kernel.org/arm64/c/cd57a6584fe5
[3/6] kselftest/arm64: Don't pass headers to the compiler as source
      https://git.kernel.org/arm64/c/a884f7970e57
[4/6] kselftest/arm64: Initialise current at build time in signal tests
      https://git.kernel.org/arm64/c/6e4b4f0eca88
[5/6] kselftest/arm64: Support build of MTE tests with clang
      https://git.kernel.org/arm64/c/343d59119e77
[6/6] kselftest/arm64: Remove spurious comment from MTE test Makefile
      https://git.kernel.org/arm64/c/89d72c035f88

-- 
Catalin

