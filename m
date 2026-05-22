Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8AD33F5A9
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 23:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779492654; cv=none; b=iDYaa3aPsK6y4vf/+jXwDKT8HappXxnnefXk7Hl2qyhOdDuSS2moUDrMt7mHjePdXeqagFsss1mOtz5dP7Ki+M3VxNIP4JqG7rrbigP9z+tuQIuOs7JKYmDIBZHPazOJAjjFbj0hWOObSEtgPalbp7b4R6ClrTHhdPVUWzJCFl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779492654; c=relaxed/simple;
	bh=vvmjUek1QzkG1Hk5FgNGb9tW9zywdDL3NFyvPD5zYmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YTN0hpi++pOl4ENOG4lpV+IMkGdJeTCeBgflLsSbMSyrI5O+lLH9d3e25Vnp7o1LnqB5aOyWQoCTkME4ACaES0hsb6Y20J2IPNcc2f5lUiNZPgT1/qdMcpQfgfES2j5stNB3pag8jefjp0ofe7tY+CTnDEjBGBMi7YVz0LywezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJS3MQmB; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJS3MQmB"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-651c366f7efso8202953d50.1
        for <llvm@lists.linux.dev>; Fri, 22 May 2026 16:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779492652; x=1780097452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVgXaIjnKTC975MfdRgmXFyZkQKLmkaHxhR1b9izJDM=;
        b=XJS3MQmBjk9ui9YCKvTUG3A5xnbNx5vnVT4hn3qBZWnM0FklTqfl4/djLIP0P9asP2
         67NZ9OrVZs+gG7DAhSZT9VSrZtnz+G4Xn1mtlu0fohCFlinFHhhsFDsaEOz68XYa05Av
         plysStmZ68zSyicB4COdMKD4x8CH1YmdWUydN9jBHL9DhpzmNlOwMlh79a6IflNwk7Sr
         +nsMtVbzVO6Px+9F/HqTo8SqPtdJ1AAEPeDi6FRzwKPGZgtIWJ8PyQVbVKdBToh1RaAK
         ja5RhvTroz6IsYtiD4uPVoowqYPBMkkwh74/QhllnpyNAZAvBJsxYbijntaA6X9Y8yPO
         3UDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779492652; x=1780097452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVgXaIjnKTC975MfdRgmXFyZkQKLmkaHxhR1b9izJDM=;
        b=KTOonVmKsYjxSH4wt5n+Zm20K/XEO+KHOvv1o1Nj2dbQoHVqluVpQ8auZpNMSNvLoo
         NLbl1Z+d+hj9nhh4rk76y1+bb+uZU63UB7auQbjA0gz0bkca/y3bVf0FkdyVtXx4rxXy
         88B3iZEiOneVU/hBEaQuh9KKARDzEAvkJNSjwJs/2TqRfS48yu8spmYdgZdMiB+EpW8I
         dS0TI9vMOZbsdz9ejvUj9sc0Wz1bzFa4dIaJNQRKoiaWA4z6GSzK+95LcvlDBNCbEc/c
         xRSbJw06eXQiavzklvalZe0Vr68j+DDTajZU26GHW4P0fBKXDiTIrEyCCoEAScw+3EbD
         dtNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+t3t33v1qqZt8h+WBK0wbG/+6h5mBGUbsomxXX0lq5meAqXye/feBpXa4f9TWVjbF20JWY@lists.linux.dev
X-Gm-Message-State: AOJu0YwvkJhh6SbhlwIec59C98T25uws7hsYU2lx4B3AnTJ52lLvtetF
	NNwmuWfjx1tFz9pG/gwkaeJ4PiS0LtGvmbMOD1mBHF4/R10WIeMfioew
X-Gm-Gg: Acq92OHfzmsROgYPf1VsBMdSSGrEVfkszoK0w4S28o+/6QsKdx6r6s/a9Mkf2CFOoFa
	iA/fTL2gUpxApS2IzoWTRNnIrR5Q0/XjbXqNPcRljG7eh+L9QRVVzKhF/VHFtl+BrJXdubN8pAI
	l7zIPxzsYjx1mSZODAhYpNZt9tF7hAF+17sjfS12LPU72Ir2Df6Tk2EDItKGDECAehVyR6XawUI
	3IB/UgHgLLU2wJh8tEG0nKSDH5c6Lw16+loYeQaer+uy5CfOywnUsBYXhJKoB0UB/AVejzZVL+9
	OJWOpMH2iInznYGX53niKxSQ/se3weO9vv4gmUH4NI00CTkhgiVrXEGyIBy3i5+tlg39tvVGYXj
	Vh1GroGrFeqNgzyzQhZ2BBuMYCb3umSUlrAY2moXVDtOeNpPMLIZxDpRyv4weYi/1fB16Uwc3KZ
	Hs5ynj2Kixz/kh9xflZDCjDFUskBrTmXTyOkdw6ea3LrSgLkR7rJK3y/0tnKsAZkvaDo466xw31
	nyKP42mzrh62omZq2gIfzdw4TaXUH+Jwh5qJ+rn2K0SAU0+i16OilTDKNIPCbLUwK+tvg==
X-Received: by 2002:a05:690e:418e:b0:65c:5b88:849f with SMTP id 956f58d0204a3-65ec9931107mr5745827d50.45.1779492651865;
        Fri, 22 May 2026 16:30:51 -0700 (PDT)
Received: from localhost.localdomain (99-61-165-33.lightspeed.sntcca.sbcglobal.net. [99.61.165.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ecfdfc74csm1341853d50.21.2026.05.22.16.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:30:51 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mithil Bavishi <bavishimithil@gmail.com>
Subject: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Date: Fri, 22 May 2026 16:30:36 -0700
Message-ID: <20260522233036.12277-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
because omap_pm_ops.finish_suspend points directly to the assembly
routine omap4_finish_suspend, which lacks the expected KCFI type
metadata.

Annotate omap4_finish_suspend with SYM_TYPED_FUNC_START so the assembly
routine carries the KCFI type metadata.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/mach-omap2/sleep44xx.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/sleep44xx.S b/arch/arm/mach-omap2/sleep44xx.S
index f09c91978..0b48df6fc 100644
--- a/arch/arm/mach-omap2/sleep44xx.S
+++ b/arch/arm/mach-omap2/sleep44xx.S
@@ -58,7 +58,7 @@
  * stack frame and it expects the caller to take care of it. Hence the entire
  * stack frame is saved to avoid possible stack corruption.
  */
-ENTRY(omap4_finish_suspend)
+SYM_TYPED_FUNC_START(omap4_finish_suspend)
 	stmfd	sp!, {r4-r12, lr}
 	cmp	r0, #0x0
 	beq	do_WFI				@ No lowpower state, jump to WFI
@@ -223,7 +223,7 @@ skip_scu_gp_clear:
 	isb
 	dsb
 	ldmfd	sp!, {r4-r12, pc}
-ENDPROC(omap4_finish_suspend)
+SYM_FUNC_END(omap4_finish_suspend)
 
 /*
  * ============================
-- 
2.43.0

