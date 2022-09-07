Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E335D2CA6
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 09:17:57 +0000 (UTC)
Received: from YC20090004.ad.ts.tri-ad.global ([103.175.111.222])
	by smtp.orange.fr with ESMTPA
	id Vr47oZr83tFxAVr4YoSn8R; Wed, 07 Sep 2022 11:10:20 +0200
X-ME-Helo: YC20090004.ad.ts.tri-ad.global
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 07 Sep 2022 11:10:20 +0200
X-ME-IP: 103.175.111.222
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Borislav Petkov <bp@alien8.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	David Howells <dhowells@redhat.com>,
	Jan Beulich <JBeulich@suse.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Joe Perches <joe@perches.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v8 2/2] x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to evaluate constant expressions
Date: Wed,  7 Sep 2022 18:09:35 +0900
Message-Id: <20220907090935.919-3-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220907090935.919-1-mailhol.vincent@wanadoo.fr>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220907090935.919-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If x is not 0, __ffs(x) is equivalent to:
  (unsigned long)__builtin_ctzl(x)
And if x is not ~0UL, ffz(x) is equivalent to:
  (unsigned long)__builtin_ctzl(~x)
Because __builting_ctzl() returns an int, a cast to (unsigned long) is
necessary to avoid potential warnings on implicit casts.

Concerning the edge cases, __builtin_ctzl(0) is always undefined,
whereas __ffs(0) and ffz(~0UL) may or may not be defined, depending on
the processor. Regardless, for both functions, developers are asked to
check against 0 or ~0UL so replacing __ffs() or ffz() by
__builting_ctzl() is safe.

For x86_64, the current __ffs() and ffz() implementations do not
produce optimized code when called with a constant expression. On the
contrary, the __builtin_ctzl() folds into a single instruction.

However, for non constant expressions, the __ffs() and ffz() asm
versions of the kernel remains slightly better than the code produced
by GCC (it produces a useless instruction to clear eax).

Use __builtin_constant_p() to select between the kernel's
__ffs()/ffz() and the __builtin_ctzl() depending on whether the
argument is constant or not.

** Statistics **

On a allyesconfig, before...:

  $ objdump -d vmlinux.o | grep tzcnt | wc -l
  3607

...and after:

  $ objdump -d vmlinux.o | grep tzcnt | wc -l
  2600

So, roughly 27.9% of the calls to either __ffs() or ffz() were using
constant expressions and could be optimized out.

(tests done on linux v5.18-rc5 x86_64 using GCC 11.2.1)

Note: on x86_64, the asm bsf instruction produces tzcnt when used with
the ret prefix (which explain the use of `grep tzcnt' instead of `grep
bsf' in above benchmark). c.f. [1]

[1] commit e26a44a2d618 ("x86: Use REP BSF unconditionally")
Link: http://lkml.kernel.org/r/5058741E020000780009C014@nat28.tlf.novell.com

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 arch/x86/include/asm/bitops.h | 38 ++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index 879238e5a6a0..95591310c080 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -247,13 +247,7 @@ arch_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
 					  variable_test_bit(nr, addr);
 }
 
-/**
- * __ffs - find first set bit in word
- * @word: The word to search
- *
- * Undefined if no bit exists, so code should check against 0 first.
- */
-static __always_inline unsigned long __ffs(unsigned long word)
+static __always_inline unsigned long variable__ffs(unsigned long word)
 {
 	asm("rep; bsf %1,%0"
 		: "=r" (word)
@@ -261,13 +255,18 @@ static __always_inline unsigned long __ffs(unsigned long word)
 	return word;
 }
 
-/**
- * ffz - find first zero bit in word
- * @word: The word to search
- *
- * Undefined if no zero exists, so code should check against ~0UL first.
- */
-static __always_inline unsigned long ffz(unsigned long word)
+/**
+ * __ffs - find first set bit in word
+ * @word: The word to search
+ *
+ * Undefined if no bit exists, so code should check against 0 first.
+ */
+#define __ffs(word)				\
+	(__builtin_constant_p(word) ?		\
+	 (unsigned long)__builtin_ctzl(word) :	\
+	 variable__ffs(word))
+
+static __always_inline unsigned long variable_ffz(unsigned long word)
 {
 	asm("rep; bsf %1,%0"
 		: "=r" (word)
@@ -275,6 +274,17 @@ static __always_inline unsigned long ffz(unsigned long word)
 	return word;
 }
 
+/**
+ * ffz - find first zero bit in word
+ * @word: The word to search
+ *
+ * Undefined if no zero exists, so code should check against ~0UL first.
+ */
+#define ffz(word)				\
+	(__builtin_constant_p(word) ?		\
+	 (unsigned long)__builtin_ctzl(~word) :	\
+	 variable_ffz(word))
+
 /*
  * __fls: find last set bit in word
  * @word: The word to search
-- 
2.35.1

