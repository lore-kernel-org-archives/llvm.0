Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795235817;
	b=0Qu2OdyIdnrf5B/BkjU+KI/EQqG8QYEyF8lrYX22e7geVRNrm3/Yu1xetX1VQZ+8wf2k
	 pDWNnc5v+EHkvZF2CcNVH9lZkbW2jho5Rz4xZP6z2R/tDKh+u5dJi7vfxoZHl3xYtsqUA
	 ckikx5ADNwV991WbgYHgYY+ZOGt3M9lmXbwlkI98jJIeVuQWnSsKDuQwEkmPeiHNo9yhh
	 CTVtpf4X/O6RLHKEg0wAnmhLH1t6qkZePl+/awb/KDsn1z6Z48bmr7YIvyfFPahnSP+TI
	 jnvcBWDfEqItsFdcBVIpoS/mEYj/0afL/yDBpc2+YJ2m6gZSnZaRS4Y/Ioe3dfC0M4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o+H2NfKElOKBXC0JjKSFjht+d0+DsV9I8ZA3m1AWoIY=;
	b=MDPWyZWYPbOObvdbf8jP1ffmMLuizmjm2Akkej2sftd+b1yVLjJVM4kKWHUCUq1sGrV2
	 e55vSVPWkDHH32Ndzb8Q9X/UqNOZNZUyaqfpUpgX4di1vV+qvUN89MFF/LNaY+W82Uf1B
	 A6ZaDd87OaNO1scxsrTIUNzwhGhi1EXZHbUBTN2Il5TIzWWd6CKIgZyoRKu+O9WC26f6j
	 W+rY2Dm+mGbdM3WhhZ3e8Em+kL8HmQf/2RGKoefAtP54Nk+2VxguZEyN8IfesDxxlg6B+
	 PBmhIYILC9oVa/qF68IfamN7vm/pS/Uq6wTjYBSXY8GhcxxT04m879IjudE+VlzsT6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbH7jwUR;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDFD606A6B5
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 04:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDFD606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbH7jwUR
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so611416b3a.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 20:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795235805; x=1795840605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+H2NfKElOKBXC0JjKSFjht+d0+DsV9I8ZA3m1AWoIY=;
        b=bbH7jwURtpxLEW88Wuh+YGzg2y1sEboQrMAHtDxrjzPmgEBOz8REWdVk4b7loq8Vjx
         WTc8VYEjurjUPPZn06xApEBaLs9EdkOt0DSKgLxUrlpUBFlG0vSsuUVTMBeMuW3+HrBB
         95bdl/dyrJcTUhePchKgqjMOizQeqZ55basAyKxyx9jYz+8ym/x6Nawcx49mBzBu0DfW
         NAYyS+Cjiu/tMvUXhmxRREh2EOObzYfc0zYM6h3Bc1EtjlUPiqPFTRlCV3NaRHtJNp9C
         p4CabOQ8Qt++ex2/PguG4FB15ngGtudUWHjPlyJ5F0eb3hfzbvDErEBp4WxxK/B0FGGY
         W2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795235805; x=1795840605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+H2NfKElOKBXC0JjKSFjht+d0+DsV9I8ZA3m1AWoIY=;
        b=cVTm2BiV8xO2jrK1o56emWeOsjMJZugLUEmoxIH3AWVpzxi0QnSElnNnxxcrYuAU8U
         2CEzDS4fRbwwMyoWmAA3qFN9OQmLaGwduz+3wK3CzXK9hp5PHHXNu637yVvf3B4ejhTe
         JAo9LvWDynId6FbjlUf2B2VYlv1xc/L4w0jI5MC6Ksbdavp5BaznraYm4oLfz7cQPsei
         1vkcZnhvcPKQUdIhoyPU1juUtVTWBZhsGepEAF9G0PFw1QR1MOQT29B/qkkJ5F7xMNrG
         915nZ/uoPgJZF0/DW/u1fMyeKNDW1q5d0AncF45GCalKtX8Q3P9DfpqTEuSKVEgj8pFQ
         33Lg==
X-Forwarded-Encrypted: i=1; AL+hErHrF6T+dnfQ8Ed9y2MvAVMgzSU7YJbEZ4DdzVrThtFpShMH0aCs8vSRALKBUct36u3TXq5e@lists.linux.dev
X-Gm-Message-State: APuU4Z/MkgO42nbGc5rw0s97nbhRo1CvoYpb8RZ0CqU4FwwaQQFvQSqY
	U4wpFwq3KNaB6l0eKwLcrzRfr9Boj49iz1tWB3goz/UL+vW70BfZbyif
