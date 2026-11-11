Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364418;
	b=atbP9hgoFrNroukkflazRyq5b41tfuUxQTbkPzg/7aCKsPY1nd379L9WKL6CiufGBEXp
	 kvbe8Au2l88jIzMQzaxPF8SnPgoYvw/onWs7HfwDKrCAy/hKLUljZt0BeyguuH95HCpzs
	 RNWUCQCCn2xbvqivBcxd5AH2o7JnzEgQri0esR3+oDjbn7jI00XDq2OYTjGaRquLuBLC5
	 jxZrj1MiAtKa4ysqP1Q7xdsl4i6xoN83gj7neoCwxrYwxv4kRcZLV3kLi3BPXFTLeXZ8b
	 6gq0AAHMnSvqit3DsoJETL/J6mD9HnOtdA7bf0kwOxFPnz8/QlT7NLq237BUVVCUDpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s18d0QtUAH5SO1XlwoaKN258QqfdDcIgzB60hufTnb0=;
	b=4428xKsbtH3F1J5pC8bFCuwfKePFcF9E0cnBUJvdSWrAQSluDaJAwmZlvB8YM5o+wUeB
	 A2Si14UYmZ1z5kcHQqptiZsncQouO01lT8w08yPWEIEA9Uvqf2wzaQ73IFwl1uI/Psq/C
	 8kxL/DyZOABPGRJ77DkFlw8mYFuFrCByq8ZsxMejXAcAlGM63EsrU/8GT3th9vXXEkVvm
	 tpGgQHXQwJc/H0vzPNdkgnug2XwRn79QaIyOkvYujk0LtFjES7VrVvxUKLkNAS995ZGCR
	 FbRYl57AkS/FZaH2RuQpvlxMo4+6eaJDq/Q9zSI3gXA575ViKRCW89w+cL7u7CLLRWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poROOy9c;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0885E606A31C
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 02:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0885E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poROOy9c
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b190cdc9feso1576789b6e.0
        for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 18:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364417; x=1794969217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s18d0QtUAH5SO1XlwoaKN258QqfdDcIgzB60hufTnb0=;
        b=poROOy9cJaDysw+ruRjFsu8afh/5wgqjFa+T20WFfl9YSNQ2t36tF747B5meKtJVoX
         ZeKTyuBlc+fHttK9k2qkrZ9E6tzyzMXIDLCGY9FMFJtm373fS/p7rG5TAD9Z5ES0oSjS
         3y3NApwNSl9OMNtyYAnss/OBVv6jVspaWfYMlSh/Z+qhIuBBFrv5CcW6evWsTtotjdDf
         swUUWDveZrj2BkT0e/ju4P1tSuf/HvkmGORk+diR36prCXl3bmFswuH7Oo2bPTTcLvGN
         oVj0+2kx4UdzrIyadFJ7tQigSiX6Eeb9I1use8mVHF4lAXuEe4Ot4NrChBcp+QgnXe7H
         BmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364417; x=1794969217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s18d0QtUAH5SO1XlwoaKN258QqfdDcIgzB60hufTnb0=;
        b=N+IeCdzQbzLwL4EQf6ztC6qNJeVqI6dWy07pTStKRcxXSgX2f3Mk8DoO5PtJNGWdqB
         q29wtv5bssO81YW7ywe2bKKTO+VAwdtlDZEM0rT4QtEn4Wz+4umP4wcibR+xOVV1L5bb
         OyRhzrth5UEHd+PJaGy5OMelD+i9C+Uz/fe6yNUU3hKnOJiARowdMBe3mU1Im43eyAhV
         Wzfg6TUhhCLqHsQKq3fv2ZylfsrVMDgOmXmaG6pnxkDxLbOU3teBVXzsafmQakTFAVde
         DFtTssex36RboXpD6aHNkxdKJmBj3iC+OKqmUXAWwxKQGMjsq0jHrtxgZqlSFPQDbgKU
         13tQ==
X-Forwarded-Encrypted: i=1; AL+hErE4d/QIfw7v6CQ1RZh81DfZQsXP4wrtJy5za9dVwzl0KTlkHY22QFTlPbHQADzRS0IqeHe6@lists.linux.dev
X-Gm-Message-State: APuU4Z+wxzW0bS3Q1Ese3eNM9yP7eTqu+JTkP4txnMOVmpEpiYIHXR0x
	HjBxsPbF+b8IcVfDi4ROKSJuRbBsbzAYQZ19k17yKJuxGphezuN9k3v4
