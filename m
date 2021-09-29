Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260DB72
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 19:20:31 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id d81-20020a251d54000000b005b55772ca97so4731980ybd.19
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=63GoLmMa0FISTNSj54qXjbso1R5Gm74Cq4uLpOpYGuc=;
        b=ATWvAqdpQVpqVi4K3NqKAqDFl3zEfb62R+RuzCeC1G0ZhU6f2/anEr9Q3QSCT6t4UM
         6EGIK8wuaWhvpSxTKnZNdh3nK5MR6/r8tGgVpeSYO6nAwCLUADKEYLRAqpowbWylhLLh
         b/atyNM8TbsxrqxmEkQ6eN5ffBfdaGbMFfXec99LhIYkD+kW+d6w7ItvVHe8R8RAQqfa
         sejzsbhuOq/WMOYgdWvmoJekAqRzoNjHjI4BB4jkbS/cWQ2A58E8O6DwmP8kCmkOK93G
         fziZ84ik03TP8/PLBTZ16lBLhnJWO3V35UeueoaWixFRXV0EQVIQV3qHxoJRp+T38n8I
         rJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=63GoLmMa0FISTNSj54qXjbso1R5Gm74Cq4uLpOpYGuc=;
        b=E54uyMRYVqzfYL7FExRfntckv2jIdgdvWIiWJLG6n3HG9g/ZZ91YrwnibYD5l2ISjn
         bVSO6maPGSV07B2709GSIG8/JJExgzsz5ueBmzy8ftBBojh52OcHSigIPv8IqjJOr9tm
         X8gY1PurEoe39dnc3VqO79bWSD7bXk7rj5EEkHktVWdZ8zLOSRkqKflS4JRbLoRRYRQb
         VrAqGdr6P1eOmU7G7EvZsBAOAKUM0WNFycM1wp0E59pkukxw5ZerO4zrRpaqGT3gUKTM
         uDEA4+9B+uc5wECJQOd6Z+1mm4c/FHvssjXg0Y8EUMhkDXoJq7FIekT1XTkmL2mfcdy6
         aQhw==
X-Gm-Message-State: AOAM533kN4Jeyu3xJqjFajBHv2AjDj0dU0NHMzOz1MetB97F2jBq57pj
	AOqN5jen2n3BO6PpZq80nxMiOvEkHe4Cguy05JU=
X-Google-Smtp-Source: ABdhPJwCgxungjpkRehOgF/M2ddpxBC327A5mIHGC9y7oK8GZI1Rw+c/3t7/cNjQIvN8YqA80g8deU0ImyL5J5rvrUU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:da31:1dfd:2e69:dc82])
 (user=ndesaulniers job=sendgmr) by 2002:a25:690a:: with SMTP id
 e10mr1739500ybc.393.1632943230203; Wed, 29 Sep 2021 12:20:30 -0700 (PDT)
Date: Wed, 29 Sep 2021 12:20:24 -0700
In-Reply-To: <CAKwvOdmjZ+QmjTJnQ-w5hLPJjow1gYnWTe6f8RBhQUJ2b3cYnw@mail.gmail.com>
Message-Id: <20210929192026.1604095-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAKwvOdmjZ+QmjTJnQ-w5hLPJjow1gYnWTe6f8RBhQUJ2b3cYnw@mail.gmail.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2] ARM: mm: proc-macros: ensure *_tlb_fns are 4B aligned
From: Nick Desaulniers <ndesaulniers@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Fangrui Song <maskray@google.com>, Peter Smith <peter.smith@arm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Dave Martin <dave.martin@arm.com>, 
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

QEMU 6.1.0 is more correct about trapping on misaligned accesses. A
kernel built with CONFIG_THUMB2_KERNEL=y and using clang as the
assembler could generate non-naturally-aligned v7wbi_tlb_fns which
results in a boot failure. The original commit adding the macro missed
the .align directive on this data.

Fixes: 66a625a88174 ("ARM: mm: proc-macros: Add generic proc/cache/tlb struct definition macros")
Link: https://github.com/ClangBuiltLinux/linux/issues/1447
Link: https://lore.kernel.org/all/0699da7b-354f-aecc-a62f-e25693209af4@linaro.org/
Debugged-by: Ard Biesheuvel <ardb@kernel.org>
Debugged-by: Nathan Chancellor <nathan@kernel.org>
Debugged-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1 -> V2:
* Drop accidentally committed Kconfig change.
* Pick up Ard's AB tag.

 arch/arm/mm/proc-macros.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
index e2c743aa2eb2..d9f7dfe2a7ed 100644
--- a/arch/arm/mm/proc-macros.S
+++ b/arch/arm/mm/proc-macros.S
@@ -340,6 +340,7 @@ ENTRY(\name\()_cache_fns)
 
 .macro define_tlb_functions name:req, flags_up:req, flags_smp
 	.type	\name\()_tlb_fns, #object
+	.align 2
 ENTRY(\name\()_tlb_fns)
 	.long	\name\()_flush_user_tlb_range
 	.long	\name\()_flush_kern_tlb_range

base-commit: 02d5e016800d082058b3d3b7c3ede136cdc6ddcb
prerequisite-patch-id: 3edbe4a8485c7a75a61dbbe299e8ce1985d87ee0
-- 
2.33.0.685.g46640cef36-goog

