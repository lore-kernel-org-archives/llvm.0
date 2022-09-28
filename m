Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AA55393
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 23:37:04 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id x23-20020a634857000000b0043c700f6441so8069709pgk.21
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=Od/67DGfgSZdEk0wltT/TSsm6XolwmXbW+lbYagDoWo=;
        b=XzIVUy26GrCltEvq+B8Fi+I95dgx07XyVD742iCpjVYeLCfh8Z68YuSLk+o4Y8n0yY
         WvywMCozmLkVsTKzeUc6yqeR3scqPyvBLIyyUoF8Rh3wvJryo5rD5mNXERMShAyWW5SX
         1cfGBK4W0TeAXEP7URjKTLvBNWvzIux3DnIbnE4Nkmvn/LzX+whLUL9tEYDp0KPWAOV/
         dS1NJh4PgI0jSr3g/xERgWcQi/QEkQxV0PAUoZaIaAAmXchWKzPDCaRLqTyZChBz/ARe
         IpZV6e0dTaG0nVmlENgoI+nMsMHzPHajf+jfKPLlnaLaf3jcW/fKf4W8e6JQv4oR19+q
         Vvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=Od/67DGfgSZdEk0wltT/TSsm6XolwmXbW+lbYagDoWo=;
        b=d5lnLqa/J/6HMH1OWRd1Hp0EUiqMRZwsZHQJuE1TGwIskT9jtK8zpZz+Uxk6jG6nVn
         nI13QdhJ6iqjcjLbaCALYblN7uea7+nQj9LtdW992e+cS3Z0BHqcny7093nSCtlWEj27
         Eji5LzEu5V0DiPvnDsOmXmELeYSkyUBWO/v+W23J8y+GqEdommuFayADtkpCm++/siV5
         OpGyW+nXUqEQ6D9uJUZ0VWl7YfGdW4kG1QSmT8JxLV1CVa9fGLi14JayLiHHdYmmwx+N
         eV2+JR/CBe/gTN33u5RwL3iGeYB4OBKEO1DVphzoO6J0ngeGDhwu3vNfXzIGSZ/EhmSb
         RWEg==
X-Gm-Message-State: ACrzQf1IYki0Cd15mHfTGL2PIakNdAuKQskTN7HQBeORNlfMqZdgBlR6
	TP+ho23WRWRFhaUvz3wKhFT5D36zSAg=
X-Google-Smtp-Source: AMsMyM5zJT1Nj1nzZ5R05TcpmNKxRck0zM4yF/L/JbUVM5GJqLR+hU0xD5VCJG+SWpF+AAqpJoQ8XUanJsg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:33c9:b0:200:a0ca:e6c8 with SMTP id
 lk9-20020a17090b33c900b00200a0cae6c8mr12941934pjb.147.1664408224370; Wed, 28
 Sep 2022 16:37:04 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Sep 2022 23:36:51 +0000
In-Reply-To: <20220928233652.783504-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220928233652.783504-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220928233652.783504-7-seanjc@google.com>
Subject: [PATCH v2 6/7] KVM: selftests: Dedup subtests of fix_hypercall_test
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

Combine fix_hypercall_test's two subtests into a common routine, the only
difference between the two is whether or not the quirk is disabled.
Passing a boolean is a little gross, but using an enum to make it super
obvious that the callers are enabling/disabling the quirk seems like
overkill.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 .../selftests/kvm/x86_64/fix_hypercall_test.c | 45 ++++++-------------
 1 file changed, 13 insertions(+), 32 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
index 10b9482fc4d7..32f7e09ef67c 100644
--- a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
+++ b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
@@ -17,7 +17,7 @@
 /* VMCALL and VMMCALL are both 3-byte opcodes. */
 #define HYPERCALL_INSN_SIZE	3
 
-static bool ud_expected;
+static bool quirk_disabled;
 
 static void guest_ud_handler(struct ex_regs *regs)
 {
@@ -70,7 +70,7 @@ static void guest_main(void)
 	 * enabled, verify that the hypercall succeeded and that KVM patched in
 	 * the "right" hypercall.
 	 */
-	if (ud_expected) {
+	if (quirk_disabled) {
 		GUEST_ASSERT(ret == (uint64_t)-EFAULT);
 		GUEST_ASSERT(!memcmp(other_hypercall_insn, hypercall_insn,
 			     HYPERCALL_INSN_SIZE));
@@ -83,13 +83,6 @@ static void guest_main(void)
 	GUEST_DONE();
 }
 
-static void setup_ud_vector(struct kvm_vcpu *vcpu)
-{
-	vm_init_descriptor_tables(vcpu->vm);
-	vcpu_init_descriptor_tables(vcpu);
-	vm_install_exception_handler(vcpu->vm, UD_VECTOR, guest_ud_handler);
-}
-
 static void enter_guest(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
@@ -110,35 +103,23 @@ static void enter_guest(struct kvm_vcpu *vcpu)
 	}
 }
 
-static void test_fix_hypercall(void)
+static void test_fix_hypercall(bool disable_quirk)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_main);
-	setup_ud_vector(vcpu);
 
-	ud_expected = false;
-	sync_global_to_guest(vm, ud_expected);
+	vm_init_descriptor_tables(vcpu->vm);
+	vcpu_init_descriptor_tables(vcpu);
+	vm_install_exception_handler(vcpu->vm, UD_VECTOR, guest_ud_handler);
 
-	virt_pg_map(vm, APIC_DEFAULT_GPA, APIC_DEFAULT_GPA);
+	if (disable_quirk)
+		vm_enable_cap(vm, KVM_CAP_DISABLE_QUIRKS2,
+			      KVM_X86_QUIRK_FIX_HYPERCALL_INSN);
 
-	enter_guest(vcpu);
-}
-
-static void test_fix_hypercall_disabled(void)
-{
-	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm;
-
-	vm = vm_create_with_one_vcpu(&vcpu, guest_main);
-	setup_ud_vector(vcpu);
-
-	vm_enable_cap(vm, KVM_CAP_DISABLE_QUIRKS2,
-		      KVM_X86_QUIRK_FIX_HYPERCALL_INSN);
-
-	ud_expected = true;
-	sync_global_to_guest(vm, ud_expected);
+	quirk_disabled = disable_quirk;
+	sync_global_to_guest(vm, quirk_disabled);
 
 	virt_pg_map(vm, APIC_DEFAULT_GPA, APIC_DEFAULT_GPA);
 
@@ -149,6 +130,6 @@ int main(void)
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_DISABLE_QUIRKS2) & KVM_X86_QUIRK_FIX_HYPERCALL_INSN);
 
-	test_fix_hypercall();
-	test_fix_hypercall_disabled();
+	test_fix_hypercall(false);
+	test_fix_hypercall(true);
 }
-- 
2.37.3.998.g577e59143f-goog

