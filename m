Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CB02C11E4
	for <llvm@lists.linux.dev>; Sun,  9 Nov 2025 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762677451; cv=none; b=JUJ+tCWeghB4Xb7jQIiuJzMKKDq4rU8Etm3KDgqdq31FU4x0E+zWlNc+rMf8Wg1gKQyMtTBgo4jS/+dxOL6HMXbfgNyoK9qZCJyryQkssRy9pQF8MYXtq92c/VRUj0YAStjHiXRgH+pSGH3Vpkjjsky3Lq418pvV8FuiRbQDNGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762677451; c=relaxed/simple;
	bh=42SlGVlCpQ/P26E4xhlQely8LBdZ+0nU5CjNjqqzYWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=meOiXp63KP3zWJGNguKf0NhSeU7DWQe6/13QM6WUWnjebjsxuW1CFD1zf4KMt8rjn63TiHveTqOhcIpEg2RB5mYzEXVPOmy/gdPp7O08w3iQHn/nMQ2EEG3YernaBhz+fzEKWJVHqHFUgWG8CbfaP1laUF3XKyHqqETUN0Tb9SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=And0VUp8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="And0VUp8"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b18c6cc278so1990124b3a.0
        for <llvm@lists.linux.dev>; Sun, 09 Nov 2025 00:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762677450; x=1763282250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pai05e1hPAGzD+JDMKw8YIk3y/PWAM8SYYHTXpXZd4=;
        b=And0VUp8Pqjpt3yWxCjuGWoHw/r5dTuGKLaapDD+STDpIBEcKq8V3ZLMn9LY2hqRhR
         AvfHxsxkybQGqxbuW0zhVcINPWGHogOahE/FJ9YDEAMpOfKDb7n9nzu/qUjcw7L9d/ak
         rrUQ9FPVf6392f+9zMPOQXOldIGL0wlgoC4fNZ2N6v9W5DkmwrT9bpMCVSTG+DUXBQIc
         x8McC3RzBcrOPe/6tnIq3g4y6LS2B5ifOaaRK5s6DYFzB08hhlohmHDLitWOpVON6Rm4
         tQljQbpHAta2r8AOZty6Z66vs1swJcUppF2OXqzxNmi+z4Mm8b27tLN2bFJesulzefnb
         kezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762677450; x=1763282250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pai05e1hPAGzD+JDMKw8YIk3y/PWAM8SYYHTXpXZd4=;
        b=FuKob0cNdkL7HmltDlYgJDfKtbITOlDHjt4WQdnevSIVafd4sDb8vvAc8KCr72pchr
         EzKsNdg4oqiRtKPzgGjRnfLZxxO5PJEzyU1307f3uVdXKPB4j4rjY6PeU0nQ6F7VGEbW
         n6Bwa6iv7isapkdiWhedbjVPvPcDimz9YvpMbDHJik4CUTLyg+ejkWEW7q0fUEIuvQGY
         8hC1m+9JRW+35hWVqIlG5wZZZE25LC8HH0xNSrCufKb4yiDgv09LxgY/b9vSQLxpGn3N
         EyAdbfr46g47Ub2YTKcqJTFKTcWtdcdQ2tvLuNXOWE3gONRGeMOIyA2WOGGexZrjG1rc
         mDPA==
X-Forwarded-Encrypted: i=1; AJvYcCVe9nBE8WuO6h8rizWclu/gg2KZ0eCt2q3zH4hH1ALCg2g+K16x4LgVwWvVN4rgF9uyX6+j@lists.linux.dev
X-Gm-Message-State: AOJu0YzcRuxr7nkXh4VgC8Pxes86uNXxBs32/DON/7htoUWkUsUUc6c0
	wK1G35Vb8ugn4QjUsZaYUhCtPyv+jYgt/PJU50gEVtN6r8ZhH1zYyUB6
