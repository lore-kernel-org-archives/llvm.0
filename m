Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124698C15
	for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 16:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6151C433D2;
	Tue, 31 Jan 2023 16:29:46 +0000 (UTC)
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
Subject: Re: [PATCH] kselftest/arm64: Remove redundant _start labels from zt-test
Date: Tue, 31 Jan 2023 16:29:44 +0000
Message-Id: <167518258104.583521.13126662777725000752.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130-arm64-fix-sme2-clang-v1-1-3ce81d99ea8f@kernel.org>
References: <20230130-arm64-fix-sme2-clang-v1-1-3ce81d99ea8f@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 30 Jan 2023 23:45:57 +0000, Mark Brown wrote:
> The newly added zt-test program copied the pattern from the other FP
> stress test programs of having a redundant _start label which is
> rejected by clang, as we did in a parallel series for the other tests
> remove the label so we can build with clang.
> 
> No functional change.
> 
> [...]

Applied to arm64 (for-next/sme2), thanks!

[1/1] kselftest/arm64: Remove redundant _start labels from zt-test
      https://git.kernel.org/arm64/c/b2ab432bcf65

-- 
Catalin

