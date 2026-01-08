Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BB615ECD7;
	Thu,  8 Jan 2026 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887932; cv=none; b=rR5ibHRK5lBJgVBWG8TADZPB8qDen1038CeaimuscdEEM5LpjDhrnJJnQoEV61lET8b9Sy+gxny3t56fXiCb8qUIxG0v3eVk+J9CLiFH4W5eGkbOqTRE51vgWxcaqwxdq/5DiTyvsTiq8ugD/CRheUAmHFF4N1QctA4UIFkdkpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887932; c=relaxed/simple;
	bh=59UGg20+a8O/utg7jkDZv98IzGuoXpfkweM7G+15fCY=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=MoUTz2+WuuMe4kozA1jihuVr/UItDycDxqxaK8SFDsKXhVBojLkEs2sS2Qv71oM5sWPpIC/Ru7DfuBVdAeVYaPD24VgcOYpj8CHuoT9sGqxqZau7tvPYpiHwSJffB2ERV54dBQNmjA9VJD6SFbPvMmiWL6Ao66iBfcS0WgO4fMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zngMsS34; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zngMsS34"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0C9C116C6;
	Thu,  8 Jan 2026 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767887932;
	bh=59UGg20+a8O/utg7jkDZv98IzGuoXpfkweM7G+15fCY=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=zngMsS34cLX0kYuzhDo4C7C9VTnmdi+kizMAUdNstjtHf8cRjkWHUXYpyB/6/63W3
	 FI2zRPcEDPntQn6AZ5tNt9N/0NudnPfGqIK0WGlt+9UAfsL/5e1P2Wz9+wEStv5JqC
	 ItVBGx0pEpEdRnhquO153j9eF4wkLjlw86+uKrg8=
Subject: Patch "KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning" has been added to the 5.10-stable tree
To: alexandru.elisei@arm.com,catalin.marinas@arm.com,cov@codeaurora.org,gregkh@linuxfoundation.org,joey.gouly@arm.com,justinstitt@google.com,kvmarm@lists.cs.columbia.edu,linux-arm-kernel@lists.infradead.org,llvm@lists.linux.dev,maz@kernel.org,nathan@kernel.org,oliver.upton@linux.dev,suzuki.poulose@arm.com,will@kernel.org,yuzenghui@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 16:57:53 +0100
In-Reply-To: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>
Message-ID: <2026010853-fineness-stopwatch-0bd4@gregkh>
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

    KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-sys_regs-disable-wuninitialized-const-pointer-warning.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From justinstitt@google.com  Thu Jan  8 16:52:32 2026
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 04 Dec 2025 12:44:48 -0800
Subject: KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,  Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,  Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,  Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org,  Justin Stitt <justinstitt@google.com>
Message-ID: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>

From: Justin Stitt <justinstitt@google.com>

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways -- it is
a false positive.

|  ../arch/arm64/kvm/sys_regs.c:2838:23: warning: variable 'clidr' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
|   2838 |         get_clidr_el1(NULL, &clidr); /* Ugly... */
|        |                              ^~~~~

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration"). Since there is no upstream equivalent, this patch just
needs to be applied to 5.15.

Disable this warning for sys_regs.o with an iron fist as it doesn't make
sense to waste maintainer's time or potentially break builds by
backporting large changelists from 6.2+.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kvm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 989bb5dad2c8..109cca425d3e 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -25,3 +25,6 @@ kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o
+
+# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
+CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)

---
base-commit: 8bb7eca972ad531c9b149c0a51ab43a417385813
change-id: 20250728-b4-stable-disable-uninit-ptr-warn-5-15-c0c9db3df206

Best regards,
--
Justin Stitt <justinstitt@google.com>



Patches currently in stable-queue which might be from justinstitt@google.com are

queue-5.10/kvm-arm64-sys_regs-disable-wuninitialized-const-pointer-warning.patch
