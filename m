Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD29B2C9D
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 00:50:05 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id p6-20020a63ab06000000b0033fcc84d4f6so11330314pgf.5
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 16:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=YlCl+ohirKd09vv0wcllKf/IW1dSS26lbTtAtOAdLYg=;
        b=Qctxu1B8NhsO5um4y7KJJHlRD72php90lxuzKdp6hG5en0y0USYIVlfvIob1Axm8Nb
         6STElTyHIexmGhrBQEpkqzbKFDOpCVzflM2HphSEsSkOrbX4CDLKcr90FGgiXg0APt64
         8kVvBHzJqrsDrIftmybBme8IGhVQnO2UA2C93yfqw4yQdipU6RahqIzRpgUrNzOyPbRh
         RVhuPRgRVkUChtu1JW6GEO0VfHYgs3ipc8aRJ300voV5AOlPEKIrAlI10r6mcf0pcvUZ
         NsApodqde8pLGBWv/m7ZNwhbWsiD4Vm3+re04yGZ/ffBvWYOgp1s3D7Udp0d1+VH9lOU
         096w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=YlCl+ohirKd09vv0wcllKf/IW1dSS26lbTtAtOAdLYg=;
        b=S04VPr2R5njLmPYqK6Y/YTmNwrMaG9JVHG4KGDYpQJdJYc9TXuBz7TCuqZGzH2HHZe
         vKvKFKNI2j7at2V/R8JQhIgWL06kEWNhxqHXBpdo2EL3qEYQiuZbHP3S3R46kmp56wmD
         zU8P5cfF9qxXmL7M1iFPa6bP3L+rqDx6Pp/f0ye+RK0hisERu9ob8miIuzW3OK7UGvdr
         Z3FP4YPFMG9oxu4RXV+w+jaZHGGOE9MH1CdBwREZ5OEDxW+9dqH4I4fnotbb+0VIAXTk
         GkJKTDnIJAaBQV3W4AvZIYhSuDsBA9ZRC1T1efcmEGpGk3N48ew1f8Z1TubPcfpY5HXU
         r8bA==
X-Gm-Message-State: AOAM531fyAg2vrrB1Wau6LY/F2KVV7qFK+2rnfrwk1zsLoJleAd7uQnt
	QgBJ8BHYI7dGwyb+WxyEmomqWmCl0dQ=
X-Google-Smtp-Source: ABdhPJz2X2rTMuFJJEYa6E10XzsJthSh3qvVQfRKYL+RLkE4rRhykPoFGY/gKPXyjSkfJpiwXyTqUs0zF2U=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1992:: with SMTP id
 d18mr26971386pfl.85.1643763005290; Tue, 01 Feb 2022 16:50:05 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Feb 2022 00:49:44 +0000
In-Reply-To: <20220202004945.2540433-1-seanjc@google.com>
Message-Id: <20220202004945.2540433-5-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220202004945.2540433-1-seanjc@google.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH v2 4/5] KVM: x86: Use __try_cmpxchg_user() to emulate atomic accesses
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Tadeusz Struk <tadeusz.struk@linaro.org>, 
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
index 74b53a16f38a..c9cac3100f77 100644
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
+	(__try_cmpxchg_user((t __user *)(ptr), (t *)(old), *(t *)(new), efault ## t))
 
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

