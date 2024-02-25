Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D891B952
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708891699; cv=none; b=iAfuITx5pFiiG6qne9Hh7RsJ/N+a4UVasZbBQfT5M4BcUdQ7Wmtfed7WVui/hT8N1jv7TBGmhuG5+ebvQ0K7efGyvA5gK6Yxjuc1m/XNgJcGewTj0rScmHvjaGH7aWw4O1FMinUO6QJORlUjhppM212wk48MO6YIW7Dqb7RNm8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708891699; c=relaxed/simple;
	bh=WjpCRBe+vZFn8yoU6NIkWivSfH1KKxda2QhHNT+5kfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Utbd3fhCqGP6lL3QheA0HrHW6DEBackzUmbtseCg4PGzXmY6cIzq3uIr7DdIVaQcZnVEvMHwhhtmAas0eGEvX/em7CnDrzf4voEFli0PO87YM2cdMKrYxRhzWBmeTRf8yeAA5X/Evj5NhL5P+OcfPZcn6EexPTWgcOSp73I944s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qzWYZGfG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qzWYZGfG"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so2642109a12.0
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708891695; x=1709496495; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B30jBDh8l6oorNFVXLBM1TGNZMOeiKLndpCjpsCjwrU=;
        b=qzWYZGfGFWjQknLyRNqaVxa+Thj4aGs1RgGjJHhmucaWQcw7lYhQwcyp/RmKNiMnI8
         fD7ONwsktYR+Lzs9lnvVM5rUI83R63Vrsq6Th5uw7OeWv50mfFAVx3hq6sRtlEBxNgUB
         YekGqXRsjVq8ZhdX3PdzM4tUDOdHqRdUY6QmDJL9LyzEK7pHGAhzfJAmTXL0tH74bD0+
         G9rxSZVu4tKs+g/W8gklZm8jI5BPlMh4hvjBFI+ib/nQHpJu2e07++njISXpF2+M0tQQ
         sFEq69rfeQGZJsAku5EyoXND/Lff7psdkuszWiysvnQKweIut4EAmDdJqkItdCtaWicY
         m/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708891695; x=1709496495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B30jBDh8l6oorNFVXLBM1TGNZMOeiKLndpCjpsCjwrU=;
        b=fH81RiAlmxpI01fRYaCMJ5Z0rhDVaSk818kA9gIAGzhEkQiMVlf/T8L1NTey4Ptz+v
         KuAme1BEq9Hlf6krTEnMkilRrleGDwkGPHH92gyzeWuc6ayRZ0vKDbg6bL86nmcS9zOd
         X/ZTWMVSJ99WFvlvOt8QeQ5sCubusGYzxnunTzOzvGsImK03HoR/V+kTp1p3yTdNfpLR
         4o8tELjcldP4H1GXsBeHSc6W1bUmAam78tEu0fEmx4HDRgDabFCoseeP8n+nt/5ZcEul
         vw1tHk9voV9W5ieDvsGWHi3gp6YcY7KYr73cd4qm2LQTzxPpP3HEGvAVPxUlSrAL3Yb3
         ju0g==
X-Forwarded-Encrypted: i=1; AJvYcCU4Mw+nvu0aTeU1blIAATLyrwPxGnxgD/4JhuwkRffMwB8/p2qgigifNn38HjcVkKog6oS4Im9Byo32PhwSjxjRBnrWxw==
X-Gm-Message-State: AOJu0YzPs9kXmxAMeoDRPFZA71xTP4W+1GecVqQa0zMaV/BtjwzKrYfy
	XRyfZ9fZJPN2i91bjkJoi4czs/VUma9aG3MXXrpBkOutwHdx2fx4/bUag3VE4fE=
X-Google-Smtp-Source: AGHT+IG2qoyuh4S+jfoRRx1zENZfd3lkef19UKCSeTtf/j2FkZhkfI+btWJuX2mCaASM5yFXpwUUiw==
X-Received: by 2002:a17:906:c00b:b0:a43:292c:7c38 with SMTP id e11-20020a170906c00b00b00a43292c7c38mr1353402ejz.14.1708891694976;
        Sun, 25 Feb 2024 12:08:14 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id hu14-20020a170907a08e00b00a4340138ab5sm504621ejc.5.2024.02.25.12.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:08:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 25 Feb 2024 21:08:12 +0100
Subject: [PATCH 3/7] ARM: bugs: Check in the vtable instead of defined
 aliases
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-arm32-cfi-v1-3-6943306f065b@linaro.org>
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
In-Reply-To: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

Instead of checking if cpu_check_bugs() exist, check for this
callback directly in the CPU vtable: this is better because the
function is just a define to the vtable entry and this is why
the code works. But we want to be able to specify a proper
function for cpu_check_bugs() so look into the vtable instead.

In bugs.c assign PROC_VTABLE(switch_mm) instead of
assigning cpu_do_switch_mm where again this is just a define
into the vtable: this makes it possible to make
cpu_do_switch_mm() into a real function.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/bugs.c     | 2 +-
 arch/arm/mm/proc-v7-bugs.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/bugs.c b/arch/arm/kernel/bugs.c
index 087bce6ec8e9..35d39efb51ed 100644
--- a/arch/arm/kernel/bugs.c
+++ b/arch/arm/kernel/bugs.c
@@ -7,7 +7,7 @@
 void check_other_bugs(void)
 {
 #ifdef MULTI_CPU
-	if (cpu_check_bugs)
+	if (PROC_VTABLE(check_bugs))
 		cpu_check_bugs();
 #endif
 }
diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
index 8bc7a2d6d6c7..ea3ee2bd7b56 100644
--- a/arch/arm/mm/proc-v7-bugs.c
+++ b/arch/arm/mm/proc-v7-bugs.c
@@ -87,14 +87,14 @@ static unsigned int spectre_v2_install_workaround(unsigned int method)
 	case SPECTRE_V2_METHOD_HVC:
 		per_cpu(harden_branch_predictor_fn, cpu) =
 			call_hvc_arch_workaround_1;
-		cpu_do_switch_mm = cpu_v7_hvc_switch_mm;
+		PROC_VTABLE(switch_mm) = cpu_v7_hvc_switch_mm;
 		spectre_v2_method = "hypervisor";
 		break;
 
 	case SPECTRE_V2_METHOD_SMC:
 		per_cpu(harden_branch_predictor_fn, cpu) =
 			call_smc_arch_workaround_1;
-		cpu_do_switch_mm = cpu_v7_smc_switch_mm;
+		PROC_VTABLE(switch_mm) = cpu_v7_smc_switch_mm;
 		spectre_v2_method = "firmware";
 		break;
 	}

-- 
2.34.1