X-Gm-Gg: AZFdTZexdED3jwpAhX/pxiTecyPhhV9mYv8brM1n6zUJTNwO/KZa9a+s9wa0SxMEd9Z
	uJEx7Jl1PSBg20jFeKS0wvuH0b7VM5Iou5SksiK7GPU8CTuwLuUqks502MV2ttPwwOTZxpbLfQz
	RVgLqRPq/FyOkfiCN0owWJwd0/HD5pMz1kJP+0F0z8DEeTGYXjjE1dfkji7p6UcHkXViBOPPwhi
	UsG7I92r3bTtp23pzvtVt5Slf8rdK/XtJwHNFWRs+364fbczxEqs7MsyEPy0pV8KfsW88/YBimo
	excenHpZ+808cGg9KzryNlkw3wAxpRrh221hKWISLjGx/Z+N2NazNFwtNKa3Oz+Szz8I7LvdZpt
	o/iwxdjK1IrG/9K4kbMFidIEGb9f5abmXoWnWhuK1BLEzcZSPBFAD3f2HJ4YWRCUcMBeZ1MQEt/
	3TulO7FFcX3wuKWg4l7P5fw+4Sw9HbWBZ7sRfG+2GWEkoLLeaOcWEQB6AbUkDlkoTYzz+YAv9rW
	0aJqnAbv2hbcBj9Tz5Izl/HHhI6kNCx+PUJklq27IOhjVexV+2CidAUC9RWIRy6Cdkswjnj2vp4
	1TWBntEzhPmSx9hNSigvMmFwJ/01G6dB86b6FJ+uJVF/0j6wi2vJSyU=
X-Received: by 2002:a05:6a00:2d28:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8c87d80b5f6mr4598926b3a.59.1795235804614;
        Fri, 20 Nov 2026 20:36:44 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm2367221b3a.31.2026.11.20.20.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:36:43 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Brian Cain <bcain@kernel.org>
Cc: linux-hexagon@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH] hexagon: constant-extend head.S calls to out-of-file symbols
Date: Sat, 21 Nov 2026 12:36:36 +0800
Message-Id: <20261121043636.1296130-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brian Cain <brian.cain@oss.qualcomm.com>

Every call in head.S before this point targets a symbol defined
elsewhere: __vmnewmap and __vmsetvec in vm_ops.S, memset in lib/, and
start_kernel in init/main.c.  The distance to each is whatever the
linker happens to lay out, not something the assembler can bound at
compile time.

The ld.lld versions used during this port have had bugs in exactly this
area -- miscalculating a compact PC-relative call's relocation range,
and not always synthesizing a trampoline when a call genuinely didn't
reach -- so a call that link-checks fine today is not a guarantee it
still will after the next relayout or the next linker. Constant-extend
all five so the encoding carries the full address and neither of those
failure modes is reachable, independent of link layout or which lld is
in use.

Without this, allmodconfig does not link with LLVM 17 and 18, as
ld.lld before 19.1.5 checks R_HEX_B22_PCREL against 2 MiB instead of
8 MiB [1] and the first four calls span 2.14 to 2.15 MiB in v7.4-rc1
with LLVM 17.0.1:

  ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):
  (.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2242552
  is not in [-2097152, 2097151]; references '__vmnewmap'

Link: https://github.com/llvm/llvm-project/commit/64e3466fd09e [1]
Link: https://lore.kernel.org/all/20261119054908.2988120-1-shingekinocore@gmail.com/
Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
[tzuching: rebase onto hexagon-fixes, describe the allmodconfig failure]
Tested-by: Tzu-Ching Yang <shingekinocore@gmail.com>
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
Brian, as you agreed in your reply to my report, this is 09df35bd9d9f
from your hexagon-qemu-virt branch rebased onto hexagon-fixes
(0304683b4c43). The five changed lines are the same as yours; only the
context differs. I added the allmodconfig paragraph with the error
message and the two Link tags; please edit or drop them as you see
fit.

I did not add a stable tag; you may want to add one, as v7.3.4 fails
in the same way and v6.18.63 with LLVM 17.0.1 only. The patch applies
to both, and to v7.4-rc1 and next-20261113.

On each of these trees and on hexagon-fixes, the patch gives the
head.S I tested for the report linked in the changelog.

 arch/hexagon/kernel/head.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/hexagon/kernel/head.S b/arch/hexagon/kernel/head.S
index 908ffece9132..cdd14403491b 100644
--- a/arch/hexagon/kernel/head.S
+++ b/arch/hexagon/kernel/head.S
@@ -119,7 +119,7 @@ ENTRY(stext)
 	 * vm_ops.S
 	 */
 	r1 = #VM_TRANS_TYPE_TABLE
-	call	__vmnewmap;
+	call	##__vmnewmap;
 
 	/*  Jump into virtual address range.  */
 
@@ -155,12 +155,12 @@ __head_s_vaddr_target:
 
 	r0 = r24
 	r1 = #VM_TRANS_TYPE_TABLE
-	call __vmnewmap
+	call ##__vmnewmap
 
 	/*  Go ahead and install the trap0 return so angel calls work  */
 	r0.h = #hi(_K_provisional_vec)
 	r0.l = #lo(_K_provisional_vec)
-	call __vmsetvec
+	call ##__vmsetvec
 
 	/*
 	 * OK, at this point we should start to be much more careful,
@@ -195,7 +195,7 @@ __head_s_vaddr_target:
 	{ r0.H = #HI(__bss_start);           r2.h = #HI(__bss_stop); }
 
 	r2 = sub(r2,r0);
-	call memset;
+	call ##memset;
 
 	/*  Set PHYS_OFFSET; should be in R25 */
 #ifdef CONFIG_HEXAGON_PHYS_OFFSET
@@ -205,7 +205,7 @@ __head_s_vaddr_target:
 #endif
 
 	/* Time to make the doughnuts.   */
-	call start_kernel
+	call ##start_kernel
 
 	/*
 	 * Should not reach here.

base-commit: 0304683b4c43048082483e9445fdd0691d088431
-- 
2.34.1

