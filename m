Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D9510E
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A419C340E8;
	Fri, 18 Mar 2022 18:10:30 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: fix clang warning about TRAMP_VALIAS
Date: Fri, 18 Mar 2022 18:10:28 +0000
Message-Id: <164762664707.829336.4467700903354005127.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220316183833.1563139-1-arnd@kernel.org>
References: <20220316183833.1563139-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 16 Mar 2022 19:38:18 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly introduced TRAMP_VALIAS definition causes a build warning
> with clang-14:
> 
> arch/arm64/include/asm/vectors.h:66:31: error: arithmetic on a null pointer treated as a cast from integer to pointer is a GNU extension [-Werror,-Wnull-pointer-arithmetic]
>                 return (char *)TRAMP_VALIAS + SZ_2K * slot;
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: fix clang warning about TRAMP_VALIAS
      https://git.kernel.org/arm64/c/7f34b43e07cb

-- 
Catalin

