Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7DB7E1
	for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 00:20:04 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59f4c72c66fso203036917b3.2
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 17:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695860403; x=1696465203; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=i6Py+ACdvl5qdIki/mVRt+DdjK10J7Lfr08DhLsqDcA=;
        b=4j3wBjjaNYPSf3HDw2sGMopgl8oDslrqFtqzTxhv5gfrek+kUFyXZ+6Dx+QLpSD7JU
         N9E32u81GZEduUhmh8UOTQtU4KSURoxYvegtEab8C9LGzW80snF0hePj2iHdlwRKAW6Z
         0Zuy5xcPkrppIBdFmn1kf541mD8dy0k1EIBFij0Hu5wdCNIf8bG0vmda7A924bkN0Cg8
         eGzDSTG1sOzlTyOnuz+7XNSoP7XsVLHcUhr2liY3fyk0zCA/FVyScRCOOeTK+5Rc7wrO
         WHvdYpHNg6r2OAEnzyynZKi7ZqZRMxbL7Q0NcnFBvwXWN3OG7ClN9LNN+O8l7txSR9gr
         E8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695860403; x=1696465203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6Py+ACdvl5qdIki/mVRt+DdjK10J7Lfr08DhLsqDcA=;
        b=VZvROY1COohui6HgW0mlAQtiSsMcoSouq1mh2xNkSQSmClaJ/Bfs4AFOAoAWh9U68A
         Mcf8F5DcHG25TMxRq2zPZN4dLLdKY4Tt+1P4zkY4EEfurvTCvbg2lTVO8erigj0sYtaS
         imbKdnU4szrLEWkMYR8QygFqIfEXU539FBR/X89qCQYwSdt4FtETWHeXCJcmXEg6qMY/
         tLYHcVppYdu/B3CZXNNxvUnTRsKLC8iBg98lHYPN3HbeLlYkfmE3klK1NUTVPHT7EKqh
         6OR8/TwuQ6fEl7R57LlUSHFdycPWlO3xYsrBhyfbWHPec8Vl+/IkeNSDkVxTy7Gpsz00
         QqjA==
X-Gm-Message-State: AOJu0YzerOtvHWh5tp3yzqVUfwrc+J3pEm0Q6QErRc9KvQTUslpML9yF
	f2WVQt6ForXw7J3uk5TYmacnaktYGKU=
X-Google-Smtp-Source: AGHT+IHUrcVz15+j+5HECYlp3Pgaiq4UBfegTD1MqSW66kU3ut2BpeebBPZckxrdcj0LzX6zbXVIBR34wfg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4316:0:b0:58c:8c9f:c05a with SMTP id
 q22-20020a814316000000b0058c8c9fc05amr53375ywa.9.1695860403653; Wed, 27 Sep
 2023 17:20:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 27 Sep 2023 17:19:53 -0700