X-Gm-Gg: AYBFou09tNX4YwMyCmAxlR6pfuuSzlo9zhayOJOLE9zDs1v2o0wtjCROIaAqAGrp8Jd
	D/KpM/g/HWTHUgHvuqv34574sqnwXB6hCXqPHAGruFDjm3dwV+nme9+9tsUde03MxEA4KUB8/pS
	ripN25GTWcUefTI0UsqiMbdS8QBiCm8G1BdV54LPRabtqVQnyRkN/zZ6Vmx8hxw6gcDGPCk5DI2
	L6WlzG1TbONB+uDRfG2P12jfM5iIuURLgHd+zkv+coO10HL1pbMeKx4rV2H1PAom6B7Lr/vXMgx
	Mpl7vbegq9o/RVEC+I6YEhdYxhDHecSQouCQZHjq9uiPSjxAMWKFznKYZ/3SU4jRqhb43W11AYS
	ubk/054WeRXb7UwS9S8Y63anQRUNtHJDuFGs6cdMk2KPorLmrh+6UeN+sINRyu/wRK3iTSRt2l6
	p+a1u3sN4JURycD5+R0YK5+eL+T8WhK9NT28jbhFTa+uFtHdzWoUhk5CjEMM59ocZ7oXtdSr0AA
	/KWc0vRixa7k0cyRjmMJdYCRz3uYhkDb4sCP303Eh5YN0UtKNXD0pEA4ob/vnsk84TQMIjEqCQl
	RUVF3n89PAo9bA7aO1dx3hEciUDVZJU44LfksQv2f3LQ1Lhc8eD6hHGLq8VtOxGPLFNhbr/iA0k
	TkZP3EGFkbXeVwLHb87asg6460N7TYoF0wjetLuCaL8DlJeN6G6DLZ9PA/Ao8qlOxSdURr7WZ+b
	/djw==
X-Received: by 2002:a05:6808:138a:b0:567:e9b5:37b6 with SMTP id 5614622812f47-56b97c1742dmr835978b6e.41.1794364416881;
        Tue, 10 Nov 2026 18:33:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm4103177b6e.11.2026.11.10.18.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:33:35 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] perf: arm_v7_pmu: suppress -Winitializer-overrides for perf maps
Date: Tue, 10 Nov 2026 18:33:26 -0800
Message-ID: <20261111023326.70922-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The perf_map and cache_map arrays intentionally use a range initializer
to fill all entries with HW_OP_UNSUPPORTED / CACHE_OP_UNSUPPORTED, then
override specific entries with supported event codes. This is valid C99
designated initializer behavior (last initializer wins), but Clang's
-Winitializer-overrides warns about each overridden entry.

Suppress the warning around these array definitions using the kernel's
__diag infrastructure, since the pattern is intentional and widespread
across all CPU-specific perf map variants in this file.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/perf/arm_v7_pmu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
index a1e438101114..9ac28c8adf80 100644
--- a/drivers/perf/arm_v7_pmu.c
+++ b/drivers/perf/arm_v7_pmu.c
@@ -146,6 +146,15 @@
 
 #define SCORPION_ITLB_MISS				0x12021
 
+/*
+ * The perf_map and cache_map arrays use range initializers to fill all
+ * entries with HW_OP_UNSUPPORTED / CACHE_OP_UNSUPPORTED, then override
+ * specific entries with supported event codes. This is valid C99 but
+ * triggers Clang's -Winitializer-overrides.
+ */
+__diag_push();
+__diag_ignore_all("-Winitializer-overrides", "");
+
 /*
  * Cortex-A8 HW events mapping
  *
@@ -530,6 +539,8 @@ static const unsigned scorpion_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
 	[C(BPU)][C(OP_WRITE)][C(RESULT_MISS)] = ARMV7_PERFCTR_PC_BRANCH_MIS_PRED,
 };
 
+__diag_pop();
+
 PMU_FORMAT_ATTR(event, "config:0-7");
 
 static struct attribute *armv7_pmu_format_attrs[] = {
-- 
2.56.0

