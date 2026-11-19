Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108097;
	b=3UWHbvrHQKfeiICkqP5gfgy0Oo24zpsaTVMbXoYLB5e5UtOFBAG5W+jnHgZiPoY2JOPI
	 kkNmKOAuoc7ZmsRAK5PDaZl8uPaIIUuIo6qAj2OJj8RUk1u5uVFsm7JyQQiR4Hzdt4/ZT
	 FE4HmFmSQ6+mhDU+5yU3V5acH2kJiW56zhSJ8fF02EG48iid4vVS1GoMq37rbitpbXqvD
	 oMlqvgpX9iAK34WibVmdPXt04S59ah/JUQw/rxFkxFZoLgY6qwck0a3VoWZUqtCkq0TY6
	 Ee4sVD8c/CqT0YyJY2k4wqBka2JohltFwDw/GW0VfzIKfbLXv8FBnVPRP7b9mzb/muA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
	b=zYNCZfw5NU9akbP3+G7DcH2pUXae86eit9XpCPSzfwdlYqxxlicjKH+wmhcO43DHLp8f
	 mqJQRtNKwVEXqorlxnxYlXWs6X85/+QRVuS1DJySmBcnHfYVhmJSw+5cCKGDztWHSfTpB
	 leF0MZ/TJHzcAlgO/mF4oEpUHuJLOEyHhg6CDi4HrQSVxa9GQyNN3/eJqLUuJBGZt8lOV
	 LpSb5L1M8GnBcyR+SHHth7d2fEfM3fF2bQ7pLQsUFfAK7nQGQGOND9Nu82vIAlfBho8xR
	 tKXt03ryILdHza+lVszdTBP9bRFKUOLfK7/4/xEr1ey5EFCfWmX9Z83GWCI6n3ZyKdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="fmlz/Qlg";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289C660A261E
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289C660A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fmlz/Qlg
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383165e9b0fso1982515eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108096; x=1795712896; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
        b=fmlz/QlgBI48YiM3DJH/BlkyIKmNQsbQOEctlMUgnRgeFeqg/NAcZ8Dyd/GDc+j4Io
         5yhyfsovlX2zaJGaiXhzV31HcBDGKLXVv5bh2hPQNcqud+oTId10eFyWljjMI+KDtwq/
         oofFTE0jmvybvS5fNkKrBFEkFY5gnFBvSk4TVqhpsk5CJFlpXMdgraOE+BAOEvjmifDI
         KqQJhXBZTpbfnQ/E0XI/99t/YPPsc7RDy97f5rBRajEApfkberSvO5pJmk6S+iGPx/Fl
         iYW8g53Hpfp+OGTusAnpno12hxJeLoD0IJlHyNj+i02rThwgjsfF418Rg2CCBRJWhCvQ
         UyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108096; x=1795712896;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
        b=T4wtobV1NXYpuH9ORDk/q4CF8bsC9K20jwo90eYxEEBA10tTYXr6LvrgtsqlHe5g+j
         hskErAm5SGOyQHZEMAVFBvfCRBdZEaNrXYKhIV/02+6OvKO2cwtLVXU90+xOFq1IngD3
         3WLy8FskxxlIslOdl1hp1i6jqWc0k+uimnimmJ8qiywsmTdmgV8FKQF59qJ8gF3MDFl9
         UYMS7m/6XI58YvOS0qkjfOnR120Oi+OvfaiwHA8yQH6Ff7b84CfvJ1O6cFIXLz5KvoBy
         dWiqqiTbJMhXtT4KMM+ogzVbidBt+3gcRgmto8ReW4zoDBf3LPsr4lJBLTzAAe7yB8T2
         hDRg==
X-Forwarded-Encrypted: i=1; AL+hErGe2erEeXrXVqZjKo6RsYvvFsycK6WiETizXkHsosHw7PdQlFpUdSLQ4iGAdCbJay4qmJ+4@lists.linux.dev
X-Gm-Message-State: APuU4Z9mBDzNVVEfI5CdiduLCXjlm8Hnaj2faCXg39E8fHMk+BcuudCK
	zId6pHbokI0B78odtCIMd4AzCDEWnoq1F31/bhLs9NaFY/3dV50SNWtG9sxN5kRUppzeHc2bDC1
	2rvOl+pryVw==
X-Received: from dybdr19.prod.google.com ([2002:a05:7300:b293:b0:375:861c:512e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:db86:b0:384:d59d:199c
 with SMTP id 5a478bee46e88-3856c2c3fd0mr22119eec.1.1795108095991; Thu, 19 Nov
 2026 09:08:15 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:59 -0800
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
Message-ID: <1de898fc85710c85f6f90bb685d3be109f44c2ba.1795106962.git.irogers@google.com>
Subject: [PATCH 2/2] ASoC: qcom: lpass-platform: Return IRQ_NONE on invalid
 DAI ID in DMA ISR
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In lpass_dma_interrupt_handler(), the default switch branch returns
-EINVAL from an irqreturn_t handler, which triggers report_bad_irq()
in note_interrupt() instead of reporting an unhandled interrupt.

Return IRQ_NONE, matching the other error paths in
lpass_dma_interrupt_handler().

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building sound/soc/qcom/lpass-platform.o with LLVM=1 W=1
(-Werror) and -Wassign-enum; not runtime-tested on Qualcomm LPASS
hardware.

Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/qcom/lpass-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dad4becf7579..45379604b689 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -963,8 +963,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
 		val = 0;
 	break;
 	default:
-	dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
-	return -EINVAL;
+		dev_err(soc_runtime->dev, "%s: invalid %d interface\n",
+			__func__, dai_id);
+		return IRQ_NONE;
 	}
 	if (interrupts & LPAIF_IRQ_PER(chan)) {
 		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
-- 
2.56.1.708.g77570a6a1d-goog

