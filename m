Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601B43FDD
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 01:09:02 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id k7-20020a170902ba8700b0014c7e2870d4so6056484pls.21
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 17:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=LcukT3aVWQNuFlO5tp4KbgwXT1VI3YuMTdLXdDHGgw4=;
        b=L5WVkpDBAaqAGX7sBQ9aM3BYEJZZItsnHILJyVw9anPCW9GBY6gMrJI/qsNxUDKi/b
         tVx/WXxQ8dpcYEP1PyI5F3A0LkrX7NlEchmWKjxbmmhItMO1VPhqL3SXKPc2GKJT7gHF
         +MueL52xjMxeZDZ79vz8mCrvikzwKG6i6rncgx3/3NWKPEWXvRLJd3F8+AI8TD093WC3
         fy1eBEB50+5Spbs0Z7cyviGeT2+7SixtFXWSLNt7/xq8TG68bsmbOSjVWmBBXVRLRpNF
         uqsM9E1016Ul0cWQQ93GlHN5rp3UH5pyOer1I+J5viYD6/BjVDbSiG6usGovwNBRvfZJ
         zkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=LcukT3aVWQNuFlO5tp4KbgwXT1VI3YuMTdLXdDHGgw4=;
        b=AcsKBmDWycSO1LgbFPttjsgIj+OdKpxjBRoN2HWcZeKljp67F9D5NT5tBj31aGYiAb
         ecnVkNZNPBUHpratNBNkThYC+kJToCa6/ZdFLLB5krQ9qpTM0miBHq33rHhSZ754Z9KR
         dB/KaXqOUcvsFr+AKPHXqEcKkUOdOTgZcvg4M//bvJLUv/uxWWNMJZQi7wBXTBrIl2iH
         8tAPOGk/zGcb0r+Ed+kCxzsN0OCkSGL1g3NyEzG0I5o50ceL+SBctBZAo3dGkEjZhIJo
         6VcGR2+x3LyAFLN9sPiUp6z89GUYNuvNavoqgxr79NwF+Zd0VmcQylvKLIJCRv00G97X
         ym4A==
X-Gm-Message-State: AOAM531lRRZywWd2mdjEmyRwVE8GQJKqWWNOLXlOqJ4affL135Pw8IBO
	/ePMZ5pAgN+qRFbFEnfLEPIEVUnwzI0=
X-Google-Smtp-Source: ABdhPJxukxPNZ3VcpmMc2eg8v3Edq+8quTgFxnPmvAUmlOB6In41l4WjFVxqrNN/Oh2K/QwpEJn1488nuA8=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:f198:: with SMTP id
 bv24mr25807269pjb.32.1643677741876; Mon, 31 Jan 2022 17:09:01 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Feb 2022 01:08:37 +0000
In-Reply-To: <20220201010838.1494405-1-seanjc@google.com>
Message-Id: <20220201010838.1494405-5-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220201010838.1494405-1-seanjc@google.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH 4/5] KVM: x86: Use __try_cmpxchg_user() to emulate atomic accesses
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Use the recently introduce __try_cmpxchg_user() to emulate atomic guest
accesses via the associated userspace address instead of mapping the
backing pfn into kernel address space.  Using kvm_vcpu_map() is unsafe as
it does not coordinate with KVM's mmu_notifier to ensure the hva=>pfn
translation isn't changed/unmapped in the memremap() path, i.e. when
there's no struct page and thus no elevated refcount.

Fixes: 42e35f8072c3 ("KVM/X86: Use kvm_vcpu_map in emulator_cmpxchg_emulated")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 74b53a16f38a..37064d565bbc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7155,15 +7155,8 @@ static int emulator_write_emulated(struct x86_emulate_ctxt *ctxt,
 				   exception, &write_emultor);
 }
 
-#define CMPXCHG_TYPE(t, ptr, old, new) \
-	(cmpxchg((t *)(ptr), *(t *)(old), *(t *)(new)) == *(t *)(old))
-
-#ifdef CONFIG_X86_64
-#  define CMPXCHG64(ptr, old, new) CMPXCHG_TYPE(u64, ptr, old, new)
-#else
-#  define CMPXCHG64(ptr, old, new) \
-	(cmpxchg64((u64 *)(ptr), *(u64 *)(old), *(u64 *)(new)) == *(u64 *)(old))
-#endif
+#define emulator_try_cmpxchg_user(t, ptr, old, new) \
+	(__try_cmpxchg_user((t *)(ptr), (t *)(old), *(t *)(new), efault ## t))
 
 static int emulator_cmpxchg_emulated(struct x86_emulate_ctxt *ctxt,
 				     unsigned long addr,
@@ -7172,12 +7165,11 @@ static int emulator_cmpxchg_emulated(struct x86_emulate_ctxt *ctxt,
 				     unsigned int bytes,
 				     struct x86_exception *exception)
 {
-	struct kvm_host_map map;
 	struct kvm_vcpu *vcpu = emul_to_vcpu(ctxt);
 	u64 page_line_mask;
+	unsigned long hva;
 	gpa_t gpa;
-	char *kaddr;
-	bool exchanged;
+	int r;
 
 	/* guests cmpxchg8b have to be emulated atomically */
 	if (bytes > 8 || (bytes & (bytes - 1)))
@@ -7201,31 +7193,32 @@ static int emulator_cmpxchg_emulated(struct x86_emulate_ctxt *ctxt,
 	if (((gpa + bytes - 1) & page_line_mask) != (gpa & page_line_mask))
 		goto emul_write;
 
-	if (kvm_vcpu_map(vcpu, gpa_to_gfn(gpa), &map))
+	hva = kvm_vcpu_gfn_to_hva(vcpu, gpa_to_gfn(gpa));
+	if (kvm_is_error_hva(addr))
 		goto emul_write;
 
-	kaddr = map.hva + offset_in_page(gpa);
+	hva += offset_in_page(gpa);
 
 	switch (bytes) {
 	case 1:
-		exchanged = CMPXCHG_TYPE(u8, kaddr, old, new);
+		r = emulator_try_cmpxchg_user(u8, hva, old, new);
 		break;
 	case 2:
-		exchanged = CMPXCHG_TYPE(u16, kaddr, old, new);
+		r = emulator_try_cmpxchg_user(u16, hva, old, new);
 		break;
 	case 4:
-		exchanged = CMPXCHG_TYPE(u32, kaddr, old, new);
+		r = emulator_try_cmpxchg_user(u32, hva, old, new);
 		break;
 	case 8:
-		exchanged = CMPXCHG64(kaddr, old, new);
+		r = emulator_try_cmpxchg_user(u64, hva, old, new);
 		break;
 	default:
 		BUG();
 	}
 
-	kvm_vcpu_unmap(vcpu, &map, true);
-
-	if (!exchanged)
+	if (r < 0)
+		goto emul_write;
+	if (r)
 		return X86EMUL_CMPXCHG_FAILED;
 
 	kvm_page_track_write(vcpu, gpa, new, bytes);
-- 
2.35.0.rc2.247.g8bbb082509-goog

