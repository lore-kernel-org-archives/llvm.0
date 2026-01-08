Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287B03ED110;
	Thu,  8 Jan 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879403; cv=none; b=IW6syaxA71wPnK2q+2V7Nr0SyoEP/PdVa5hW3I4sXuuqAPNSpgKpc+s954pZ0TFPJdE2zNynGBLvQLRpkPKQX8Ss4naYnZvku5sbT2NWWHMSLTvOXpdsApDOZL8ZNmqIC4DSsh9WIQHouJGaSBWz+GqSgJO4GTjmKDnClUPuj/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879403; c=relaxed/simple;
	bh=O26X0sdvaAEhLqhxIo+DAUoci1J8MorgSZNU9eEiNek=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=uwg4uSK0hRI35Yqh5xg1xcdDWbu+9gfCWKGKNljehBSn1x1IlcZH8R10hEsKL1bmvB5d94AEoJBhNrm4UdbDtYVWaZkFscg8X7IsKUEp3l6gS/cNLAqIig2okknIa7ox2xOZEtC5k24bVZMiq2HjKtKFXyvhxiv4aBT4YWo1J8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VNyTqjC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VNyTqjC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A381C116C6;
	Thu,  8 Jan 2026 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767879402;
	bh=O26X0sdvaAEhLqhxIo+DAUoci1J8MorgSZNU9eEiNek=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=VNyTqjC0jF2kSmH1p8tDj5GZFPGRfWy7lc0maQ4bihbs1O8DFftIOQf7v0v5KOhig
	 BryrqCkte6S/7KOi6qdsZGHRRytr1LaRUf9ukzatiGrrNibunlXx/DIIV6ZmEwWHEC
	 jXEOOtPEjXdf5Y81QdIkhR7rwgWUu04tKKUREwxk=
Subject: Patch "KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning" has been added to the 6.1-stable tree
To: alexandru.elisei@arm.com,catalin.marinas@arm.com,cov@codeaurora.org,gregkh@linuxfoundation.org,joey.gouly@arm.com,justinstitt@google.com,kvmarm@lists.cs.columbia.edu,linux-arm-kernel@lists.infradead.org,llvm@lists.linux.dev,maz@kernel.org,nathan@kernel.org,oliver.upton@linux.dev,suzuki.poulose@arm.com,will@kernel.org,ynaffit@google.com,yuzenghui@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 14:36:37 +0100
In-Reply-To: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>
Message-ID: <2026010837-unwell-problem-70b2@gregkh>
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

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-sys_regs-disable-wuninitialized-const-pointer-warning.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From justinstitt@google.com  Thu Jan  8 14:27:57 2026
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 05 Dec 2025 14:51:41 -0800
Subject: KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,  Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,  Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,  Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org,  Justin Stitt <justinstitt@google.com>
Message-ID: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>

From: Justin Stitt <justinstitt@google.com>

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways -- it is
a false positive.

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration") which incidentally removed the aforementioned warning.
Since there is no upstream equivalent, this patch just needs to be
applied to 6.1.

Disable this warning for sys_regs.o instead of backporting the patches
from 6.2+ that modified this code area.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
Reviewed-by: Tiffany Yang <ynaffit@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kvm/Makefile |    3 +++
 1 file changed, 3 insertions(+)

--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -24,6 +24,9 @@ kvm-y += arm.o mmu.o mmio.o psci.o hyper
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 
+# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
+CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)
+
 always-y := hyp_constants.h hyp-constants.s
 
 define rule_gen_hyp_constants


Patches currently in stable-queue which might be from justinstitt@google.com are

queue-6.1/kvm-arm64-sys_regs-disable-wuninitialized-const-pointer-warning.patch
