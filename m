Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF2C260566
	for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771165727; cv=none; b=GKlSEyW4dfmB2uKpEZdngYhgu7XTpYvm+E1IJgxOwfGPy8a2crKlQfRjYxz+0S/2BJLXlri/9bclXjag/ahaaWIeMOyKxPOTOyQTQ+urj/JTrN4wPqDlQmAuThQpQT45YgM9WxJ3TqDgXqVNrJuOGqXHicY3XHD5c2ZZXyPLpSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771165727; c=relaxed/simple;
	bh=UIsI38CxV5C8/dpQs7kHF6213q1DPMbGVu78V9Xy1IY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uu5PYvnL/1teHVG2m8UMHVTOPEwcJ1QvHd8wmo/4nVZUfkXcfjo2geDjMqw5Xgps0Vtpem8P8PqmBVYYg336dOyp4LKEriZzYcQrzWHWTOJGxi/utAuayWkEfWMeDM19Mo2jZnlX9EwKCF6v1p5LJGCrh0CCl/AqZpiTNH0i6kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebWaSUfE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebWaSUfE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so23644005ad.2
        for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 06:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771165726; x=1771770526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/1QT4RXhbMrOmsnwGPGjXx/hD6yj4KylbY6P+Zn5W4A=;
        b=ebWaSUfEL5AdnFzmWSsJ26ion2ffEcJwORfpYsoAATvqMqLa8EnMROn8NiUNm9HiaO
         EMdO/Uq1es27RPpR9/F5lCimeE+QpNgkAO9tiPC1ASqO5RIYC/yXNyqKlq5c1B8xEnXA
         MzZEk02BnBmyQw+hziPH8I6LZcNPp9J7LYovpnkogPBIEzWB4xqg0rEt3Wn/KSGV/pkY
         aX5QNISq4qTXUH5nsxLVfXGge+d2/aASvVcDJhNPghtjTcHCJLXWAsfDaahqWFRPp3Cq
         lu7ixL/VDGW87MzY4OyiPKv51otZT0LjTSMaq9nuaVckrNkEqhNDLsSxM4UznwPxQiLk
         6bEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771165726; x=1771770526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1QT4RXhbMrOmsnwGPGjXx/hD6yj4KylbY6P+Zn5W4A=;
        b=iBVQ0nJD1phBEX20GH9ubYDI8uEofic+Dru5iJCf5OEFLPin+XG3JiBC7lJilC2B8D
         LTbskhklTqiift3r4vfzNLv17iAaekfPNzLY2n2LR0cfjcc6R6WvtDacY6vcs4RLOOqK
         eMZ0HuDtZeFILcRU7nkVT+jgwm2TmGs82/DOw/JVJXruJ6lhdydISPb/rwFMB3wPqxJQ
         8FFh2eFE9qeyCyDhQv6usS5hYem+bTD0x22FaH0hiG5M8JA2HB2mumkcTc3I//7A9Hxs
         tqbs/RHBAI3Pz8rJqg0bPvVY0PbcNkyml9YFQ2k0VmKXo+/QIyVjm3xT7ZaxQdL6pjMT
         hzgA==
X-Forwarded-Encrypted: i=1; AJvYcCVFeZZYmKZ5zVo0h4969bOnIyCCen3KFgKJfBg4fDBkz15go1uBRy1QSxuASr5ExtU0Yxkd@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt1vhohCwnn2cFbXS4snKiFDUCVkDs2KRqcjLDLrJfJ2X6Q0px
	DNL0TShBpCOjNgk+iMhklsVuanSw3kgApPrHCX6zrkcSLWeBnLRKBukhNQrZg1xdgSw=
X-Gm-Gg: AZuq6aL0sT3fc9cjDqVcvEb9+HlypiH95BCpIRUlMU8kZkjqcBBYlfQM0+rIJ69Oeac
	yHrzQHDD53K/4C3uPW14EPSTQ/GFgSYL6ivhMiCOcl5AulXkZLODTcgmHpvcPKGt4qTTCq1mzlF
	Fvi/8YsD6Wq8rNuBEYpPAPesRfDQD1xDjNS+wN5hlUp3BYD9vexT9Gfh8/8Ls4vSlpiznBlnwKY
	tzV/ZYiRW113Pyl0WoMCvhMc3W+L/OJWF+5N5HYP3ZwCledt0bkEW/axFQ8RcaZ4y9nheE7z4j9
	Luv6hxdzhUszU0ew2galr0loUf0UufYhGwRfDf4Uf0bnryQeZQZroSDRYUBD/INdgSvrGtNLXGP
	e8hQEdwSsHHk8X0F6LIBRqlnAiSa/zaPxFr7ELqZ7Nk570XVzojnmoHI7cIhqhWse12tzNLvwbJ
	4wg6Ocd3QNb4HfbTEvpR04iUAtvCzvmsPLKCUfkSzOHz3s5kAuLkOlhJ2I
