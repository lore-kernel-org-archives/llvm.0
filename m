Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D75616F0E0
	for <llvm@lists.linux.dev>; Mon,  1 Jul 2024 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859931; cv=none; b=igdnlYYfNguI+D4qoqbKmoaHKtsj0zUwx4m63MDiK91cqoev4Onc/oIfqKoIdzvg9ap39kCtvIC3VsHwEOhKdOcWVQlQA+5sxDajdxgcfLin3cEsT/tH2RXfNsBJ/THIITEiBekac6tkvgXOkHj9BPzdJ8SJYTLRL7rh/HPgUtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859931; c=relaxed/simple;
	bh=q1vCMlpyvueGwlO+m60gcYRBt/B42mbcvrDQZVWRBUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FcOKyw15GXyB3zqSkQ8VPLgkAR/pKrjs6MCWz/79L9grP7MYFqZ+U1fe5jhZ7sdEo3QR05eTeeep+aOFWGu0lDvr7fmJ1/LYTESVKRT2vyEduenRaqkLdxvuUrrdDg8cxzQlb5qszfXIatNUjr90hLNyhCyAIWGbvXRa4FRO3ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Zzuc+H0F; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Zzuc+H0F"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso2193823b3a.3
        for <llvm@lists.linux.dev>; Mon, 01 Jul 2024 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719859928; x=1720464728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS9GYxuXw7/qz6F0Huo3Gpz70QhA7niN6kxlAksoOL8=;
        b=Zzuc+H0F1EIC+QIpTxmrF6kT7v0z9O2EX5KP9NBFicehw+WSFTiLiQPfwALYefrMIr
         sgEvircP/y6kBS53EyAJaiMJkA+Aob9OOHBgVbh9ZeZLX4/pEiyrKbsrepsgCX/3dVd+
         GNN/Ywpn+iFunufiFrcrRvsHKKj1NxqpuYVYUfStGTjWwCQXhcKcta3W8vzfF+R96F+Y
         uPARTPrEvgsZbIqTNH3GK3xlnR8KC8SD17RobNzlgmv0HgfFFXAAe+I2xX+xHGo4nxH1
         Cky11eZ9Vt4KXVfEwHUOqmNzbcx0eaIgmtjYxBE8Am4t02UyrtUswWadY5Dl24GV6v35
         0MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859928; x=1720464728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wS9GYxuXw7/qz6F0Huo3Gpz70QhA7niN6kxlAksoOL8=;
        b=ceoE6LRrgWtaq+J3rkz6WChzlIC5feiP40Coge1/cgHtKctrJysWJnQHGcnf77BCKX
         kAH30xNbZ88p2qKlWXJCgrJYKQAx/qPn7NVPkXeLTJ7Ghu+mk2pXUU7OvVqAq5SHyBUp
         FXV4ri7xtGiqLvA8HOt2h5WKA5ZI2ra5Kp62dEtGUh84Dts/OcIWH4o1/FXXIu1my4vc
         8wg7S071JcW+nO2Toxj6lERxes6ggvy7Vo/NjeiaWyySJgdAYXOIwYqcCwa6IWu/VnDD
         7tM32jZeOpqSjETvamq4VFYo/VFujke/VmXmpVXt0sl+A0F0RUwQxCkjupxPNO1Y8SaX
         lnvg==
X-Forwarded-Encrypted: i=1; AJvYcCWhHsRDTeAf1aGfgaD/z7mSZ6htBBnybEQUGJUBGDUn1K4knb+9ixM35dHUPkawzcOrvl3ODtMAesB3dT/8aCzRO2pW4Q==
X-Gm-Message-State: AOJu0Yy8DYoxXtd1QBQmNG/PblGRHNitPdW/Y20sZjkHP5htRwZGftDX
	uWuGZXjQs+LUQgw5j4fym/fLCwGzHX6Noj6jvK5R4N3MwdLwjdqknelpYl8BR8I=
X-Google-Smtp-Source: AGHT+IG4RGDVsfQVAXbtDLxsNorbihdnFaeyKDYqlytZdtsd3sF4TSa+MDTMQVNkNGIHeIsWv6QxPQ==
X-Received: by 2002:a05:6a21:7885:b0:1be:e4dd:17a1 with SMTP id adf61e73a8af0-1bef611ba18mr5678163637.5.1719859928442;
        Mon, 01 Jul 2024 11:52:08 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1ccesm69883375ad.20.2024.07.01.11.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:52:08 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 2/4] RISC-V: lib: Add pi aliases for string functions
Date: Mon,  1 Jul 2024 14:51:30 -0400
Message-ID: <20240701185132.319995-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701185132.319995-1-jesse@rivosinc.com>
References: <20240701185132.319995-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memset, strcmp, and strncmp are all used in the the __pi_ section.
add SYM_FUNC_ALIAS for them.

When KASAN is enabled in <asm/string.h> __pi___memset is also needed.

Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V2 -> V3:
 - New patch
---
 arch/riscv/lib/memset.S  | 2 ++
 arch/riscv/lib/strcmp.S  | 1 +
 arch/riscv/lib/strncmp.S | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 35f358e70bdb..da23b8347e2d 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -111,3 +111,5 @@ SYM_FUNC_START(__memset)
 	ret
 SYM_FUNC_END(__memset)
 SYM_FUNC_ALIAS_WEAK(memset, __memset)
+SYM_FUNC_ALIAS(__pi_memset, __memset)
+SYM_FUNC_ALIAS(__pi___memset, __memset)
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 687b2bea5c43..bc73325b2fd1 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -120,3 +120,4 @@ strcmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strcmp)
+SYM_FUNC_ALIAS(__pi_strcmp, strcmp)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index aba5b3148621..b36325a57f6a 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -136,3 +136,4 @@ strncmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strncmp)
+SYM_FUNC_ALIAS(__pi_strncmp, strncmp)
-- 
2.45.2

