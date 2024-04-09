Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77574297
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643123; cv=none; b=j5Iq5mdv7Wl1Cqpa5Qj6m/z74ARSz+u0WOcVyaEl8sqo4IHC6lUpOJgMXsEixJZfx1WWPKfO/n1111Aco+qEqQ6sgujsTQbebSpow70GBOISIkauf6habneasNX1nyK7xxkzhyuEHTnTnI0lSooaPWREnFcLVuSKtyxCtf9OY+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643123; c=relaxed/simple;
	bh=5sZFa9MwpAUEn0MLOkKBsH+G2UQd4bau7WQNBed8iyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WWpH/vbGg6dj/rSYlKKY0NrRrme5z71s/FImzLvrXU6switx7eTZ0VHWI688YSvQCYIZkXOtwo7JGNr+wjvmi8QcnHcqBPbzEDtvw70Za//JEe9BR/KkE87cQjM1qm/CRKk20ctQNhu3lITkR54v9/vCIW5SqE0tYXAN8xiuS7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=InC0+lIh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="InC0+lIh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e4266673bbso15469765ad.2
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643121; x=1713247921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiLAeIECyw84AGrUV1USEqteoHaPU8YvP/EXtLFxWio=;
        b=InC0+lIhNiL6RQuzd5rGrH8zGdUbpx2PBpOSSX+OT62nfG/Jrs5w8TvFOcOxbBGlCo
         uL+OXWfRuJ1TyCgL95WGL46k8Ik7XXDXu/cfX5uXi2I9abhWit7+6Hnbt1F3+tZ2CfdC
         /v+4O0pzSykvGFWOTMMY6ncleF5Angz8olU3HcsgL7JD8nEKkeC1TS1uFeqDWyCaCeuN
         SR0zz/L6B46OcbSyIZWyIZsvbyfYD9moYeyTh6eH1i5aZaIbhbzFuRXbDVWTZUBCMhIV
         Y8KNwVB1PslvirA91h2z+X4/v4wmhkbJ9icq5WNo0SQtP2RCs6YdnElS2KcRLO/RUg9y
         vFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643121; x=1713247921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiLAeIECyw84AGrUV1USEqteoHaPU8YvP/EXtLFxWio=;
        b=NjYtqaaQIVtJ6PyLPLEjbzSH66uxEJ8iFgtulcCQLgn6JVPtW+XD4eTkuP9s4Tcm+Q
         lygOlZwp3Cx5IrZ5YjDIPDktwi2Z6l0na0D6/ifRLK584DjgPqF3+Re1qXw+6Ce+frsH
         lCHM224/hq9++1h9+0C5kd7Jimu1Mny73n9T0FTccEbktHyfaRmxLmaeqsxepDMkznUQ
         Q3dUac5bJZjvggJlRIrsukIMEzJdqQa/hAPm3WTbJrkLzWEc4TwS3FCc9cntgMKG424o
         WxuNB7lf6sVLHijE3liwicI30trEiA3Ef5FM3a/uiXeqgc1TiWzAlJVirbGq1MZmehTp
         vhYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6GgzXLlfcYBn7KeJYQ2C89oRH3QOzc+E8CbK9fE6xML4zgt6hOSyvMTUUEZQ6Wyjng1Axt5fkKvrSkF6CK5TJbjJRhw==
X-Gm-Message-State: AOJu0YxM51ARIYDeNidQ2PlzsV2jqqBA/aE5My44yAPgPDWkNnUEBQ4N
	Rz5GgOcpGwWoOXhaZ2TA5wOrYiuRt4h1wYaEYVy9THjWjv252ACz0BA7Feyd+4s=
X-Google-Smtp-Source: AGHT+IFEkDe2ZGfs1F8mvdmf/ch3SNQCuQFomQ5uVJDLwaNinIwMUeMD+w87Nmm/x+873W3JBq3PpA==
X-Received: by 2002:a17:902:ce06:b0:1e4:70d0:9337 with SMTP id k6-20020a170902ce0600b001e470d09337mr3182383plg.45.1712643121070;
        Mon, 08 Apr 2024 23:12:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:00 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 02/12] riscv: add landing pad for asm routines.
Date: Mon,  8 Apr 2024 23:10:33 -0700
Message-Id: <20240409061043.3269676-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SYM_* macros are used to define assembly routines. In this patch series,
re-define those macros in risc-v arch specific include file to include
a landing pad instruction at the beginning. This is done only when the
compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
index 9e88ba23cd2b..bb43ae7dadeb 100644
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
+	lpad 0x1;
+
+#define SYM_FUNC_START_NOALIGN(name)			\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
+	lpad 0x1;
+
+#define SYM_FUNC_START_LOCAL(name)			\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
+	lpad 0x1;
+
+#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
+	lpad 0x1;
+
+#define SYM_FUNC_START_WEAK(name)			\
+	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
+	lpad 0x1;
+
+#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
+	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
+	lpad 0x1;
+
+#define SYM_TYPED_FUNC_START(name)				\
+	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
+	lpad 0x1;
+
+#endif
+
 #endif /* _ASM_RISCV_LINKAGE_H */
-- 
2.43.2

