Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4532CA1
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 19:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53217C36AE9;
	Fri,  7 Jan 2022 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641584639;
	bh=m61fuw1pNqrst7HLX3tjWWgGYWOPsNFFFghJhYPmSmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kbgPV3t8QrUmD2HnDIOaXpJIDDPm6qaXONETzG3lIat9eubaqXRAustox8oo0GtfW
	 YRzJNxtvnJDXpsENKajOs0xiY1yRuRRDAN1KUuQ8pV5420B2iG2pVyPslI36nWvEqs
	 UD/CTkBWE4duTwiFm4BdC67WFkqXcL8vmudiqBb4AKnlftH6Cwv1/Fq6WA+aR21sYA
	 c4egkzXda5F++epcEqSYvKlffLED26LsdKZX4EeXXQZKWhglk+6EnWHfJSNjgjI3Bi
	 5TG+k/VVIg2XiBm0RiZDWZ0YUxwQAv+hKG/QMs0oEa5y4/mbLIvBu5tq0nHIpnn049
	 BiJutRHUN2wkw==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH RFC 4.9 2/5] arm64: Remove a redundancy in sysreg.h
Date: Fri,  7 Jan 2022 12:43:32 -0700
Message-Id: <20220107194335.3090066-3-nathan@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107194335.3090066-1-nathan@kernel.org>
References: <20220107194335.3090066-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Traby <stefan@hello-penguin.com>

commit d38338e396ee0571b3502962fd2fbaec4d2d9a8f upstream.

This is really trivial; there is a dup (1 << 16) in the code

Acked-by: Will Deacon <will.deacon@arm.com>
Signed-off-by: Stefan Traby <stefan@hello-penguin.com>
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 88bbe364b6ae..7a9f0a71f441 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -95,8 +95,8 @@
 #define SCTLR_ELx_M	1
 
 #define SCTLR_EL2_RES1	((1 << 4)  | (1 << 5)  | (1 << 11) | (1 << 16) | \
-			 (1 << 16) | (1 << 18) | (1 << 22) | (1 << 23) | \
-			 (1 << 28) | (1 << 29))
+			 (1 << 18) | (1 << 22) | (1 << 23) | (1 << 28) | \
+			 (1 << 29))
 
 #define SCTLR_ELx_FLAGS	(SCTLR_ELx_M | SCTLR_ELx_A | SCTLR_ELx_C | \
 			 SCTLR_ELx_SA | SCTLR_ELx_I)
-- 
2.34.1

