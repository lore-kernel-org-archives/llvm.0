Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFE012DDA1
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821337; cv=none; b=i+hjqjMT5BTXqDYvuSNkgn5YYDZjAYR+gbmHPn/qCLbS0wqIPXVx7kfW5eIQOCdh+2mL98n2RgkXory6M4G0XM1+RjNdHMyUQIrgc2weC2VuodUnHlsIhj0t+81htB50Q+WY9YGe8zXgLX6nqqIpWOVlXI63uXT8WXTp7gXanjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821337; c=relaxed/simple;
	bh=SHe823c6VGye6PdlJLuHS7JghDZjsCULh7bG4duNDrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULJu9wc9xs8CJr3JfLOz5iuVPInz1nBQQ0stlhgPH63+NugsvmKrd8SOp8V0VZ7VhlRmkSlJ8ZBOlJYymLoiv9fcmJ2oBqP6LQbj9YzvyUOZIxnrWjRNFjgv0Oa8GT4R/+QV79XyG5KiGFaqg8851DKDGJvnnO9J6FzojVPjCMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BVe5COvg; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BVe5COvg"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51326436876so1107535e87.1
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821334; x=1710426134; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7VN7dAxY/atiKl1Kg9VLJc8sP0Tkd5ODVxcz6HIAw0=;
        b=BVe5COvgk38QFeAJw+i6RxD45mFc0iRM6zSUu0vqkF7NGy2A2hFKIYN/t8sfYcrnwJ
         3jgGH1MoWr8JoV8G9jCGZzIAUequoe/IvUw5zKfqJE+kB2itzoP+3zuJ9TvbuHL3dN4f
         T9G1AmCfOG0yfdwEzxGu+oGIqpV0tBeyXDTPb/2uOEqrm/ROFT2PyMbV3hPtbShrymyR
         w5d/i25Gwk2sh9ig6Z2M5d82cRHtskZ9KFq5eVpgu5Iq4UqK5y8ARKCUQX30/H9FeVOu
         2gCte3WuOYIVPtnKpkkiTmTxjyTM/Qu7REOrcYFgjKQNkheo8R3r2JU4YyYndu2IL5CI
         J0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821334; x=1710426134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7VN7dAxY/atiKl1Kg9VLJc8sP0Tkd5ODVxcz6HIAw0=;
        b=HPZt9VgRKEg6Ugz/e74hw/BBV8/S8aFEHL9OBkfYOdMJoSUQ9ufAin0fOSnjZgbrIn
         aDDedvVCUvo6u8GIs4N4t7gV0Kh4VrX+44rPHdDQZVQ4dZL/so8FOby/8+/OfAMCOGw8
         nem5cCv+V7rbmrhjxIRqa0gGiEdbrIdQg3yJJgyq5lVPl6e0re2wO7AwuboNIl3ueGha
         El7qxNJ28vlP3c4BNu/mcAF7eZ3f7us2jRiwS2QDXJqzLjwb5kQLSPxAEx9Lje2eqDJZ
         0CYpyJh+RKJnSBBvKNoXIy9ffpd32F/bvpOQA77yzDdo388sVpWw+sLDSe35Z9TNjeNx
         gbQg==
X-Forwarded-Encrypted: i=1; AJvYcCUAxtpW754JDFWtPLHWs1l5ViXip5tHB0YkQQiovOBTcXAe1YzL1XcGRbpsXn5Keav6eFyD7C3uYCL06Oa/LeC5HygItA==
X-Gm-Message-State: AOJu0Yx7nrWXTiWMx1kZSgds2QcJMTlXROiFDH7NVmhdSU3N1t0sxTwu
	ZTVc8MLIPmOGa/l21JaK2fn9m6ItMimli4e8+MqWZbYLWAS+46Kl9G+x7jYA/d0=
X-Google-Smtp-Source: AGHT+IGuVdEctc6eZaqVDqgJkOSPcRt7FloO7oS7Ik9PTreXsBbLelwTC+GMVqluqHoE3YBWXS+GEQ==
X-Received: by 2002:a05:6512:1107:b0:513:df6:dcd3 with SMTP id l7-20020a056512110700b005130df6dcd3mr2367653lfg.48.1709821333814;
        Thu, 07 Mar 2024 06:22:13 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:13 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 07 Mar 2024 15:22:07 +0100
Subject: [PATCH v2 8/9] ARM: ftrace: Define ftrace_stub_graph
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-arm32-cfi-v2-8-cc74ea0306b3@linaro.org>
References: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
In-Reply-To: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

Several architectures defines this stub for the graph tracer,
and it is needed for CFI, as it needs a separate symbol for it.
The trick from include/asm-generic/vmlinux.lds.h to define
ftrace_stub_graph to ftrace_stub isn't working when using CFI.
Commit 883bbbffa5a4 contains the details.

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
2.34.1

