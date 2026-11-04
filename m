Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793761317;
	b=10Hkk6iha3wAJtQlp58sfJbT11DONbPYSJIwOATRoKjsaOK+jXlwPoG0opfk97iqAcVW
	 kmyqSjoYi9EJlxKDynZOa/DL8UQib3fgVdHjmjBKoVM8xz0enEzcDYbE57+D/iqAHrOoL
	 smLECd11646Gub7IPKafnJ8RTXsnd9LqOGFXeb2TTl3dRqb8ID1+mXdrxjWV+kapM5AeS
	 gy5HkmftFvdJ7LhFC0QFF0wqLG734LsiDQC+O8y7NiBPp4AmtPDit9lhTQEMc+2bUNd1r
	 B/7IXzD7/Y3j9oGOan7qgGQSrNmjZ2qkIJb2UBO2g52CyOtyt5YaYXafbH87RvTHSjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793761317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YlterDeN6T+DiNtjdG/tEDnVKD1WZhlw9rJO8gzsf8k=;
	b=l/WGaAQ986XGoaDzTt0sb/S63RwWWLOhgdhB6BVo+MZVwNubWnkMXgYaWaAq+pW/QtNd
	 nq2QM2BSNHcS3YKNg77nu5Ok9L5bciDxVV45v4/JfLN0dw8Wf6wLlym2cCBEEsH8+NRFB
	 89fmibm3dEzRcTBsl8noNxg/0tm9F+rlcGI0n1kUhJL3u5+IBwiio6yQkpGmCwhxW4P1t
	 fqhbZW5k7AOGuV2cPQCdR7hGmR/du9hrEoEbvFKFNka+CjwDz62iLBOVV9IhAyOTr/jTA
	 jxeEldvl2JtK/a62frRanMczNB4Aw6Q1hCGtgnltyQNB3I68fR+YOlXLxRKk4N1npeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BUX8i+Jr;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189AC606A326
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 03:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189AC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BUX8i+Jr
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so322447eec.0
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 19:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793761315; x=1794366115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YlterDeN6T+DiNtjdG/tEDnVKD1WZhlw9rJO8gzsf8k=;
        b=BUX8i+JrM9A/f4iWmuvBrQtVA+hC0gTU14SlMa6/1P78nY1rh+Fkd+rU4a2u3D6xqz
         tcgV+k/Og1/kBr1DLoxu4WH1y0Ivybu+DuObvWgtU9qjVssj/ERmjEEl929b62jkoKmV
         m+xcTiS15fECJhbwqS/sW4jWjk+sr+VljSvObCkzrwYmk/y7fA4VWpO4dGf9AQRfpXRf
         CbOoSYRPVzLyt+yZAmf7Y+bRiOt/4IY9oJe0vdQ/Gt5lPpcweSWgDwH9M5cTa+9KyZqv
         oGEuQqU77a2ZpZ/stcXXiqC8T0ArALX2liGVjUuBReiXZtK/OsKvFGtHqjS/f1qYf6rk
         7MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793761315; x=1794366115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlterDeN6T+DiNtjdG/tEDnVKD1WZhlw9rJO8gzsf8k=;
        b=2Qyi8pok7WL5IdLET4iDZJrtLiFab5otLnsRRcCIWABr9gciNdG0HNjEx0X8oV6ah2
         LCVgMi6ULcfpKzG4Ehr3vr7SsCQXQoAVGC5ORTvOw9NAkvvRAJFI+J7Xre1ScXm+zceD
         ieVD9iltv2WHKWlUWpiKVwlrwzDfnDAIDQ9VMCniZhzGzSPn2XkIqzAbiSj2KpZlTTrR
         bPeuVEBjbF83t8Mz+hgYbnYEXway7RLPYZTSyDqfdUnxQfmC8TMs57nDujQ3UTuw6eBw
         ae3gXlqHeU/fulc7MaaG7uu9TW2p9SwNSp/vjo0BZB30fd1y/9Y1IIo8RB7fOzGnKQUl
         qCEw==
