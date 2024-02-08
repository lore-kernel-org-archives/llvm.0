Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6341E87C
	for <llvm@lists.linux.dev>; Thu,  8 Feb 2024 01:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707355368; cv=none; b=JwYwj3A+0fpnQPLt79AHIuFE9axxS2Wxj+irYa2upK3HY/CPRtK90BAy2mR01hn3fJQZy52qleeA/huZjHklge299omDSBIXYqhksSEE/l4ASC9LiFna/Q8yUUkOGnpijgim1s5/iFOHXliK1kAcZ94eHFkJv+hwxv5Y4u4RKpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707355368; c=relaxed/simple;
	bh=Mm/LoXa3RB6B+MBL36Ib2qcdqqwIv2prBEiaoLJuQyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FId+kO+eTIdrolF3omtLqgCynY/zBafr796P0PID7UF1Qlu2+Y3q1OK+jWIkirOjCeKLolr49OoPTCbZT0rhoPcOev+daybeQzJi68L7XC7waNC5XEBFuI5u1Gq/H14F7659notIKLLgcNtQI8sgi/euNT5Vriu8w3BgzoCZXlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLKSXW5V; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLKSXW5V"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-410177e41a8so9064355e9.2
        for <llvm@lists.linux.dev>; Wed, 07 Feb 2024 17:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707355364; x=1707960164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kY0vgVMAWXvg6WdX7kWSrpFxwM9nLTP4P22qdJFLKnI=;
        b=mLKSXW5VoycFyb5hw7ELQmruHHfprtwVyc+J3iHdmJ+SXgKudb5HTGenC/uPjKqpyP
         FlZpuMatqsvLgrQUdWZToJSB6mKrmlHOmC2dpzIT0XUGbgKZeqSN8bDhinj2lbb7kboo
         /LgitoKF6YSD5adiGy25DfLGecqq2sIMyBmM/oOWIkl6yuXOD37f++rMv4jX9Jt82zZa
         VEeWbYL1SvB97BU1yHnfQFAA9Y2kiVZovqJUJOQwguNXzkPOweBC4i+02DnNfvDUZcRf
         RUQjerYF8bXH2ooxEkxkpQCkqaunRsRPm+7RFCYNPFRRy8ZNk5L7sFZvb3sh2jkVxQbV
         ZfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707355364; x=1707960164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kY0vgVMAWXvg6WdX7kWSrpFxwM9nLTP4P22qdJFLKnI=;
        b=L06GY2FlQlk0N/oetE0tFkDsmCndJrGxzo+9jgjNkohknvjd4D1MLMz9DsRygl1mZy
         CXkSfl9q68yGMnUY9YS5qLAO49KfJ1yD5dZqq65+C2CXGwirNXh15Yj74DRjTcP3OBiS
         /A3zDs6TP6LixviUrQilqe/XpvNJHXlap9JX5m3Tj3PBSUoqCBHydfR2qkNlcZ8771L5
         HV4bVH5oK4XvINw/JsAu5Hv5xYLjHDAEUsXR97R2sXy/dfGCwts0Tj2JInVpCDkQfFwu
         0z6BSKjICNv2iYxN6Hxa5hDnfKWTkhmaxUIRGsV68JMF9DjPaE/Pr4oZuxerqfIGLYxe
         Fhnw==
X-Gm-Message-State: AOJu0Yw/h+sfiRPb1oo7j/XQtAd8MzCYvPpgrJ+xq94+hu2htf4JEPF9
	dXPgmGp4D2FmjARl5whg/uMHgitPEUde0si2vHgTAO73LoKGGN7katnyFZek59c=