X-Received: by 2002:a17:902:ced0:b0:2a9:47d0:12cf with SMTP id d9443c01a7336-2ab504e9742mr70645865ad.4.1771165725885;
        Sun, 15 Feb 2026 06:28:45 -0800 (PST)
Received: from speedy3.lan ([116.197.216.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aae9e0esm45298925ad.79.2026.02.15.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 06:28:45 -0800 (PST)
From: "Marcel W. Wysocki" <maci.stgn@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	"Marcel W . Wysocki" <maci.stgn@gmail.com>
Subject: [PATCH] x86/vdso: use calll mnemonic for 32-bit vdso calls
Date: Sun, 15 Feb 2026 22:28:34 +0800
Message-ID: <20260215142834.1455794-1-maci.stgn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VDSO32 fallback functions use unsuffixed "call" in inline asm
that is compiled in 32-bit mode (-m32).  In AT&T syntax, the
unsuffixed "call" is ambiguous -- the assembler must infer the
operand size from context.

While both GNU as and the standard LLVM integrated assembler handle
this correctly in practice, the unsuffixed form is inconsistent with
other 32-bit assembly in the kernel tree (arch/x86/boot/header.S,
arch/x86/boot/copy.S, arch/x86/realmode/rm/wakeup_asm.S) which
already uses the explicit "calll" mnemonic.

More importantly, alternative LLVM-based toolchains (e.g. zig cc)
contain a separate assembler implementation that rejects unsuffixed
"call" in 32-bit inline asm context, preventing VDSO32 compilation
entirely.

Use "calll" -- the canonical AT&T mnemonic for a 32-bit near call
-- to match existing kernel convention and ensure compatibility
with all LLVM-based assemblers.

No object code change: "call" and "calll" produce identical machine
code (opcode E8h with 32-bit relative displacement) on all tested
assemblers (GNU as, LLVM 21, LLVM 20).

Signed-off-by: Marcel W. Wysocki <maci.stgn@gmail.com>
---
 arch/x86/include/asm/vdso/gettimeofday.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/vdso/gettimeofday.h b/arch/x86/include/asm/vdso/gettimeofday.h
--- a/arch/x86/include/asm/vdso/gettimeofday.h
+++ b/arch/x86/include/asm/vdso/gettimeofday.h
@@ -101,7 +101,7 @@
 	asm (
 		"mov %%ebx, %%edx \n"
 		"mov %[clock], %%ebx \n"
-		"call __kernel_vsyscall \n"
+		"calll __kernel_vsyscall \n"
 		"mov %%edx, %%ebx \n"
 		: "=a" (ret), "=m" (*_ts)
 		: "0" (__NR_clock_gettime64), [clock] "g" (_clkid), "c" (_ts)
@@ -118,7 +118,7 @@
 	asm (
 		"mov %%ebx, %%edx \n"
 		"mov %[clock], %%ebx \n"
-		"call __kernel_vsyscall \n"
+		"calll __kernel_vsyscall \n"
 		"mov %%edx, %%ebx \n"
 		: "=a" (ret), "=m" (*_ts)
 		: "0" (__NR_clock_gettime), [clock] "g" (_clkid), "c" (_ts)
@@ -136,7 +136,7 @@
 	asm(
 		"mov %%ebx, %%edx \n"
 		"mov %2, %%ebx \n"
-		"call __kernel_vsyscall \n"
+		"calll __kernel_vsyscall \n"
 		"mov %%edx, %%ebx \n"
 		: "=a" (ret)
 		: "0" (__NR_gettimeofday), "g" (_tv), "c" (_tz)
@@ -153,7 +153,7 @@
 	asm (
 		"mov %%ebx, %%edx \n"
 		"mov %[clock], %%ebx \n"
-		"call __kernel_vsyscall \n"
+		"calll __kernel_vsyscall \n"
 		"mov %%edx, %%ebx \n"
 		: "=a" (ret), "=m" (*_ts)
 		: "0" (__NR_clock_getres_time64), [clock] "g" (_clkid), "c" (_ts)
@@ -170,7 +170,7 @@
 	asm (
 		"mov %%ebx, %%edx \n"
 		"mov %[clock], %%ebx \n"
-		"call __kernel_vsyscall \n"
+		"calll __kernel_vsyscall \n"
 		"mov %%edx, %%ebx \n"
 		: "=a" (ret), "=m" (*_ts)
 		: "0" (__NR_clock_getres), [clock] "g" (_clkid), "c" (_ts)
