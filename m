Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD87442B0E
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457568; cv=none; b=ui/utM+JfaXIYIeLST5PJm+IYjGKy5gx/6XuHidvhvnD+KyojthXzfu7Xn5X4ukWF089Ja4+rWtnsy+0R9ZN8xp0MrfdnH5/hTC9wFxmR56Kzp6PMC89lR+nGHfmrvq0O9eQHw3zzq8+KgQo/iU2z81HXUd5yvT3KbF9hbUIbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457568; c=relaxed/simple;
	bh=O4l6lSWrd7GbUn9t/Xhyu2+p1lAOhzIAdkcPdOotscw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DuL+CzD4NsQEpR2AEMhqab+5nJ6Se8cKsq6Ri0s4YWGDD1NT/1dcN/0M9vga0u0JNK5sJlJYttnlSSwECSWlv/QNBfRnzaRFCYw8ClPSr8ZEH2O9dN2W3oBJtDcyF0I/I4qx3EZ8ZPv7NFoeOlbHEittl8eZSPwUOEUaDA39yyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFj8ubEo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFj8ubEo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso49712725e9.1
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 07:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786457564; x=1787062364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUKReELtva+IRTqgyN0Xulu2tCFMOBx3NrOCV78F8dM=;
        b=tFj8ubEomI0uQ9tzjV7dufKZi1If49K8fj5Bk6Mnx9JXg/21pqrj36e3M+SKmEUJj+
         dU9vosQJ5HFNwRd7OHFeSiIFL5t0sdda8IVpG1EKi81bBfK9MtB7SWnIKied2lUK5c4T
         EcOkaAll5NfoEq/LJyOxaA+aAxqjrDFo1kF9aS9mc1/G4ww7e/p6/6zRb3DmKyMrgyJr
         mV0MM23fwxWY8PrMx0iClAerdo1c1EWG2H0Fngbhfil93zAtCaU+ZJkoDwdWQaNoC31L
         Bvz4FPbgMy6sC/3SvStvBi3ukAh4dCI8hoRi5zuTMCFJfvk8O1Pigeqy4M6DfZfGRK4v
         yetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457564; x=1787062364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUKReELtva+IRTqgyN0Xulu2tCFMOBx3NrOCV78F8dM=;
        b=N2PCDYapad3GHcjuJCizwsi/ZgOKnsjMeUEYx30TNGtdlR19GqFxTtKCUmxQztTHV6
         EUIKjqpbarZ55rrh3/PRye1Th4BK1N8e91C6NH9Q5tE1RvoLVP1qMacJGquuZ/tFD2e3
         Yex2bQtoyG3YsMZsreTgINm4q/cGGRgJx9c+kA+C+ZNN5JiBDNfHUIVAkdo4viVO1PKt
         MWT4X7riQt//xj79+AJItp9KdrhB8TRt+LeyWa8sjeDpQzjwByQhHfENgVtyO54ubRSG
         hLnHtkLrrh9qJeYlEb8yOuaIsNTtDe/yun9xE3eBClIHvnndZ8oRU9KbpzGZX04cF7Na
         wNSg==
X-Forwarded-Encrypted: i=1; AHgh+Roqc6XPkyn4rzwMadNSSZa9sAOG3bymMNSkDowV1UUO6UamdWT3xJhy2B5N9rxWYSk67Wot@lists.linux.dev
X-Gm-Message-State: AOJu0YyBcA92Cabi616tocHXeHeQRjbzg9o6qN63tmy9UO0LEn0oEezJ
	QkgNG2bTOQFwWEYXu0surk5x6tIUdiF1m5Ic/qWbZhe2WtU71E5qIgLr
