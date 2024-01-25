Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E095A784
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706182399; cv=none; b=KS8ZN0v5t9dtMn5zddztRpnjT5k+1LTHea9O9kfZEI8dK2BqKvBTrXxkjqgxFmkthK3N/aukJeJvuCftK1A/n0hM0TSSjoX/AK2C240hzTWaYE1eJfxSG6eI4lVQbQOhV+/+VNCHVKkQoeDX1zg2nUQNaqGw1RkHrXGVQTQoQws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706182399; c=relaxed/simple;
	bh=OwW6wBuNpjoZwXNRvFnESPahBXLxFOjLZ++ayooCsxU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GBet4AcRMjvUiNoqEoe7m46V/nJg4ucG47FEqX8KSy2OSSdkx/zY7Hfi8S2A/aIua790cWkGul9T6ekiZ2vbOh8IQOKBULMf34WkvBN49y0g4PhgcQvWkq7is9BlXwxVEFoyXT2IFgLnUAzTUBx+Lj7jscfxc8K3bSYyWffMfqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pQ9Re5Bs; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pQ9Re5Bs"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-337d92e34d6so4637205f8f.0
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 03:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706182396; x=1706787196; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M0LWk2oJk+i7OdHacQS8szXmAws8+WmD6+X8i7Byook=;
        b=pQ9Re5BsqN6Kkh76s8OJzMSx05mR3xebccnM6x2v0uwLkUqba0UoEg/CI8FIRMD/LI
         dnXBopoR8V/jFes/2khhDX7bhWdFDDi0agxD5gfK8EBHmmFf4PdVEtzcU0V/6jxaphPp
         M2rlF8iIaSyzCCYfgIhpcS86TWfpPsqX+2cDbxk6NxTZkDzUHSDXoHpc1dVmAn6FW6KJ
         lYWguXYPnLEPy4v4bIwAeATjRZkjG6EeqwB/gYoNPqeadY/LWKI8BgCvkNH/kU0NuDvR
         ekJCGmdlwS0+oaG6wgkG6W1irRPsX8aIE7rqf++Sxu5SJBDIpa5H9q+pvLek+grm9l2N
         wK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182396; x=1706787196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0LWk2oJk+i7OdHacQS8szXmAws8+WmD6+X8i7Byook=;
        b=Y1iQ3wi+Um+mOlb8sikOupS6EnHwhsm6owkqJZK7Zyg8bSiJgkO+jfnNuCqP9ek2DJ
         NFUx1C4ARbVAREff30gETcpOrZum2RljH4t80fEvpWK++tGas10CNNEXHHusDNz1i72Y
         rgPqYmr9sx4+a2pk93C/+euIuETz4YE09E6prltye7SsONCN+7IZNeIjry8TpynYYYk7
         Dh3sgbaNpAn10a8Y9QBCMaPvvMg0RcXUndYhCU46nIJ8pAny2Rs1h7zvL47f+R3fu22C
         qWPvx9y2hshhVVWa2nrAn6bpN1MmovvLFAta2qSlQZUexfQrCnS/fzoWnht4xXW9YwCI
         90pA==
X-Gm-Message-State: AOJu0Yx66sr8biDnoNl0521IFX4K/QqcJbXgM93O2nH2gr23jB1rQbtq
	LnpwIMJGyKKuSR//5aeJpa6GbHm43FigR+PXveVuZ4wi/qbg6I2V0TA9vhpJN8ifgKxphw==
X-Google-Smtp-Source: AGHT+IG/Nfpuzk7bgzrZNwvHbfRYXZf+jimIHipf+XjfpPJSWyU5yyhZ8rY9HrGdokg9HeoZMcEye6SG
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a5d:4a04:0:b0:33a:d182:fda1 with SMTP id
 m4-20020a5d4a04000000b0033ad182fda1mr704wrq.11.1706182396410; Thu, 25 Jan
 2024 03:33:16 -0800 (PST)
Date: Thu, 25 Jan 2024 12:28:36 +0100
In-Reply-To: <20240125112818.2016733-19-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240125112818.2016733-19-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=ardb@kernel.org;
 h=from:subject; bh=hctyhPpJV0WOf9z7vrzpK1P7aPRf6ODhgzfVMyHZJzc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXWTG8sTO09G1eh3s38HbSvasYtlpd3913LP1YUZb+y3l
 Gtsejy1o4SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkgx7D94wEFmeVtglT7X2n
 ae2pfHhf8JzyxIQtHd+dJiq5nqrMYmTYsNiqaMdW0aOzHgsVla44+tL+ZWwd59c1V192eaTtZ4v iBAA=
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125112818.2016733-36-ardb+git@google.com>
Subject: [PATCH v2 17/17] x86/startup_64: Don't bother setting up GS before
 the kernel is mapped
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The code that executes from the early 1:1 mapping of the kernel should
set up the kernel page tables and nothing else. C code that is linked
into this code path is severely restricted in what it can do, and is
therefore required to remain uninstrumented. It also built with -fPIC
and without stack protector support.

This makes it unnecessary to enable per-CPU variable access this early,
and for the boot CPU, the initialization that occurs in the common CPU
startup path is sufficient.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head_64.S | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 5defefcc7f50..2cce53b2cd70 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -76,13 +76,6 @@ SYM_CODE_START_LOCAL(primary_startup_64)
 	/* Set up the stack for verify_cpu() */
 	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
 
-	/* Setup GSBASE to allow stack canary access for C code */
-	movl	$MSR_GS_BASE, %ecx
-	leaq	INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
-	movl	%edx, %eax
-	shrq	$32,  %rdx
-	wrmsr
-
 	call	startup_64_setup_env
 
 	/* Now switch to __KERNEL_CS so IRET works reliably */
-- 
2.43.0.429.g432eaa2c6b-goog

