Received: from mail-m118204.qiye.163.com (mail-m118204.qiye.163.com [115.236.118.204])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6ED33CF
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 13:58:15 +0000 (UTC)
Received: from lyc-workstation.. (unknown [221.212.176.62])
	by mail-m118204.qiye.163.com (HMail) with ESMTPA id D7842A2044F;
	Mon, 26 Sep 2022 21:48:38 +0800 (CST)
From: YingChi Long <me@inclyc.cn>
To: 
Cc: me@inclyc.cn,
	ndesaulniers@google.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] x86/fpu: use _Alignof to avoid UB in TYPE_ALIGN
Date: Mon, 26 Sep 2022 21:48:28 +0800
Message-Id: <20220926134829.891084-1-me@inclyc.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <Peter Zijlstra <peterz@infradead.org>
References: <Peter Zijlstra <peterz@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFPN1dZLVlBSVdZDwkaFQgSH1lBWRpIHU5WQxpLSUkZSUkeHkxLVQIWExYaEhckFA4PWV
	dZGBILWUFZSUlKVUlKSVVKTE1VTUlZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBw6GAw6CTlIPzcDGBE#CwIP
	LEoaChBVSlVKTU1PSUtLSklLSkNNVTMWGhIXVRYeOxIVGBcCGFUYFUVZV1kSC1lBWUlJSlVJSklV
	SkxNVU1JWVdZCAFZQUhOT083Bg++
X-HM-Tid: 0a837a0e94d12d26kusnd7842a2044f

WG14 N2350 made very clear that it is an UB having type definitions
within "offsetof". This patch changes the implementation of macro
"TYPE_ALIGN" to builtin "_Alignof" to avoid undefined behavior.

I've grepped all source files to find any type definitions within
"offsetof".

  offsetof\(struct .*\{ .*,

This implementation of macro "TYPE_ALIGN" seemes to be the only case of
type definitions within offsetof in the kernel codebase.

GCC builtin __alignof__ has different semantics here. __alignof__() will
in fact return the 'sane' result while structure alignment and
_Alignof() return the ABI required minimum alignment.


Signed-off-by: YingChi Long <me@inclyc.cn>
Link: https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
Link: https://godbolt.org/z/T749MfM9o
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=10360
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69560
Link: https://reviews.llvm.org/D133574
---
 arch/x86/kernel/fpu/init.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index 621f4b6cac4a..de96c11e1fe9 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -133,9 +133,6 @@ static void __init fpu__init_system_generic(void)
 	fpu__init_system_mxcsr();
 }

-/* Get alignment of the TYPE. */
-#define TYPE_ALIGN(TYPE) offsetof(struct { char x; TYPE test; }, test)
-
 /*
  * Enforce that 'MEMBER' is the last field of 'TYPE'.
  *
@@ -143,8 +140,8 @@ static void __init fpu__init_system_generic(void)
  * because that's how C aligns structs.
  */
 #define CHECK_MEMBER_AT_END_OF(TYPE, MEMBER) \
-	BUILD_BUG_ON(sizeof(TYPE) != ALIGN(offsetofend(TYPE, MEMBER), \
-					   TYPE_ALIGN(TYPE)))
+	BUILD_BUG_ON(sizeof(TYPE) !=         \
+		     ALIGN(offsetofend(TYPE, MEMBER), _Alignof(TYPE)))

 /*
  * We append the 'struct fpu' to the task_struct:
--
2.35.1

