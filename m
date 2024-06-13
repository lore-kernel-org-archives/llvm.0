Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E713C912
	for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718263994; cv=none; b=lJy9qjv9B/oOVR1rrIdXC9jnB0kVR3cJXBhhFhUdZCIN2Yv+oWGexiufzY/APPsLsqYnjyQDtSwtNhjB2eDQAOdzgVs+QC9rRjMUZf4cJ9zvPnvEjxU8E5tklyRPMIwBeBOHSOXKnDfX/oN58gr7qFPteLAYbgqohoLkE9oj+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718263994; c=relaxed/simple;
	bh=uoTnrqYSg19kqb0lgMH7SLS/qe9dnaqbOD+HJnS87Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=haQr3eVJqzHK/IG0iGhtYKVhWU73HwGgNhwP66rmWcD4pf6YedtqBrU0z3R73mGEGMawb4YFw4623GCb70Zr8LzFXeND1Ciagq4Mp8FmiwPpyyG3ED78jWTR5Sw4cip1zl/JJEUfsqJ7bZ7uYIQh/TlQbm8ZdvFqLTdOUPngYXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=d5RdomNf; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="d5RdomNf"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6c5a6151ff8so515702a12.2
        for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 00:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263992; x=1718868792; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlJIkXaRaXYEOo0FtAy4w5B+d0jhj99dMDrjOpWfyi4=;
        b=d5RdomNfqE52caPrqSucfrmfNRcrSmPbgCV0y6LwwvqQiEr928wXZbgzbOCK5RhPu/
         8bEWnYcFWb2EIiRAmJCTiF50+srCHttxxGKfnykuzwZHP4UkqfYDUvB2iAuEdJoctoVB
         va+ruUXFnEHOYaZja+nEy+lDgFr0b45veRYVKk5jepgMFXSqCtafwH70bMPIIwkV4Ngz
         Hoa/IjftuqQ8rH+jE6lgJYYlExddA4bNwau0CZQL66EP1zTx8kGc8g3Sd5OZxXBXpeEk
         iC18/8qq1nH/dEPBYaPj8K3NfUyr7P3uWxQ/hlkmsNaGeIV92I/xHGbDH2RN6gc5BcXT
         p5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263992; x=1718868792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlJIkXaRaXYEOo0FtAy4w5B+d0jhj99dMDrjOpWfyi4=;
        b=jJRvK/lE4/spS4+RckAHdSgivJQRbGUzrJFveYDckhL4srI6DebHh8I39QfQ/6OT2/
         1Vxj0TKs3+DhnWq4a/YAE+A8p2CvkNjyo0pP6yn0mqXyclETRRweM/Q+6IgdTVyIPl5z
         OaWtH6p6UDG/5nDxLq9xLNmpN/CYSJcfIG2z3zTnjHprBcqN/YOWn3SoLRj2kbKJtu72
         OQbL4a1b6aqKKGzmJyyWPEL4h5E1u2ReYDScb6ANcRuzKKOcVTTD0yUPM7Z2gbdbRT0C
         w+961P9QjTXlm/bMIRD/DQMRyR+E5OMD4LmRr7Isojej9FRLyVgVYUlJ/Xg1fmvsHzL0
         j5SA==
X-Forwarded-Encrypted: i=1; AJvYcCVzYEA5xKSvkSuCpEa6a7Xifd2WXTZI7giT+D8YL8cyeHgjNC0E0PAsIq3xSmSMQuA46IcFHgagwUljYSBqkK6vWG9+8Q==
X-Gm-Message-State: AOJu0YxSwnndKJ3CSWGouXGyPFSlKmuhYCUL6TjzbwbFquOrVmeci2lx
	GFZNN98xbweXxE4ZzQbqMLFkrHQdOVx5Nm0+mF9PZVpODFipIMJN/MJ9i7Z3XgY=
X-Google-Smtp-Source: AGHT+IEyM0ONI7ICTx6DjS1SeAdMKnjMDIyvhgY/AOB26Jk18oYzU1QW75t2bRm257+1EVhnYwVCTA==
X-Received: by 2002:a05:6a20:3d88:b0:1b2:a889:f7da with SMTP id adf61e73a8af0-1b8a9c887fdmr4702279637.55.1718263991983;
        Thu, 13 Jun 2024 00:33:11 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:33:11 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:13 +0800
Subject: [PATCH 8/8] riscv: ftrace: support PREEMPT
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-8-1a538e12c01e@sifive.com>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
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
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4

Now, we can safely enable dynamic ftrace with kernel preemption.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 80b8d48e1e46..c1493ee1b8cd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -133,7 +133,7 @@ config RISCV
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API

-- 
2.43.0

