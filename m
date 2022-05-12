Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD1A190
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 01:20:14 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id a11so3459508pff.1
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 18:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TrL32Nt81/NQSNF8rFsX4dzPpMYEmEyoU2tdFctinr4=;
        b=p5W3iSAAD3DwAarCXV14GiMOE8396VxmuWGBCC+xBcGLRTuEqMlpBQfVKva3ueDvWT
         suWJIUZdtVoZspuRBIIN2bln0EIkuXe012K8U4Y/JaMq6eMO5UfuT3N+3JOnAsgkcXen
         gOhWf5bxWbzseK2JAMJio558696uP62Yx+wGvQkydZj8XnJQJ2uuD7exdHLmXcYto1sx
         3EWH81ZE3M4ykhLLqJIYN3YQ9MZ9lS7i2ImGPZ3tCm3U8aCjD46VeNuCLEaCVKkb/BXp
         yy9FgwlGuCvF3wFQo3Nuyk2TsLC1OAxeUePrgahcNmK+BwgAcFN8hKCLARhaFRyoJvIl
         +cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TrL32Nt81/NQSNF8rFsX4dzPpMYEmEyoU2tdFctinr4=;
        b=F9kCxNUeeotfUJqR12vRS17M5f71RcyvromBqlD9eJFJdfcO8F6PZ1EOLyWyqze0nO
         wUDJaFw9wl9EFevwdFSLYKCh7hh1hSslUz+FbTRnT7iRLzwBkabC/ljNY7X609/rdRR2
         E2CZy1UTZCnA9qdpjdRMeC1hA/TUWS2E05aUOmgj4EES/g2RjVNje8WDA6faGNLetM9g
         41/Kob6JargEZidycJMVlTBNnbw7sDFQIbaj9RAaK3fZvaSAFYjsKx6slHhQ5OMZOPj6
         ttqSuROh/+YwHHuM/cm3ULTLDQ36k7MJXSKgFUwL2/AzQQaGc89CkqOD5eF0MwiuZXN5
         MAWg==
X-Gm-Message-State: AOAM533CYD9rKrV01YT1PabSN1+d3Gb8MtIrrvg+J3X2Kh9SXD4wp/EO
	vaY+zj818vXaCFk0rG+fSsM=
X-Google-Smtp-Source: ABdhPJxRTun1qVUqHUyyz1PVhV+O3qL8/7in+R8xB5f2DcN/ETKRNWSBuH7fEp7PGnxG5CqugWyp5A==
X-Received: by 2002:a63:88c8:0:b0:3ab:1871:13b4 with SMTP id l191-20020a6388c8000000b003ab187113b4mr23246137pgd.85.1652318414220;
        Wed, 11 May 2022 18:20:14 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902ea8500b0015e8d4eb24bsm2545978plb.149.2022.05.11.18.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 18:20:13 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	David Howells <dhowells@redhat.com>,
	Jan Beulich <JBeulich@suse.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v4 0/2] x86/asm/bitops: optimize ff{s,z} functions for constant expressions
Date: Thu, 12 May 2022 10:18:53 +0900
Message-Id: <20220512011855.1189653-1-mailhol.vincent@wanadoo.fr>
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

I also think that the fls() and fls64() can be optimized in a similar
way, using __builtin_ctz() and __builtin_ctzll() but it is a bit less
trivial so I want to focus on this series first. If it get accepted, I
will then work on those two additionnal function.


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

