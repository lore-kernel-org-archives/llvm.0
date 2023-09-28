Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ECCEBE
	for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 00:20:08 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d868842eda1so15140260276.0
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 17:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695860407; x=1696465207; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TVfUpdVb4H8djihj2XvGyhzWBuel7qP+7Sh6W+PqBNQ=;
        b=o2leccT3souhRvSeQGwvCx2Lu6p/FQCQj6dQU5Pyvd2Krr2xae5V5RI4r1ZK6/tbKJ
         3yDkWmbMSWmSX+8QR8GUXQcgXPqYIgT6fYGaimrpGNzNB56kMIJeeTOOIAL4S5uCtSmn
         IiyGaGcI/ec9omgPo/yRveOsJpYVW5vJNTaUSHnl6gp6X6K3IWzGkfhS4gJiECewyjUB
         Uc9XdIr3VCXV15E38KRgqkZA0gl/O24foV4NB7l5eJxwJasPtPDaG0ABwXfiGWEl8o5c
         EQtfky0ziCYJOcHDSj9ml9eRPUMXK9wzpobsBIv5t7Z3axK8musEP0MnDHOIjQ48Ps1+
         aZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695860407; x=1696465207;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVfUpdVb4H8djihj2XvGyhzWBuel7qP+7Sh6W+PqBNQ=;
        b=NbLatV0eytA1DglUSfGBsYflTUI6fhj5xRqB0h5s4MF1uMehu2RsthyAWT2mMR++P/
         6mmfo+esp3w/giH/eP1/W9KBJ3zYMSnYkZMK8RrNfMoHwDSWnZNt5XdCkJDwWegqxv7G
         arZmocJu5t2SiRaoiMVLCrs4Kx2b0PYrP1//Cjj9pfDQUHuHaH6vOki6uY51KwQwxn6h
         au7K4jq/BQyuKgOATBW9yBUh8DmZD+nwAFi7OdeIOsWdEFPCsD/FUD2axS7WZ0eOiUUe
         fIeCxpXA5XFLc7ybbo10xKuw/SFzmUfcnH+qM28ennIOwYuo7hafYQZqnQRwcUiNGQtV
         UNfQ==
X-Gm-Message-State: AOJu0YwtVZi3cZe8aLNYcPO+kwHFPLuwuvyzthQmRuYuFKkXI5zFl4Dr
	7XEnwf7Y2rm++lQOzJq74JeF0+uE+RE=
X-Google-Smtp-Source: AGHT+IFhAUt+8/byCgo6N2PCf+dvWKMyFGUjD1tcqW/1QA0MnF0S/CYub5vkgi5QAlFkH9KMWwwIy4ogT3A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:541:b0:d0c:c83b:94ed with SMTP id
 z1-20020a056902054100b00d0cc83b94edmr49229ybs.10.1695860407456; Wed, 27 Sep
 2023 17:20:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 27 Sep 2023 17:19:55 -0700
In-Reply-To: <20230928001956.924301-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230928001956.924301-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230928001956.924301-5-seanjc@google.com>
Subject: [PATCH 4/5] KVM: selftests: Load XSAVE state into untouched vCPU
 during state test
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	Tyler Stachecki <stachecki.tyler@gmail.com>, Leonardo Bras <leobras@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Expand x86's state test to load XSAVE state into a "dummy" vCPU prior to
KVM_SET_CPUID2, and again with an empty guest CPUID model.  Except for
off-by-default features, i.e. AMX, KVM's ABI for KVM_SET_XSAVE is that
userspace is allowed to load xfeatures so long as they are supported by
the host.  This is a regression test for a combination of KVM bugs where
the state saved by KVM_GET_XSAVE{2} could not be loaded via KVM_SET_XSAVE
if the saved xstate_bv would load guest-unsupported xfeatures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/x86_64/state_test.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/state_test.c b/tools/testing/selftests/kvm/x86_64/state_test.c
index df3e93df4343..115b2cdf9279 100644
--- a/tools/testing/selftests/kvm/x86_64/state_test.c
+++ b/tools/testing/selftests/kvm/x86_64/state_test.c
@@ -231,9 +231,9 @@ static void __attribute__((__flatten__)) guest_code(void *arg)
 int main(int argc, char *argv[])
 {
 	vm_vaddr_t nested_gva = 0;
-
+	struct kvm_cpuid2 empty_cpuid = {};
 	struct kvm_regs regs1, regs2;
-	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu *vcpu, *vcpuN;
 	struct kvm_vm *vm;
 	struct kvm_x86_state *state;
 	struct ucall uc;
@@ -286,6 +286,21 @@ int main(int argc, char *argv[])
 		/* Restore state in a new VM.  */
 		vcpu = vm_recreate_with_one_vcpu(vm);
 		vcpu_load_state(vcpu, state);
+
+		/*
+		 * Restore XSAVE state in a dummy vCPU, first without doing
+		 * KVM_SET_CPUID2, and then with an empty guest CPUID.  Except
+		 * for off-by-default xfeatures, e.g. AMX, KVM is supposed to
+		 * allow KVM_SET_XSAVE regardless of guest CPUID.  Manually
+		 * load only XSAVE state, MSRs in particular have a much more
+		 * convoluted ABI.
+		 */
+		vcpuN = __vm_vcpu_add(vm, vcpu->id + 1);
+		vcpu_xsave_set(vcpuN, state->xsave);
+
+		vcpu_init_cpuid(vcpuN, &empty_cpuid);
+		vcpu_xsave_set(vcpuN, state->xsave);
+
 		kvm_x86_state_cleanup(state);
 
 		memset(&regs2, 0, sizeof(regs2));
-- 
2.42.0.582.g8ccd20d70d-goog