X-Gm-Gg: ASbGncsWAWo4bm6JHzHdcfWosl4Z4S7+UxGjIKwTptQA79YoCw/QjRC1WPnV+bMjk4L
	8cVZJ5SonpUw3bPK46l2oKQOWRVMX2xpPo4b8mRvl6V8YHZ3Y2+5Im9cJ29WXA5/eMGpVCWpdSy
	pB5UMolHsGWtkslIEh0Bz2DNfYnMjDPW1OKp1rgzFs0nWq8BiG0rrrDLF36MQstv+5XQtjCcegB
	EACb8mDc6BGrm6GwvbjJ0sVR4AUhSRY1RV5SnmL+1JE3gN8d6lYmBxY6ne8EXOa7tqbk2t33iK+
	ofUWZ7l63hXOgCQM41c6xsNh76iFnO81ZRHu0IlOqlP96Dm7rs5FO3OH4U8VeuvkizVaOrXywmJ
	adJob701W3kHHNh53QplvB0tUbKuRU5xrEQSffhjBqjWhrPTG2nbFG0gG9O5KeBoBFdad5LmnCG
	L5r1sgi6klRukmO4BcaHIjhc8l
X-Google-Smtp-Source: AGHT+IFKEu4tYw0M4y2gVr7qt+7rNApZrwM+nFaRqD3qTEIP52a3V5zmhTK07hKkia27YNGZFVwKBA==
X-Received: by 2002:a05:6a20:3d82:b0:342:3b8a:f33e with SMTP id adf61e73a8af0-353a1ae221bmr6350944637.39.1762677449580;
        Sun, 09 Nov 2025 00:37:29 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed21f6sm9934944a12.13.2025.11.09.00.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 00:37:29 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	masahiroy@kernel.org,
	jack@suse.cz,
	akpm@linux-foundation.org,
	maninder1.s@samsung.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: [PATCH] Fix redundant judgment in WARN_ONCE with clang
Date: Sun,  9 Nov 2025 16:37:15 +0800
Message-ID: <20251109083715.24495-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For c code:
```c
extern int xx;
void test(void)
{
	if (WARN_ONCE(xx, "x"))
		__asm__ volatile ("nop":::);
}
```

Clang will generate the following assembly code:
```assemble
test:
	movl	xx(%rip), %eax // Assume xx == 0 (likely case)
	testl	%eax, %eax // judge once
	je	.LBB0_3    // jump to .LBB0_3
	testb	$1, test.__already_done(%rip)
	je	.LBB0_2
.LBB0_3:
	testl	%eax, %eax // judge again
	je	.LBB0_5    // jump to .LBB0_5
.LBB0_4:
	nop
.LBB0_5:
	retq
	// omit
```

In the above code, `xx == 0` should be a likely case, but in this case,
xx has been judged twice.

Test info:
1. kernel source:
linux-next
commit 9c0826a5d9aa4d52206d ("Add linux-next specific files for 20251107")
2. compiler:
clang: Debian clang version 21.1.4 (8) with
Debian LLD 21.1.4 (compatible with GNU linkers)
3. config:
base on default x86_64_defconfig, and setting:
CONFIG_MITIGATION_RETHUNK=n
CONFIG_STACKPROTECTOR=n

Add unlikely to __ret_cond to help the compiler optimize correctly.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 include/linux/once_lite.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/once_lite.h b/include/linux/once_lite.h
index 27de7bc32a06..194c5ebbfbc4 100644
--- a/include/linux/once_lite.h
+++ b/include/linux/once_lite.h
@@ -10,17 +10,17 @@
 #define DO_ONCE_LITE(func, ...)						\
 	DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
 
-#define __ONCE_LITE_IF(condition)					\
-	({								\
-		static bool __section(".data..once") __already_done;	\
-		bool __ret_cond = !!(condition);			\
-		bool __ret_once = false;				\
-									\
-		if (unlikely(__ret_cond && !__already_done)) {		\
-			__already_done = true;				\
-			__ret_once = true;				\
-		}							\
-		unlikely(__ret_once);					\
+#define __ONCE_LITE_IF(condition)						\
+	({									\
+		static bool __section(".data..once") __already_done;		\
+		bool __ret_cond = !!(condition);				\
+		bool __ret_once = false;					\
+										\
+		if (unlikely(__ret_cond) && unlikely(!__already_done)) {	\
+			__already_done = true;					\
+			__ret_once = true;					\
+		}								\
+		unlikely(__ret_once);						\
 	})
 
 #define DO_ONCE_LITE_IF(condition, func, ...)				\
-- 
2.51.0

