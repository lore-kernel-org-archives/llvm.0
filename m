Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E2EC8A
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 16:23:58 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id u17-20020a63a911000000b0037491401c44so2609486pge.17
        for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 08:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:message-id:mime-version:subject:from:to:cc;
        bh=Zq5O8IKBkl9yeultGadXfU2kv4EOG3DlmV7KiCyDcKM=;
        b=crEwl8LrnedZBA2+Md/f5sPIkTNDd3HYfHlrpjl5H/7KtrpKygDWvmlRLs4DvoXySZ
         B4oBmQ3HULN70w4taFlDvkgBuurBxC3QH9oshKsZ6UeJKsve0PTZdHGCMKIbR/A8Akd8
         fYcloBZvCg7y9iwDTa8g0OBJ1uuYqzyg+LAWyGZtCZbUQ5p8Fl65UCP3NR31QEZRHE7l
         PBrFDDztQdyQhT1PTlBKCLawcgtH/F5Z8zmU03CqPk5yRRuRh0PiJUkmzcD2RjOB7eg9
         6zCDwQfOTxiDUgMMN7TP9lrdV5zphFC5iM5NjO0qVJaLrNIyqpYMEjnw/JYRxSJOMhsD
         lYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
         :from:to:cc;
        bh=Zq5O8IKBkl9yeultGadXfU2kv4EOG3DlmV7KiCyDcKM=;
        b=ivK8s24xUDzJapu8qpH4CwVKpyyt2pExBr2nmp4Bc48lB1X0yEqHFInXduU4AW80Jq
         e32/6rdRjOfaCqlHZMGAYolktVm1HyGPHZipluwMkrabQ0f6DXygCi4YXRhGj8T6XpSW
         OSmp6ojg9OHLK7SyUUqlnhEcx0YlOuaRByuYchzDHuap3U8G1qpXCstENoVDR+J1X+tM
         SL5gsaVEtOlD792rfgZdCI1GpZjG6HzcnJtY6To+6+TurNjKCKoRZA9qWWieG+Kbet+c
         RfxRk2v5BvS5ke5oo9zxdZ4E8J9zJ50DeIbWi8s1ESUsQVkQrKDrwlT12xcUrXWNMNN3
         dr7g==
X-Gm-Message-State: AOAM532jxKj8bdK9IJB/KX3V/JN/ZlGdNCXvwzYIPxQDB6DcJPadi06Q
	iKzOqwXKfnpwAYt9I3K+VGrwsfQcN3E=
X-Google-Smtp-Source: ABdhPJzZQ0B8p6pIOm8+cCuTOJozWKUbW01GUCzK1dfNF6PIug84YVze+NcLDSwys7PuOxQ3ArOXBy0YDUA=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4f43:b0:1bc:7e5c:e024 with SMTP id
 pj3-20020a17090b4f4300b001bc7e5ce024mr57612pjb.0.1645633437536; Wed, 23 Feb
 2022 08:23:57 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 23 Feb 2022 16:23:55 +0000
Message-Id: <20220223162355.3174907-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.473.g83b2b277ed-goog
Subject: [PATCH] KVM: x86: Fix pointer mistmatch warning when patching RET0
 static calls
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Like Xu <like.xu.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Cast kvm_x86_ops.func to 'void *' when updating KVM static calls that are
conditionally patched to __static_call_return0().  clang complains about
using mismatching pointers in the ternary operator, which breaks the
build when compiling with CONFIG_KVM_WERROR=y.

  >> arch/x86/include/asm/kvm-x86-ops.h:82:1: warning: pointer type mismatch
  ('bool (*)(struct kvm_vcpu *)' and 'void *') [-Wpointer-type-mismatch]

Fixes: 5be2226f417d ("KVM: x86: allow defining return-0 static calls")
Reported-by: Like Xu <like.xu.linux@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 713e08f62385..f285ddb8b66b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1547,8 +1547,8 @@ static inline void kvm_ops_static_call_update(void)
 	WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
 #define KVM_X86_OP_OPTIONAL __KVM_X86_OP
 #define KVM_X86_OP_OPTIONAL_RET0(func) \
-	static_call_update(kvm_x86_##func, kvm_x86_ops.func ? : \
-			   (void *) __static_call_return0);
+	static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
+					   (void *)__static_call_return0);
 #include <asm/kvm-x86-ops.h>
 #undef __KVM_X86_OP
 }

base-commit: f4bc051fc91ab9f1d5225d94e52d369ef58bec58
-- 
2.35.1.473.g83b2b277ed-goog

