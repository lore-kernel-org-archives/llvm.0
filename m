Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CF17B
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 23:37:01 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-352e29ff8c2so40504487b3.21
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=YpSTzPP9K7OiRFT94U/UGwaYXo+HEY2arnI/B5+NJt8=;
        b=KaIbArM+NMp2EAHVIV0WhqJ8Tr0bZijrlBhWPsnD+lNQDoe8k4jCtWIafa/dyHrQNS
         hvqbu98jHHp+ZTG7bJnKBXYrUl1jN4p36XiZF6bA0oyTt+vdupMd2ahGzf2RCSDhnMxS
         +6ItYkPDOLQimpYiFsHJHsfZ4pC/jLDqnUyppFQn6s2DQD09UMdsrkwNZsN44kQ0+mRL
         0AI9H62oDTEhlnnYoK/aKarTxCJJbQkd2+ARObmWuw4voMQOuCw/kMWA4jJWum/IxdIj
         WbZopnAQCFtHZQuve4TVXQH3RQDnAS1/lwY4LjHzOGpvWyrSBWECTxIBppJ9xb5dUSGp
         fvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=YpSTzPP9K7OiRFT94U/UGwaYXo+HEY2arnI/B5+NJt8=;
        b=hB4irFpU89+4YORQn7Z1RnGi8ygRiaJ2fx7qaTvbTKU9+Q64Q44CkvQA8GWR3B7TR1
         yFD5S7alq7JJjxXBgLgoJ3mjiPQ8zxcPKhKQyDZ+gRiv2ZIIvnMdVe0ieP4PIt/r+JUM
         g41fm8elJ9uGm8ukl6/apglPDI9oVqU8xOJaIaV75gF7OQQCU0vQyuY8lEK7w9Zo00Yb
         97OcI5AuNKqmhJWunkJFguMgArDX9AKxiAuchDoaI17tLhVZL0RIN84/KG04EIt9VNPk
         58Yu9pPvsJ7n2NrHB38SsDKkoNld1yDUHx+La+rqrCmXTfT4b32+J36IctnF7YSCL70f
         KL3w==
X-Gm-Message-State: ACrzQf3HCLpaeXY/hebVj26y3cGBOh7Ob8vd3yknhkO9zF1qgylXCSWE
	fXiswgyN1XJxIeu/oqUEu8dM+yax/Z0=
X-Google-Smtp-Source: AMsMyM58F+KRL1GwkA3NWkr10geBrYEg9OPOQBgBASaf967GziXuMTLUR4nDnRcBVCoOwaQdUj65e33uDZI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:5945:0:b0:352:c163:d248 with SMTP id
 n66-20020a815945000000b00352c163d248mr420756ywb.399.1664408220622; Wed, 28
 Sep 2022 16:37:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Sep 2022 23:36:49 +0000
In-Reply-To: <20220928233652.783504-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220928233652.783504-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220928233652.783504-5-seanjc@google.com>
Subject: [PATCH v2 4/7] KVM: selftests: Hardcode VMCALL/VMMCALL opcodes in
 "fix hypercall" test
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

Hardcode the VMCALL/VMMCALL opcodes in dedicated arrays instead of
extracting the opcodes from inline asm, and patch in the "other" opcode
so as to preserve the original opcode, i.e. the opcode that the test
executes in the guest.

Preserving the original opcode (by not patching the source), will make
it easier to implement a check that KVM doesn't modify the opcode (the
test currently only verifies that a #UD occurred).

Use INT3 (0xcc) as the placeholder so that the guest will likely die a
horrible death if the test's patching goes awry.

As a bonus, patching from within the test dedups a decent chunk of code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86_64/fix_hypercall_test.c | 43 +++++++------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
index 6864eb0d5d14..cebc84b26352 100644
--- a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
+++ b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
@@ -25,27 +25,16 @@ static void guest_ud_handler(struct ex_regs *regs)
 	GUEST_DONE();
 }
 
-extern uint8_t svm_hypercall_insn[HYPERCALL_INSN_SIZE];
-static uint64_t svm_do_sched_yield(uint8_t apic_id)
-{
-	uint64_t ret;
-
-	asm volatile("svm_hypercall_insn:\n\t"
-		     "vmmcall\n\t"
-		     : "=a"(ret)
-		     : "a"((uint64_t)KVM_HC_SCHED_YIELD), "b"((uint64_t)apic_id)
-		     : "memory");
-
-	return ret;
-}
+static const uint8_t vmx_vmcall[HYPERCALL_INSN_SIZE]  = { 0x0f, 0x01, 0xc1 };
+static const uint8_t svm_vmmcall[HYPERCALL_INSN_SIZE] = { 0x0f, 0x01, 0xd9 };
 
-extern uint8_t vmx_hypercall_insn[HYPERCALL_INSN_SIZE];
-static uint64_t vmx_do_sched_yield(uint8_t apic_id)
+extern uint8_t hypercall_insn[HYPERCALL_INSN_SIZE];
+static uint64_t do_sched_yield(uint8_t apic_id)
 {
 	uint64_t ret;
 
-	asm volatile("vmx_hypercall_insn:\n\t"
-		     "vmcall\n\t"
+	asm volatile("hypercall_insn:\n\t"
+		     ".byte 0xcc,0xcc,0xcc\n\t"
 		     : "=a"(ret)
 		     : "a"((uint64_t)KVM_HC_SCHED_YIELD), "b"((uint64_t)apic_id)
 		     : "memory");
@@ -55,25 +44,25 @@ static uint64_t vmx_do_sched_yield(uint8_t apic_id)
 
 static void guest_main(void)
 {
-	uint8_t *native_hypercall_insn, *hypercall_insn;
-	uint8_t apic_id;
-
-	apic_id = GET_APIC_ID_FIELD(xapic_read_reg(APIC_ID));
+	const uint8_t *native_hypercall_insn;
+	const uint8_t *other_hypercall_insn;
 
 	if (is_intel_cpu()) {
-		native_hypercall_insn = vmx_hypercall_insn;
-		hypercall_insn = svm_hypercall_insn;
-		svm_do_sched_yield(apic_id);
+		native_hypercall_insn = vmx_vmcall;
+		other_hypercall_insn  = svm_vmmcall;
 	} else if (is_amd_cpu()) {
-		native_hypercall_insn = svm_hypercall_insn;
-		hypercall_insn = vmx_hypercall_insn;
-		vmx_do_sched_yield(apic_id);
+		native_hypercall_insn = svm_vmmcall;
+		other_hypercall_insn  = vmx_vmcall;
 	} else {
 		GUEST_ASSERT(0);
 		/* unreachable */
 		return;
 	}
 
+	memcpy(hypercall_insn, other_hypercall_insn, HYPERCALL_INSN_SIZE);
+
+	do_sched_yield(GET_APIC_ID_FIELD(xapic_read_reg(APIC_ID)));
+
 	/*
 	 * The hypercall didn't #UD (guest_ud_handler() signals "done" if a #UD
 	 * occurs).  Verify that a #UD is NOT expected and that KVM patched in
-- 
2.37.3.998.g577e59143f-goog

