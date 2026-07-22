Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC828411F89
	for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 17:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741109; cv=none; b=WLcHcH2/xO0wPhb9nC77bknfWnarGDzY8L21wa71AQ8I9ETX70LenLDSocVGt1Bf1mBDDXiXu8LGr7Uu832UmQYI64tru6Vdq+QabRe8Aum/PWz1C3cVilhsvqIPu3w4db/3aLMa1LwK8+zxaVMfa6X8dxhpK/gDa4P/bRsvZLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741109; c=relaxed/simple;
	bh=zWRJXCy2wjVlrC6Ts2vSMU+M0dIL/NNVsL3qymVX1C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GypjSc2g5xQmL3vm0wSUPCoyAm6X+i3KS9fqZG7T9AXaKY3KFInZe/P8MzB+JNjLg9Ef0REEu951WUo0fI6kcttpUsT4SpSuGNy9UC490xAnNYqOvOgMYW8HuFVAW9sqRLIdTRvH0RVtjoHgqC70/03GmQF8iuyNTq5T/lg9j7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4JAOYWp; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4JAOYWp"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485b358552so376057b3a.2
        for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 10:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784741103; x=1785345903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w/L0JEj1tAoEtTkbuyiqxCj7tfW27Vj36Bhq5Zj1YU=;
        b=a4JAOYWp6VxX2eXL0zoR20O7iwMnap8pCgZwH2oMJVmFJyP8eHw8IrTzxYQtS0nm3E
         kg+ZQps8uLM1vpQlHRn4DOH/X+0fB0HVIgWpdtFTeevXcFDgXwr1c5akPIOHWZhndwa9
         npbiQSAWAnao55FGxUzhySdBNPkphJxrjET5wGiLYKTZAo+5d5dc62JtgZ14/Tzfk7Dz
         X8bi4v1Svux4FC+HDEHtoBzKIF05NSa/A4LPyfK1je1ugGZd8pCLhrMrtOy1UxIfbihI
         46mM24I6l9Jdg65My9asFmanjuMO3Xe2JTu+hQUG941P7mrtx8K0l6KBdbC9IIMo7QjC
         NOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741103; x=1785345903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w/L0JEj1tAoEtTkbuyiqxCj7tfW27Vj36Bhq5Zj1YU=;
        b=VFqSdB7SyfmFqPqAMhGQel28nvlHoqZ7Yz18kwlrcq7TlShj7GWmrdAsqMNtVrrkzD
         rv2hNhFea5zHFfyTJW4ldQuHCYcTxjFUDQzREwGYtPXfd9lYgLnfJGgoj5xlmoj4R1Om
         1zfj9J2U36tZXrujuuBLOVp2XE9QSzcArngYM0jsxPUcgm4o5XRastugbdu95gV4WAsx
         8/JniVGfH790jc5mKapdU6CsUzB1wuBTpsTeSicDHsyU9uooGRcYEBQlKtMYibEBM1hk
         ocz3HFwKmsEz9OSyoRU+rbvn+yPHThhOFektCkSruBcBC1IJG4508xk8Ot+Jxuw/OOr8
         P1Ig==
X-Forwarded-Encrypted: i=1; AHgh+RoecRkgrKRj48pFsxXcygD+W14gvNwHs82YtifiCAQlQQgU5gcMHdO7obm7TQITzJ5GyrCg@lists.linux.dev
X-Gm-Message-State: AOJu0Ywws+6RT6N9PDhxRq+YyVSZ2hhh6PMU0Z5gLb1T9HAp2pYUaW/W
	b7W7u0uNoN5yughZ1ABR+9al0/lGxfQzRy8f6IkbjjymsCYc2y8gJ6ta
X-Gm-Gg: AR+sD13APQj4ATAWxzm/cEUvMgyGuC555GDA5rRajWL26NjxIo5Kwjr8Squ8XK7CBnS
	AH8fkPi7lCu4PPZKgJrLxH5jCmz6iNZZFK1PWWjO+CRrf4NOD30NawrAfK+MT2XnXdIVyj5h01V
	+blEE/3CQGxukI1kcD8piJkGLBx30DuQ7SNCapuraV1oj/umPK+yuCA6ufS+OgTrP8DD6ITfZWv
	WHnRWWqSDZXxPXi2InNuLOE/HaTSalc3wVPb8m4AmfZzuSbjdKNtm9bGKZcqc6RCyPabYby2yXj
	nsxVgZut1O1eh4uL3RUnlvAd3ewvJlKjX4AOybbftLjUCHFUk4ZwAMI0dRf/Qf2BgzymJMz4lgE
	xDFbQzxdDdFGIIkhrzCv6KPyfErs6LUeZOa/+FRtY6VF5nnr8dQfR/JfRNkuQdkIqkn0GlX7FIa
	d0axrbSC+wOMxZeRAiAngDnqpvCABZXgjgIEoMNZ/v+4xQ
X-Received: by 2002:a05:6a00:2e07:b0:848:2f84:730 with SMTP id d2e1a72fcca58-84c294e6a56mr23499585b3a.67.1784741102709;
        Wed, 22 Jul 2026 10:25:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1757488csm1645603b3a.33.2026.07.22.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:25:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SUB-ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels with Clang
Date: Thu, 23 Jul 2026 02:24:43 +0900
Message-ID: <20260722172443.534251-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building with CONFIG_THUMB2_KERNEL=y and Clang, secondary CPUs
fail to come online with "CPU1: failed to come online". The address
written to the jump register has bit 0 set, causing the secondary CPU
to start in Thumb mode.

secondary_startup_arm is ARM-mode code (.arm) and, on a Thumb-2 kernel,
expects to be entered in ARM mode in order to switch to Thumb via the
standard sequence at that label. Starting in Thumb mode causes the CPU
to execute ARM instructions as Thumb, resulting in an immediate crash.

Clear bit 0 of the entry address so the CPU always starts in ARM mode.

Tested on Lenovo YOGA Tablet 10 (Wi-Fi).

Fixes: 0cda07001a94 ("ARM: mediatek: add smp bringup code")
Assisted-by: DeepSeek:deepseek-v4-pro
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/mach-mediatek/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 6b0943d95555..9a7c65fc3ae1 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -124,7 +124,7 @@ static void __init __mtk_smp_prepare_cpus(unsigned int max_cpus, int trustzone)
 	 * write the address of slave startup address into the system-wide
 	 * jump register
 	 */
-	writel_relaxed(__pa_symbol(secondary_startup_arm),
+	writel_relaxed(__pa_symbol(secondary_startup_arm) & ~1,
 			mtk_smp_base + mtk_smp_info->jump_reg);
 }
 
-- 
2.54.0

