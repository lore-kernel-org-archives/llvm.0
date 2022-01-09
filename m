Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B832C9D
	for <llvm@lists.linux.dev>; Sun,  9 Jan 2022 13:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2769EC36AED;
	Sun,  9 Jan 2022 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641733669;
	bh=Q0NgM//5V1y957MIzzCyo9ZSojnXHk06TQdjHp9Ivrg=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=jwH2+XI4Rta8mJyZ4pScnAOTmzizKg4JXrcH3qxb1MweM/zYy0w3SJAuSpBAVGwSr
	 soIN5YJVxzkvUnfffamr4eeO6qHEacHy6dPa4Rj3TBvCz9o8yelQkJVsEjZqgYc1ry
	 za92xq8vFB8R/d/CkX5XS8h63ometHlzE8eoSOD8=
Subject: Patch "arm64: reduce el2_setup branching" has been added to the 4.9-stable tree
To: catalin.marinas@arm.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,llvm@lists.linux.dev,marc.zyngier@arm.com,mark.rutland@arm.com,maz@kernel.org,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org,will.deacon@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 09 Jan 2022 14:07:38 +0100
In-Reply-To: <20220107194335.3090066-4-nathan@kernel.org>
Message-ID: <1641733658226222@kroah.com>
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

    arm64: reduce el2_setup branching

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-reduce-el2_setup-branching.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Jan  9 01:56:51 PM CET 2022
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri,  7 Jan 2022 12:43:33 -0700
Subject: arm64: reduce el2_setup branching
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, llvm@lists.linux.dev
Message-ID: <20220107194335.3090066-4-nathan@kernel.org>

From: Mark Rutland <mark.rutland@arm.com>

commit 3ad47d055aa88d9f4189253f5b5c485f4c4626b2 upstream.

The early el2_setup code is a little convoluted, with two branches where
one would do. This makes the code more painful to read than is
necessary.

We can remove a branch and simplify the logic by moving the early return
in the booted-at-EL1 case earlier in the function. This separates it
from all the setup logic that only makes sense for EL2.

Acked-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kernel/head.S |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -489,13 +489,8 @@ ENTRY(el2_setup)
 	msr	SPsel, #1			// We want to use SP_EL{1,2}
 	mrs	x0, CurrentEL
 	cmp	x0, #CurrentEL_EL2
-	b.ne	1f
-	mrs	x0, sctlr_el2
-CPU_BE(	orr	x0, x0, #(1 << 25)	)	// Set the EE bit for EL2
-CPU_LE(	bic	x0, x0, #(1 << 25)	)	// Clear the EE bit for EL2
-	msr	sctlr_el2, x0
-	b	2f
-1:	mrs	x0, sctlr_el1
+	b.eq	1f
+	mrs	x0, sctlr_el1
 CPU_BE(	orr	x0, x0, #(3 << 24)	)	// Set the EE and E0E bits for EL1
 CPU_LE(	bic	x0, x0, #(3 << 24)	)	// Clear the EE and E0E bits for EL1
 	msr	sctlr_el1, x0
@@ -503,7 +498,11 @@ CPU_LE(	bic	x0, x0, #(3 << 24)	)	// Clea
 	isb
 	ret
 
-2:
+1:	mrs	x0, sctlr_el2
+CPU_BE(	orr	x0, x0, #(1 << 25)	)	// Set the EE bit for EL2
+CPU_LE(	bic	x0, x0, #(1 << 25)	)	// Clear the EE bit for EL2
+	msr	sctlr_el2, x0
+
 #ifdef CONFIG_ARM64_VHE
 	/*
 	 * Check for VHE being present. For the rest of the EL2 setup,


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-4.9/arm64-sysreg-move-to-use-definitions-for-all-the-sctlr-bits.patch
queue-4.9/bug-split-build_bug-stuff-out-into-linux-build_bug.h.patch
queue-4.9/arm64-move-vhe-work-to-end-of-el2_setup.patch
queue-4.9/arm64-remove-a-redundancy-in-sysreg.h.patch
queue-4.9/arm64-reduce-el2_setup-branching.patch
