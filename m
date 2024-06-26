Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FA0770EC
	for <llvm@lists.linux.dev>; Wed, 26 Jun 2024 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719422230; cv=none; b=Ui0aXbNIIiQQSHmdqPgapa9YG5sRZsbE7zo27WsjILsUDZJGP2ONDwOJmb7OThM0HFgGxbk1TdkcRMPDF1+HcjBSaeRBdSOViQTfkuxRuDviNwPb0ko/OM4erGxN/NpqdBlplWXwGvzVIFHNvRwVdmFgZoKcBom75BSY0TltP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719422230; c=relaxed/simple;
	bh=RYtqPNzmP2LS2A3MM+323p7B2fymwB8mip9tfprdIks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QEvJSdF418/iWhNsW9nmi0v9S1U/Qx2RgLNj027xtrZA3RtrmGMjxSLmaJaW96uArsYp8b1BdNYiFYDI8wGdbERM6xNyHrGcnrY0t3kyIh920YCPZsykXZGXi7QfwmYnkkJzAxk1K5CJoIXydrsHyoqDT3zSf17Xbno9Cf+IB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nEfj8nhU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nEfj8nhU"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c7a6da20f2so5391544a91.0
        for <llvm@lists.linux.dev>; Wed, 26 Jun 2024 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719422228; x=1720027028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sfc+bItioWOLi2TuWFqieQ4WdP0MPgrB+J5zxVf671w=;
        b=nEfj8nhU/72jpfd5eTiKZsHdTWSnTvyIiMUf65JZ9LjKpJ+TOsupn2OZ3ImdgrWlLs
         dOTCYXVZIJun6F4PsXNffBZuu3hVHSVGFzMzyQWGj318NpfBhYHmFWVuLWw834PMOitc
         MtsBLfw1IdTsN/jgpi/WhjlsNu7bn+4VIXwgg3W+ANk0LHeUCN/IcTOdeU/k/fnZ0Cap
         dUVIX6XlXFJ/DFdosifTPDy3Mla8EhclUiPGm5fLQXu+OTnc4Mdr0Vzlzk55LwSzWSCU
         Gr1jlt+Sr8vLLftIpgTtgUd8lTq/1EGDKJqQaN683q/PkJsb1Pkj0PunxmDxeFqz69qd
         0atQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719422228; x=1720027028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfc+bItioWOLi2TuWFqieQ4WdP0MPgrB+J5zxVf671w=;
        b=BB6ul83xojm/LrI6hz30RiHPEESbhj05xv1DPXv8kP/N1LgfI7mmnXP2zGenzoUtBx
         a+A+i8bPrgfvYBX1BwST/ojovs9TJZsHGYWMXJJ9iuj7ff0qlZyHhH4JJnd1HXEUgJKP
         eNdIy9vrPIgyjINCuNm/b3z5snlng4vp7Hj+jGzc7lfwdkFQ9YyU3nRzHa7g6T+y0Rt+
         BzBJIjzz4N0DQe4xJdfWF2obIpAG1ePad/hl1DTnNSZ55r338z/Di4jz5VMeS41szGmE
         ptdqQMtS83YuVdgLmvxqtuOJgzaTlx3jx8mMksRMGiXsu2Fsp6lQV99y3NpcE9l1fq2L
         SGbg==
X-Forwarded-Encrypted: i=1; AJvYcCX272R8mquaNynDy0FZCnnlxBlK+M+MSbqqa0Ukm/QOMD0oiEPfSr1xqCRBhZoA+LUZVCGuLuOq64fMyPDQXBTq3eH83Q==
X-Gm-Message-State: AOJu0Yz+rx9aoHmjljwamlQRSJrcqMgQ95Jy/Wi5aoou8EF3Gd5mma5s
	Lr11LrJqHxDmB+si0w9tIWWvpaIl2lO7W/MlXn2bPRhL4LcOFvSGNst7QJKA+Is=
X-Google-Smtp-Source: AGHT+IFRRYAJqPRgI7bs8MXpEZG6vyONCJH7c7jAbKBR0F7SXl7y1eqCXlLYI6Wy4OsF9R8wyxyQng==
X-Received: by 2002:a17:90b:b0b:b0:2c8:53be:fa21 with SMTP id 98e67ed59e1d1-2c853befb16mr11452942a91.34.1719422227952;
        Wed, 26 Jun 2024 10:17:07 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8f3b5ad36sm83217a91.26.2024.06.26.10.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 10:17:07 -0700 (PDT)
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
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/3] RISC-V: pi: Force hidden visibility for all symbol references
Date: Wed, 26 Jun 2024 13:16:50 -0400
Message-ID: <20240626171652.366415-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate all GOT entries in the .pi section, by forcing hidden
visibility for all symbol references, which informs the compiler that
such references will be resolved at link time without the need for
allocating GOT entries.

Include linux/hidden.h in Makefile, like arm64, for the
hidden visibility attribute.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/kernel/pi/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 50bc5ef7dd2f..1ef7584be0c3 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -5,6 +5,7 @@ KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
 		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
 		   $(call cc-option,-mbranch-protection=none) \
 		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
+		   -include $(srctree)/include/linux/hidden.h \
 		   -D__DISABLE_EXPORTS -ffreestanding \
 		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
 		   $(call cc-option,-fno-addrsig)
-- 
2.45.2

