Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2A2F290E
	for <llvm@lists.linux.dev>; Thu,  7 May 2026 23:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196116; cv=none; b=SMJee1QTHaM7+1dkAX+Lo+Xabk++Itf4psL8xR/XcpSP0qO4961Ln7kFpRCZ2duoAofK/X9M9Bzref+/eXLkVQto0Qsbr5jX4sxnr2gyIQIPyh7M8o00pCNb+0IfcFVAAtbbMP/HgbneWr9b6RGJvlkXjfBCvN6fQ0Pm/ndTkh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196116; c=relaxed/simple;
	bh=/7jMOqiqfS5E2Aa8V7nTqrJGxlbfE7BVeWQEGpFRgbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kt9zNKnkp6skqMyWhwvxUsMPJyOIckNwLL7RIkeY4lQiW/kcuv8abxdYdr7q2jfUjLHw17AVW/n4iYvfPwsdjDlNEGgcxJwf9J6/Lo8sG5GzEykoIWw5FXhSJrhhzZT8ERvGekSlFVY9c473Ds9hcs+1a2lJ2nCjPNrkqntWU0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEi0Pd3s; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEi0Pd3s"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b458ca2296so9130485ad.0
        for <llvm@lists.linux.dev>; Thu, 07 May 2026 16:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778196115; x=1778800915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqk0bhbr2l3f7IDwzLFxsnylMpESKM7ghHU7R8b35rk=;
        b=cEi0Pd3sM4iXB8SZbXRUsoWSsYdOyv72DDQQKZE0S19AqOu91J67DznBiE6lsADSJE
         NV+yQIryhdkirfDggvvalR/SKl7cWe9xaHnaki4OzqF9dBMF1ZByGwfuJHJGZUlozhuy
         s0FvvQq1NATVA2gYsJp8rZVFYF3b6HVuPgWtc1GhNvcinULRE5wMtsF63w9z2JPYM7E0
         PsCj1QcV4h5O2qwny1fD/PufQf4PXdB3/IfXFA7DqBS7OlJKWVcne0KWGaoeoEI+Ijt2
         e+36gms3Sl/uwiyHafKsKwgpvsUVuHPQSRPu4NMYEON0WeR2Vx/XadkM6xPeaw9qKVV5
         H73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196115; x=1778800915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqk0bhbr2l3f7IDwzLFxsnylMpESKM7ghHU7R8b35rk=;
        b=LuiU/NKR9fd1Wort6bx7gkl5m0ls3vzWnr4hUhm8TXXLrrh6kpPPzpmQaHfGNQsuzZ
         QaTX3AulIwBiFWKjDlp5Jh0H7isQfGBtkReJpJQCMnG5QRLNR5nZ4cN77GeINRkDY2h8
         B+/cPw9ae24DADI6kN++IJUin6hUQgMZSfcBL6dPDKQPfbQmFRjEu2SBZe6auHugJhPh
         H7+CDLsYGQyCJEBIPKaw0lJBPOte25vsVx2m5YbLrnxLFPyKUQXCkbceJ1MUUC0nBMBN
         Lut6AoQlD9bVSkB73av60XId9zepzgvWUJlP3GpYGoX7Yhs3phvJKn50fO/pU4dsV+cI
         mnkg==
X-Forwarded-Encrypted: i=1; AFNElJ9Npcb20jFXjLRZt8V4ZMzES6Cwkaer9HgaSvQWCdcbhX3KZCS2AJLHY47xKYzAKcUHJSVi@lists.linux.dev
X-Gm-Message-State: AOJu0YxHPdDfHoGbf6K4y2CrP+OP2M+BYTypUcyrADFRpthhhbUH1nAJ
	wa5TZ2zLeeaZ5knHuD5ynuw7GdBB9H47oS+Kr573kgOSM0VfTqlTk+IQ
X-Gm-Gg: Acq92OEIf7ReOAwa6h53ONg8UXs7UdRwHgkZI3hq23YT5Cjg4ES0QLLOOOxMZM3b+U3
	joWuo1jxTbSKmYu5M7G9m++zCNwtfbgL3CkaiVEIBz5BrGI9sGDHyl4HFmEJmHic3ZB6WKCHPoX
	Rad/FaFaX6VHbeyiVmphAzPAyiYROtVR3IQ9HMmH73PMvGl6MslNdxQvCRFWl4ucvsTBwkKQnze
	brxWzpyJL36KOnSJUWduVFAa2EbypSCAle8Zihl7NOR4ONZ5i3vogg8woNQF7BKjHprUm6rd6+n
	rMETACvxSik3K//EymhhO2p8zIGrneKmG0AbzpmEbmEOULGLTzCpJ4x7KQmYAyjkj8fLAgtKXJJ
	bR7RwdrxMFxWWIYmtLudESpWUzn9FcaBLqTu0A4S5CDcErUEjkfJd/Og63qVVFrz/dMehSnlMXF
	0JYsdV+mCFOyZ/fQ1S5x2XAeG9egiD4xTRERnU+Jvmle0P57cR4lIkNMPKtr1WjnopEtDZYlct/
	evKodNe++dUC/SlB4L1b8rsqm54L9kiRXU=
X-Received: by 2002:a17:903:28c:b0:2b2:45b7:306e with SMTP id d9443c01a7336-2baf0cf2c98mr2125795ad.3.1778196110299;
        Thu, 07 May 2026 16:21:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae752f766sm9064475ad.2.2026.05.07.16.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:21:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit division
Date: Thu,  7 May 2026 16:21:31 -0700
Message-ID: <20260507232131.438589-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A MIPS allmodconfig build with LLVM fails during modpost:

  ERROR: modpost: "__udivdi3"
  [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!

tegra210_mixer_configure_gain() divides a 64-bit BIT_ULL() value by the
fade duration. On 32-bit MIPS, clang emits a call to __udivdi3 for that
plain C division, but that compiler helper is not exported to modules.

Use div_u64() for the inverse duration calculation so the driver uses the
kernel's 64-bit division helper instead of emitting a compiler runtime
call.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/tegra/tegra210_mixer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index f05617b5f433..bfdd457f740c 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -157,8 +158,8 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
 			if (i == DURATION_N3_ID)
 				val = mixer->duration[id];
 			else if (i == DURATION_INV_N3_ID)
-				val = (u32)(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR) /
-					    mixer->duration[id]);
+				val = div_u64(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR),
+					      mixer->duration[id]);
 			else
 				val = gain_params.duration[i];
 		}
-- 
2.54.0

