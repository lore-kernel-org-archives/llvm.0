Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E967F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 17:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B6BC433B5;
	Tue,  2 Aug 2022 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659463183;
	bh=xpWA7Jpv8r6INPM8eC9dRH0bjB0EBSQdgOjBy0N4/rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V15liBSsJpZKesOb/8eDlMArbGuucPgpmrtWaDszI2rKEzxMbDCo0O95EcymiP/Gp
	 hgvNMmLbm1E/ShJPRVRXIXi9EaBllYBTW3GEAjm718erwAGJskfqJORShJdSvPuNbQ
	 iwAUvD2pCUmKfk3TcIc0HVHOG2CT8xYrYzkhhrOlRbyepLiKpGC5bezksL0I3N+KzC
	 Jv4qtfYKy9y1e9icY9Kkg9JLXewDMZ4CEcfa1K++dF9fJD6y37IAJgFl4+f0I149YC
	 edPUIBhg/MRDSCtYNChFU0UpEPNcFAl7jQ87XMhYIPr1NXSx95oRx15uf1S6GtFrhp
	 5GKo0/IDk4IgQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	torvalds@linux-foundation.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] MIPS: tlbex: Explicitly compare _PAGE_NO_EXEC against 0
Date: Tue,  2 Aug 2022 10:59:36 -0700
Message-Id: <20220802175936.2278362-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <YulSY1pDms0ZyNs9@debian>
References: <YulSY1pDms0ZyNs9@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_XPA is enabled, Clang warns:

  arch/mips/mm/tlbex.c:629:24: error: converting the result of '<<' to a boolean; did you mean '(1 << _PAGE_NO_EXEC_SHIFT) != 0'? [-Werror,-Wint-in-bool-context]
          if (cpu_has_rixi && !!_PAGE_NO_EXEC) {
                              ^
  arch/mips/include/asm/pgtable-bits.h:174:28: note: expanded from macro '_PAGE_NO_EXEC'
  # define _PAGE_NO_EXEC          (1 << _PAGE_NO_EXEC_SHIFT)
                                     ^
  arch/mips/mm/tlbex.c:2568:24: error: converting the result of '<<' to a boolean; did you mean '(1 << _PAGE_NO_EXEC_SHIFT) != 0'? [-Werror,-Wint-in-bool-context]
          if (!cpu_has_rixi || !_PAGE_NO_EXEC) {
                                ^
  arch/mips/include/asm/pgtable-bits.h:174:28: note: expanded from macro '_PAGE_NO_EXEC'
  # define _PAGE_NO_EXEC          (1 << _PAGE_NO_EXEC_SHIFT)
                                     ^
  2 errors generated.

_PAGE_NO_EXEC can be '0' or '1 << _PAGE_NO_EXEC_SHIFT' depending on the
build and runtime configuration, which is what the negation operators
are trying to convey. To silence the warning, explicitly compare against
0 so the result of the '<<' operator is not implicitly converted to a
boolean.

According to its documentation, GCC enables -Wint-in-bool-context with
-Wall but this warning is not visible when building the same
configuration with GCC. It appears GCC only warns when compiling C++,
not C, although the documentation makes no note of this:
https://godbolt.org/z/x39q3brxf

Reported-by: Sudip Mukherjee (Codethink) <sudipm.mukherjee@gmail.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/mips/mm/tlbex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 8dbbd99fc7e8..be4d4670d649 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -626,7 +626,7 @@ static __maybe_unused void build_convert_pte_to_entrylo(u32 **p,
 		return;
 	}
 
-	if (cpu_has_rixi && !!_PAGE_NO_EXEC) {
+	if (cpu_has_rixi && _PAGE_NO_EXEC != 0) {
 		if (fill_includes_sw_bits) {
 			UASM_i_ROTR(p, reg, reg, ilog2(_PAGE_GLOBAL));
 		} else {
@@ -2565,7 +2565,7 @@ static void check_pabits(void)
 	unsigned long entry;
 	unsigned pabits, fillbits;
 
-	if (!cpu_has_rixi || !_PAGE_NO_EXEC) {
+	if (!cpu_has_rixi || _PAGE_NO_EXEC == 0) {
 		/*
 		 * We'll only be making use of the fact that we can rotate bits
 		 * into the fill if the CPU supports RIXI, so don't bother

base-commit: 7d0d3fa7339ed5a06d6608b7cde9f079eba62bb1
-- 
2.37.1

