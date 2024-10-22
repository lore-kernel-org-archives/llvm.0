Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1417F143871
	for <llvm@lists.linux.dev>; Tue, 22 Oct 2024 01:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729562368; cv=none; b=Dy68uugSokEdu15JVxS7mVP7e0OrvNLfhILQWu9nVkTHkHH9wNX+hxZhfX16Yxo4sSYg4pbbSLhlUTmf5CjAwMYTZ5JagopL/TSBlPR7aNWEfK2+aOepEeXw8CuJcJ92GuYKxgivH+a/M0S9yFotD8X0igsTLUVmxwf4h6s2rGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729562368; c=relaxed/simple;
	bh=81X2pPkAnK+T4NW+tJgsONRnsJlo9lmW5DNhEhbK3Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfSNoMP8i7vsSqD0j4wKCq46k/rTVOaZ9St5R3oMMyAZUjjGhfVafFhGFNyjlUUo1vAMZvN6YNgVEWRLHWzJqSkl2dTNK9umoNn+SNIHjxzVoHKmgsFqtF87YjRWcgZijKc7LsApxWg5SOWsqLRsNGVtQWrdYecIMG0BRkvPdyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=TJ3SHR+z; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TJ3SHR+z"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-287b8444ff3so2020160fac.1
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 18:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562365; x=1730167165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpfVj+cCklKKT0meu9E3X+82meKkLqCR+uZsOKWdYis=;
        b=TJ3SHR+zL3Yfccj9Op5/7F0Sdohm2sYZLttbUkx+K0u/9m3xUrwPgfjobVUzqps9s+
         3CAH4JQVjm+L+bOZ0fvErZpdpWyxss2MMfAqqu9caf5Fki7xoxzvMvgFyD7aKHMpfMG6
         J/ePTtW5gissdJzMF2xAbAP0oeTqLQNjzxY418kxLr1ziH567ARvgyxNzo0+DoWU5uoO
         L0ue+DDpiJ9IWTPKXleFUw2hQyYfMoko7cV8lYcIcP9gaZttvisPTXafNwHLohXKo191
         Ol/TDXTtRaZB0aEY3vlLazzdAKEhN/UG0kElG8iQiuNTTzm3Tcysezq1PC+UwuFX6JuJ
         FVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562365; x=1730167165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpfVj+cCklKKT0meu9E3X+82meKkLqCR+uZsOKWdYis=;
        b=qFBN7FoXDSRk+ngIwMTUYiPVWJb0yCHsZ9tCzcaFJCWKdi5QU/A/Fh3N0YzI8tmHsm
         TTnt3dGtRGFIr33zajhsnWcoOHcIfisU9augcakVZS8Lm22y1b9SMw2RYFOAQYpvUxQ7
         0tn3xwUuwm+RBEqjtwOcW/JZHBBANY2oQh92A2r4ePA9FXXj1JD/oPGCNSEzf0VIBEuG
         lWhsZOGhj3EVaZ3qzjxaAE8gtFcB8y+HcmpnQmyuIc17KPa8ZtvfEtFLjONQeJmtbfdP
         uUseTayLiILRZUKUwtEf0cDbzk8X3b/1LRWWbed4b2Rq8/AAqVPw4vvOeB3keBlnEME5
         68vA==
X-Gm-Message-State: AOJu0Yw7ZPmkJ4/b3Ui0EveoP7b/y56tUPEeZJ9pNYyfxxrUvSfEgEK8
	yxXmluA8whKHPViISpXGGbpPDDGkbxOp1e6Z1RjeQ7cR+T/SqisKK+ixBLCEPXY=
X-Google-Smtp-Source: AGHT+IF8mODh9IAJs797PRe4iXy3b/dNIvInfpWpmRrPkiuy4gHecBRUAsqzv6T0/gnC7v7yNiNl4Q==
X-Received: by 2002:a05:6870:148f:b0:27b:61df:2160 with SMTP id 586e51a60fabf-28cb010575fmr1017968fac.31.1729562365145;
        Mon, 21 Oct 2024 18:59:25 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:24 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 5/9] riscv: mm: Log potential KASAN shadow alias
Date: Mon, 21 Oct 2024 18:57:13 -0700
Message-ID: <20241022015913.3524425-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When KASAN is enabled, shadow memory is allocated and mapped for all
legitimate kernel addresses, but not for the entire address space. As a
result, the kernel can fault when accessing a shadow address computed
from a bogus pointer. This can be confusing, because the shadow address
computed for (e.g.) NULL looks nothing like a NULL pointer. To assist
debugging, if the faulting address might be the result of a KASAN shadow
memory address computation, report the range of original memory
addresses that would map to the faulting address.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/mm/fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index a9f2b4af8f3f..dae1131221b7 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -8,6 +8,7 @@
 
 
 #include <linux/mm.h>
+#include <linux/kasan.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/perf_event.h>
@@ -30,6 +31,8 @@ static void die_kernel_fault(const char *msg, unsigned long addr,
 	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n", msg,
 		addr);
 
+	kasan_non_canonical_hook(addr);
+
 	bust_spinlocks(0);
 	die(regs, "Oops");
 	make_task_dead(SIGKILL);
-- 
2.45.1

