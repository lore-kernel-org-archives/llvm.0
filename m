Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706BD5393
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 23:37:06 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id y17-20020a056a00181100b0053e8868496bso8246333pfa.21
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=C5F/Oxrj/QY+Y5WS5RDePmofQ3U7kPV+RzOaucqwWdo=;
        b=kX81y2OmYgmpdTE1459Tlczk75TEKDFxBkJVeW0iAfDcW5eArglHzzmSvcQF44u5aG
         bIK8OG6sadvcY97Qsk02K5Vg0O/68uoyFhcrtc4B4+k0qG1EV5h6Kcljg5DiiSP7iHaT
         81nhQe+1jty/XsqqG9/zIlECdDSWNVsqATBXurLkbMsGtyOy16lZjrU652PtuOgiUafv
         M3Ama6QQJ+aBPmI0q8rwy2JgIzJvjrKoWpLW9thsW5Rea473nl9DA7//riN4T4m7zc33
         RXpyng5aYm1NmyQf+l+BYZtcRWrmKn1IHsfvTIkngF7RzWmZ/VqE0HKWJ3d9QMS3BLsf
         E7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=C5F/Oxrj/QY+Y5WS5RDePmofQ3U7kPV+RzOaucqwWdo=;
        b=Ryw4AOmtyUoUuM0ayVmGVgdGPJRRscusoaKedg7FPOIKeez8u66bX7v/zOSO1axdCt
         7Op5Cu1eIFefcF92xnAIixoPw45yObKGzDyBVZ9Ha6ywsip6QE9COXsHfG088u7Q1Yor
         vbPJEt3QQ3G/R2ygo2u7rW7rz45f0Z9l2e+eo1b2dy1rajuW/DwOxkN8B/nkhboihOG2
         gtytPuWjyQwfjtDtc89yWfVGC8Je/X6S2FVkkZ+SxzqY7sGZFE7wKh469gTp+Som6j9P
         /BkLOgRSbM7n8S2xvcQ3BmC1TLrtgEEm53FH/7J+3TAIZVaS8FwT4iPIc9BVN9xNDrFD
         tomw==
X-Gm-Message-State: ACrzQf1DBWsxLcuNHLSuFqUIxQ5G8gj+0nA8PACm5c7+HtgmKpufPF1m
	Tl2NtePG1j6Klw27TPR1EbKR9EO0JjU=
X-Google-Smtp-Source: AMsMyM7d4YrAazHKrdsb+/sfmf19I9lBmCAbfDiVsQW2GTrKszNHRKohe2n7YmE8+nBtYixQgjKlqriWSHg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:3b90:b0:202:80ac:467c with SMTP id
 pc16-20020a17090b3b9000b0020280ac467cmr12610232pjb.17.1664408225997; Wed, 28
 Sep 2022 16:37:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Sep 2022 23:36:52 +0000
In-Reply-To: <20220928233652.783504-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220928233652.783504-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220928233652.783504-8-seanjc@google.com>
Subject: [PATCH v2 7/7] Revert "KVM: selftests: Fix nested SVM tests when
 built with clang"
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Revert back to using memset() in generic_svm_setup() now that KVM
selftests override memset() and friends specifically to prevent the
compiler from generating fancy code and/or linking to the libc
implementation.

This reverts commit ed290e1c20da19fa100a3e0f421aa31b65984960.

Suggested-by: Jim Mattson <jmattson@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/svm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/svm.c b/tools/testing/selftests/kvm/lib/x86_64/svm.c
index 6d445886e16c..5495a92dfd5a 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/svm.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/svm.c
@@ -60,18 +60,6 @@ static void vmcb_set_seg(struct vmcb_seg *seg, u16 selector,
 	seg->base = base;
 }
 
-/*
- * Avoid using memset to clear the vmcb, since libc may not be
- * available in L1 (and, even if it is, features that libc memset may
- * want to use, like AVX, may not be enabled).
- */
-static void clear_vmcb(struct vmcb *vmcb)
-{
-	int n = sizeof(*vmcb) / sizeof(u32);
-
-	asm volatile ("rep stosl" : "+c"(n), "+D"(vmcb) : "a"(0) : "memory");
-}
-
 void generic_svm_setup(struct svm_test_data *svm, void *guest_rip, void *guest_rsp)
 {
 	struct vmcb *vmcb = svm->vmcb;
@@ -88,7 +76,7 @@ void generic_svm_setup(struct svm_test_data *svm, void *guest_rip, void *guest_r
 	wrmsr(MSR_EFER, efer | EFER_SVME);
 	wrmsr(MSR_VM_HSAVE_PA, svm->save_area_gpa);
 
-	clear_vmcb(vmcb);
+	memset(vmcb, 0, sizeof(*vmcb));
 	asm volatile ("vmsave %0\n\t" : : "a" (vmcb_gpa) : "memory");
 	vmcb_set_seg(&save->es, get_es(), 0, -1U, data_seg_attr);
 	vmcb_set_seg(&save->cs, get_cs(), 0, -1U, code_seg_attr);
-- 
2.37.3.998.g577e59143f-goog

