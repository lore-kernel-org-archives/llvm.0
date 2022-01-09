Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A25C2C9D
	for <llvm@lists.linux.dev>; Sun,  9 Jan 2022 13:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7398C36AEB;
	Sun,  9 Jan 2022 13:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641733661;
	bh=Mp1UIDE+AHNBJcUVhc8wQHDdUlejQjJxr5jRVWoSUNc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=k6N4AP4bqYhdIQEXI7zEhZjsaKbY8Azou9HLYqeBGdXCAccYv+t7WPMjUM2feBQw9
	 JuFpH5GgTfXKRkD75pzjelelGu6jsuXUStUtQOEtEAhthN3XLZftSTccgtz0oaG3C0
	 VeTvIssbnDuQiKGnPWYeu71GLl3UYfDiFwdXdBgk=
Subject: Patch "arm64: move !VHE work to end of el2_setup" has been added to the 4.9-stable tree
To: catalin.marinas@arm.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,llvm@lists.linux.dev,marc.zyngier@arm.com,mark.rutland@arm.com,maz@kernel.org,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org,will.deacon@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 09 Jan 2022 14:07:38 +0100
In-Reply-To: <20220107194335.3090066-5-nathan@kernel.org>
Message-ID: <1641733658197117@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    arm64: move !VHE work to end of el2_setup

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-move-vhe-work-to-end-of-el2_setup.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Jan  9 01:56:51 PM CET 2022
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri,  7 Jan 2022 12:43:34 -0700
Subject: arm64: move !VHE work to end of el2_setup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, llvm@lists.linux.dev
Message-ID: <20220107194335.3090066-5-nathan@kernel.org>

From: Mark Rutland <mark.rutland@arm.com>

commit d61c97a7773d0848b4bf5c4697855c7ce117362c upstream.

We only need to initialise sctlr_el1 if we're installing an EL2 stub, so
we may as well defer this until we're doing so. Similarly, we can defer
intialising CPTR_EL2 until then, as we do not access any trapped
functionality as part of el2_setup.

This patch modified el2_setup accordingly, allowing us to remove a
branch and simplify the code flow.

Acked-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kernel/head.S |   37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -553,26 +553,6 @@ set_hcr:
 	msr	vpidr_el2, x0
 	msr	vmpidr_el2, x1
 
-	/*
-	 * When VHE is not in use, early init of EL2 and EL1 needs to be
-	 * done here.
-	 * When VHE _is_ in use, EL1 will not be used in the host and
-	 * requires no configuration, and all non-hyp-specific EL2 setup
-	 * will be done via the _EL1 system register aliases in __cpu_setup.
-	 */
-	cbnz	x2, 1f
-
-	/* sctlr_el1 */
-	mov	x0, #0x0800			// Set/clear RES{1,0} bits
-CPU_BE(	movk	x0, #0x33d0, lsl #16	)	// Set EE and E0E on BE systems
-CPU_LE(	movk	x0, #0x30d0, lsl #16	)	// Clear EE and E0E on LE systems
-	msr	sctlr_el1, x0
-
-	/* Coprocessor traps. */
-	mov	x0, #0x33ff
-	msr	cptr_el2, x0			// Disable copro. traps to EL2
-1:
-
 #ifdef CONFIG_COMPAT
 	msr	hstr_el2, xzr			// Disable CP15 traps to EL2
 #endif
@@ -598,6 +578,23 @@ CPU_LE(	movk	x0, #0x30d0, lsl #16	)	// C
 	ret
 
 install_el2_stub:
+	/*
+	 * When VHE is not in use, early init of EL2 and EL1 needs to be
+	 * done here.
+	 * When VHE _is_ in use, EL1 will not be used in the host and
+	 * requires no configuration, and all non-hyp-specific EL2 setup
+	 * will be done via the _EL1 system register aliases in __cpu_setup.
+	 */
+	/* sctlr_el1 */
+	mov	x0, #0x0800			// Set/clear RES{1,0} bits
+CPU_BE(	movk	x0, #0x33d0, lsl #16	)	// Set EE and E0E on BE systems
+CPU_LE(	movk	x0, #0x30d0, lsl #16	)	// Clear EE and E0E on LE systems
+	msr	sctlr_el1, x0
+
+	/* Coprocessor traps. */
+	mov	x0, #0x33ff
+	msr	cptr_el2, x0			// Disable copro. traps to EL2
+
 	/* Hypervisor stub */
 	adrp	x0, __hyp_stub_vectors
 	add	x0, x0, #:lo12:__hyp_stub_vectors


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-4.9/arm64-sysreg-move-to-use-definitions-for-all-the-sctlr-bits.patch
queue-4.9/bug-split-build_bug-stuff-out-into-linux-build_bug.h.patch
queue-4.9/arm64-move-vhe-work-to-end-of-el2_setup.patch
queue-4.9/arm64-remove-a-redundancy-in-sysreg.h.patch
queue-4.9/arm64-reduce-el2_setup-branching.patch
