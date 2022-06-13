Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387EF7A
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 21:42:46 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id w36-20020a17090a6ba700b001e876698a01so6964072pjj.5
        for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 14:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:message-id:mime-version:subject:from:to:cc;
        bh=RVy85ULONsPMosb1NmFt3NRY87u30o0irh/ZWjWjAQQ=;
        b=SEpiP60SyyDEf/Tnm3zpDuQbs8gKvGqZQWxGmHhqNnIx2TWH/CkGAZ9qantBF7CRk6
         a+mFjO2HObwDwvtZzU62OBzinGjx0MP01SfwVdRTRSFOoyxBVLH29eEbdeRYE423f9xF
         Kl7aaN0WWWwrEbZ7SzaEYVhle5y6gfBRLn2dRSuMQwWAIbtMaDQaJqEINEK1YclQi3Pq
         gwdYCsX72hMjPUGj7PQXWFrDRhuhvPK47GWICbL/v/nmgRvnjGnJuKVSx2r4BxQkgEno
         NMC7vp5Op6Ui4qJahNYCLavsZN7o7hfmv147En8DCOyi82LSOxm6QHeXQnKRAFt/NOHi
         n0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
         :from:to:cc;
        bh=RVy85ULONsPMosb1NmFt3NRY87u30o0irh/ZWjWjAQQ=;
        b=ZoEev1poiK+MaNbDqMFm7D1HiIKXSPCgikTUrA8/5RqsttSspLnVESXiMt/wIjGP0I
         noH9Z0Q4fWJrjehT+Dw8ZTtS8nL3TTV/NMR22bu3Ah0S4WCh5k/5JufO5f/JsV04yhh/
         1NIXgC9KfDYab2CcApLnCAdB9W4Ye5/uN6s8nM/NpVklP/ZC0Q2xx3QNHSqbJ4Q6fPzu
         TWNilJg7a0n1mKUka9c61d8zt2HTaTSOM1Mc/B3Y8fwy95kaaoIJvpt3I1DnH6aBEbk6
         MSWemiY/Qfz9zr7s40mDUww5BEvbuehFR89o9Q6VpWYXuQLMjcnR2FrxaekHrr4+DLiS
         azhg==
X-Gm-Message-State: AJIora+ofIEGZzu2Pay6R887tWnIENMkzAuMy6EhJVPTPoQ4eEK4rnpe
	KcJrbomKdSDwIBtI1Fwo08BDpMWOXJg=
X-Google-Smtp-Source: AGRyM1urKA7NScvmeBtxVRmnJcZPpHOq5ewz3AmNrW84SUP+NUFAo6x/+herBNp05LNlC6l+fSWyWo0gPnY=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:178f:b0:1e3:3ba:c185 with SMTP id
 q15-20020a17090a178f00b001e303bac185mr47660pja.1.1655156565067; Mon, 13 Jun
 2022 14:42:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 13 Jun 2022 21:42:37 +0000
Message-Id: <20220613214237.2538266-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH] KVM: SVM: Hide SEV migration lockdep goo behind CONFIG_DEBUG_LOCK_ALLOC
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Peter Gonda <pgonda@google.com>
Content-Type: text/plain; charset="UTF-8"

Wrap the manipulation of @role and the manual mutex_{release,acquire}()
invocations in CONFIG_PROVE_LOCKING=y to squash a clang-15 warning.  When
building with -Wunused-but-set-parameter and CONFIG_DEBUG_LOCK_ALLOC=n,
clang-15 seees there's no usage of @role in mutex_lock_killable_nested()
and yells.  PROVE_LOCKING selects DEBUG_LOCK_ALLOC, and the only reason
KVM manipulates @role is to make PROVE_LOCKING happy.

To avoid true ugliness, use "i" and "j" to detect the first pass in the
loops; the "idx" field that's used by kvm_for_each_vcpu() is guaranteed
to be '0' on the first pass as it's simply the first entry in the vCPUs
XArray, which is fully KVM controlled.  kvm_for_each_vcpu() passes '0'
for xa_for_each_range()'s "start", and xa_for_each_range() will not enter
the loop if there's no entry at '0'.

Fixes: 0c2c7c069285 ("KVM: SEV: Mark nested locking of vcpu->lock")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Peter Gonda <pgonda@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---

Compile tested only, still haven't figured out why SEV is busted on our
test systems with upstream kernels.  I also haven't verified this squashes
the clang-15 warning, so a thumbs up on that end would be helpful.

 arch/x86/kvm/svm/sev.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 51fd985cf21d..309bcdb2f929 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -1606,38 +1606,35 @@ static int sev_lock_vcpus_for_migration(struct kvm *kvm,
 {
 	struct kvm_vcpu *vcpu;
 	unsigned long i, j;
-	bool first = true;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (mutex_lock_killable_nested(&vcpu->mutex, role))
 			goto out_unlock;
 
-		if (first) {
+#ifdef CONFIG_PROVE_LOCKING
+		if (!i)
 			/*
 			 * Reset the role to one that avoids colliding with
 			 * the role used for the first vcpu mutex.
 			 */
 			role = SEV_NR_MIGRATION_ROLES;
-			first = false;
-		} else {
+		else
 			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
-		}
+#endif
 	}
 
 	return 0;
 
 out_unlock:
 
-	first = true;
 	kvm_for_each_vcpu(j, vcpu, kvm) {
 		if (i == j)
 			break;
 
-		if (first)
-			first = false;
-		else
+#ifdef CONFIG_PROVE_LOCKING
+		if (j)
 			mutex_acquire(&vcpu->mutex.dep_map, role, 0, _THIS_IP_);
-
+#endif
 
 		mutex_unlock(&vcpu->mutex);
 	}

base-commit: 8baacf67c76c560fed954ac972b63e6e59a6fba0
-- 
2.36.1.476.g0c4daa206d-goog

