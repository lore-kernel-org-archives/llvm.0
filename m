Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4212C9D
	for <llvm@lists.linux.dev>; Sun,  9 Jan 2022 13:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5B7C36AEB;
	Sun,  9 Jan 2022 13:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641733675;
	bh=ZoTJvf9ARa9nQN1GSgyIQuGCwQNp5wnVgzlhIeLdEq8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=feg7sTH09tn24tx+RklgBmm0R3H45OONpfJGJqZsrMFwc4+U0wfv4xLKkssG21K/5
	 vaaY6f6S0JrpNuC+E578IQ7awRxlWEY9YuBypkAWkLEMbpGPN2F1cLCTO57m4+tudk
	 oY8/bPhSSoiS618Nh7fhmSDjEvfYktNgLH4Uh8iE=
Subject: Patch "arm64: Remove a redundancy in sysreg.h" has been added to the 4.9-stable tree
To: catalin.marinas@arm.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,llvm@lists.linux.dev,marc.zyngier@arm.com,mark.rutland@arm.com,maz@kernel.org,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org,stefan@hello-penguin.com,will.deacon@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 09 Jan 2022 14:07:39 +0100
In-Reply-To: <20220107194335.3090066-3-nathan@kernel.org>
Message-ID: <164173365975245@kroah.com>
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

    arm64: Remove a redundancy in sysreg.h

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-remove-a-redundancy-in-sysreg.h.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Jan  9 01:56:51 PM CET 2022
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri,  7 Jan 2022 12:43:32 -0700
Subject: arm64: Remove a redundancy in sysreg.h
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, llvm@lists.linux.dev
Message-ID: <20220107194335.3090066-3-nathan@kernel.org>

From: Stefan Traby <stefan@hello-penguin.com>

commit d38338e396ee0571b3502962fd2fbaec4d2d9a8f upstream.

This is really trivial; there is a dup (1 << 16) in the code

Acked-by: Will Deacon <will.deacon@arm.com>
Signed-off-by: Stefan Traby <stefan@hello-penguin.com>
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/include/asm/sysreg.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -95,8 +95,8 @@
 #define SCTLR_ELx_M	1
 
 #define SCTLR_EL2_RES1	((1 << 4)  | (1 << 5)  | (1 << 11) | (1 << 16) | \
-			 (1 << 16) | (1 << 18) | (1 << 22) | (1 << 23) | \
-			 (1 << 28) | (1 << 29))
+			 (1 << 18) | (1 << 22) | (1 << 23) | (1 << 28) | \
+			 (1 << 29))
 
 #define SCTLR_ELx_FLAGS	(SCTLR_ELx_M | SCTLR_ELx_A | SCTLR_ELx_C | \
 			 SCTLR_ELx_SA | SCTLR_ELx_I)


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-4.9/arm64-sysreg-move-to-use-definitions-for-all-the-sctlr-bits.patch
queue-4.9/bug-split-build_bug-stuff-out-into-linux-build_bug.h.patch
queue-4.9/arm64-move-vhe-work-to-end-of-el2_setup.patch
queue-4.9/arm64-remove-a-redundancy-in-sysreg.h.patch
queue-4.9/arm64-reduce-el2_setup-branching.patch
