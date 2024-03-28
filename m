Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238050277
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613974; cv=none; b=aQ6slEBhOQJCs2JNTnN75V4S2RmzZ+lcx/kOJT+bg5odX+uEKjMwL9AnTCLiFiP2wxjLRczLLq+qAKMwxaTGB+IO2lPvdCYA5MKf1qkdVkri0LiGWvXAWdQGe7Cf3dW59w/K1gCtxhIO5GMgkk4nC+V84lYuqe1SQTUK8YlswZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613974; c=relaxed/simple;
	bh=8JBilCO4rzISfqy9CtdaAskJRpK+KW31lmyY9ln1vPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YtHp6C8RQlR4e3w8eCzqRtsJoVAMw/f2MHphkR1xZsx0XG805AzDjRLTbXQbE0nlLE50n+0D/2x4GYvOsajbWlTX7AE2gvw6+p0Oyylfo3hMHCc4mCsBPtdHPGgCBUVlKElM4J8vY/U7RiwHhHeLW6lx2cgDn3B6QrR/453ejJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dh9pjLYV; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dh9pjLYV"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56c4ca65dc6so745806a12.1
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711613971; x=1712218771; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0w4V8x7+aGb8z229X+5uqykrw6yy++FeJfQ8uxYhY4=;
        b=dh9pjLYVuPnjwC9oQAJ2c2ufh2jIvN9pNFJ05AG6d//yKY3bJJUz2Hfdj84Zynd3IL
         2tiFw1dd7tFMR+wrjlULR9CNxsTjqln5E80jPPWmfJJnxgf/jMntJKvyLYA4MbPM9noZ
         MrCAXVwmKXpsjV8MJUbVnWqSmKiyZfLEPyM01HhPlevKhAvbEpjsMi+s34kHrVPRDbVo
         Prfhr3Ya8A54jHj97o0x/ELeo11PnNKkIlPaHi/lRSGZTK+uWEVEzBjexVFpKiW3i65w
         yGVoNrVc8SoW71h+8RH0ZCq34KPwVxMM3L88qX0By/OA1OZmyaOyRImy15pyJiCaKhfJ
         Bzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613971; x=1712218771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0w4V8x7+aGb8z229X+5uqykrw6yy++FeJfQ8uxYhY4=;
        b=ioS7uMkOn+J6uDtssxZkoMAyo7nv/llA9NUfXCZsSAmtUnamHQ1lsIrbR2keYMu0tq
         h9M87/Vj6LbHrsmw28dyzaP2Zmt0PrnoDRMZuS7EoA6b+MZCpNNu4pEFslAt8+mqSjWt
         HfTmaKbdXsYkXAyJqolXjgM7m8nBI7uj1ZpVcGpVeXqBLOm3LbYuk9CSr3yP27Um+TV6
         /oh/jA/imjIj5SCoYrjy6xJBVpqleS0J+xP9Kd3mDfozMX45PAKfr9VX2OHihCrk9WA6
         Pe3qBqOQi2KUYLEl35IvIonTX2pRSY9NDCDhpqSYSCX4iC7swvkyl2aTMO++iTGnvo+X
         Vwuw==
X-Forwarded-Encrypted: i=1; AJvYcCWnmejwRLihhWOm11Ro6iHOTa/c1fvjlt2EDf3NfbRSGgI4OmBpBmgD2zuJkgdv5NF00fOKKsXLfCmeOQBG/x6YugkCcQ==
X-Gm-Message-State: AOJu0Yxk47A16sefIL3+b0N3U+XE71Oopn8SYhwVMQq4sPZv8qVXQspB
	e5m/GKjOikmeXGZVfOa+gGUDQJDqPGm/NQkE6YKAqzazrFK5LgE58bHoO7ps6vg=
X-Google-Smtp-Source: AGHT+IFMuVYCIFTpoTH4bYnhvKcaeqcoow/AucoEJQ3LZDOry1RJHyX/3QSG5ycGe9YCxcyz9p1p3g==
X-Received: by 2002:a50:8e16:0:b0:56c:3b7a:632b with SMTP id 22-20020a508e16000000b0056c3b7a632bmr1423714edw.29.1711613971633;
        Thu, 28 Mar 2024 01:19:31 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id n7-20020a509347000000b0056c24df7a78sm566397eda.5.2024.03.28.01.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 01:19:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:19:25 +0100
Subject: [PATCH v4 2/8] ARM: ftrace: Define ftrace_stub_graph
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-arm32-cfi-v4-2-a11046139125@linaro.org>
References: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
In-Reply-To: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
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

