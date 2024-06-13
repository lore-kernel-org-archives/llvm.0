Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1EC13BC38
	for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 07:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718263965; cv=none; b=hEYpmeNVwhl7gQyx6TMfKms/RwMDB9aZP5/hiOeV0Fs2mFX9maVXqPvCf8ah+sqDvqXaiG1WfiL/ooLhFSAMisoWoLFfz3GyOhn1AANJRQRFlCXVHPxNXi12WkK4hwmer0DPBXBDJdbK43GYtQbIILCE1tamsNokupr7lBlK4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718263965; c=relaxed/simple;
	bh=JiXCsJYbgQAz9+R6zTWp/RApNEHB55TEiq7HnF4rVDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpDC8aPA/Kh75GSZ8ZPVzuA8yUxq3dAEpYIrGNzDS7D6mtWKaT7RCf11928Onsvo/vbHj6cvrcnIl3CRTQQQKGBZQqvZeo30On0kAkmPNXMMwK2Kc8rH6rp5Lp6IuBAPBvXzMi3MD7kjVNunlyT864Ax9JVuMliVDWMW6Wr46IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=i586kJT9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="i586kJT9"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f4603237e0so519918b3a.0
        for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 00:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263964; x=1718868764; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90j1lP2iehIU9E2euRd9xJoPIJsKCYmj2Va6/Ket5KI=;
        b=i586kJT9STpR6q0uGWT+KcwhOEsSyaBcCH0iqbRCSAmkvVKC0oP80B/9pyjubmmS5M
         IWXnppmqRCe3CKJN5sLaHYZmtko5qy9ziNv0DnFtY55Q7PI1mUmg/cSyXKigcq51P76H
         c1/OyNKHCqrSKWfP+wZEhb1L6U50C427kXWY6KL5nGn+f1KdT4nvteTwwhjDUqi4QIBu
         ErmMXU8GwjUHTslnGpwmw6txCtiQOlc4Ja6Dtj3LvFt5pOvRicZQ8bSkRHNQAbISjh13
         UiTfusVV5XVFF4OKqEJbW5weuFEcskn1ghl9YEFhs+t3ZvEPBc0YDKmn8ViRUPGqzQa6
         RmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263964; x=1718868764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90j1lP2iehIU9E2euRd9xJoPIJsKCYmj2Va6/Ket5KI=;
        b=cic7IknOqZnBJC+JT10x+oHmXQe7CiaGv3qH43g19g9+suqjbp++1cGhnOmVv25p9f
         Psf1ZL2AfzFuo06JgdpzBy6a2ZH0lUC2ds0pVDwE7Y2LxTTFDwKG3hRVb91zQN1Ap9EG
         ryBFvPkqxjtHkMqSxVg8XB83KlKny9vNCh71r9YD9HSAhoilcZAqvjiB3R3/Fpvb3g2K
         w5JHtL96qDqm8vTTpTT4ouMwsGlVJ0aXy+IXiU+m/VdA/LGU3Pg/BqLD5jP3Np+cOI16
         XdPxtZReQ196b90vr7BpOVErx6AuWwH2rFVKmOCd2gn32YCzF+YWjjGf7Mns4aU6VF9t
         ib+w==
X-Forwarded-Encrypted: i=1; AJvYcCVvCb3HPOXlbB5tjW5J4wT9dchcpbD9dRlwkr4nYXbU7X1YhdnRxanEID5A4HhGF1IoxIeNlPLLtd5i+5S7WRttV2TgAg==
X-Gm-Message-State: AOJu0YyoLoIQh3f89XYeiJQXxGPzZqMmqrutk9CNqUC/0t2KiZ1mRz1y
	kUeD7+LJm3Dk01mSPYUFtUJpUE+kaFCKXOUpPtD3XiW8DbvrlDGqZmcvjf6crTrE8l4u6kTdzHJ
	0
X-Google-Smtp-Source: AGHT+IGTwQ5EB55toThK3E4Aeh/60oGzOVaQMTb+lJV8UkAi/aBjTebo3WO7lB+gn84w0BlxoTDk4Q==
X-Received: by 2002:a05:6a00:2d84:b0:705:a18a:686a with SMTP id d2e1a72fcca58-705c9389332mr2770164b3a.7.1718263963654;
        Thu, 13 Jun 2024 00:32:43 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:32:43 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:06 +0800
Subject: [PATCH 1/8] riscv: stacktrace: convert arch_stack_walk() to
 noinstr
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-1-1a538e12c01e@sifive.com>
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

arch_stack_walk() is called intensively in function_graph when the
kernel is compiled with CONFIG_TRACE_IRQFLAGS. As a result, the kernel
logs a lot of arch_stack_walk and its sub-functions into the ftrace
buffer. However, these functions should not appear on the trace log
because they are part of the ftrace itself. This patch references what
arm64 does for the smae function. So it further prevent the re-enter
kprobe issue, which is also possible on riscv.

Related-to: commit 0fbcd8abf337 ("arm64: Prohibit instrumentation on arch_stack_walk()")
Fixes: 680341382da5 ("riscv: add CALLER_ADDRx support")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/stacktrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 528ec7cc9a62..0d3f00eb0bae 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -156,7 +156,7 @@ unsigned long __get_wchan(struct task_struct *task)
 	return pc;
 }
 
-noinline void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
+noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		     struct task_struct *task, struct pt_regs *regs)
 {
 	walk_stackframe(task, regs, consume_entry, cookie);

-- 
2.43.0

