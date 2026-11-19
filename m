Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108283;
	b=S2ZQmT5++OrlO5ADRUlRxMUexLhHKRKlAyVySkXDAfT8t0gtlb9QGLV5lBOLpbd6pmF+
	 lBcLL2AsMSytyG2ZfuGLZgmayHz0IK68UH+G2WTggHI/qnCZekuEiSCMo97NmYZsqHODS
	 XJ27OAnUzJvirt5Ha9y+noZ92FkgMJObKMzuh7f6BeNisXir0T4+porigfiaN+Y3fC03w
	 4A3z9QkDyE5CPPw0ciUcU54RyOTx5/ctbYi6g9INl1pTDJmNDwgCp9b6cEIz35Ndp/abM
	 1yytWKSSoL1XtepW+2XtB+EVR4ht7KPIWH98jQoWeQJOc2nTrt/aRIWxQbx8wfEwhLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Ko+MjmiHNLM691UwBxmQgih73Czi8IVII6J5M6Yn1mM=;
	b=JPQGwcblbj1clqU2fKcLvXfPK7F3TABrvPQ/IVboXtGndboITCk85ZsTeyguE335xvUs
	 3P6xfgYtaZqzwKBqF/9WO0akvnxxLkVLa8XZ1jXxOWtkpdga6SjBHIox7Kf2mCHpJeKGx
	 rs3icHdcFYIJU70xJDAycGtkVrTykjVpLiwNQnAL13eAQ7W3HgG8gF7DQ84CZaeyBgoXj
	 0uyH1kLmjEjrE8/1HRmBjxBJ5o87dGr9FnaHip35YbOqC5ots/SguAzcG4u2D3Fbjh4kv
	 mcmaDppC8cudatacAx5et3MIanh0P0HQJINdlMOsPsKNYOsHgt7VZwSFxvBCYixpdIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dt8MYN8b;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BDF606B403
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BDF606B403
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dt8MYN8b
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so4735402c88.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108282; x=1795713082; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ko+MjmiHNLM691UwBxmQgih73Czi8IVII6J5M6Yn1mM=;
        b=dt8MYN8bXoYcIxNsAnc00A9Xck4RjarZvmSo4hxh8hOItpnNXkqZGz9ahA7/2wtvwD
         AvGEtk3vHOE36UD16E3jl5CS6XpLisDVhMlHIKRMx0mL39V86C+Ap1QSVLlobwtuXTT6
         nYyArWUwBt7KiNBLcXYF8UdhspHdhTJxxBzSjsuw12yNKHZrTpqf+5yMjbzbwis7q5G1
         S636bJfMHwtiUUTxFM2LAt6YZ4d4e3nmWjhmVZDMOJet6UUyztl7c6hjndKmiqxbiPJ/
         mD9gU+kmJ4Af2/GDEuVaKLGXJ+byz5g6+/+8rWUdLViMMhmokvM9jr6J8epyWP6hJ7cL
         TFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108282; x=1795713082;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ko+MjmiHNLM691UwBxmQgih73Czi8IVII6J5M6Yn1mM=;
        b=K4CnnkA+urPBlK8AaD703eSfaG8YpSK8iglc4ZGLiCQNQlvTErZXo9+CFeh7Qj5wk0
         L9X0AgOKIHBNV10rakun0ChLQRDkvsQGhk95y6KiQQJMUOcD331ZazsRmh+zIllvc7Hg
         0jn95c0kKV2ChCqh18Q22XA1JuYOcYIMp+DXCXpCCzgK5+IRGfmhdqEUbmQe1DVpEvTE
         5wyF7P54p2uNbqJzBZG2WVrckKWgossCAH/LXaOFipkkTwM5j7pyIUEcKF+kLsXIdQgf
         qG71XRCRdOE4fQvccoRl7FbwkwJe5+emcmyP0Ajq19FdX482mEBbpPcScnlBamzbIK5y
         DpGg==
X-Forwarded-Encrypted: i=1; AL+hErGrixF9t3QnJJDoR79sxAK5SPsVnhF6u2EgyX7P6BZYuXd6mSC759OHIQxOhmrWAOlQtAZ9@lists.linux.dev
X-Gm-Message-State: APuU4Z/7r3aNNTzLbzoNVofIlv2ZUlbKd2IHHi6BLq6phVIyDbegUzXQ
	XUeT3VJdoMbowuJcfulC9Y39xFXxj5cO5QZ8WZpKPgcGv7t1DgwVR+0Gllfms+zQGaL7uVU8nzF
	KDlK4PNnkgw==
X-Received: from dlbsn4.prod.google.com ([2002:a05:7022:b904:b0:1b3:b6c4:6fd4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4308:b0:1b5:1a6e:1bec
 with SMTP id a92af1059eb24-1b5568779e3mr259172c88.10.1795108281678; Thu, 19
 Nov 2026 09:11:21 -0800 (PST)
Date: Thu, 19 Nov 2026 09:11:11 -0800
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
Message-ID: <20261119171111.1538575-1-irogers@google.com>
Subject: [PATCH] ASoC: sti: Return irqreturn_t instead of -EPERM in uni_player_irq_handler()
From: Ian Rogers <irogers@google.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When UNIPERIF_ITM_UNDERFLOW_REC_DONE_MASK fires while
player->underflow_enabled is false, uni_player_irq_handler() sets
ret = -EPERM and returns it as irqreturn_t. Returning a negative errno
from a hardirq handler triggers report_bad_irq() in note_interrupt()
and bypasses unhandled-IRQ storm accounting (while also clobbering
IRQ_HANDLED if an earlier status bit was handled in the same call).

Leave ret unchanged (IRQ_NONE by default, or IRQ_HANDLED if an earlier
error bit was handled) instead of overwriting it with -EPERM.

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building sound/soc/sti/uniperif_player.o with LLVM=1 W=1
(-Werror) and -Wassign-enum; not runtime-tested on STi hardware.

Fixes: 76c2145ded6b ("ASoC: sti: Add CPU DAI driver for playback")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/sti/uniperif_player.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 844ddcfc421a..63dfe2b4d304 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -117,7 +117,6 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
 		if (!player->underflow_enabled) {
 			dev_err(player->dev,
 				"unexpected Underflow recovering\n");
-			ret = -EPERM;
 			snd_pcm_stream_unlock(player->substream);
 			return ret;
 		}
-- 
2.56.1.708.g77570a6a1d-goog