X-Google-Smtp-Source: AGHT+IGQfyAOB5pdzwLmMMlKecAQ7P88fZJEisR2tHxtc6hmhm0dZ/Fy4VcF+TPqRRA4nSh9MQJrCw==
X-Received: by 2002:a05:600c:3543:b0:40f:c1fc:e5b6 with SMTP id i3-20020a05600c354300b0040fc1fce5b6mr5694924wmq.38.1707355364099;
        Wed, 07 Feb 2024 17:22:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1eHQPE5BUroa8741BQMtqOa6Q3Ltc5RSdH3ErtrGeYLe8Xm6pGHsUedrwe1B8tYW8NHtdJ5Tio6FyolPLSS6AH46OVd1PmvzbQrhn8/qcjAoGyY4NSXVZAMV33WFicA0tbE/4fqACx4qSvJLZMDWZu6aYBguC+HjQdfgZZ5Fho50GpVVDLSt2/p5eSal/z7XlF5BVuksvA+1DDGsT6He2M2DnZXAmdThDH7nGz67NPFOUEcN750jA8KKbl7/p3/dAxbHThD9eJqyJwU8eK418Kv/1+uXQil4qoZSmPn1zL39LxlLOaUgM4p+nL2mCyOAtc2pG0Vc200Mc9b7sJrEw9J9YnfOcG04Su6q6zcrYFDu3CQ==
Received: from node-04.shui.grid ([31.94.24.68])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0040ebf603a89sm161866wmq.11.2024.02.07.17.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 17:22:43 -0800 (PST)
From: Yuxuan Shui <yshuiv7@gmail.com>
To: llvm@lists.linux.dev
Cc: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Yuxuan Shui <yshuiv7@gmail.com>
Subject: [PATCH] kbuild: Fix building with LLVM on NixOS
Date: Thu,  8 Feb 2024 01:20:58 +0000
Message-ID: <20240208012057.2754421-2-yshuiv7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NixOS is designed to have immutable packages, and explicit dependencies.
It allows multiple different versions of the same shared library to
co-exist in its file system.

Each application built with Nix, the NixOS package manager, will have
paths to its dependency shared libraries hardcoded into its executable,
this includes the dynamic linker. To achieve this, Nix adds a
--dynamic-linker linker flag when building any application.

This isn't a problem if the kernel is built with ld.bfd, because ld.bfd
ignores the --dynamic-linker flag when the resulting binary doesn't have
a DT_NEEDED entry. However, ld.lld respects --dynamic-linker
unconditionally, which breaks linking in several cases.

This commit adds an explicit --no-dynamic-linker flag which overrides
the flag added by Nix.

Signed-off-by: Yuxuan Shui <yshuiv7@gmail.com>
---
 Makefile                      | 3 +++
 arch/x86/boot/Makefile        | 2 +-
 arch/x86/realmode/rm/Makefile | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a171eafce2a3b..10ed19caecb1b 100644
--- a/Makefile
+++ b/Makefile
@@ -531,6 +531,9 @@ RUSTFLAGS_KERNEL =
 AFLAGS_KERNEL	=
 LDFLAGS_vmlinux =
 
+LDFLAGS_MODULE += --no-dynamic-linker
+LDFLAGS_vmlinux += --no-dynamic-linker
+
 # Use USERINCLUDE when you must reference the UAPI directories only.
 USERINCLUDE    := \
 		-I$(srctree)/arch/$(SRCARCH)/include/uapi \
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 3cece19b74732..390a4604166eb 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -102,7 +102,7 @@ $(obj)/zoffset.h: $(obj)/compressed/vmlinux FORCE
 AFLAGS_header.o += -I$(objtree)/$(obj)
 $(obj)/header.o: $(obj)/zoffset.h
 
-LDFLAGS_setup.elf	:= -m elf_i386 -z noexecstack -T
+LDFLAGS_setup.elf	:= --no-dynamic-linker -m elf_i386 -z noexecstack -T
 $(obj)/setup.elf: $(src)/setup.ld $(SETUP_OBJS) FORCE
 	$(call if_changed,ld)
 
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index f614009d3e4e2..4b42006d9ce02 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -50,7 +50,7 @@ $(obj)/pasyms.h: $(REALMODE_OBJS) FORCE
 targets += realmode.lds
 $(obj)/realmode.lds: $(obj)/pasyms.h
 
-LDFLAGS_realmode.elf := -m elf_i386 --emit-relocs -T
+LDFLAGS_realmode.elf := --no-dynamic-linker -m elf_i386 --emit-relocs -T
 CPPFLAGS_realmode.lds += -P -C -I$(objtree)/$(obj)
 
 targets += realmode.elf
-- 
2.43.0

