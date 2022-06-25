Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6538E7A
	for <llvm@lists.linux.dev>; Sat, 25 Jun 2022 07:27:23 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 184so4352906pga.12
        for <llvm@lists.linux.dev>; Sat, 25 Jun 2022 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nyw+kIA5BAs/IWrKxn3GKDGPvGzat8nDAzo2DBLLfVQ=;
        b=aq1pS+VS92o4g/aCPqmlXhWuoghY8Hg8a9wHtnBXdaFpXnCeZnkV0KqZyiKnjCsIb3
         9gNkp2wNm7+RaKaYmMOpoAOtqsnH72MjEwcBmZPQupfjAZZHWUliHn1lKAXGJENOg7vT
         27wzF/acS30lNTC0dN6dSQtawZTucvqdL+VDJoZ1NpmhzFcbN+iZzXiOJkPna4hq1Fmc
         OfsTi8gTPfuyH5l87FNoyQy7UhbvN4nlp3QreV732iSIPuE0OGBxnacGUqHWpJnzrWuk
         hwPg24qhE4eMBjjU6Z+uGRyWanf+NQHCgKNf9pVepyIZdrMQ/la6fIf26s0fVjK07gZC
         9PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=nyw+kIA5BAs/IWrKxn3GKDGPvGzat8nDAzo2DBLLfVQ=;
        b=cTU43WrrMfMFy021y7cx6crvT/fFZ/2rZ0rJaJSldrK3Xub5+WBMqlg3wbZCbB4qFg
         AVSbb64+Ls56B6oPWiyrqkO7O3E3tYgw/o9xACQ5wCsEn/UzPhWIZE22nDgFC6keQRAB
         bsW7xLghry4TDLzX3gbfXfORvODEeQlV6B+1Fyts2758PlwdxXoEFWXJWWu2a2RB+JZw
         RJBicrkaAUx9r87VdqcH4w4GmDLysSJ78GGnhbS8AFdbUGrReAKBy4hSgak7/gLlNoL+
         eCFAkrazvY+yS+qpndmxgfuzX4PgrYlUU5vsrUvAIb5bEVAg8IzolypK3r0XACs+Nf7T
         3Z2Q==
X-Gm-Message-State: AJIora/2UY18ejXPYZz/THELwqXE5NN9F/AqgGX+PPdJSaWM+TKbLmF3
	pqpZ6mHdYQrtD0xPLWqOjeI=
X-Google-Smtp-Source: AGRyM1tQE2K31P0vhbMCKlpE2xqSND3nR66pHyTbWbXsTrAlSBTdFLo76RLbe6NrsxdMfeRUZXBAlw==
X-Received: by 2002:a05:6a00:198a:b0:525:8b3a:8965 with SMTP id d10-20020a056a00198a00b005258b3a8965mr959794pfl.20.1656142042619;
        Sat, 25 Jun 2022 00:27:22 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id o12-20020a17090a5b0c00b001e29ddf9f4fsm2973821pji.3.2022.06.25.00.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 00:27:22 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	David Howells <dhowells@redhat.com>,
	Jan Beulich <JBeulich@suse.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Joe Perches <joe@perches.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [RESEND PATCH v4 2/2] x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to evaluate constant expressions
Date: Sat, 25 Jun 2022 16:26:45 +0900
Message-Id: <20220625072645.251828-3-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220625072645.251828-1-mailhol.vincent@wanadoo.fr>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220625072645.251828-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__ffs(x) is equivalent to (unsigned long)__builtin_ctzl(x) and ffz(x)
is equivalent to (unsigned long)__builtin_ctzl(~x). Because
__builting_ctzl() returns an int, a cast to (unsigned long) is
necessary to avoid potential warnings on implicit casts.

For x86_64, the current __ffs() and ffz() implementations do not
produce optimized code when called with a constant expression. On the
contrary, the __builtin_ctzl() gets simplified into a single
instruction.

However, for non constant expressions, the __ffs() and ffz() asm
versions of the kernel remains slightly better than the code produced
by GCC (it produces a useless instruction to clear eax).

This patch uses the __builtin_constant_p() to select between the
kernel's __ffs()/ffz() and the __builtin_ctzl() depending on whether
the argument is constant or not.

** Statistics **

On a allyesconfig, before applying this patch...:

| $ objdump -d vmlinux.o | grep tzcnt | wc -l
| 3607

...and after:

| $ objdump -d vmlinux.o | grep tzcnt | wc -l
| 2600

So, roughly 27.9% of the calls to either __ffs() or ffz() were using
constant expressions and could be optimized out.

(tests done on linux v5.18-rc5 x86_64 using GCC 11.2.1)

Note: on x86_64, the asm bsf instruction produces tzcnt when used with
the ret prefix (which is why we grep tzcnt instead of bsf in above
benchmark). c.f. [1]

[1] commit e26a44a2d618 ("x86: Use REP BSF unconditionally")
http://lkml.kernel.org/r/5058741E020000780009C014@nat28.tlf.novell.com

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 arch/x86/include/asm/bitops.h | 38 ++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index 6ed979547086..f88c55b8b37c 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -224,13 +224,7 @@ static __always_inline bool variable_test_bit(long nr, volatile const unsigned l
 	 ? constant_test_bit((nr), (addr))	\
 	 : variable_test_bit((nr), (addr)))
 
-/**
- * __ffs - find first set bit in word
- * @word: The word to search
- *
- * Undefined if no bit exists, so code should check against 0 first.
- */
-static __always_inline unsigned long __ffs(unsigned long word)
+static __always_inline unsigned long variable___ffs(unsigned long word)
 {
 	asm("rep; bsf %1,%0"
 		: "=r" (word)
@@ -238,13 +232,18 @@ static __always_inline unsigned long __ffs(unsigned long word)
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
+	 variable___ffs(word))
+
+static __always_inline unsigned long variable_ffz(unsigned long word)
 {
 	asm("rep; bsf %1,%0"
 		: "=r" (word)
@@ -252,6 +251,17 @@ static __always_inline unsigned long ffz(unsigned long word)
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

