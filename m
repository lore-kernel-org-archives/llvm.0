Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E26A10E9
	for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 00:20:10 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59bdb9fe821so241330527b3.0
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 17:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695860409; x=1696465209; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=apwOiyl24ZAzh9ksVSTWSskudG0FdMibqgJzxKGTzAQ=;
        b=GsBQQKPG4CyWknHYcjWVXJzUz6+9jvu3TSdHow3P7nR9idYEJ7avbZCwPwDQrp0A+V
         5/aFFFntP3+322VsiehLTuypjbFMTOLSGL4Df1HR9z7sThKQzTL/SHf+Sf9CJJSfafRn
         dzvCWX/DRiTI69q6iUG+oXuIvvDIuhqq/v9EVSYHp1NtSFEixNccsWI7KtNS79+7ItXg
         XF1NEHr9oQoZZ5hy7I17ksrxxRfRj4EMD8BD/jzrRr7Oo3XyL/zpK6UwCvHKoeD3rHvX
         UkO92tGjf+StWpNDSu/eN3hfPJfZqBepRBY38MWolYrAtN/g3084mE1IYfbu3yoFrZ3s
         DAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695860409; x=1696465209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apwOiyl24ZAzh9ksVSTWSskudG0FdMibqgJzxKGTzAQ=;
        b=Dr0riAqT+JdLzwOe+uQg4EL65CDWsNZBOkFZgIddpay5di88QHcYf4GaLOEbH+Ll6b
         jmTGdEmhzWTsFGt+XJUkrsCQAIli+jj8qYrV8hChT3p3TcCYoaMUVKrK+WlXWPpaxmao
         8DvBc6q3JJ7xuN9ZH8WcoPmoO0kVVAdayhPLYTX/PnDttbz+pJfAJpUnhvQ0n5Lyn21q
         PfZsMC5PWBjWy5PXmQrlmu7k/KzZ4pEmBGJlJ6RX+97NDrcIKXM+0S67x5IuK3yFeZVJ
         nfS/d2OxO/Kwmf4kqwXUDVfg2Ogv6LFqTI6X3CLjFMLKWdvlVimNN3QU6E4TVEPecG/0
         XmsA==
X-Gm-Message-State: AOJu0Yz3ezuJNivivmTat+h5EmgJRxfyzG/FXcVFRnvO2YSCAs1VyCLE
	tNibkW9gUQl3rLP784j5KPu7TmOFRuc=
X-Google-Smtp-Source: AGHT+IFjrvJ2npDBahfPzbZd3vwTKZ6Cm9AffU0wGAefuUEwJ5h8tV0U/szmpVbKu6qLaPMbte7BjNX86SI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b65e:0:b0:586:a58d:2e24 with SMTP id
 h30-20020a81b65e000000b00586a58d2e24mr63304ywk.5.1695860409338; Wed, 27 Sep
 2023 17:20:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 27 Sep 2023 17:19:56 -0700
In-Reply-To: <20230928001956.924301-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230928001956.924301-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230928001956.924301-6-seanjc@google.com>
Subject: [PATCH 5/5] KVM: selftests: Force load all supported XSAVE state in
 state test
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	Tyler Stachecki <stachecki.tyler@gmail.com>, Leonardo Bras <leobras@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Extend x86's state to forcefully load *all* host-supported xfeatures by
modifying xstate_bv in the saved state.  Stuffing xstate_bv ensures that
the selftest is verifying KVM's full ABI regardless of whether or not the
guest code is successful in getting various xfeatures out of their INIT
state, e.g. see the disaster that is/was MPX.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86_64/processor.h       |  9 +++++++++
 tools/testing/selftests/kvm/x86_64/state_test.c    | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 6f66861175ad..25bc61dac5fb 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -922,6 +922,15 @@ static inline bool kvm_pmu_has(struct kvm_x86_pmu_feature feature)
 	       !kvm_cpu_has(feature.anti_feature);
 }
 
+static __always_inline uint64_t kvm_cpu_supported_xcr0(void)
+{
+	if (!kvm_cpu_has_p(X86_PROPERTY_SUPPORTED_XCR0_LO))
+		return 0;
+
+	return kvm_cpu_property(X86_PROPERTY_SUPPORTED_XCR0_LO) |
+	       ((uint64_t)kvm_cpu_property(X86_PROPERTY_SUPPORTED_XCR0_HI) << 32);
+}
+
 static inline size_t kvm_cpuid2_size(int nr_entries)
 {
 	return sizeof(struct kvm_cpuid2) +
diff --git a/tools/testing/selftests/kvm/x86_64/state_test.c b/tools/testing/selftests/kvm/x86_64/state_test.c
index 115b2cdf9279..88b58aab7207 100644
--- a/tools/testing/selftests/kvm/x86_64/state_test.c
+++ b/tools/testing/selftests/kvm/x86_64/state_test.c
@@ -230,6 +230,7 @@ static void __attribute__((__flatten__)) guest_code(void *arg)
 
 int main(int argc, char *argv[])
 {
+	uint64_t *xstate_bv, saved_xstate_bv;
 	vm_vaddr_t nested_gva = 0;
 	struct kvm_cpuid2 empty_cpuid = {};
 	struct kvm_regs regs1, regs2;
@@ -294,12 +295,25 @@ int main(int argc, char *argv[])
 		 * allow KVM_SET_XSAVE regardless of guest CPUID.  Manually
 		 * load only XSAVE state, MSRs in particular have a much more
 		 * convoluted ABI.
+		 *
+		 * Load two versions of XSAVE state: one with the actual guest
+		 * XSAVE state, and one with all supported features forced "on"
+		 * in xstate_bv, e.g. to ensure that KVM allows loading all
+		 * supported features, even if something goes awry in saving
+		 * the original snapshot.
 		 */
+		xstate_bv = (void *)&((uint8_t *)state->xsave->region)[512];
+		saved_xstate_bv = *xstate_bv;
+
 		vcpuN = __vm_vcpu_add(vm, vcpu->id + 1);
 		vcpu_xsave_set(vcpuN, state->xsave);
+		*xstate_bv = kvm_cpu_supported_xcr0();
+		vcpu_xsave_set(vcpuN, state->xsave);
 
 		vcpu_init_cpuid(vcpuN, &empty_cpuid);
 		vcpu_xsave_set(vcpuN, state->xsave);
+		*xstate_bv = saved_xstate_bv;
+		vcpu_xsave_set(vcpuN, state->xsave);
 
 		kvm_x86_state_cleanup(state);
 
-- 
2.42.0.582.g8ccd20d70d-goog

