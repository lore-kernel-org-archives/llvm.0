Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DC07A
	for <llvm@lists.linux.dev>; Sat, 25 Jun 2022 07:27:12 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id jb13so3912391plb.9
        for <llvm@lists.linux.dev>; Sat, 25 Jun 2022 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aK0OouJ7vj79B3CKhHBNrE1LgvDzY0FwEUqvzc5U2io=;
        b=ah3bFiqJbvOkS77zS58PHpqgSCsOJLA33/tQciJ5ahsHGdcQ4S0Z28AfnEpgmcgVPT
         c2JyiLUESs5eFVsx6CY4urzNt9pWPIGJSZJigt35B9o0U20fBBDe0MFikZb07hRsWZ9C
         IRZ06HrnPDO3xi/qSmzW1WNyphVN8WdgEFY6V2f0YapfjS8ibHvXxsPal4c7re44TAaF
         yajKjjbbj21Ps/QNytNL3BSyayV0Uk4RBvhl0YR7dnIlIm5mJf4ohAKSRbv6BMgLCFIp
         UF9DYkSbfOLWVHrgX5gxlgZxYMNqenBmHsVEW3fH+HFWA+OOp+bTDAHsr1BloVFaNrk0
         uPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=aK0OouJ7vj79B3CKhHBNrE1LgvDzY0FwEUqvzc5U2io=;
        b=eikl8ErCFWTzuQQ6dth5mSvl1LZ07Nz9wgs5zUSNC8k4XHOo6WpmeKdhCCNBttsoHS
         iDlIUV2u0OgGGSN0x4q9zU+ym4a+Kn9MdkE4LlvkC2NywwCX5Hq3caKuGW4aAgJ50F/Q
         dqW5mINgDOhmD55clX5fOZeoYA7IxIvRYgDBNTJEDa7iNHWZmgI8KYhjlbykcq+BRmbh
         bDOzKVDuYFynpS9N9r4z9Y1StKAUSS6Dn3MSEq1XfAoBkP309R5ASsAUUJU/+jlMHtE1
         kyDrmVSAuKmuhKdG3hsoRSiC3oaI5M+nPstvWs8ccS457QjoZBDGad5fS8lReeB2rklI
         FYWg==
X-Gm-Message-State: AJIora/IpQhSmg1YOIT41FSZJUB5ARP7N7Mkl1f/kE4f4Ij9RO0hPuAe
	YVsTBajFFK+7gbA38y2KmME=
X-Google-Smtp-Source: AGRyM1ue3umiPhKv03BlLEsunv/7tTkIDrPvgOnOYKIFmUx8R3lV7YOiOfYFZuWA53Bqw0E+d+qSEQ==
X-Received: by 2002:a17:903:2452:b0:16a:3b58:48fd with SMTP id l18-20020a170903245200b0016a3b5848fdmr2996311pls.67.1656142031812;
        Sat, 25 Jun 2022 00:27:11 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id o12-20020a17090a5b0c00b001e29ddf9f4fsm2973821pji.3.2022.06.25.00.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 00:27:11 -0700 (PDT)
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
Subject: [RESEND PATCH v4 0/2] x86/asm/bitops: optimize ff{s,z} functions for constant expressions
Date: Sat, 25 Jun 2022 16:26:43 +0900
Message-Id: <20220625072645.251828-1-mailhol.vincent@wanadoo.fr>
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

