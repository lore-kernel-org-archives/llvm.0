Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C181272A6
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342664; cv=none; b=X+cJo30rBwpsIwe8qVmujWVMS297vRyuE7fWy5+usXk6tVHY8TQ4mW0PAt/+INgMOhhphSS2Q/ua532nilM9/1bQC0U4G5I22ozhr2JtL+7pvWJcRh8gtJv0JmJg6zYuCPzFkqizip5yr4j6ujaT7mqbePcmFG+OjRHkUr0iqWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342664; c=relaxed/simple;
	bh=DHod4R95dmfxlATUYg8PEHh9KCB9O2la9voBWAdmE2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uGW0uw0OaHr3dSO5fShS7ds8LiR3+2MjqF3SBaYkOHoNupkTycO7g/u2dChBTCWvkzcAOUxT7Y8zEu2D7D/k2q9gx9k1uPovQ7aDXpP3pGOjQeor/wQbWaHge2Q/iG5FrJXqYpWr6cOPx+ym9IlF4+CTYRbPVIwGCAGg57/nxaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AvnDUlwe; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AvnDUlwe"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5176f217b7bso9410963e87.0
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342661; x=1713947461; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8O1l9DG1nr6tC/T09XllcDqc2JZrTHVCm6s1PJNYaY=;
        b=AvnDUlweYbv8jdAhevinsiiiSl3H6d/vDlDqDJVrB5J4TWeTGbWJaCfDdXJQXqvT7k
         p/UVzRarFyVdMWFxpn35QYsLvo1C/KPvaUOxn1KSqoYC7Ia48XtjSxEECBBfEC1EhCfQ
         9WHXJIrnKH+Go/jWAhnlho5ElK8gcElwW19xttiBNjakJefoVd9WkOvXkBp/MQ5d3A1j
         JgJCcOXVNl29mBP8KlGWvhW9hhur90KK/Fzuf2hiksExFahGZQj89q5YuU9Skr3jR8zg
         B9h4vaJI6oH1ALaj07trdKWSh3Gc0Kaju5fJ+DAqTgRvrVqjph1Zc78cGuLCDsPkv3sS
         jVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342661; x=1713947461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8O1l9DG1nr6tC/T09XllcDqc2JZrTHVCm6s1PJNYaY=;
        b=Gh7HLNMTZDXLOQUcuLl+q5ewKOGpf8Sdi2xv/vz4p0Dbjd21zHYpaDMz39q9r42SiF
         +mjCr3cIlPaIyHkCwxmrFV23SdBFvZDr5lpFU/Tdg4q66TLHeyKpU0tD+Hns+KFz1n1j
         afXhCmRGV2+3ZfmKnEaPVgA5xe7hpFTLpkvLUxuRwKOiNnUeZUwVFCneVJg6vvp0hOFi
         U6i+sYiJ5oTNW6bMKCyygbDse5ssWQYes3Lq/M6tY3z4E6NWaIsSbu4Q4Q2Q/L7QvubX
         EAHyLg4fS8a/UKYMNNFd/UlFrIozt7+6uDlqMC8OQqzUATSN6PIW7uNOdNoBXbqgfDyg
         gU5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVHMHAWkZ1a3YPhU/fKxo8J/PdPIJ3Ak5fY0gVWsrFALGSGrAUx8+b4HLLrTc95j5Aur/QWoBPtTrjER79Bx5646A3iQ==
X-Gm-Message-State: AOJu0YxnjTHY8UGdJeiXkxbkc24MNG8eCqDCtwIIUmRsp7o1eofKgZz4
	Jyo7il8+2vWn5DgYaCQJLdUQRqNDd7eNhWjw4M4fgJAB0A3sCKgZTMQ/agjlKfU=
X-Google-Smtp-Source: AGHT+IGUnZrEIHfBBbG4EyQF/+1ZV+ejt2IYqs6beIEUlrR/J6flJei6ybRM4DwGnqlKSCUa7KsxEg==
X-Received: by 2002:a05:6512:2c9b:b0:518:c382:3216 with SMTP id dw27-20020a0565122c9b00b00518c3823216mr8556361lfb.34.1713342661519;
        Wed, 17 Apr 2024 01:31:01 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:30:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:30:51 +0200
Subject: [PATCH v6 02/11] ARM: ftrace: Define ftrace_stub_graph
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-arm32-cfi-v6-2-6486385eb136@linaro.org>
References: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
In-Reply-To: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

Several architectures defines this stub for the graph tracer,
and it is needed for CFI, as it needs a separate symbol for it.
The trick from include/asm-generic/vmlinux.lds.h to define
ftrace_stub_graph to ftrace_stub isn't working when using CFI.
Commit 883bbbffa5a4 contains the details.

Tested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-ftrace.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
index 3e7bcaca5e07..bc598e3d8dd2 100644
--- a/arch/arm/kernel/entry-ftrace.S
+++ b/arch/arm/kernel/entry-ftrace.S
@@ -271,6 +271,10 @@ ENTRY(ftrace_stub)
 	ret	lr
 ENDPROC(ftrace_stub)
 
+ENTRY(ftrace_stub_graph)
+	ret	lr
+ENDPROC(ftrace_stub_graph)
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 
 	__INIT

-- 
2.44.0

