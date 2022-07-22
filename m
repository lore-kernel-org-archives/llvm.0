Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B85C85
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 23:48:47 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-31e6a8e2674so49615027b3.4
        for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 16:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=C5vxcKBsXfUKk2MUSnDuijEsY5Uu1XCESOEGFEpHan4=;
        b=Utdu1V3aRcGKKdAJiX1P6WXcvxoJLpXF8LbdwZgQ2R2R8j/6WsY8HUYm06OrvZY4B9
         VZDgDdFPliKb2A21kfpagaDCr3hSzuk07GJTzX4xKoYTukGX7X6x+v/OKdMt08DlJQuL
         cip9S4pmjPz13jQlWcDoQqd98cR7AgfDgYdBZO0qwLNfICob/mXUBOmSEaeKyxCwPhg3
         Xh7PlWjmdmj8mxZ2E/AZ7Ud1E6YVP1qJ16h2kryDbkLHW+FlihzkrITlgMCXm7fJxHp+
         pKUyuBIrrv/yMsooOhKXxACpWSPyQ7idgj+jQ0J1T2hWTjCh750l11CsZ1SGFvf+QVPO
         JZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=C5vxcKBsXfUKk2MUSnDuijEsY5Uu1XCESOEGFEpHan4=;
        b=cpIf5Vy4MLxu/BnOgI9jmJxR67NZS2incmnCxsQLDabXcf33h0LTjXR6F6Je6uYmQN
         pNyV67U/NXLj7xGp8O2pwHB6tzSLnDbrL7s+0l4cfTbvGnfM9Nzg+j3CSq38ppfOZteP
         Bkx/I+RipVNjMD0skaHekRAoAl2y1ozwoSvAiHeenvAMKCd4FKNfdQTIIPkUQmtRkeZb
         xRH6EQ+o0UtiYix8NMAaFR4ORGLDFC/nfQK3asBuHTXv44ZyqYwgVyxedW/M4pYuHRf8
         MTqMg1uL6HYweSiSOp20AzxpFXL+juAE/2gq8YF1HThJvmR13uXkaHeTnsRBmTmfrCaf
         rweA==
X-Gm-Message-State: AJIora+3D5F5LqtZ5xtzTdmE0IU4vX/gpg+fPlF0Xoyu1bpE6DGVnWyX
	FCGHTXHBQyOqTr1JT4vYIPwLD8cprdHGCQ==
X-Google-Smtp-Source: AGRyM1tn9WYAdHKqq6lfJAZm8nBg32Zv2QGSkMx1BhgjaHTdJKmr0cWym95nsT9ukBiTU4ZQC0T077veefdMvQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a0d:c603:0:b0:31e:7d54:17fd with SMTP id
 i3-20020a0dc603000000b0031e7d5417fdmr1922347ywd.421.1658533726164; Fri, 22
 Jul 2022 16:48:46 -0700 (PDT)
Date: Fri, 22 Jul 2022 23:48:38 +0000
In-Reply-To: <20220722234838.2160385-1-dmatlack@google.com>
Message-Id: <20220722234838.2160385-3-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220722234838.2160385-1-dmatlack@google.com>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH 2/2] KVM: selftests: Fix ambiguous mov in KVM_ASM_SAFE()
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Jim Mattson <jmattson@google.com>, 
	Oliver Upton <oupton@google.com>, 
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Change the mov in KVM_ASM_SAFE() that zeroes @vector to a movb to
make it unambiguous.

This fixes a build failure with Clang since, unlike the GNU assembler,
the LLVM integrated assembler rejects ambiguous X86 instructions that
don't have suffixes:

  In file included from x86_64/hyperv_features.c:13:
  include/x86_64/processor.h:825:9: error: ambiguous instructions require an explicit suffix (could be 'movb', 'movw', 'movl', or 'movq')
          return kvm_asm_safe("wrmsr", "a"(val & -1u), "d"(val >> 32), "c"(msr));
                 ^
  include/x86_64/processor.h:802:15: note: expanded from macro 'kvm_asm_safe'
          asm volatile(KVM_ASM_SAFE(insn)                 \
                       ^
  include/x86_64/processor.h:788:16: note: expanded from macro 'KVM_ASM_SAFE'
          "1: " insn "\n\t"                                       \
                        ^
  <inline asm>:5:2: note: instantiated into assembly here
          mov $0, 15(%rsp)
          ^

It seems like this change could introduce undesirable behavior in the
future, e.g. if someone used a type larger than a u8 for @vector, since
KVM_ASM_SAFE() will only zero the bottom byte. I tried changing the type
of @vector to an int to see what would happen. GCC failed to compile due
to a size mismatch between `movb` and `%eax`. Clang succeeded in
compiling, but the generated code looked correct, so perhaps it will not
be an issue. That being said it seems like there could be a better
solution to this issue that does not assume @vector is a u8.

Fixes: 3b23054cd3f5 ("KVM: selftests: Add x86-64 support for exception fixup")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/include/x86_64/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 51c6661aca77..0cbc71b7af50 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -786,7 +786,7 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 	"lea 1f(%%rip), %%r10\n\t"				\
 	"lea 2f(%%rip), %%r11\n\t"				\
 	"1: " insn "\n\t"					\
-	"mov $0, %[vector]\n\t"					\
+	"movb $0, %[vector]\n\t"				\
 	"jmp 3f\n\t"						\
 	"2:\n\t"						\
 	"mov  %%r9b, %[vector]\n\t"				\
-- 
2.37.1.359.gd136c6c3e2-goog

