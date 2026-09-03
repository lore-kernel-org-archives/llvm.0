Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFC74DC53E
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451658; cv=none; b=DjMgRhZds2z/gwqOX3sVP2zWgPH5MmBzsPv8xwBg7RfHyJ0YrVpZ8oYnYAwsLtvYPYQRLkwoN7bpywjKfym5O3y8M//+IGypm1iXq+CiphZ/qoO8D//HEV42cNiFRbkA0AG31Oo88LV+qhnx4Lmz38XMKJobF2qwJk+PE2PreN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451658; c=relaxed/simple;
	bh=1KHlc1wHj45U9E/CloOnejb8Z/oRbJCgq5P42bIgUC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8UPeXKEIfQKxz4flzgN0w+NUrQnX9VyMrqQK1G/wO/zjGZM5PTH2M+ifN4JTuUznE8o0QOzDLchGCiT34cibEacqKwcd5bCnqCvPbqzfyJnSnFHk3kBYcVfqKsCd+I572uM8H0bsPORJMj67sVc4Etpth5sMjWtinbO3iZ1Rkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AdsRe8xt; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AdsRe8xt"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so41218e0c.0
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 09:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451655; x=1789056455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DQ17Gra4qRIZ9+bjeO8XFOZVaIoBgdk+Vd/GhAwUauw=;
        b=UnFjwwti2fsxCmZ30+/ZCjcH+ycZt6Y1A8QdP/mQXIeGCNdVvYeQprJ4mXk4pRar/n
         c64vcbwoWB4VBXU2Y0jBt09yn7m1V1+Dj5nkJhKjH8yBbAe36VRQPHk69Gvp6F/Wctt7
         LdfBdZi745GNv0A9E9GDkw/+7NQcRJ6WlaGzjCRbQezKXGb6CSUjJJOGOFGg8g9aTHRJ
         jX3T75yVacShJ8n2J1kdC8Bbip58iPYV0ZlfdGEEnZKfd0AJcwOH84KJWWgMIJY7DNps
         abQuxwzbOR7opD8YA6aHiUB1UWYc4FzviblUzENOLZi8w60y/XFBgcebbcYjnP/3D6ic
         gmuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0kxDc48Tlabmr6aVrNVHpLLUQPjjT7TFvUxXUn6eWS+ZTf3AFVCITmk0BAtVFqFxKMN/U@lists.linux.dev
X-Gm-Message-State: AFuF++kFEPLGQelu5jyKSwWKAYcZn8RM1PqoRiqtMQ6V9V/dc9VgKDOC
	cZuRMl9nbWCXTG4Uslzt5gQqWfN3zLWlyaeswIPSplO133d9jqBY4o2A70CMTy2fAWfaepfncEG
	NzhtiGUhO4ES42lWuKyjTObQ9RxbpBSyNN9hZjqLfIku8aVIKu8qdEHzibNYABPAKTDmWR1vSqq
	TddVkcXCKANJA44nfCvnPurnKaxWg3ygz8GIAcob18ZAxrWZkB77bz3ibDEPRIBAZOEodZqDLGx
	USJJA==
X-Gm-Gg: AYBFou0jPCYSMU8zfEfPHcFQGKbY4BM8vLhwtODAQcD8AAvrjiT8XXBbemD7NYEjoz8
	QT5ZEzbtkW4LRl+Wu0l7EGskmwi+qWGZJRAuCSrB6L9A/QqL1I36/IeH63nNzw+4AyOD/DpfPQE
	FR9uLSoPdUfX0AsijKybylA4TX8b9W5UI6zXr5fTeDw7EaNgOe1W05hXDE+XZzmmkBgLP6Ii2fk
	Mrd42Iu0IobxfAm4g7dxTez+4kDCeSfSJ5T7p+7HtRsGBwBMd+Qprh5Mxe6kvXQy8HJ/UdZfg6z
	zSq1DvRgrqi0tUN6yGB5rCktZrvs2/kaQbBLzg0S710xYfhisn9MYELNzEBPrKq2vH1Kzsl80GG
	+1a8TKICEnLR0dyyRTn4KIM1BIdcrEQTdSCFB2hB7k57CkUvug0vjXJbPx4vjwgiFfFezGaYB7L
	bx+EctMw751A7vc+Y0UevZiLM1DBsvcA/v
X-Received: by 2002:a05:6122:3113:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c7d279060dmr5928285e0c.3.1788451654541;
        Thu, 03 Sep 2026 09:07:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ec386e92sm24123e0c.8.2026.09.03.09.07.34
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 09:07:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3106450a91.2
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 09:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788451653; x=1789056453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQ17Gra4qRIZ9+bjeO8XFOZVaIoBgdk+Vd/GhAwUauw=;
        b=AdsRe8xtuQeA4Ot5Xxzyp2x066Ch/2l6Dd3WXpEj4ktJqhF/hoSjmAAuaU7Hn2lBJo
         ktCvwua6zCbkrQng1PkvgpiaTKCRUwonWFZSILIIhiqDeAPmyfmTCbVDiRFIb14/OSjk
         gonNlkOExtfbVKDof2x0TEkHfYS5e2M7mFQsg=
