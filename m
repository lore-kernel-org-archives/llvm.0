Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587376;
	b=hCfL3hbI2VZEYBOzj2Ng4v/xxS7tbYmwFS7G+K2JmG9DlNq9K02BFXYH/o3IoyUSvOKm
	 PjRHz0AREkUe13tVJCgHNoF5cO0UygiP8xYEL3HJe5Y13lf5jsU2w9hZWGtKl1C3nyReg
	 LBp1jJK4A31wwlq5ANXjhzwtaRW/NzuHt5K9u8c2RXJb0kSAThtOkfHn6m4y0l3w4c2Yh
	 rS0wnf0vVZvOTFCKkEkakvJf9GKX8dRlJY/5H9uavpFQg28Qtqg1mq5krruuubayg69oU
	 +tpjATwyQOa+o/gxX3QQieX1s12yVkRwL2eMRMk7r7/l7ilsNs7GdFRIfKlkD8Cf/Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
	b=fng0PR4kgwwD1TOBFR2dr5bP5FQNz9r9bJ3MLdWhWorHZR2a0o6+ms2PbaFPE2lfQ7cO
	 /x9LbbdTxtpv+PSjrs3Ll92FHLgnbkxkdO4a0fTZMKHN5BRtCILpWBUIfzBYTbLYWxDl/
	 ohtbzsmKYw0afOcquff1PUuS2bYv9gsHdMuz9rD7EdrAcWV1ZTbq2cpi531T1gByEB3lq
	 4e+zYU4EoRCqMBvRDECSLq2ORXvATA7uRLVVQLiVRv0AtzCJ2fyzHoDeNblwe9X+4SDMz
	 koaQsrsUafERtDgy9B12YahnCJgGCk9vQaqGRvFMMrIX+MmnmR8BQOleNieruPjGPBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=moqQdJUI;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FB4607024B
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 06:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30FB4607024B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=moqQdJUI
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b45597c7so409827c88.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 22:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587375; x=1796192175; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
        b=moqQdJUIReRNbA8CMjwP+P3b5n2gAx+4dRqAgVKQaD1ogQYe5swNCmo7067GO4JdO3
         it+X0W3BB+kHdQ87qZjKHYF4TzP4z3o3HAyWgLXokTANU5O9w/ytT8IBnV26+rdPn7ts
         DLecpi1dH1+0TK22sSDOetFLKLsUTcJ0hwEfgymc4Dx5qeDqdddDcYKh9FlsI89NoNJv
         ijmA9yB+Qo8DK0v7/wozHpqvW4cOHrx13Vj5PrxEOHVTS25AdH31/svlh1KFh1hL3GNf
         oW3MXiAyJv1pO/54hTxD88YIWIpi3CjZiFC2rkQxlVogpP9eJMmexT4Hurad5t6Bh8iO
         IBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587375; x=1796192175;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
        b=PrisWDehiJuSfR5KucPcmCILDQd7WzFSL8ZplGIIzV5/ZzW2/s5eu0Hz7dqVi/hnJ5
         nlfRid49QzDTmqZX8jupL24dAMln0LLLRSZqVaRbc7ImDAOgIcA5zmlPw3e+Zk79TAmU
         MWyBJ6O3ZI1c6B5WEAbBYlRBqpL7btOfERfqJY7rM/kXMAd0B7Kaz0PMvJnb+gjp8LxO
         dkMYPqYpwPCGbVOwkl78EONtRD2KxymEQX6WebVZM5v2a1mt4lSzUnuGetRukBR34fJ7
         9N94WY4kObOrqC6TuULRKqLa/S9A+7JPuhmZRxYN6CTaFsoZJeJ7DlzdgdzdC/8kn39v
         KSrA==
X-Forwarded-Encrypted: i=1; AL+hErHu2rAekDveihnmH++9HsKuJywXhUCkcKaCJ+HqN9iaw9cvFkNGISOcROdFtkj9qJ7ZBX6z@lists.linux.dev
X-Gm-Message-State: APuU4Z/hjGzwnIhQ0+9RTKggr59d8tZLdsZRZMN3IsPnLVieGM5zXlbZ
	oIpAEqcGECamxwtzwReCwI/7NeZTWf3S0GMcY0jwDdDSbUtNcLA+0ASYbglfp9uFjyKrqRisV+H
	/PH2fU1uWNg==
X-Received: from dloo27-n2.prod.google.com ([2002:a05:7023:a5b:20b0:1b5:8761:cc11])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b902:b0:1a5:9abb:fdd7
 with SMTP id a92af1059eb24-1b556877a2bmr15589113c88.9.1795587374885; Tue, 24
 Nov 2026 22:16:14 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:02 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-10-irogers@google.com>
Subject: [RFC PATCH v2 09/30] efi/libstub: Disable unwind tables in x86 and
 RISC-V EFI stubs
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Pass -fno-unwind-tables and -fno-asynchronous-unwind-tables when
building x86 and RISC-V EFI libstub objects so enabling kernel-wide
asynchronous unwind tables under CONFIG_UNWINDER_DWARF_CFI does not emit
unwanted .eh_frame sections into the standalone EFI boot stub.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/firmware/efi/libstub/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..19c2822eb302 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -19,7 +19,8 @@ cflags-$(CONFIG_X86)		:= $(filter-out -mcmodel=kernel \
 				     $(PADDING_CFLAGS), $(cflags-y))
 cflags-$(CONFIG_X86_32)		+= -march=i386
 cflags-$(CONFIG_X86_64)		+= -mcmodel=small
-cflags-$(CONFIG_X86)		+= -fPIC
+cflags-$(CONFIG_X86)		+= -fPIC -fno-unwind-tables \
+				   -fno-asynchronous-unwind-tables
 # Nothing enables IBT while the stub runs, so ENDBR would only take space.
 cflags-$(CONFIG_X86)		+= $(call cc-option,-fcf-protection=none)
 
@@ -29,7 +30,9 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
 				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
-cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax
+cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax \
+				   -fno-unwind-tables \
+				   -fno-asynchronous-unwind-tables
 cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
 cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
-- 
2.56.1.831.g720f3f5937-goog

