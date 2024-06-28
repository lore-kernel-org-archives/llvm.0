Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A8415886E
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575305; cv=none; b=tEiLYgnyMmZdHWdwA6Hr5qHrU0c/ki30JO7gty3kA/5Ii4W3hhbYhLVYujtzW/ZpDXrD4iOgt8Yq0rVPYZ8L3UA5QqLUKinbpafwSIBvjHYZ74HbaaZMGOI3PEMxuTll8COxhxccXquw0F+sjKU3L6kiQD4H6NXh1rrLxAENAHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575305; c=relaxed/simple;
	bh=p2HySWNSHl4lGfXVKZPfkGILCZymtqNKCJwXmlevm4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEVXE1DRcT3Bfp1Hg0bSCC3e57Q04TnW1N41bvF9j/Ta1tuXTNtOtyzE1arNRR4EglL7a+LTXfIOnqKd47L2ZD7iMcrivzbGqMIx1ag0sAfki24tWBU/hiUp9yvCheQsTpdOR9XIGgmE8l68Ab+x4hilWWY/OLzG9TQOlU4+Pc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=HTFzMA/2; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HTFzMA/2"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d5666a4860so291296b6e.2
        for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575302; x=1720180102; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R4ThAGGzyxzKL16VZ/3SLSpBqDh/fGCMoUEXeAx/HQ=;
        b=HTFzMA/20+TEivFxEnt+jPIaQloD/EzkyiVX1CH23uYUcjngADiMIUXFTMZbngkqgC
         UpFbZOJqDKVeIdJjUsCGVqQStabkXnVI90zFgTYAqWmMBfp8qnIEeXZUpfH1irI1TrWm
         GQpL1muydmEnjIwz3kNRRkFuCGifvCauOShvZL1qxhulY38EKSDkiCEI5Bf6GG3oxhvw
         fSc3sF2Uqs5pjBb/EdEPcvF1u3Zit5z1AeM2DvA3ykbS0cj46TSws/JNHpiWahPoJocC
         OafjFYw64PIE+PgbCsYKH0uGlwd8Op2TvUiqvzA6NiuNL7R6iGcO4+Lkk8Fx20d0w4fJ
         T1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575302; x=1720180102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R4ThAGGzyxzKL16VZ/3SLSpBqDh/fGCMoUEXeAx/HQ=;
        b=nXvmXbG+ClkgGsqPXE/IxMiWSl/ZNOrs4rz4pRvZwsdhojBh8XSEs0tNCEqYzaj1Ly
         dJpS6Nt5pVZL6ifZ0XKB3eqwEClVIoTLKQYJVbdObbO+rwIb36ymcA7CFFDomHOLCfJz
         VLUFzYf6aDUvV+iCH+tvbiIx+FwLqykAOlHn3jeWJ3S6EQM2Pt2q5w4plDe+3AVPwwzZ
         m65U3krO3WZ+FIlllW8rHD4xKUsPcLxz0VXH9RYxax23BPvlhBbikB6x1oi5WjX8VdFq
         cL4z3LU2TkENsM8lcGc1FCFZltnaXbcgLave43mp0ek3sSO1RtdX4g87tn5ZTmhmdkiR
         NQHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/JN464SP4EUoAHu6cBf6A8t2B+PMfht8ZOfi5J+buNZ0gartB60EBgUo1cn9KbaMJZRt3BS2tPEmVr8FxbaZd5RqrA==
X-Gm-Message-State: AOJu0YyVtjXv7LAudoOeUBFHlUUb6djj8s1p//5wi4KQfq7DwRTbcOeZ
	BUUpmt1RJB9jEOnrGPUwWTl8EHHZXrZFytBE8kBis6OyRh1Ti57/Vaz1PGPME7M=
X-Google-Smtp-Source: AGHT+IG4h5F6VzLgJwsJVSFf3Gl7LvgvGwcibgWFpRNTrZUraOpcCSEmqXroyM6n2QyUfXey/pxfEQ==
X-Received: by 2002:a05:6808:16a8:b0:3d2:1a21:782 with SMTP id 5614622812f47-3d541d46720mr17312078b6e.56.1719575301977;
        Fri, 28 Jun 2024 04:48:21 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:21 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:47:45 +0800
Subject: [PATCH v2 2/6] riscv: ftrace: align patchable functions to 4 Byte
 boundary
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-2-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4

We are changing ftrace code patching in order to remove dependency from
stop_machine() and enable kernel preemption. This requires us to align
functions entry at a 4-B align address.

However, -falign-functions on older versions of GCC alone was not strong
enoungh to align all functions. In fact, cold functions are not aligned
after turning on optimizations. We consider this is a bug in GCC and
turn off guess-branch-probility as a workaround to align all functions.

GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345

The option -fmin-function-alignment is able to align all functions
properly on newer versions of gcc. So, we add a cc-option to test if
the toolchain supports it.

Suggested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

---
Changelog v2:
 - Use CC_HAS_MIN_FUNCTION_ALIGNMENT and it friends to prevent reinventing
    wheels (Nathan)
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 704d4683bcfa..55c70efbad0a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -133,6 +133,7 @@ config RISCV
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
+	select FUNCTION_ALIGNMENT_4B if HAVE_DYNAMIC_FTRACE && RISCV_ISA_C
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
@@ -208,6 +209,7 @@ config CLANG_SUPPORTS_DYNAMIC_FTRACE
 config GCC_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=8)
+	depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C
 
 config HAVE_SHADOW_CALL_STACK
 	def_bool $(cc-option,-fsanitize=shadow-call-stack)

-- 
2.43.0