In-Reply-To: <20230928001956.924301-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230928001956.924301-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230928001956.924301-3-seanjc@google.com>
Subject: [PATCH 2/5] KVM: x86: Constrain guest-supported xfeatures only at KVM_GET_XSAVE{2}
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	Tyler Stachecki <stachecki.tyler@gmail.com>, Leonardo Bras <leobras@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Mask off xfeatures that aren't exposed to the guest only when saving guest
state via KVM_GET_XSAVE{2} instead of modifying user_xfeatures directly.
Preserving the maximal set of xfeatures in user_xfeatures restores KVM's
ABI for KVM_SET_XSAVE, which prior to commit ad856280ddea ("x86/kvm/fpu:
Limit guest user_xfeatures to supported bits of XCR0") allowed userspace
to load xfeatures that are supported by the host, irrespective of what
xfeatures are exposed to the guest.

There is no known use case where userspace *intentionally* loads xfeatures
that aren't exposed to the guest, but the bug fixed by commit ad856280ddea
was specifically that KVM_GET_SAVE{2} would save xfeatures that weren't
exposed to the guest, e.g. would lead to userspace unintentionally loading
guest-unsupported xfeatures when live migrating a VM.

Restricting KVM_SET_XSAVE to guest-supported xfeatures is especially
problematic for QEMU-based setups, as QEMU has a bug where instead of
terminating the VM if KVM_SET_XSAVE fails, QEMU instead simply stops
loading guest state, i.e. resumes the guest after live migration with
incomplete guest state, and ultimately results in guest data corruption.

Note, letting userspace restore all host-supported xfeatures does not fix
setups where a VM is migrated from a host *without* commit ad856280ddea,
to a target with a subset of host-supported xfeatures.  However there is
no way to safely address that scenario, e.g. KVM could silently drop the
unsupported features, but that would be a clear violation of KVM's ABI and
so would require userspace to opt-in, at which point userspace could
simply be updated to sanitize the to-be-loaded XSAVE state.

Reported-by: Tyler Stachecki <stachecki.tyler@gmail.com>
Closes: https://lore.kernel.org/all/20230914010003.358162-1-tstachecki@bloomberg.net
Fixes: ad856280ddea ("x86/kvm/fpu: Limit guest user_xfeatures to supported bits of XCR0")
Cc: stable@vger.kernel.org
Cc: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/fpu/xstate.c |  5 +----
 arch/x86/kvm/cpuid.c         |  8 --------
 arch/x86/kvm/x86.c           | 18 ++++++++++++++++--
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 76408313ed7f..ef6906107c54 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1539,10 +1539,7 @@ static int fpstate_realloc(u64 xfeatures, unsigned int ksize,
 		fpregs_restore_userregs();
 
 	newfps->xfeatures = curfps->xfeatures | xfeatures;
-
-	if (!guest_fpu)
-		newfps->user_xfeatures = curfps->user_xfeatures | xfeatures;
-
+	newfps->user_xfeatures = curfps->user_xfeatures | xfeatures;
 	newfps->xfd = curfps->xfd & ~xfeatures;
 
 	/* Do the final updates within the locked region */
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 0544e30b4946..773132c3bf5a 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -360,14 +360,6 @@ static void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	vcpu->arch.guest_supported_xcr0 =
 		cpuid_get_supported_xcr0(vcpu->arch.cpuid_entries, vcpu->arch.cpuid_nent);
 
-	/*
-	 * FP+SSE can always be saved/restored via KVM_{G,S}ET_XSAVE, even if
-	 * XSAVE/XCRO are not exposed to the guest, and even if XSAVE isn't
-	 * supported by the host.
-	 */
-	vcpu->arch.guest_fpu.fpstate->user_xfeatures = vcpu->arch.guest_supported_xcr0 |
-						       XFEATURE_MASK_FPSSE;
-
 	kvm_update_pv_runtime(vcpu);
 
 	vcpu->arch.maxphyaddr = cpuid_query_maxphyaddr(vcpu);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 41d8e6c8570c..1e645f5b1e2c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5386,12 +5386,26 @@ static int kvm_vcpu_ioctl_x86_set_debugregs(struct kvm_vcpu *vcpu,
 static void kvm_vcpu_ioctl_x86_get_xsave2(struct kvm_vcpu *vcpu,
 					  u8 *state, unsigned int size)
 {
+	/*
+	 * Only copy state for features that are enabled for the guest.  The
+	 * state itself isn't problematic, but setting bits in the header for
+	 * features that are supported in *this* host but not exposed to the
+	 * guest can result in KVM_SET_XSAVE failing when live migrating to a
+	 * compatible host without the features that are NOT exposed to the
+	 * guest.
+	 *
+	 * FP+SSE can always be saved/restored via KVM_{G,S}ET_XSAVE, even if
+	 * XSAVE/XCRO are not exposed to the guest, and even if XSAVE isn't
+	 * supported by the host.
+	 */
+	u64 supported_xcr0 = vcpu->arch.guest_supported_xcr0 |
+			     XFEATURE_MASK_FPSSE;
+
 	if (fpstate_is_confidential(&vcpu->arch.guest_fpu))
 		return;
 
 	fpu_copy_guest_fpstate_to_uabi(&vcpu->arch.guest_fpu, state, size,
-				       vcpu->arch.guest_fpu.fpstate->user_xfeatures,
-				       vcpu->arch.pkru);
+				       supported_xcr0, vcpu->arch.pkru);
 }
 
 static void kvm_vcpu_ioctl_x86_get_xsave(struct kvm_vcpu *vcpu,
-- 
2.42.0.582.g8ccd20d70d-goog

