Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108048;
	b=4BmwUdge1mNLPpeNsi3nG6Q4xK1u1VKpGjFyCJ2wp/5V8sziOVaHuOOwIxWT+xR2mhpq
	 pVYbexYQDjVkXORxmLWVj+mQXUe+fFlgiTDcmfJFW0YUWv7ISrUwXWjjw9hkRgnfdUVQ7
	 pg2jH56IXRQOfGv3BBWoGIfJbOwWGYOUTvTTrHAHAD4N96N6E1dD0GhqKjVJKV5j8sJvy
	 L7AeJXhAzZgKiihVVAX/vG/Q9DR6dttz5BrDKp97RyIQLJ6v3nEoDrDJsH3Z86D8UJrZL
	 rKP7xbrXuxYySkbfoueix/0+3SOtIWBY9cAIuvt5V0Bzgs6bUHOSsET1sYswydUJAVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CPSkT3mQY7L20a8r35/Y3UAKl++Ut888ubg0F2YWBeY=;
	b=A963/KrC1Q4PbKalxF9gwJwMXA7BeJgg6/BBsPZs4MvrOK9moUSag3Hutgdl8AtasHTm
	 yblTOZtPgHNE6cKJfarsGcBs5g7u4PrVmGXViOA1pUwbcyncDKEw2WOJhovkPJy51zW71
	 pp4yDwD1FNWjml0dp3hLF5QeOEORUrrMi3+eh8E5ZBQ+YnT8X/IpXgC1yVRQyCq1Vnv7e
	 0MDioUor7RNWTNvLQxM8zsFCSZu6lq86D5dps03CG5Xq8SoPGDW7DWnNViPP1zqMCsif0
	 ZMe/o0o3RFfZzBkIpcS9JSX54XpWSgm8XD4CycVcYrA4OLYvMy9VoU6hUtGiG2MYYNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mROLPVsW;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594C960A2603
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 594C960A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mROLPVsW
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so3660403eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108047; x=1795712847; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPSkT3mQY7L20a8r35/Y3UAKl++Ut888ubg0F2YWBeY=;
        b=mROLPVsWVkjFzIcs7oes8a0DEeTpIN3M87StjoNw2WaefRdP1EJkCDDFA7fzefY+jf
         F5BziA+nD7vd+dQ0NGMHeAHXxTQKxk5GIFNS1zCMEkTqU/SMt1ns5pwuxtqtHwJrm88D
         9iaGdg2NU2EP77A55HLrk5d8Yfft0sIIoJi7PSl4WAuzveGruisLdSwAHWY1sfW3ZF/Z
         imoovR4aZcgbvc0BL8gTewXKte+vwg62v249344eNngeqNOn1NZBx91noNwS5a4FXKlh
         k/7kuhRObYJdAxbTPfXF/NMe+zKKQXGLX3NtsC+PHimOqZBfVM1hE27sJwFIWPacSy0E
         Teeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108047; x=1795712847;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPSkT3mQY7L20a8r35/Y3UAKl++Ut888ubg0F2YWBeY=;
        b=ihPKxmGmDOSQ06kfXvCV0s/9aNeuh6kgeJwnyImZ91VJ1R5tCbLFRKQTJTnSTMvh8u
         8um6o0gV6vMUQWCvTg89dlNOUCbt5cyjUm2vEqiXU8LZauXRIPRqlOu5bxEGpp2lJW0n
         2hh303KPv8AJxWmT0zFbEuqTHZqZbvm1Gz/V63TdmdZDrLAfB9K318tdUCx/H4Lr5HJ8
         7kCmajbIQRGzqJy9QvM6zqpyGxxBuXQBFJt3OEAenuWezEBZBKK5z26dmRZihnqEFFrb
         TOCEJrQkrgW63/wFreHtktDEa3SgZ9w1EkJCTcPiAvskyvlYbT0aQPUl1S2lIVOa2stS
         R0IQ==
X-Forwarded-Encrypted: i=1; AL+hErHlB0y7ohyyzFvc/uvS6TvqPCku/5SCCQIXfxF/JnHPEQbr9gsEeNHuxxfJl1LHO7Sn5YRC@lists.linux.dev
X-Gm-Message-State: APuU4Z/dkHa8xWejmsKtY9Obdu/e69R0mVYm3NOYhQtNoHzcSiLtV7ML
	DXCYCx7rTvZj6OrjGpGkg1W9Gw176C/NWuYCsnxXs5yjZCSxnRQswnwa3J6ZCyajxRl3bcaAzRK
	RR3dR8buaaQ==
X-Received: from dybmd48.prod.google.com ([2002:a05:7301:1830:b0:376:93cf:d6ce])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3f16:b0:375:dc5b:4400
 with SMTP id 5a478bee46e88-3856c5b52eemr19829eec.1.1795108047106; Thu, 19 Nov
 2026 09:07:27 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:22 -0800
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
Message-ID: <20261119170722.1524088-1-irogers@google.com>
Subject: [PATCH] can: softing: lock card->fw.lock unconditionally in softing_card_shutdown()
From: Ian Rogers <irogers@google.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

softing_card_shutdown() calls mutex_lock_interruptible(&card->fw.lock)
with an empty if-body ('{ /* return -ERESTARTSYS */; }'). Because
softing_pdev_remove() invokes softing_card_shutdown() before
unregistering netdevs or removing sysfs attributes, a pending signal
while card->fw.lock is contended causes mutex_lock_interruptible() to
return -EINTR without acquiring the lock. Execution then proceeds unlocked
through IRQ and DPRAM teardown and calls mutex_unlock(&card->fw.lock) on a
mutex not owned by the current task.

Use mutex_lock(&card->fw.lock) in softing_card_shutdown().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wextra-semi-stmt enabled; fix and changelog drafted with an AI coding
assistant. Build-tested under LLVM=1 W=1 (-Werror) and -Wextra-semi-stmt;
not tested on Softing CAN hardware.

Fixes: 03fd3cf5a179 ("can: add driver for Softing card")
Fixes: 47fa0336c1b7 ("can: softing: softing_card_shutdown(): add  braces around empty body in an 'if' statement")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/can/softing/softing_main.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/can/softing/softing_main.c b/drivers/net/can/softing/softing_main.c
index 519ab3097f86..d3dfad4f5321 100644
--- a/drivers/net/can/softing/softing_main.c
+++ b/drivers/net/can/softing/softing_main.c
@@ -448,9 +448,7 @@ static void softing_card_shutdown(struct softing *card)
 {
 	int fw_up = 0;
 
-	if (mutex_lock_interruptible(&card->fw.lock)) {
-		/* return -ERESTARTSYS */;
-	}
+	mutex_lock(&card->fw.lock);
 	fw_up = card->fw.up;
 	card->fw.up = 0;
 
-- 
2.56.1.708.g77570a6a1d-goog

