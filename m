Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108091;
	b=zj7zImpYcp1ACRO6Sf2q+mqNutwgZnKc0+B2TPkgxJYsyUH9aqhEJqj0NBcRLXB0W07B
	 +POj+JXQeecZM+1tz/iYXpX7Dt68/vLZw220B0TDV+/GRxRFpZ6GmHvPiDmw/80mIcqe8
	 nruWz8di2BzxIlt6KI9wZIecCUStzUxkdb8EbBtZVwNWvmoyleXt9iInSmdBx89URssgC
	 oUXMRxnKaQZEgYxfPw92iR6/2o2k1VaoTMDTZvAVa1gFexvfvizGQw9dxjZC4V2i6Klep
	 Jjx4gqMf+uUfKdAzaMJIT53r4HmbK1Eo6fUeRPnyqr3Yn7SBiR7kqwWw1FqmT7w13cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nb8Ts+L+z/DpTGbH2tq/3CpL8ayCSrXAUIaUzn6KeKM=;
	b=aN1tm3oqJb+34QDxKCLjkav0Xz+ht3uaapMDowgxI6yzLYwQkKVvmHrNMX1w83C2B8k3
	 L1fs0U9++obswlI4ANu8DLuwGC2M9RFQwHkRdwlet+i5fRiiy9ZcI6706u6YYPApZNuuD
	 2Hjalvs3tojExhfn6D9NlH1tM9BtUgqh60OeeimseZeunJ2NkHGvGW1uqgU69SgTHvhll
	 6v2YpBrGCarPVS9gOklPAaOhzjZsDD9YjouG9pJoERTbinrKolumbgRgnUPcGN9Qp+oyO
	 Pf329VJXYSKxh6Z9kvYgzM2ogsqfvRfG18sSZ4javhSxGosAro5nHCkHMcCPA05kJGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K3Lk2Sn9;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C6060A2610
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C6060A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K3Lk2Sn9
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so15454a91.3
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108091; x=1795712891; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nb8Ts+L+z/DpTGbH2tq/3CpL8ayCSrXAUIaUzn6KeKM=;
        b=K3Lk2Sn9g36g3XLn4j+mO3tXZ30NOnhyZGCGfIQydoV4meHrzibG6k3WI0gCLLKHNE
         ae2hBNCXybEKjN3n2ezH5VkRp55UucPBBHb3mOmJuJMT8HKF8JGGN25CKN9LdTwdnuFn
         tl5GKqaNODA0zAiQbQBKylLJzT/2ypnbIGwcZ78k2olLzPWHqzpzP0s2YKYxWvG6LdMK
         3xD0EzO/pkkl3sRx49SvRDY+wTGuSkPhGcLpdF+U9doSomQBSo0I6uW0o/jSWcVpFeTW
         OV7+U87fJIGzjkZPdkevbh+JLoQyzBoh8utfunu/fCbehkhWVAkHMiTP0/fYuIo5nGzk
         gcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108091; x=1795712891;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nb8Ts+L+z/DpTGbH2tq/3CpL8ayCSrXAUIaUzn6KeKM=;
        b=uM6Y2+SKWEaLVsgKUvKJS/0zZW3sgMHkrlJYv0r8p1kmqS9OHEbiDx9mFC/VDED+Mz
         gofWpkqAYWViQozbq1k6lA0Na/jP9RnulGq+cmykN5UruMBQrxlwU2MVSb0Iz0cyHFBU
         yJwnT9m7Fzi83vLthqEal3MQmiOTLCLzSpE1ZwfGORXQ/Rxr57bGtihKvjGfUm0LpDvF
         WT8Hau7y78vlIf+WBfJiETw/N51zyCz3fWm6PsojxgjZ3M0ESWtaY1IylMmD8P8OFwU/
         HaqjkJhpeL11DwVPTiX9st+Oh5ub1G+97Ez/bAroh3gEy2px9cymSDSMOkCVvo2raMbY
         8PdA==
X-Forwarded-Encrypted: i=1; AL+hErF26aX0aBIe79F36XWXyF1ImHkb67AXo04S23hzDunxZsECKtv5Cngtv4bsoGwrbuak35c1@lists.linux.dev
X-Gm-Message-State: APuU4Z+w0KGsqWtJYV5qSQq7LZW8zH2n6lURCiYLC8H/skkZonDuilUb
	pQcdrAJN0FWySjBivoFlaIZ6mciHY9akMNQ+ajIC4J90BaoPvdT3wFNLzOIZg81+vTTkIWXphtG
	j1L4mQrxQNw==
X-Received: from pjbds10.prod.google.com ([2002:a17:90b:8ca:b0:3b3:b3a3:5e41])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c0a:b0:3b3:c998:6d6e
 with SMTP id 98e67ed59e1d1-3b3d07c68a0mr7206916a91.37.1795108090513; Thu, 19
 Nov 2026 09:08:10 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:58 -0800
In-Reply-To: <cover.1795106962.git.irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106962.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <8af31a87f52c4cebc5ac7db6696a91545adb6ac4.1795106962.git.irogers@google.com>
Subject: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Return early for non-HPH
 interpolators in HD2 control
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

rx_macro_enable_interp() invokes rx_macro_hd2_control() whenever
rx->hph_hd2_mode is enabled, including for INTERP_AUX. However,
rx_macro_hd2_control() only assigns hd2_scale_reg and hd2_enable_reg for
INTERP_HPHL and INTERP_HPHR, leaving both u16 register offsets
uninitialized on the stack for INTERP_AUX before testing
'if (hd2_enable_reg && ...)' and writing to random codec register
addresses.

Return immediately in the default branch of switch (interp_idx).

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Qualcomm LPASS audio hardware.

Fixes: 4f692926f562 ("ASoC: codecs: lpass-rx-macro: add dapm widgets and route")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ab8a1c2b0489..84a3a47cf932 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2414,6 +2414,8 @@ static void rx_macro_hd2_control(struct snd_soc_component *component,
 		hd2_scale_reg = CDC_RX_RXn_RX_PATH_SEC3(rx, 1);
 		hd2_enable_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 1);
 		break;
+	default:
+		return;
 	}
 
 	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
-- 
2.56.1.708.g77570a6a1d-goog

