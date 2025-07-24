Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC81E500C
	for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400229; cv=none; b=R9uPVeOAFc4rJKTByLG71mvxvDDGLAAfdz7N/Y+/xVMLwf5FKLtpqMFy43WHQHDtdXoEfStZrde9Saqul6b344FHr8FUqBN4Y9dpbdAotwHOQuDnk68qAgkvGuVPa66+3gt9ai61c07Q9WVuckkjCJorXXOuuo0Dbu+sSkye6aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400229; c=relaxed/simple;
	bh=5N5m8xOH14VHtqk63znJyJZdTgix/MtEnLNiozKJxiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dV0Lt9dXpxwPS3WcD4IxTwjggZacqL29TQtZ+sYBIvqY9laR12XlviRDFqhcpumCNxvYsmfashNJLCABO7/72Bx3kRL7EZWkH5rnCl2Q9GZrh906gvReVzm2wC3asJTEGsvb6ENoE1umX0+FZSPc1SCDWaGHw1u4bs38Xmzty7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VqtlYgnB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VqtlYgnB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23e210ebd5dso20562835ad.1
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400227; x=1754005027; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krQk4P3pfTRPUT5p9FwZ7J0ulZx2x20Cletpatu8lvU=;
        b=VqtlYgnBQT3V5qXYZRQ9F85HWCf2JMvdn6MEAedZX3loa0hmRr74MdUaKz3qBS/Vmy
         oCq/grZbuYFlAlp0slgqiVtRPoYZQkRgD01bZ2eV6fyW58ZyMV29viGYanSLHwMwovDI
         +aS84/g9Y3LsrNU0JdkIkgmzjwPsmCmnvtRhWsTiy96/0Lk3d4PNXNSwianhyVg4DtjO
         kMJ1SyvcuwG1/OtqK9DwqK1WEqGatTvFKS1ktg4uKixPDT+4mxWCrPBOpfoa8GfWamE0
         QgzRNMWu/qQdV+jb/DTx4sYy2fReyTnT/Ma/SIumegUpqx/uI8erL5GyuaSKKn/UOkVx
         YYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400227; x=1754005027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krQk4P3pfTRPUT5p9FwZ7J0ulZx2x20Cletpatu8lvU=;
        b=X0/P/ELGeCyBdhlwIBqJjBC+Xxe57sKzEe7wg8Gf0P9tA5VhWc5Ntk6poe4ELgDfsO
         TEusjpsJGC3cQnHFyclrq4Jw9Czhmp2C9j9ZrjB2GnpHlDUvgCEYrCpyt91UQZjQgEPP
         rcav7gwQ67U3+sIzjZoZMg+z9ZkFJR5ckPqs7FwZrbZ8VjHADdd6ZTBUotfOwWuQutxb
         ryEkHs6/TU/jmInlmC+GzV9DdQZZ3JvES1d8mvkiuxmd1B625Xhw2ZbWLJXFNhxgHC7X
         iZ0RQG7puZGRlZr/pOLgKiDcV/86Kn/hZ9GOyL3CxfIjfDJSK9uy7wFZBKDzBXgYMf/t
         iWuw==
X-Forwarded-Encrypted: i=1; AJvYcCV09BZmne5t3ucqAnoArXe8kJ2v4df4alqIl/sbBiZIv6gj2zXpXwT+m3GAAiCKeK+ZZ37j@lists.linux.dev
X-Gm-Message-State: AOJu0YxGUzfce3MolUcZOTcUrOlMydjEOzJF5HdE9uuxeIM+Ow01Hcjo
	WGB25gNOoSueFgOXEKR7OuXMxnoIgaC6LY6BgMPW33YBMLjam/4+b3iYt8uG/Y2GAAc=
X-Gm-Gg: ASbGncvMNQJpH53Fgo2Flg2Ma3kbm529mnqEi2RJRxLLq36KWpaP0FoQX7JTphkF5sa
	I582yz42+FlTvLfAGVFFd+dI1yqmx3P7Gz4UFgxghR44OXTx3993BaQVWh5MD4miKOZuahq9Rmi
	NILgR1/R58d1VWREh2jqFZKeltZDUZYUQ/s2xrkEqECKEq0bzOsNhX3/IpY6XCPqKzWMu5Gsl4K
	THwN2lu06nirgkcAogEemK6b7Ljy9qyMrKPSdgw8wc/aj8IPjUTH9P5HMFQg6ZBTBvmM/4fXv58
	8/MXlRu9VRzoRgVJMcmBWMEhS+qS7MmzWgz4nQhU9oNuNaj1294rjVm2Q4EHoB1xlNFY2jYrhrk
	YHrDqJJRwgMz+GWZocCWr3PE9bSUk2F9x
X-Google-Smtp-Source: AGHT+IHqqHjkrV1Y0AgUE/7okEjKgN0Xu4SqOAlTzo93EMsg5xWeC1nRyl3GBDs9U3ql1blBgoSqFg==
X-Received: by 2002:a17:902:ebc5:b0:23f:a1b5:e537 with SMTP id d9443c01a7336-23fa5ce4bf8mr55592815ad.3.1753400227208;
        Thu, 24 Jul 2025 16:37:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:54 -0700
Subject: [PATCH 01/11] riscv: add landing pad for asm routines.
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

SYM_* macros are used to define assembly routines. In this patch series,
re-define those macros in risc-v arch specific include file to include
a landing pad instruction at the beginning. This is done only when the
compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).

TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
support.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
index 9e88ba23cd2b..162774b81158 100644
--- a/arch/riscv/include/asm/linkage.h
+++ b/arch/riscv/include/asm/linkage.h
@@ -6,7 +6,49 @@
 #ifndef _ASM_RISCV_LINKAGE_H
 #define _ASM_RISCV_LINKAGE_H
 
+#ifdef __ASSEMBLY__
+#include <asm/assembler.h>
+#endif
+
 #define __ALIGN		.balign 4
 #define __ALIGN_STR	".balign 4"
 
+#ifdef __riscv_zicfilp
+/*
+ * A landing pad instruction is needed at start of asm routines
+ * re-define macros for asm routines to have a landing pad at
+ * the beginning of function. Currently use label value of 0x1.
+ * Eventually, label should be calculated as a hash over function
+ * signature.
+ */
+#define SYM_FUNC_START(name)				\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
+	lpad 0;
+
+#define SYM_FUNC_START_NOALIGN(name)			\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
+	lpad 0;
+
+#define SYM_FUNC_START_LOCAL(name)			\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
+	lpad 0;
+
+#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
+	lpad 0;
+
+#define SYM_FUNC_START_WEAK(name)			\
+	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
+	lpad 0;
+
+#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
+	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
+	lpad 0;
+
+#define SYM_TYPED_FUNC_START(name)				\
+	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
+	lpad 0;
+
+#endif
+
 #endif /* _ASM_RISCV_LINKAGE_H */

-- 
2.43.0