X-Forwarded-Encrypted: i=1; AKwUvByu4ZkSIXN10aZ/Bm0a4jr2vcZaarA7Iuh4VuFYrKHG8jyYvJ1j7Go6dEpJ5wyAWmccUJCH@lists.linux.dev
X-Gm-Message-State: APuU4Z+/dVKyQvOcvorn31F7E8Gm7jKIi57vaDH3kPrPW/x5pRWAkivq
	scMopMrsflhfO0h4V7JBgCuzcXh8wkiXZT38yKRYHb4ybaR8azcJUhdL
X-Gm-Gg: AYBFou1bmWcZiGv3KSdepSgUtvjJzu1pWaAiXOUj/aWuzx0NxrD0cvuL1NwKipoqPyv
	G12oiXQ7VAwwWK0CiA1eF6h/hYZc0UQ28ij0RfsFkY6FsOEQro8x8iSQ9Dbai9L/x22P1ZNZMQV
	9kLBP/HipLGgkVZziIJfC2qjrAOq4BHLqnhdF3B8Bz+ezlVEUdWf4Hu3XjVOzBWWI6tMXyPzVyE
	6BwaTHiQWIIt+QLjP/rR0sDbMXSaMOGAlZLbuYy+7tSmAyjeaBl0cHDNJXxNW52xpn4ZAQOJOJj
	WvkPHJ+yXswPLgOxl3/rGrsfogriwNisbx2tZ/d5hBdLKqx3FgCpCYlWlQSaz3f84e0KiwrywuP
	eliLh6crZclgQKpPWodiwQj3K8CY/LT1VRxx9kd8mIFSqVIoMFAJSZpeZroeFkihBoKHNYuXaj+
	xQ7Sv9H4rjFyGaBYjCFYLlFPnP1AoMZSlfWdodCVPv6DF1zwTLrhqzUk0+c6fOR3nJtgf2cMpEG
	X+6Q7BEOgwRUzA4yHDvWowfcR2kt9kyosVRdI3RDCxcuPWVeTUOhc7pFOTGpjQ3P7JvWrR7VhfX
	FAcMJglzVYTJ2G2wud86baUrDlGbh5v3I2CdOBcrgo9ZbdLKXU6ntaA=
X-Received: by 2002:a05:7300:8813:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-36c49a78c8cmr4600001eec.37.1793761314951;
        Tue, 03 Nov 2026 19:01:54 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca392abe4sm2951819eec.19.2026.11.03.19.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:01:54 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-mips@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] MIPS: Fix genex.S build with LLVM before 21
Date: Wed,  4 Nov 2026 11:01:47 +0800
Message-Id: <20261104030147.3117325-1-shingekinocore@gmail.com>
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

Since commit 56651128e2fb ("MIPS: Fix idle VS timer enqueue"),
BUILD_SKIPOVER_PROLOGUE uses label differences as the immediates of ORI
and PTR_ADDIU. The LLVM integrated assembler accepts such an immediate
only from LLVM 21 on, so LLVM=1 builds of every MIPS configuration fail
with LLVM 17 to 20 unless LLVM_IAS=0 is set:

  <instantiation>:7:11: error: expected an immediate
   ori $26, r4k_wait_idle_size - 2
            ^
  <instantiation>:10:14: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
               ^

Wrap both expressions in %lo(). For that operator, LLVM 17 to 20
emit a LO16 fixup instead of rejecting the operand, and resolve it when
writing the object, since both expressions are constants by then; no
relocation is left. Both values are between 2 and 30, so %lo() does
not change them. GNU as and LLVM 21 to 23 emit the same code as
before, except on microMIPS, where GNU as now uses the 32-bit ADDIU in
the delay slot instead of the 16-bit one. With GCC, the 2 extra bytes
replace the 16-bit NOP that padded the end of the prologue, so all
symbols keep their addresses; with Clang and LLVM_IAS=0, except_vec_vi
and the code after it, up to nmi_handler, move by 4 bytes.

