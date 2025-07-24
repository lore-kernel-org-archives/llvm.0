Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7268246BC5
	for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400241; cv=none; b=lozxFNaNwFNpW5ldnsNelHWMobonKaJcyElgAsHSa4jbQ3t/+wpfjzgYTDKMfNjzS+9ChCUfy/D/GazolhEkOihrrKRz74o+bsWwJAON+Z4/UWcjS0GM6gxyf+OEUImgpEayydMAZqalYENy+XFSdUHfC6OY92pmu2wHRyfA/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400241; c=relaxed/simple;
	bh=oxNgSu2OIKAiuhRCFS+U6NWNOSDM8tRYi8GHDM6kfVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceZ4TR1Pz03FjpAAUfTHkAeP/c5UJBTsk5zYuT5GpyOZGGW8gkV47qbSm/s+Tyv/cilRVjqDI0yCvQVF78fRBJluHhEdszLWVxEHyIjAa93DadeUopZZWPtP2mzSunz7Cle/U5wgNnCL02QDK1WOqYS4eiSSgA86qhHivGUi8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WFlZ22HN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WFlZ22HN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235ea292956so14161095ad.1
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 16:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400239; x=1754005039; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOl3Nqiah3DIFqJnwAEdiPuuEwqhP+r/KN32JLcNnyU=;
        b=WFlZ22HNw9MaAqwwXZtiVHYbO2xaO3YBChG47G+TksMjILonvLOCuulzsGOYLfF1c6
         Pbj6SVdMQF+0rNexRJ7h4hPKocvDl/s8TwEa3gN6gd7n24SsfpEwCXcW4rqvYKFN19q+
         sqzUK8jKkdqdZYeZ6ORKJRoM7dE91xInE17WsNK651tZApr0BS45WuJ1LFVRAqnJH30H
         a/QL6zzmiRYVLasNgVE4aq2zGTr9vILNaRKL/JhDWEBwsJ3tlexRrN1TreFsDfqo2Gvl
         bBUQ3wBhjCyNzPD49/c9pyqp7gmzOSv0fOXgJmeIfv9ibdGUfM1R7WNomgalfByW1AmN
         oQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400239; x=1754005039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOl3Nqiah3DIFqJnwAEdiPuuEwqhP+r/KN32JLcNnyU=;
        b=ch9YQ91y9TjYSkGmjowUsmqZ5UXauY9u/S26oF9lgRgkeJe/ku+UWN95SDjLPKn9tG
         FZLNw1uR5V5vvwVytt5105SuunkVaqjvfrBt71wM3mPi76Edh8QNJVMfAOwn6ZSAc0aN
         ghPLHP92Z63x2o09TQRbU6ti4uhLbl/Bn5p4jL9rc2Grsz1nvzw0aNpwQOOnLCrgJbcR
         wERt73xGwQgCrs9r3xbZ7uu+389XIED+H+krBkwQHn0DYwzoxJFPn0BJOlhs/kAN87ly
         M+eNfKgPFv+aL6F7CTdGec6aRLKwn6dOIgFrttrZZLQr0QPvnRLEkFzeV01GToiKi+d6
         jJRg==
X-Forwarded-Encrypted: i=1; AJvYcCVm3naM56rgDOD3UIYPJTfd1iKUsJwInbHgdzVh+uMoRXQHBCm31loQiSm/Xy9eZCRw03mI@lists.linux.dev
X-Gm-Message-State: AOJu0YzCa89Ms9ZLFFissVGvgNfDvcwoFiQcj45opB4oIc6V0a1Qho2+
	1q7OpFlmFCbmjUBe7yGtNHqAy946vMLdOQLzGfU+zEA68TeFpMEN9wQNA+iF4IGx1D8=
X-Gm-Gg: ASbGncswNueCK6yDKM+V+eFRihi2xmkYtZJpGUHQBC56bzyDst+1zONGu0bp0BcOJ3/
	TsaxVUelr/05lJufY9Y4+R0yQCCTksqemjp8L85dG6cfbsRIwAwIuMPzoVJkfrk9d6JczcbKeOz
	GPs+cl+HAty1lVA9HDzFSjJTv4B6Ru59Tf/BKfIxljOXK/Lvw/Qkq8E+dQwGukc2K3d1ZK91dCP
	tmRgwOXCKNpTzwtRHImnXu4Sa+g1XjpDxc4HrqSGl1pf9tO8YvXBqezpQ8kgHi4UZyJFIlGS/iO
	g2d1RA9T3JWOYqisWMBqd+EM2huFKs+l88/HQr9mweJnQ7hoYtGbQEU3qmshtq+s+e5a/xoEcMT
	bak9FxAN/LoTwn/7hC9GDHxqId0r+TtxT
X-Google-Smtp-Source: AGHT+IGSQSNsbZMV3011ClnOwbU01lkESEFEILFi40CGgrviIgB/I9wMU9rWnehZSismvHPpuGcGoQ==
X-Received: by 2002:a17:902:d501:b0:235:e71e:a37b with SMTP id d9443c01a7336-23f981aed8emr123582705ad.34.1753400238919;
        Thu, 24 Jul 2025 16:37:18 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:18 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:59 -0700
Subject: [PATCH 06/11] mm: Introduce ARCH_HAS_KERNEL_SHADOW_STACK
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-6-04b8fa44c98c@rivosinc.com>
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

commit bcc9d04e74 ("mm: Introduce ARCH_HAS_USER_SHADOW_STACK") introduced
`ARCH_HAS_USER_SHADOW_STACK`. Introducing `ARCH_HAS_KERNEL_SHADOW_STACK`
so that arches can enable hardware assistance for kernel shadow stack.

If `CONFIG_DYNAMIC_SCS` or `CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK` are
selected, skip compiler flag `-fsanitizer=shadow-call-stack`.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Makefile   | 2 +-
 mm/Kconfig | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 35e6e5240c61..7e3ecca9353d 100644
--- a/Makefile
+++ b/Makefile
@@ -987,7 +987,7 @@ LDFLAGS_vmlinux += --gc-sections
 endif
 
 ifdef CONFIG_SHADOW_CALL_STACK
-ifndef CONFIG_DYNAMIC_SCS
+ifeq ($(or $(CONFIG_DYNAMIC_SCS),$(CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK)),false)
 CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
 KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
diff --git a/mm/Kconfig b/mm/Kconfig
index 781be3240e21..f295ea611cdb 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1367,6 +1367,12 @@ config ARCH_HAS_USER_SHADOW_STACK
 	  The architecture has hardware support for userspace shadow call
           stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
 
+config ARCH_HAS_KERNEL_SHADOW_STACK
+	bool
+	help
+	  The architecture has hardware support for kernel shadow call
+          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
+
 config ARCH_SUPPORTS_PT_RECLAIM
 	def_bool n
 

-- 
2.43.0

