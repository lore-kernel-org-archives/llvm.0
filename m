Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107995;
	b=LFAzqlcdT5Z0m2wFoSk8dAIVqlG2XnZ0QKNokymrsnmO8PDuiJ4dCT8QaqLp1oJVkZWX
	 XEK4z2ZauacSBDt0tHFRNsPW2hqEMreeRxRkM49PlIzTpTUfIcBZ5mYoj6oTfZfqnZSOf
	 8x+1U5dqQUkkjJNihy8QbriZUnTFXyiJNTo5AKmFPw1lzA4e3tuQ4dC0t+8DYCZQE5153
	 XLMqy/O0mxBazNqizFwGwsK4gIGJOcAAZUEavlz1W6uN/vRGzSRF5VWJn7uqYk5o5Y018
	 UpLKGtvwhrJkQoCdiEZ3bo0VOQRtnvddNRSfcvAc38XDGXfhUUzq44130YJDelhFnUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Vi3sYKHX2QVb4mMLMwrvd+hlOAx69WBSD3NKTJsUNQg=;
	b=hA0Zj/ObGwW4kVyJrG1owYaGAb6v6NaP/Bbz1cyrHVuYEV9lzY/HQS6VnFx0OwPjlz3s
	 h3XV3JaUJovEBo5DewyqQPYZIb96hC0ORL9tjyaJ5iO97yeCfhs9XvQtNjhNNGO0NaD6G
	 r0BfefFBRZ8LxLqYOGo6z23QejGjvK0FnM6LLFxzWZQXk6ScT99OWnlRJWs17sZHIZPof
	 s1IL1OXLKy5Gizsn2p3pCOLM7BIJ+aIBn5dRHJmSQwCh2yyax/iR/SjkrwWotugNLz6Ue
	 6MD7HUvUsp9JyIs6uGihM8KE5b/e5xp/bbyH5Rkvmgr3D4taUoeocnyOGXS1pVLrOLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMa4UFk7;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91A7606A320
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91A7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMa4UFk7
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-83edc5c5ae9so2945335a34.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107994; x=1795712794; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vi3sYKHX2QVb4mMLMwrvd+hlOAx69WBSD3NKTJsUNQg=;
        b=OMa4UFk7ExYE8RO8pGMdU7J8d0d0a9kQwybfIRRL5aNoLrt7HdI+YfTuVqlwKiuAJc
         t+OUpbhU4FKzbkT4Gq8aMNjMDJwWuo4YTV0KzH5QlhQfekO9bWSIz5jt9w9lgcSx53AY
         38k/2cVDV6mh4GCqWxwhAqLmWXm5cHi1qMKWAoMp/Iqd+00FAzsfwirERemI7g0Bp9OU
         kFS7KPgqb8YmW0L9oO9hDb0OP/KRUHVNYH2UjXxJIBdyHX2Y1AMpPs5fj9Ss3gYrrTGp
         XidCY6GLaf47TayPhzMUpURKQnUBvmFgburVcu0ATTJ+Ab8GhD2PUBwGRwg/Ht0S+9zJ
         F1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107994; x=1795712794;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vi3sYKHX2QVb4mMLMwrvd+hlOAx69WBSD3NKTJsUNQg=;
        b=XbOlBqCKklgj2YZn3QyTSBz3m5sGSYEdrWXx6FJAeA6BtfP4WmCPNO5YoLKS+yJKR9
         DTV10HHoAikN7MAEw9G3aNKlkb6qYf+vFcwm8SmQnQl3tDZxVfPPzlJi0jDQvPUGc1Cf
         S5Jh1H/6yUetKvK86LC5Ib0GenGwjPvi53rx5+A7bv4y4gtkyN0KQPTzHLefpO8PCxsc
         9lIlVjEeoE8dWKmF8kJu79EX7054PwWMUuUySYRn8PMZYLP1JXtZh1bQBKbj7K4sctW2
         JPw9DtKdcVFaVPPP6A2GEBjHOdnYeVCrbsdV2XEaiV81bXCzeAxV+Ko7ncCrqRMCRSNc
         vOWQ==
X-Forwarded-Encrypted: i=1; AL+hErHRXxSoJZvpWbJw2I1/L+R5dq5lTHGdzhI0Uw0zGG6cmfar6XuUxx37HT1Pvgv2uzkEmN/s@lists.linux.dev
X-Gm-Message-State: APuU4Z/YQaJ2qgtljEPbTDQA4gIYj3Ix/g2tz98e5V3SAgZ1gTBsTgT+
	xisNtIpVu05CaIbQBACXsDu+olNIao4QTHGZIPq15P1AauIkd0ssJ81PRDO1nV2isF0Z6PnHKw+
	NhT0uFKfEfQ==
X-Received: from ilbeu16-n1.prod.google.com ([2002:a05:6e02:2f10:10b0:53b:299:42c1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:17a1:b0:571:7f0f:924f
 with SMTP id 5614622812f47-57a0c6b7286mr589706b6e.63.1795107993418; Thu, 19
 Nov 2026 09:06:33 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:29 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170629.1520297-1-irogers@google.com>
Subject: [PATCH] clocksource/drivers/timer-mediatek: Check devm_clk_get_optional_enabled()
 for errors
From: Ian Rogers <irogers@google.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

mtk_gpt_init() stores the return value of devm_clk_get_optional_enabled()
in 'clk_bus' without checking IS_ERR(clk_bus). If the optional "bus" clock
requires probe deferral (-EPROBE_DEFER) or fails to enable, mtk_gpt_init()
ignores the error and proceeds to access timer MMIO registers with the bus
clock disabled.

Return PTR_ERR(clk_bus) when IS_ERR(clk_bus) is true.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wunused-but-set-variable enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wunused-but-set-variable (CONFIG_MTK_TIMER=y via CONFIG_COMPILE_TEST);
not boot-tested on MediaTek SoC hardware.

Fixes: e234d4082380 ("clocksource/drivers/timer-mediatek: Request and enable the bus clock")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/clocksource/timer-mediatek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..860d4eb3f8f7 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -314,6 +314,8 @@ static int mtk_gpt_init(struct platform_device *pdev)
 	int ret;
 
 	clk_bus = devm_clk_get_optional_enabled(&pdev->dev, "bus");
+	if (IS_ERR(clk_bus))
+		return PTR_ERR(clk_bus);
 
 	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
-- 
2.56.1.708.g77570a6a1d-goog

