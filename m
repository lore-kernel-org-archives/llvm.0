Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F008E51027
	for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 06:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684023; cv=none; b=AQ3nqN6CzErq9lbOwjpYLBX6h+T56K5D7NsOlEFq1fNo7/SgQUShIxGt21OW2msKY8htsaKEx4J3zZ0nJ9ntQTX/osYlHvvPrg/RwudqPg/orbCO/BCfBkgT9Wqbclgp1Yg3Rxw4fuXJ15OnW0TiO1nUOnpRrFZMvIspgVjdV/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684023; c=relaxed/simple;
	bh=/V9Rglm98djqCs8KSL/PzgVQzNmWOOniqe3fv5n82uk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fNchqlgBg0frmsd7yh7zF4k5bYa+zkHBpkd3M88ZvPAWjYvMtjEFbiT+X4mfvBBGpu+0flbca2zKWcS/ogOi0PWQwR8Eh8qH/KGhHj5DRpt27Xt23Ztvy5wbhJ1ldpa8Wlb1vNbn/32u6lwn4Koc18g0W4m4uyAAasOfnUWQWik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--maskray.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rkzNcdA4; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--maskray.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rkzNcdA4"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc604c99e95so5588903276.1
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 22:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706684021; x=1707288821; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8dMZ3OwOckg/8nEeQlzzg6EqDAiFIDc7gYYU0A2bM1c=;
        b=rkzNcdA4MbkjF5NCcUqHIAV/s9GQ1RxiIA7AJvHPXKppcMCx+c2xEhUmZAR8vWS2+W
         z6GeK+nJ05AIcS3W187nU7UaXcVfRn+6txtGAABrEq06AEqywGHvBih7vdlGIEtkkqJM
         oJhwgvbmdbaghVPbPuXkLIX7LvRTGAdRKlkT4eX0pfFu/synabfMT9xz3I88UyOQ8it5
         y7J4oPLOw75qCAHyf58R1CV6+1ToEniRsC5xcvojMf2Y0SxnHBTbLRHXugs+7iGiDKFH
         exKxVXxdbOHgz1DmR+iKXZMQOX7vQbQQPMS1gH/8OMmnIC5QRXZyMz8r9u0+S4m3hog4
         Mtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684021; x=1707288821;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dMZ3OwOckg/8nEeQlzzg6EqDAiFIDc7gYYU0A2bM1c=;
        b=cDIxUJNeUmzNj4ttOpHqm9rZUjIdGTgdzwgOU6qdJgvXQ32dCahXPCnCIHv7rUBmB7
         GfuW76AenrgfqDJ8OAUzL0C6qHwcrfDvjuXyuSNnyffh3NTmhzY1MZhrcYTgFxvxj9nO
         JY4gJN1vhCMV4QqS0ODZJ5tFKRG4r82EpUKjFajIXaleWjUUzd+ztbbl9a29cfuFWWjZ
         B+aYyG5SLYsAZzobJhgx3w/Trfd4Xry+lIQKZMIpQxxaoImHCLwCNNu+KG3WDEMCc0ss
         QxtEW/tzCknbzVwbroG/R0Y5T9Lgs3LPvCzPgVb5JfI2bKb29KQs6tMmIMtOkMAbiXcp
         IFgQ==
X-Gm-Message-State: AOJu0YxSCxJrYyqKa+wWoGQPIAx+fyexho66esKIVGYgUfNJHP+/zMES
	18m44xVLTWbASAeO9sWiVVhpfIthd4zvDA1kouJNwJrOmUYjdDk/AlXZHm13UqHr7m7DoCmM0qo
	HnBIwwA==
X-Google-Smtp-Source: AGHT+IHYBZ61Hkmf065FzDbmISs1w+H1s+kPtfBvIanyUT0Z/nhLrWER1j7n3G0iOTAUij8aXk2uZrIboMe4
X-Received: from maskray.svl.corp.google.com ([2620:15c:2d3:205:bc85:d604:bdab:a3ed])
 (user=maskray job=sendgmr) by 2002:a05:6902:1188:b0:dbe:30cd:8fcb with SMTP
 id m8-20020a056902118800b00dbe30cd8fcbmr35684ybu.0.1706684020985; Tue, 30 Jan
 2024 22:53:40 -0800 (PST)
Date: Tue, 30 Jan 2024 22:53:22 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <20240131065322.1126831-1-maskray@google.com>
Subject: [PATCH] arm64: jump_label: use constraint "S" instead of "i"
From: Fangrui Song <maskray@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Cc: Jisheng Zhang <jszhang@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

The constraint "i" seems to be copied from x86 (and with a redundant
modifier "c"). It works with -fno-PIE but not with -fPIE/-fPIC in GCC's
aarch64 port.

The constraint "S", which denotes a symbol reference (e.g. function,
global variable) or label reference, is more appropriate, and has been
available in GCC since 2012 and in Clang since 7.0.

Signed-off-by: Fangrui Song <maskray@google.com>
Link: https://maskray.me/blog/2024-01-30-raw-symbol-names-in-inline-assembly
---
 arch/arm64/include/asm/jump_label.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/jump_label.h b/arch/arm64/include/asm/jump_label.h
index 48ddc0f45d22..31862b3bb33d 100644
--- a/arch/arm64/include/asm/jump_label.h
+++ b/arch/arm64/include/asm/jump_label.h
@@ -23,9 +23,9 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
 		 "	.pushsection	__jump_table, \"aw\"	\n\t"
 		 "	.align		3			\n\t"
 		 "	.long		1b - ., %l[l_yes] - .	\n\t"
-		 "	.quad		%c0 - .			\n\t"
+		 "	.quad		%0 - .			\n\t"
 		 "	.popsection				\n\t"
-		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
+		 :  :  "S"(&((char *)key)[branch]) :  : l_yes);
 
 	return false;
 l_yes:
@@ -40,9 +40,9 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 		 "	.pushsection	__jump_table, \"aw\"	\n\t"
 		 "	.align		3			\n\t"
 		 "	.long		1b - ., %l[l_yes] - .	\n\t"
-		 "	.quad		%c0 - .			\n\t"
+		 "	.quad		%0 - .			\n\t"
 		 "	.popsection				\n\t"
-		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
+		 :  :  "S"(&((char *)key)[branch]) :  : l_yes);
 
 	return false;
 l_yes:
-- 
2.43.0.429.g432eaa2c6b-goog

