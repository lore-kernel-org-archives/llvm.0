Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5394324716
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 18:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956167; cv=none; b=Ij4G2LQ32tL7pygJif01pztCLrJY5cnP1SjEkE3C705z1nTwUuFhPt5gEaIE2SpATc9PDr6LlVVSVzRwMka7CvPu17T5pkGhd4EYLWcUKKG4SS5fM5bxBiUXhUjwpwZxGkWKKPo7cyJgMQJgAybdA2Inq+csdQP88zGETFT7fA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956167; c=relaxed/simple;
	bh=X/sheB2HerNRDwMRSjJhuRwSfkYyfYB880Mu9Bm0zM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VbZbfhKAQybbvzvrZu1cIRV9elo2W49G7q1f3gw+jwYppXB4a+8gEqMVlPLS0Vl6RITH5ZFKUBPEaMA1cddvioFFMVxTQLqBCW97m4ap0qUA78xWzV4+2HuqurT9bbbb+2TPpzQNgUq2qcSy73vnz7vz37S8izXPysVu/TaCbN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDWR6FX+; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDWR6FX+"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-80e2cfe6918so15441227b3.0
        for <llvm@lists.linux.dev>; Wed, 05 Aug 2026 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956160; x=1786560960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGeYBl1VUIwt/G4nfmKLTgCtjzdo27V8KoUvBJpzzDw=;
        b=BDWR6FX+pWBSo8L5zoaNn32qiLHK70tqpB9DrDLcdz4quGGMzKnM7UFIzCnvBrJG4Q
         14tUB/VNPe4gynoTOTlzLpwzIM1ePtqb1PovtlAjCdO8igiNnp/hQVHUb8rchSZvGJXx
         V+GoLRGkpcRWrQqPR6W+EYQrC8LmHNfZmtbfA69bheZIUXk3m3PMmBCz2tDxd4S8nVfu
         izrqsIz0mR27J+6ESmA9N1fBMC+y2Erj346mfgPq6Ai5aZCzUT9ndFAG+DQQKpzz6cO+
         B5nQKccU+Fi5Zu0m+oQCKeqxwYRFzkhURo+wa2tvPZlUVQbhMqZDete7gI/TVPkXlCha
         rvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956160; x=1786560960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGeYBl1VUIwt/G4nfmKLTgCtjzdo27V8KoUvBJpzzDw=;
        b=PAqU3KBAsD6O5I1GLfhSR0AHG9Mm0MSGSuJFBsuJU4Nmeh5Epc2vZ+4sRWny6dz4YM
         LfF/6bnNX/TmOEMPeteinaWjzd5NFJRr9aDSu/hWtCCg8lujET/l1HQJ7kb2Go/6v/rh
         JRqCcibTMQLaLZen+dHECjyU4Zg2JSWlP4CW/TMWoKIzNxPq8byBOZaaTUTGOGps8kJt
         qyaZldAIW40JJuoFgoUB+8EgHJpzSsuGfhgXdKSb+QTaT/upvRDCxoTbuG8fnHanq5nr
         J5xb6PbHCDd4ztB0YShQyKueHgYs+j4IkdPokKqvpMo/IZgH4zT0lja4ftkBKwfA9tJR
         2trw==
X-Forwarded-Encrypted: i=1; AHgh+Rrrr8CissbmjZrImmCCPrTRL/Al4KvBpcnuENBC6iYGIHLpko3OhXXZAVQnYW+tJxFIv8cH@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg3l2A2dfVxNG3mJA4hQuBiuL/Tx15R57gssLdvQn7+19ULbll
	7LYA83FIguq+acxoWdZoj6UOKsVLpIFyjASRlguYRdkGNQ6nWmZOWxQH
X-Gm-Gg: AR+sD10du5ToQQKQJcAPmeVQws4FErz31Q6Hb64DxRhdtRM72I3bapC3HYPRDEVdtye
	KOM1w4aZIEVpQScSG+ufQ3QdGMAzyTN1VWeCG9hA5wcq6fUr/Gp09OQL5v3q/cO3fWhvFooHogj
	DPtaJxSHjw8+ZmYVb1g86TKwuqo22NUFncOl9YEvatwkoJng9ERB2q+tAYzopGZ58NtEkSHid1a
	+lRHQZ7dSbkjBK9AerFoA4gXb1z77hzcJscuS9N8guNLOUKQ+kkpeaY6N8Iyg205q3VQI1LjBFz
	c/JKK+Z8usOwfLUwb3aCy6Tdy0jkTlWnt8x8JuMyDnAdJdyOmKvovaU1VYStArTxrAusvLHZxRO
	JYxTlaREas6b0+8IdOVDoHLMpNmAOkkiwkgyTHTaNV92dXv0qIWdDzB/BwjqGLGQ21SVBbhpUlr
	6fgiZtUDImPXRS3pX5D/HkETxcUGs7JcI7tzbo+NxiH98xE4a5QG4AA64FODD7
X-Received: by 2002:a05:690c:6212:b0:81f:64cf:2c58 with SMTP id 00721157ae682-8201bccf8ddmr51869547b3.6.1785956159995;
        Wed, 05 Aug 2026 11:55:59 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820131d9135sm25910817b3.6.2026.08.05.11.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:55:58 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 1/2] alpha: pass -Wa,-mev6 only when using GNU as
Date: Wed,  5 Aug 2026 14:55:57 -0400
Message-ID: <20260805185557.3283233-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That flag exists to stop gas emulating instructions the assembler thinks
the target lacks.  It is a gas-only option, and LLVM's integrated
assembler does not emulate instructions in the first place, so nothing
is needed there.

Condition it on CONFIG_AS_IS_GNU rather than the compiler, so it is
still passed for clang builds using GNU as (LLVM_IAS=0) and omitted only
for the integrated assembler.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Only this patch changed; patch 2/2 ("alpha: read $gp and $sp explicitly
for clang") is unchanged from v1 and is not resent.

Changes in v2:
- Drop the scripts/Makefile.clang CLANG_TARGET_FLAGS_alpha entry.  It
  will be sent separately when the alpha backend is upstreamed to LLVM.
- Condition -Wa,-mev6 on CONFIG_AS_IS_GNU rather than CONFIG_CC_IS_GCC,
  so it is still passed for clang builds using GNU as (LLVM_IAS=0).
- Reword the subject and commit message for the reduced scope.
- Link to v1: https://lore.kernel.org/r/20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com

 arch/alpha/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 35445ff2e489..7074602dca94 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -27,10 +27,16 @@ cpuflags-$(CONFIG_ALPHA_GENERIC)	:= -mcpu=ev56 -mtune=ev6
 cflags-y				+= $(cpuflags-y)
 
 
+KBUILD_CFLAGS += $(cflags-y)
+
 # For TSUNAMI, we must have the assembler not emulate our instructions.
 # The same is true for IRONGATE, POLARIS, PYXIS.
 # BWX is most important, but we don't really want any emulation ever.
-KBUILD_CFLAGS += $(cflags-y) -Wa,-mev6
+# Only gas emulates instructions the target does not implement, and only gas
+# understands -mev6.  LLVM's integrated assembler never emulates.
+ifdef CONFIG_AS_IS_GNU
+KBUILD_CFLAGS += -Wa,-mev6
+endif
 
 libs-y				+= arch/alpha/lib/
 
-- 
2.54.0

