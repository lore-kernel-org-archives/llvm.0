Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0A5C85
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 23:48:44 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id m5-20020a2598c5000000b0066faab590c5so4668009ybo.7
        for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 16:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=KFQW7jsAcLHmWp9w2LJQVvYaLlYILuaNUn+12sIyDcY=;
        b=qxbrGOijKZeV2cD7ZxgNjzGsfWLCuscD/Si2sRkuqHSu8wUOQXPslVMbJSSYHi5WV+
         u/HvgFWLP/siEPKRUx4ziTzEQfjV2d5L3UuvlCJV9K3ptVIlSVxIQKSE3MG02rfw/iDw
         lhwjyYlOwSTv/J29vvRVTu8HAfmQIrV3muEmsRAX1KDRoAZD4nHKZvPQXhV23lK9xjsh
         E9/rln3BX1SRs/9gCiQFyyUAydR3G2hJB4rVIv1vSAblexVGKvYmaXjRbdTez46Aufsr
         YgUpMKo7UeZR9+ProUmVORWAcH/QmnfYzfumj9HF8aC4d/xGrCmSybQJL/2mqD+JpIWf
         jdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=KFQW7jsAcLHmWp9w2LJQVvYaLlYILuaNUn+12sIyDcY=;
        b=MZzcqYt0JXA+2W5g+NuN12VyP/Oh+pjxDpAIwcP64/m5DXmjnk/0RzUChj96vz8G3N
         T7Zka/tU6zilrZTy5JdSZJB9ViH+vf5jsrsD2Sxdx3FKnI0FQlqjVc6hiTse5/f4Ok6x
         Kj5h8+gKFKt+vu/buwr34oSto3spzvYpzElic1vkYZFEGDrnxPDBGCyestyioJIksOyY
         M94fhRg2Tm0gCAWftgKrg3NqPW9Vd8qhpI+Bogl3w6CwW0T16OXhMOojlCfm4b4UCVBr
         In7IJeAQ3hO2XZbnDEdGoif/Y17yzFJS9OFo6Ap3hQzJvnBiMj7b0jbnAWLq6k1POUjb
         rPCA==
X-Gm-Message-State: AJIora8n+hd7/pfSaE3/6LTsQDTPkzudI/TusMMDPiKp+O2jO44UzaFX
	gNmzBJEPPR8tq51/+OzABhExnuAdU1PQKA==
X-Google-Smtp-Source: AGRyM1sOKspIXC3FlbYTAoXrIrzhWcsWZPMFx9n/05iN/AmSnKvxUUNxuiPxUVme/T+yNRebujFPkHOoZl+wog==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:d606:0:b0:66e:b73d:5de3 with SMTP id
 n6-20020a25d606000000b0066eb73d5de3mr1845516ybg.360.1658533723862; Fri, 22
 Jul 2022 16:48:43 -0700 (PDT)
Date: Fri, 22 Jul 2022 23:48:37 +0000
In-Reply-To: <20220722234838.2160385-1-dmatlack@google.com>
Message-Id: <20220722234838.2160385-2-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220722234838.2160385-1-dmatlack@google.com>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH 1/2] KVM: selftests: Fix KVM_EXCEPTION_MAGIC build with Clang
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Jim Mattson <jmattson@google.com>, 
	Oliver Upton <oupton@google.com>, 
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Change KVM_EXCEPTION_MAGIC to use the all-caps "ULL", rather than lower
case. This fixes a build failure with Clang:

  In file included from x86_64/hyperv_features.c:13:
  include/x86_64/processor.h:825:9: error: unexpected token in argument list
          return kvm_asm_safe("wrmsr", "a"(val & -1u), "d"(val >> 32), "c"(msr));
                 ^
  include/x86_64/processor.h:802:15: note: expanded from macro 'kvm_asm_safe'
          asm volatile(KVM_ASM_SAFE(insn)                 \
                       ^
  include/x86_64/processor.h:785:2: note: expanded from macro 'KVM_ASM_SAFE'
          "mov $" __stringify(KVM_EXCEPTION_MAGIC) ", %%r9\n\t"   \
          ^
  <inline asm>:1:18: note: instantiated into assembly here
          mov $0xabacadabaull, %r9
                          ^

Fixes: 3b23054cd3f5 ("KVM: selftests: Add x86-64 support for exception fixup")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/include/x86_64/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 45edf45821d0..51c6661aca77 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -754,7 +754,7 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 			void (*handler)(struct ex_regs *));
 
 /* If a toddler were to say "abracadabra". */
-#define KVM_EXCEPTION_MAGIC 0xabacadabaull
+#define KVM_EXCEPTION_MAGIC 0xabacadabaULL
 
 /*
  * KVM selftest exception fixup uses registers to coordinate with the exception
-- 
2.37.1.359.gd136c6c3e2-goog

