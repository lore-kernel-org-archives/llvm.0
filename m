Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A57E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 15:15:37 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id ku18so6711198pjb.2
        for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 08:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aK0OouJ7vj79B3CKhHBNrE1LgvDzY0FwEUqvzc5U2io=;
        b=Me+qv1JnC+Uu5R2+FCTXCgSCsM0E/YDI8NLaPA0F2H9OTWqbaTC5nEXN9qMc9Aqxdv
         ugwkb0fc1MVfC6MvZk6xag1YyBNhFQ1E6zUPrglkqiePnFVir3krK342EHxEeIFy1ek6
         L6tgnj+wrThudBkYiv4EUwN+YD45nNbu4M3sqN0vZ5J547poqmeUka60lUy2RkXUEJri
         ZvA7XcChji0DrWhqdurdC3lviXeXfdlFuDlrH3CU3Fc/JTyhFMa3bsjUXmwOtPWHKuHy
         prbaMOimDfQdHS8qA43uvAD9widLwoABheuRd/UB1Okl7FLxXyRLV/gxfcR0n5RkVa1+
         9BWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=aK0OouJ7vj79B3CKhHBNrE1LgvDzY0FwEUqvzc5U2io=;
        b=qmXrHYvHNg/lZhSJ7YpwL0E+/6vMwXkw7V6uVrSsK1TY/7WLnxzopZ+pvvdhh5t3Kz
         Nazw9XrfWcSaqXuCv9CcDyHs7TeY+AzhzS4zRy6JPyPRdG6RtA/roJikxEQ6lVS9GG73
         88YX7nuZlWMnOwuwQLxgwX+9oE2XeN5A4xESYe4LOWSIgQkSBV81mSKwfxIOk+p7XaFT
         FYT32gAAXWoMhsENbk3cQ6Fp+iUND3afjMeRDoOJb6yG50zYFpPOxU7sTT+dcwarMnJ+
         ZrlnIz5JH54Qiar9mti+M1IjUxLT/vRcWyjM77WWG5gKryFYi4vSBjSDgTrko4mRzBNd
         tM2Q==
X-Gm-Message-State: AJIora9fxBhNNSxrBTnod9dbBuEll3/9f1IO2DGfrjWe6DVbDX+pKaIe
	2kwWSKILDVli1tzwgEBugN4=
X-Google-Smtp-Source: AGRyM1t3kZHIwiwfGy1nQBE14Z/D3Z1d5e2j78FpRwfman4hragA5vIF8Y5vI619e+yI8OXGGPHqoQ==
X-Received: by 2002:a17:903:32c6:b0:16d:328f:898d with SMTP id i6-20020a17090332c600b0016d328f898dmr4743715plr.143.1658589336430;
        Sat, 23 Jul 2022 08:15:36 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id a5-20020aa794a5000000b0052ac1af926fsm6071350pfl.20.2022.07.23.08.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 08:15:35 -0700 (PDT)
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
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Joe Perches <joe@perches.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [RESEND PATCH v4 0/2] x86/asm/bitops: optimize ff{s,z} functions for constant expressions
Date: Sun, 24 Jul 2022 00:15:19 +0900
Message-Id: <20220723151521.51451-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compilers provide some builtin expression equivalent to the ffs(),
__ffs() and ffz() function of the kernel. The kernel uses optimized
assembly which produces better code than the builtin
functions. However, such assembly code can not be optimized when used
on constant expression.

This series relies on __builtin_constant_p to select the optimal solution:

  * use kernel assembly for non constant expressions

  * use compiler's __builtin function for constant expressions.


** Statistics **

Patch 1/2 optimizes 26.7% of ffs() calls and patch 2/2 optimizes 27.9%
of __ffs() and ffz() calls (details of the calculation in each patch).


** Changelog **

v3 -> v4:

  * (no changes on code, only commit comment was modified)

  * Remove note and link to Nick's message in patch 1/2, c.f.:
  https://lore.kernel.org/all/CAKwvOdnnDaiJcV1gr9vV+ya-jWxx7+2KJNTDThyFctVDOgt9zQ@mail.gmail.com/

  * Add Reviewed-by: Nick Desaulniers <ndesaulniers@google.com> in tag in patch 2/2.


v2 -> v3:

  * Redacted out the instructions after ret and before next function
    in the assembly output.

  * Added a note and a link to Nick's message on the constant
    propagation missed-optimization in clang:
    https://lore.kernel.org/all/CAKwvOdnH_gYv4qRN9pKY7jNTQK95xNeH1w1KZJJmvCkh8xJLBg@mail.gmail.com/

  * Fix copy/paste typo in statistics of patch 1/2. Number of
    occurences before patches are 1081 and not 3607 (percentage
    reduction of 26.7% remains correct)

  * Rename the functions as follow:
    - __varible_ffs() -> variable___ffs()
    - __variable_ffz() -> variable_ffz()

  * Add Reviewed-by: Nick Desaulniers <ndesaulniers@google.com> in tag in patch 1/2.

Vincent Mailhol (2):
  x86/asm/bitops: ffs: use __builtin_ffs to evaluate constant
    expressions
  x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to evaluate constant
    expressions

 arch/x86/include/asm/bitops.h | 64 +++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 26 deletions(-)

-- 
2.35.1