X-Gm-Gg: AR+sD11n62iEvg5IO5k+kaYIJm2sVPBPDJTAAJOWQHY5zPNXk4T6+vGaNFMbLdZ6BH9
	Skfg2uTBpha9Fn6zp76dHS2TZ19/010Afl/uiUJNsfvpNaoCDhzQ+OWZXBnqBGK594iVQlcrfKA
	EO/abywv5SoTQn+X0Rbc0ovDabcRJuyyEtR8rVKh81Snh79OFZX5JtI/w/SZuFD1mzqyyfoGIWa
	BL75F3p4k4YBbKLAI/06b6seaVbaWZYkifE0ssLjBgVVbjM/UiMKiic50yOQ/o4w7GlMcfy9Ysv
	pc5xtYmilJS01BU8Pb61DfhFDTTc1wmR4xftazJWmP6x6tRgG1Nt+82jgf0Yf6UUOZdhYcRrx1q
	oW1PcCp3DpZNzPpFLhKnEocnnf/T75ZpGYM6CIKQ7BfE9UyEtGKs3DGozizkD6kljMaLDQzSIhv
	EMfOTqFn7aTe586zwgu49IJOt9TD6dNmS5McRWhIaOd1V78EAS9pzyLbapWjqL3EwBVqqyUELmy
	enpc+nplI8Xodrla4GE4R19Ft/g8KMpRwJrtBRty8gybZiHYxYZzm2Pg50dzIGp1KGaBV9R6M3L
	pLvHQP9C0EWJGtKpr1jEPUjGevxzizTlT3fAyNi+Iv5PHQScTqMLwnWdbK6WHou553Y/
X-Received: by 2002:a05:600c:8b4c:b0:499:593c:3384 with SMTP id 5b1f17b1804b1-49978434835mr57851385e9.6.1786457563927;
        Tue, 11 Aug 2026 07:12:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5be29fsm4464099f8f.12.2026.08.11.07.12.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 07:12:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/3] slab: ZERO_SIZE_PTR alignment and exact matching
Date: Tue, 11 Aug 2026 16:12:37 +0200
Message-Id: <20260811141240.62519-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kmalloc entry points promise ARCH_KMALLOC_MINALIGN alignment but
return (void *)16 for zero-size requests. Patch 1 aligns the sentinel
to that promise. Patch 2 makes ZERO_OR_NULL_PTR() match only NULL and
the sentinel, so increasing the sentinel does not widen the set it
matches. Patch 3 adds KUnit coverage.

In hardened usercopy, patch 2 changes check_bogus_address() so nonzero
addresses below ZERO_SIZE_PTR no longer cause its null-address abort.

v1 -> v2:

  - express the poison-pointer bound as 0x100 instead of 128 (Catalin)
  - make ZERO_OR_NULL_PTR() use exact matches
  - add KUnit coverage

Tested on bcc44b6785f21 with the series applied:

  - GCC 15.2 QEMU boots on ten configurations spanning sentinel values
    16, 32, 64 and 128, all passing the zero-size allocation selftest
  - the x86_64 test also passes with GCC 8.1, the minimum supported
    compiler
  - the new KUnit test passes on UML
  - Clang UBSAN_ALIGNMENT is clean on armv5 and the generated code
    retains the exact sentinel comparison
  - Clang builds the macro for 21 targets at -O2 and -Os, with single
    evaluation confirmed in the generated IR
  - patch 2 changes vmlinux text by -2 bytes on x86_64 and -72 bytes
    on armv5, and arm64 gains 44 symbol bytes

v1: https://lore.kernel.org/r/20260808105622.62026-1-kmehltretter@gmail.com
RFC: https://lore.kernel.org/r/20260712120728.96628-1-kmehltretter@gmail.com

Karl Mehltretter (3):
  slab: align ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN
  slab: check for ZERO_SIZE_PTR by exact match
  slab: test zero-size allocations in slub_kunit

 include/linux/slab.h   | 20 +++++++++++++++++---
 lib/tests/slub_kunit.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 3 deletions(-)


base-commit: bcc44b6785f216eb939226ade6e3910baa30516b
--
2.53.0

