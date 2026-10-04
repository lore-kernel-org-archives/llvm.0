Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A500F30EF91
	for <llvm@lists.linux.dev>; Sun,  4 Oct 2026 23:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791157711; cv=none; b=pcFYYlhFMuyPcEPF0X85LsS8AV1DokL/LJj6K4PfAHHWRQvMrPrym+ZMwb6M1Cj4PsOrY2e6c0u8I9iXwM9EApG9dHoIwjUmV8C1/74l+VofzbmbXW8MnY2VXEPNfxNr9Wic/VtojAlqH1rBeo84TdNM48HM1xyhMfLl7qwf9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791157711; c=relaxed/simple;
	bh=Yakr+ipymN7ZnA+Xz4TDokUUTt0zx6UpbPqxI12sIzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WRUc6vX2zZmFxcs6vH6JLwiPnNW2CC6R+GbXfHDJ/9wpjmKQFbfh+J0jQ1FXGX5biKjOZxvOpbvsAYkrkpuQNo6qP6JHKqcUXnVeyIglSXJoJyqpfjvhoSmn0EAr9kCo6icEgviB2HPikitKn1z0a9pdhYMJWueYaE6/5WH7VNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3L1QAa6; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3L1QAa6"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2dd05994cso2603455ad.2
        for <llvm@lists.linux.dev>; Sun, 04 Oct 2026 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791157710; x=1791762510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dO6qiiwJ5mjkpx+bVW9ukEfz8rnMpwLVr276QlZKmZE=;
        b=Q3L1QAa6r/+zFkoWkcwQTUYokXiIHdVokHKZvRtHir2J8+iot4hlqhudlIU6fuSVYX
         ZRzdtWO0ULNWu0JEoyMyu15l8ylgtO0l+PjyFLraiiuKI2+bLHuG37i5I7PnlqQGmYiB
         O+Zz+cdeE6+D1Dcq+mJAd8fpuO37ySOeR7SUxE0UWa2Wbcyg+fetG91K4Mv6LSV4k9/X
         xqy22s5BzF9pwPvfqDuyWBstFc+vtMOKCkJqxQol5iowvyIB2AaVzhvUFYf9MUMCVqev
         3renMFxLBC2c/X3dvqcmcOUjWmRqEnva4q1/swp7jcwpy49L4H6XfAtvMY94yHgv8wfJ
         JRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791157710; x=1791762510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dO6qiiwJ5mjkpx+bVW9ukEfz8rnMpwLVr276QlZKmZE=;
        b=qvM2ZtUF7SZziLM7hbsc9z3PNilcCjvWWqwfR6STo4FItfdm4/D/HokIdOL+kZjtsb
         OdtuzaY5q2731byGCROmIlZnDH1PYd0tycZGzw+Z85BPXJPw42ykmutS8Sq4dhuarpFl
         96ntuH3//Z7iR3092abf48iT/t3CmotCAZfxKKCnAcJbW/iJRbUQiXZDyBUUAaYWtvoS
         CCdmyEVJQzUbSAibTmZEA5nEitsMtxUw9JmVYIIJyB2ZdnHSr1fdZRGOcyooQLbC4e4x
         GxSiJG/QJlXiiPKEvsQMtaOUfNBELHtl5AE5gi8YDg5nBE1YUGMOxvZVHatY8Z233O1k
         Sq/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQ/ETwXvuIXXEFdfX6FpoYwk1Tq/7hO2A021oPh9YgICFYrb1Mxo6lCToVFjH1V1HY75HP@lists.linux.dev
X-Gm-Message-State: AFq9FYIM5Lb9dnab2MWq7J37TD9G96C5dNt0vGO32L5QalJWW/IOXb+/
	GvYp2SqzMgvjIMO8tKXAr05Fxl5rBL1jFL54krPemOfW9Bu19dXl2w/k
X-Gm-Gg: AYBFou1TydW/egaC9jNzytAv3GaNKZg+JOgPTL8ojdRSENO+yyjNTVE7P8B5CG6inXm
	kR08UZV7xL4/lGPUrq/5hLlr++saD1QGCizaNhKYdG+tZqGvezN/BOmSX3jCK216JXhB35JafC8
	AkfgByiIQkVKpelm+2FhZpYl/mkaxXoFumoR5kEfkx1g/HkmYdsK/p1dbqGywOaB3a1oIjgsoXG
	z8AvZoeUaSzasuVtLqd75Rr4DC0eLW9Cstf9BUCzbWj9+UIbthJ8n+hRQ2kxTwPcmDB2xgMMqqt
	7Jx1j+lKsm96Xo3Ug5DjC6LaKUTXIBFabK5MbjfcCdSJK+0QJv3I4pv6qY0AjvYm1qIncpaEEF8
	zh8e8484AtD7HCXgVAGhwUKR7ZM+vGemNozF9IfDBQm9sSjfaRESOKzY6uo16kY5VrO1+lP2LC0
	vMWTYG+gPsPUjFilTuteXpGGSau65v/J5rGEGggsz+gAxsVrx7gN+Y7ORfTUPynu1phJvrJA/aM
	Kr2KSwuTWCvyYaFWjPPgdly98H8aa4I4Fa4K0zwWrSIdto1P28tw6KfVe14gKx5MzoN6BhoOtw7
	20syLiA4HGOapIU3eibGxRnkmkXExvD0/obSxR4tTCXC4JFg+zz+oZ2c+rs=
X-Received: by 2002:a17:903:8c3:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2e49b65f04emr81741455ad.57.1791157709961;
        Sun, 04 Oct 2026 16:48:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6cd764sm26207215ad.48.2026.10.04.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 16:48:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Burton <paulburton@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] MIPS: Avoid dead code/data elimination when using recordmcount
Date: Sun,  4 Oct 2026 16:48:26 -0700
Message-ID: <20261004234826.541468-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_LD_DEAD_CODE_DATA_ELIMINATION builds with -ffunction-sections,
placing every function in its own section. recordmcount refuses to use
weak symbols as section bases, as a strong definition could override
them, so a weak function alone in its section, such as the generic
pcibios_fixup_bus() stub, breaks the build:

  Cannot find symbol for section 88: .text.pcibios_fixup_bus.
  drivers/pci/probe.o: failed

MIPS always records mcount locations with recordmcount, so this hits
any config with the function tracer and dead code elimination enabled,
e.g. malta_defconfig built with LLVM=1.

Only offer dead code elimination when recordmcount is not used, as
powerpc does since commit f8b2336f15f3 ("powerpc: Avoid dead code/data
elimination when using recordmcount"). In practice this makes it
unavailable together with the function tracer on MIPS.

Fixes: c0436b503591 ("MIPS: Enable dead code elimination")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ddabe25d6bf7..f4f82bd75b66 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -79,7 +79,7 @@ config MIPS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !FTRACE_MCOUNT_USE_RECORDMCOUNT
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_PAGE_SIZE_4KB if !CPU_LOONGSON2EF && !CPU_LOONGSON64
-- 
2.56.0