Fixes: 56651128e2fb ("MIPS: Fix idle VS timer enqueue")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505071331.Z0N2eSkr-lkp@intel.com/
Link: https://github.com/llvm/llvm-project/commit/b65e0947cade9bd39036a7700b54c1df4ec00756
Cc: stable@vger.kernel.org # 6.18.x: 2b6d718c8dbe: MIPS: Fix whitespace damage in r4k_wait from VS timer fix
Cc: stable@vger.kernel.org # 6.18.x
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
No MIPS hardware here. Against mips-fixes (v7.4-rc1). All builds use
W=1 and kernel.org toolchains.

- genex.o, before and after, with GCC 8.1 to 16.2 and with LLVM 17 to
  23, both with the integrated assembler and with LLVM_IAS=0. Configs:
  64r6el, 32r6el, 64r2el, 32r2el, eyeq5, eyeq6, malta (little and big
  endian, MIPS32r1, microMIPS little and big endian), ip22, ip27,
  loongson3 and cavium_octeon.
  - The objects are byte-identical before and after with GCC, with
    LLVM_IAS=0 and with LLVM 21 to 23. The only exception is the
    microMIPS ADDIU above. The 4-byte move with LLVM_IAS=0 is harmless:
    set_vi_handler() computes the offsets and the length of the vectored
    handler from symbols before copying it, and ejtag_debug_handler and
    nmi_handler are only referenced through their symbols.
  - LLVM 17 to 20 now assemble genex.o for all of these configs except
    microMIPS and Octeon, which the integrated assembler rejects for
    other reasons. For malta (little and big endian, MIPS32r1), ip22
    and ip27, these objects are byte-identical to the LLVM 21 genex.o.
- vmlinux of 64r2el, 32r2el and malta, built with GCC 8.1 and 16.2,
  LLVM 17, 20, 21 and 23, and LLVM 17 with LLVM_IAS=0. Where both sides
  build, vmlinux is byte-identical before and after. With LLVM 17 and
  20, genex.o was the only object that failed before, and vmlinux links
  after. No new warnings.
- The malta kernels built with GCC 8.1 and 16.2, LLVM 17, 20 and 23, and
  LLVM 17 with LLVM_IAS=0 boot under QEMU 6.2 -cpu 24Kf. That CPU uses
  r4k_wait(), so interrupts go through skipover_handle_int. Each kernel
  boots to an init that keeps the CPU going in and out of idle and then
  reboots; a QEMU trace shows every interrupt that lands in the idle
  region resuming at r4k_wait_exit. A microMIPS kernel does not boot
  under QEMU -cpu M14Kc with or without this patch, so the microMIPS
  change was not run.

In the 2025 thread [2], Nathan suggested requiring LLVM 21 for MIPS in
min-tool-version.sh, and Maciej an #error for older Clang. Both would
also stop LLVM 17 to 20 builds with LLVM_IAS=0, which work today, and
the stable trees would need the same change before 56651128e2fb could
go back to them.

On 6.18.y, which also allows LLVM 15 and 16, the patch applies after
2b6d718c8dbe, and LLVM 15 and 16 fail and are fixed the same way.

The 56651128e2fb backport was dropped from the 6.14, 6.12 and 6.6
stable queues because of this build failure [1], so 6.12.y and 6.6.y
still lack that fix.

[1] https://lore.kernel.org/r/2025051415-unloader-likely-b0e6@gregkh/
[2] https://lore.kernel.org/r/20250521224450.GA2412476@ax162/

 arch/mips/kernel/genex.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index be1b049d856f..ef27965f6ad9 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -146,10 +146,10 @@ r4k_wait_exit:
 	MFC0	k0, CP0_EPC
 	/* Subtract/add 2 to let the ISA bit propagate through the mask.  */
 	PTR_LA	k1, r4k_wait_insn - 2
-	ori	k0, r4k_wait_idle_size - 2
+	ori	k0, %lo(r4k_wait_idle_size - 2)	/* %lo() for LLVM < 21 */
 	.set	noreorder
 	bne	k0, k1, \handler
-	 PTR_ADDIU	k0, r4k_wait_exit - r4k_wait_insn + 2
+	 PTR_ADDIU	k0, %lo(r4k_wait_exit - r4k_wait_insn + 2) /* ditto */
 	.set	reorder
 	MTC0	k0, CP0_EPC
 	.set pop

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