X-Forwarded-Encrypted: i=1; AKwUvByynehxlrk0/1MQwD0hTGBWUebMrKi/0M/4UGOD7IQLgCxhRm7MPtKDFT/OxfR3ypvrwYtT@lists.linux.dev
X-Received: by 2002:a17:90b:35d0:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39aee10890cmr21433016a91.18.1788451653210;
        Thu, 03 Sep 2026 09:07:33 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39aee10890cmr21432860a91.18.1788451652514;
        Thu, 03 Sep 2026 09:07:32 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e7167sm6172054a91.5.2026.09.03.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:07:31 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1] x86/vmware: Fix i386 high-bandwidth hypercall arguments
Date: Thu,  3 Sep 2026 12:07:20 -0400
Message-ID: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The high-bandwidth hypercall helpers push %ebp before loading the in6
operand into it. On i386 without frame pointers, both GCC and Clang can
address the memory-constrained operand relative to %esp. The push then
moves the stack and the helpers load the wrong value.

Typical i386 configurations use the frame-pointer unwinder and happen to
address the operand through %ebp. However, UNWINDER_GUESS is available
with EXPERT and permits the affected frame-pointer-disabled configuration.
vmwgfx is also available on i386 and calls both helpers.

Stage in6 through %eax before changing either stack register, then save
%ebp and copy the staged value into it. Load the VMware magic immediately
before the string I/O instruction. Mark %eax early-clobber so it cannot
also provide in6 or an address register for it. Use the same sequence on
x86-64, where the full-width register preserves in6.

Fixes: 34bf25e820ae ("x86/vmware: Introduce VMware hypercall API")
Cc: stable@vger.kernel.org # 6.11+
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---

Notes:
    Built on v7.3-rc1 with W=1 on i386 using GCC and Clang, with frame
    pointers enabled and disabled. Disassembly in all four cases loads in6
    before changing %ebp or %esp.

 arch/x86/include/asm/vmware.h | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 4220dae14a2d..fb011cef01e7 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -276,20 +276,22 @@ unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
 
 	asm_inline volatile (
 		UNWIND_HINT_SAVE
+		"mov %[in6], %%" _ASM_AX "\n\t"
 		"push %%" _ASM_BP "\n\t"
 		UNWIND_HINT_UNDEFINED
-		"mov %[in6], %%" _ASM_BP "\n\t"
+		"mov %%" _ASM_AX ", %%" _ASM_BP "\n\t"
+		"mov %[magic], %%eax\n\t"
 		"rep outsb\n\t"
 		"pop %%" _ASM_BP "\n\t"
 		UNWIND_HINT_RESTORE
-		: "=a" (out0), "=b" (*out1)
-		: "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (cmd),
+		: "=&a" (out0), "=b" (*out1)
+		: "b" (cmd),
 		  "c" (in2),
 		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
 		  "S" (in4),
 		  "D" (in5),
-		  [in6] VMW_BP_CONSTRAINT (in6)
+		  [in6] VMW_BP_CONSTRAINT(in6),
+		  [magic] "i" (VMWARE_HYPERVISOR_MAGIC)
 		: "cc", "memory");
 	return out0;
 }
@@ -304,20 +306,22 @@ unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
 
 	asm_inline volatile (
 		UNWIND_HINT_SAVE
+		"mov %[in6], %%" _ASM_AX "\n\t"
 		"push %%" _ASM_BP "\n\t"
 		UNWIND_HINT_UNDEFINED
-		"mov %[in6], %%" _ASM_BP "\n\t"
+		"mov %%" _ASM_AX ", %%" _ASM_BP "\n\t"
+		"mov %[magic], %%eax\n\t"
 		"rep insb\n\t"
 		"pop %%" _ASM_BP "\n\t"
 		UNWIND_HINT_RESTORE
-		: "=a" (out0), "=b" (*out1)
-		: "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (cmd),
+		: "=&a" (out0), "=b" (*out1)
+		: "b" (cmd),
 		  "c" (in2),
 		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
 		  "S" (in4),
 		  "D" (in5),
-		  [in6] VMW_BP_CONSTRAINT (in6)
+		  [in6] VMW_BP_CONSTRAINT(in6),
+		  [magic] "i" (VMWARE_HYPERVISOR_MAGIC)
 		: "cc", "memory");
 	return out0;
 }

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

