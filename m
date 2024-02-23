Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66A125D9
	for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708670436; cv=none; b=eMuizclaVY9+Y067YSH4Y8Cz4CMRwVuR94qikH8Vqznc+WDpFSykhtmhRA0Mrtn6/tu+EXUNPtjBwWFYFooxSyvYFq6F91xUZMVqkULlPB8+dreyn7XXBggoeC/V6jU8i5IOilJ1XYuYt2bjewZHrg/UxW25moPeXk0Fij/+KIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708670436; c=relaxed/simple;
	bh=Jyw2KgNMUcRwAe/3vjo2g69lJx3RZu+Q5aJy6+FMHow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lctlHG87eSdU1TuIndQkVjy9lI73XvP6m1bn4/QwT7p3XfKJsc842Y0TQplev3JSkvU8KYW5NtE+00hSsudnWUUFdTdAU72MsrrqA1ThHFxkAD7yurT6Bca8HhXQ0JLTt+nek8+586v1w4YfRkWcqS977HKae2bvY+9uJhZdDg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H12nBDxZ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H12nBDxZ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e457fab0e2so392457b3a.0
        for <llvm@lists.linux.dev>; Thu, 22 Feb 2024 22:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708670434; x=1709275234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VlAxTgaIbiVQpF/ZQwxp07S3UGXkKE5YGd7hWgHUVZY=;
        b=H12nBDxZuKuYvIUwiJGThTdpH51y7Zs+9vE1q1Kr3zLSYo6FkMZllCh8i9w9eN+Wjh
         OipnEd3KFUQVurnT8G7D1PnSyXSu0V0J/XoEAMSsioFuOn9mWTknV6CLILzVJA2W7pYv
         B+CQscLvLw/2DH3xk/xazInP/zyFOx6t8S3lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708670434; x=1709275234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlAxTgaIbiVQpF/ZQwxp07S3UGXkKE5YGd7hWgHUVZY=;
        b=ZV67ohux6DpC1XWrLYcSWxB7LhyqbUuuX+o0eCGrf0wDpbiO6GT+FpOpQG26fmXCJs
         eiGrKrSXEr7xlxuSX2nc2zY84/o6kbuPhs7qQoeUJFGl8MnOftD7w6Jdw7vG7Oft3762
         Soneu4T/pkhIDR3tESo/KznlnyFVx9nD0rguOB18ZqUR+GnL28Abz/TQrfw0MP+7Qh7k
         xaPxiRxozblFkYLEVsxlCCPUuZdGH34pFk/rYoetLZEevLXZn3meDCsIRpthat+Qh1nS
         LArTbvKmmNfHfddy6jTvKyURSmDEJjD8O1Sy4vi3eDyC86KyQSgcbC4EpbmaR80Xd68J
         FZfA==
X-Forwarded-Encrypted: i=1; AJvYcCWN32uMxJo3sQa729KOhxiVpNu3IMiTOC5DyoGuUVALAbE4PpNxWhZTS1cJSKuE9YSsQmXT9IjaZVGwf9HtoRO/ymNQfg==
X-Gm-Message-State: AOJu0YwVZgZszA6fiE69oIzDM9u06aC4OtW295gj35V2JBzDfEJOWoka
	S6YeygbKwdwHAPI8mrX+W8KDpdpY8UuBTNqiKwb/zgN3ZeYuoSia0fBA5D8Bwg==
X-Google-Smtp-Source: AGHT+IH4UFzwgV0g9dgBCvcLiwOp8510IaCSr0SQ/rg50PPnqosFI2z6O/vgddexixApZQrnaAjOmw==
X-Received: by 2002:a05:6a00:4307:b0:6e4:5ff9:f037 with SMTP id cb7-20020a056a00430700b006e45ff9f037mr2262350pfb.12.1708670434104;
        Thu, 22 Feb 2024 22:40:34 -0800 (PST)
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id fm18-20020a056a002f9200b006e484e13454sm5653680pfb.32.2024.02.22.22.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 22:40:33 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jason Ling <jasonling@chromium.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH] arm64: ftrace: Don't forbid CALL_OPS+CC_OPTIMIZE_FOR_SIZE with Clang
Date: Thu, 22 Feb 2024 22:40:29 -0800
Message-ID: <20240223064032.3463229-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per commit b3f11af9b2ce ("arm64: ftrace: forbid CALL_OPS with
CC_OPTIMIZE_FOR_SIZE"), GCC is silently ignoring `-falign-functions=N`
when passed `-Os`, causing functions to be improperly aligned. This
doesn't seem to be a problem with Clang though, where enabling CALL_OPS
with CC_OPTIMIZE_FOR_SIZE doesn't spit out any warnings at boot about
misaligned patch-sites. Only forbid CALL_OPS if GCC is used and we're
optimizing for size so that CALL_OPS can be used with clang optimizing
for size.

Cc: Jason Ling <jasonling@chromium.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: <llvm@lists.linux.dev>
Fixes: b3f11af9b2ce ("arm64: ftrace: forbid CALL_OPS with CC_OPTIMIZE_FOR_SIZE")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index aa7c1d435139..6b96d75a3a3d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -198,7 +198,7 @@ config ARM64
 		if DYNAMIC_FTRACE_WITH_ARGS && DYNAMIC_FTRACE_WITH_CALL_OPS
 	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
 		if (DYNAMIC_FTRACE_WITH_ARGS && !CFI_CLANG && \
-		    !CC_OPTIMIZE_FOR_SIZE)
+		    (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
 	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY \
 		if DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_SAMPLE_FTRACE_DIRECT

base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
https://chromeos.dev

