Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0D5393
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 23:37:02 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id h13-20020a63530d000000b0043087bbf72dso8210446pgb.17
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=mS6VIRczScq+ZK5JpZSpDTPKYwplveOdSZ+4IyqZtac=;
        b=qHKIgIl7nYwrH4PMIdq4cCyCJgQdffQgx0rGIp0KrZS9cCeBI11Nw2Sh2IKI+wzQEw
         1JEQY8RuaUSYgM5OkZBN90UG1L/KDKDmHd0BDtpvw15mwNPUeD/uQy+9pZcGWkXF9jfc
         /aWZ+PMj7mSUyBjcGtL3+SQl1OjCHEZs4eNjCup4VblPFteyhCVCukiI9xKqKwuAUAeI
         4RlCkp5NQP1dxE0tQEatR7T1rqQvfMAFuaSGF7Xx7ii5Sg0dSbbqxbUhhYyKtiYQxuYM
         8j0BB3eUMxccdxmDiyUnWQsouRB35AtwQGliYEkLr95pUr5dfQBfHuOXpA6RKXSfvXks
         dHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=mS6VIRczScq+ZK5JpZSpDTPKYwplveOdSZ+4IyqZtac=;
        b=TKrq/zATG1CVO7mHkbWWdp96A63aWkTMAmhRazRa1/wKBICOpWJ7rtx31Kbw9X5Lww
         gcoRIrKcsGorbToY5xza8O8PxBtGYeQgIH5NBb8voZQRCChFpR1ngYsqg3p1jrgfKgDP
         +6nnPIH8XFXDkCoznOeR20IQe6rqzQZi+qQ7pGPYUq4wu/5agMzom1kJ2XDc9aENkpOe
         lgSbFwaIiiS5/pvn9pLMwgyk+OjWxvtft4vvUmrhJU5T891nuPseJxrci9XvcDbue3WB
         ge/bRJ7OmxZA2GNrY4OYtC63RuuyOgJu1TTtOIrIY5PB0xj8o6XXvDIPM7YVSYRVSaI+
         0LMw==
X-Gm-Message-State: ACrzQf0TQTaBhHBVIQYWu3iHCGKdAlnUePCs5cmKEvBXNSJAOj2YJs0q
	9cluvTe0t3s50Y0l87DerPu+EJTBu8k=
X-Google-Smtp-Source: AMsMyM76uWH2qDTa38zS4n1/QSUtAckOqDzb1DVWyUP+oG9GpKEVF69IOu3NdxbEFewP1z8AAY91MNGoRII=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:10c2:b0:547:4991:c984 with SMTP id
 d2-20020a056a0010c200b005474991c984mr414896pfu.6.1664408222532; Wed, 28 Sep
 2022 16:37:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Sep 2022 23:36:50 +0000
In-Reply-To: <20220928233652.783504-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220928233652.783504-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220928233652.783504-6-seanjc@google.com>
Subject: [PATCH v2 5/7] KVM: selftests: Explicitly verify KVM doesn't patch
 hypercall if quirk==off
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

Explicitly verify that KVM doesn't patch in the native hypercall if the
FIX_HYPERCALL_INSN quirk is disabled.  The test currently verifies that
a #UD occurred, but doesn't actually verify that no patching occurred.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86_64/fix_hypercall_test.c | 26 +++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
index cebc84b26352..10b9482fc4d7 100644
--- a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
+++ b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
@@ -21,8 +21,8 @@ static bool ud_expected;
 
 static void guest_ud_handler(struct ex_regs *regs)
 {
-	GUEST_ASSERT(ud_expected);
-	GUEST_DONE();
+	regs->rax = -EFAULT;
+	regs->rip += HYPERCALL_INSN_SIZE;
 }
 
 static const uint8_t vmx_vmcall[HYPERCALL_INSN_SIZE]  = { 0x0f, 0x01, 0xc1 };
@@ -46,6 +46,7 @@ static void guest_main(void)
 {
 	const uint8_t *native_hypercall_insn;
 	const uint8_t *other_hypercall_insn;
+	uint64_t ret;
 
 	if (is_intel_cpu()) {
 		native_hypercall_insn = vmx_vmcall;
@@ -61,15 +62,24 @@ static void guest_main(void)
 
 	memcpy(hypercall_insn, other_hypercall_insn, HYPERCALL_INSN_SIZE);
 
-	do_sched_yield(GET_APIC_ID_FIELD(xapic_read_reg(APIC_ID)));
+	ret = do_sched_yield(GET_APIC_ID_FIELD(xapic_read_reg(APIC_ID)));
 
 	/*
-	 * The hypercall didn't #UD (guest_ud_handler() signals "done" if a #UD
-	 * occurs).  Verify that a #UD is NOT expected and that KVM patched in
-	 * the native hypercall.
+	 * If the quirk is disabled, verify that guest_ud_handler() "returned"
+	 * -EFAULT and that KVM did NOT patch the hypercall.  If the quirk is
+	 * enabled, verify that the hypercall succeeded and that KVM patched in
+	 * the "right" hypercall.
 	 */
-	GUEST_ASSERT(!ud_expected);
-	GUEST_ASSERT(!memcmp(native_hypercall_insn, hypercall_insn, HYPERCALL_INSN_SIZE));
+	if (ud_expected) {
+		GUEST_ASSERT(ret == (uint64_t)-EFAULT);
+		GUEST_ASSERT(!memcmp(other_hypercall_insn, hypercall_insn,
+			     HYPERCALL_INSN_SIZE));
+	} else {
+		GUEST_ASSERT(!ret);
+		GUEST_ASSERT(!memcmp(native_hypercall_insn, hypercall_insn,
+			     HYPERCALL_INSN_SIZE));
+	}
+
 	GUEST_DONE();
 }
 
-- 
2.37.3.998.g577e59143f-goog

