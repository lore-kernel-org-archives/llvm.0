Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEC03EA66
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706827023; cv=none; b=lHBSvIvx5q6rjA6JaBDvfeFjbRP53Uigrszb0D9uGFsT0jV2eia5OOo5ssLRK6rbG23vGmuF87Y6UypB9it9sGRuih14lvu86iNB0GAfFiqtmRCpJ1ks26i2LpW5QXUMlzdkE+CsrsYa8QiSMkXS4VQYRzW6WTb6qAgqbkWExUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706827023; c=relaxed/simple;
	bh=C1Td7LS6mQYWKcz4HPRMpRrQao7T6kT+I564bAgKsBU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pmZb8wSnC4kazbLHEoRgjgValAzKYAaThQH/qg6tCfwFFqVo7BlPhILOn/+blyGO1oxQiNVciYnDOibD8N/dcYi4+umci/W3FL4Lekh30Yp/rd0kbCBNDCjC+nEuSVSpM4FV+n+sfuojNkMupTCel8ALZsHZ+TJfygL5bSS8zKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--maskray.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k1GCHnct; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--maskray.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k1GCHnct"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6df2b2d1aso1250173276.1
        for <llvm@lists.linux.dev>; Thu, 01 Feb 2024 14:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706827021; x=1707431821; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3B3tF1HYvRY1UkQ2K7cnSqpuGaSyeDgjRqaJd9RSiXg=;
        b=k1GCHnctXmaFkpSojuto2R+V7tbW+3gRLjJ6L29+XK+Wv9j2uuBpu3V4m2ZInhNOwT
         zhBnd6m7eogIppR85vRHhqBZwJ7braLxgcShg7RhPMcupavFzt3Cm1L6W4HOLVHXAJDc
         Gro9QKaEkA2kA6tO545thpqyrljlBzKkPGALVUx+frAVVv36xkEoHH893T6VVkmxNx4y
         lUO0uTpXFSLl8wB7mrSsuA2dPpU52C/mccP3b6mtYZlH8zgSzXoWi2E40toP8PVATnF5
         cnIIwHW3uZsjmYdLSXqWTa6yAHyAxA6O+lDma+K6fD34mzFs53jq0RJf+oTlFRvdpZyI
         FTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706827021; x=1707431821;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3B3tF1HYvRY1UkQ2K7cnSqpuGaSyeDgjRqaJd9RSiXg=;
        b=CnvSG4knmtFt0qnoj8IFAqA93tBrNgY1oWqtEwadSPcTiZOszWrStJ/w8QQsii+HGz
         BANBiLRsHZg3HRklEK96wIcOxT6mkpuuX92kgYGQUOSWJwlPWX2IPN/4KUWKmZ3+HTwW
         YFBVlHqHqbkoH+DixTjHXPgFS5sxElBXPATqCdFrNlqT3MltVArqOABXq1Um8FUvycon
         rokYXGpxuRNh4GpCI1l6GSebM4xXPUVzOS3u/RMl2irfwMDJux4nCjFxaAa50x/FlLfo
         Pq1Gc0ntn3c2oDlgcK8mYDXiIpYbY4EuD/VKWb2bNGBFUwvjCNCQF0r5pjWO0viXJH6r
         D0NQ==
X-Gm-Message-State: AOJu0YzHdVelUbGchBszbdgyOjW3XKHBwDTHdE8yCVan7cYc4c0L6BsM
	7Gy0McKf6pdc2fOviRRzkQhNgE6rVkDUNHZ3KQ2Vt5PmMJ3mw0J7wxrdCLjlfeZuplQIrizlvA8
	/pZ0CyA==
X-Google-Smtp-Source: AGHT+IEtIsVPxgDfG98U8Bbl2kwE3MvRjxByJZVySc1k/DECQFUpeiwq33gwZ/XYHnQ4uktoKoW718gMTm1N
X-Received: from maskray.svl.corp.google.com ([2620:15c:2d3:205:7de7:721a:241f:7455])
 (user=maskray job=sendgmr) by 2002:a05:6902:cc9:b0:dc2:57c9:b44d with SMTP id
 cq9-20020a0569020cc900b00dc257c9b44dmr149539ybb.8.1706827021012; Thu, 01 Feb
 2024 14:37:01 -0800 (PST)
Date: Thu,  1 Feb 2024 14:35:45 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <20240201223545.728028-1-maskray@google.com>
Subject: [PATCH] arm64: jump_label: use constraints "Si" instead of "i"
From: Fangrui Song <maskray@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Cc: Jisheng Zhang <jszhang@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Peter Smith <peter.smith@arm.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

The generic constraint "i" seems to be copied from x86 or arm (and with
a redundant generic operand modifier "c"). It works with -fno-PIE but
not with -fPIE/-fPIC in GCC's aarch64 port.

The machine constraint "S", which denotes a symbol or label reference
with a constant offset, supports PIC and has been available in GCC since
2012 and in Clang since 7.0. However, Clang before 19 does not support
"S" on a symbol with a constant offset [1] (e.g.
`static_key_false(&nf_hooks_needed[pf][hook])` in
include/linux/netfilter.h), so we use "i" as a fallback.

Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Fangrui Song <maskray@google.com>
Link: https://github.com/llvm/llvm-project/pull/80255 [1]

---
Changes from
arm64: jump_label: use constraint "S" instead of "i" (https://lore.kernel.org/all/20240131065322.1126831-1-maskray@google.com/)

* Use "Si" as Ard suggested to support Clang<19
* Make branch a separate operand
---
 arch/arm64/include/asm/jump_label.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/jump_label.h b/arch/arm64/include/asm/jump_label.h
index 48ddc0f45d22..1f7d529be608 100644
--- a/arch/arm64/include/asm/jump_label.h
+++ b/arch/arm64/include/asm/jump_label.h
@@ -15,6 +15,10 @@
 
 #define JUMP_LABEL_NOP_SIZE		AARCH64_INSN_SIZE
 
+/*
+ * Prefer the constraint "S" to support PIC with GCC. Clang before 19 does not
+ * support "S" on a symbol with a constant offset, so we use "i" as a fallback.
+ */
 static __always_inline bool arch_static_branch(struct static_key * const key,
 					       const bool branch)
 {
@@ -23,9 +27,9 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
 		 "	.pushsection	__jump_table, \"aw\"	\n\t"
 		 "	.align		3			\n\t"
 		 "	.long		1b - ., %l[l_yes] - .	\n\t"
-		 "	.quad		%c0 - .			\n\t"
+		 "	.quad		%0 + %1 - .		\n\t"
 		 "	.popsection				\n\t"
-		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
+		 :  :  "Si"(key), "i"(branch) :  : l_yes);
 
 	return false;
 l_yes:
@@ -40,9 +44,9 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 		 "	.pushsection	__jump_table, \"aw\"	\n\t"
 		 "	.align		3			\n\t"
 		 "	.long		1b - ., %l[l_yes] - .	\n\t"
-		 "	.quad		%c0 - .			\n\t"
+		 "	.quad		%0 + %1 - .		\n\t"
 		 "	.popsection				\n\t"
-		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
+		 :  :  "Si"(key), "i"(branch) :  : l_yes);
 
 	return false;
 l_yes:
-- 
2.43.0.594.gd9cf4e227d-goog

