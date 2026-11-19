Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108085;
	b=p9WU6qhFUO6E7qX+h7Jn3HYZ1Y/vcH5k+vx5xiBKkmiP8Hodgs9Ob+8J/WslmRdyQql8
	 tQtyVJaVbKNjeLjU1EyZrt4Lh8/bvD4vdhqNUK7XOSlbuPhFtOXh2TSU0nji0EGmSRm/l
	 eMJuZAPEDEqWAG2DYZBJpSj17chqg+kFHqyTkGuOcrZgaLNSKiojw6xjjv0NEMG7QLwXw
	 QIxlud6x5OWp5YBovjl12RvNI8oekFnHIqM/r+L2FgBHVVZT0ANIEzUux/ysDsixn39nk
	 179V78cSwnvEbT1g9Hb+VPXpkt2WF7wRJijPX7Zzyph/6wCUB8gBo4SPWK+IcGfnDVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
	b=0mQlg9FRZcSjKKq4/Z3xDvqrFwRVk4xjpdtdh05IRlN3bUubaVtPiU0HqpfJDiAeusa9
	 YYjy0NdjnzmNX1UDVV7nrpouMJ8btH5hNfSfjWsMjN7SQo0YKnoD3Z8bi1Omx+NKoF4p0
	 AMvhboArBQsTABcVSX5F4tIe8IcqVJ8C0s0wX+wHqhbe/Dv0tagg7y/0fv9yMjGVj97JQ
	 IFz3dvRmghixxwr8LaY1+WHvnmDb9a58+dEbrpqXVMwORZs7ukNfwlVnR8qihK00GVb71
	 KP83kslN0MzOx8ETZAq1sOgKh/fcTHqtr1osUUGvcd+iwBNHpIZl0tlqG5RhECW5Pfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IQyeCAC+;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D4606A33C
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62D4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IQyeCAC+
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so2525580c88.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108084; x=1795712884; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
        b=IQyeCAC+2hxSJ38KIS/+MHT9iIrA+LnDeO1xV30h54Q07COE1jf8BqOgRHte36DFRv
         OQ10bjAtk0wIAcIZGtetKJahi1bi601IRsCnrYiqzhE+om4Lm199XJBmMiMEj09hSrex
         3ABD/MCzVXsrIAAcAJt4J8TQaBM8ly4bbsdUOQbMZSQ4dKhk2ndlkF09himXS7sdNiwL
         0pzfsQkpGYhcydUu076epias6E98fWPI1RKOhPkCms7zrQkC8FPE2fwauCA2lKnadFFQ
         KsW+Mg5JQ8zLgosFy8vfOy9y8sTkvxWjxmrnaT+zR3jhRVzw98SYHdFINvu8RkOpD+RN
         CU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108084; x=1795712884;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
        b=NktoaZjZF9IKMg7aN4GyjsEA5OwvDY0D2+0RImKA+THL5MwtqVjYwtegMQlWzXR7Vc
         QEJD6s7mPcdO59QC/10chQ2mHJ2vQf1c94foSFtHwZ+O2LFu6qxnYFJXKQ/l3cLT8V5r
         rTT5x8erw+ivGxtQu9Wq9DjSg6W+F9JYz5Nna4BSe4SKyCjLOIBVIOVhebEOV0Z2WLJG
         Uenxf9SjitsXp3bjW0TE9SluKlWbUEiMS+j7GPP7wGk6364F6RuB1BSsqoE2haHk8ErD
         dl2Gb7SPH+lwvUxJR3KI+ODsk+6s146jfK1hXtgOUDnn2Fn9QXlVLPTfb9Yh9RVXJUxO
         pAhw==
X-Forwarded-Encrypted: i=1; AL+hErFQ3PlDGnpEOtRKPSyR8OBA6juKLFrDBB2+LHAFNNpqOyw4a0aVwCd6gv5hwiPXQIIlSpuA@lists.linux.dev
X-Gm-Message-State: APuU4Z8pSlMME7SN6GmquapXSA/QGrH2jIG8IYpI7NthQS35RYS0L2RJ
	AMhDZOl05DXxL8aLA0VAFftJfUiFpxruWzdF8i7zERH8tr9x+kjNJNM8FCBEEmlbsQ3wCzJvmE0
	r4OA8NFvxuA==
X-Received: from dlar19-n1.prod.google.com ([2002:a05:701b:21d3:10b0:1b2:48db:23f6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2215:b0:1b2:42db:8a54
 with SMTP id a92af1059eb24-1b5568b3154mr212363c88.23.1795108083489; Thu, 19
 Nov 2026 09:08:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:57 -0800
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
Message-ID: <cover.1795106962.git.irogers@google.com>
Subject: [PATCH 0/2] ASoC: qcom: Two fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two fixes in Qualcomm ASoC drivers found while auditing Clang
warnings (-Wconditional-uninitialized and -Wassign-enum) on an
x86_64 allyesconfig build:

1. Return early for non-HPH interpolators in rx_macro_hd2_control().
2. Return IRQ_NONE instead of -EINVAL on an invalid DAI ID in
   lpass_dma_interrupt_handler().

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
Qualcomm audio hardware.

Ian Rogers (2):
  ASoC: codecs: lpass-rx-macro: Return early for non-HPH interpolators
    in HD2 control
  ASoC: qcom: lpass-platform: Return IRQ_NONE on invalid DAI ID in DMA
    ISR

 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 sound/soc/qcom/lpass-platform.c   | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

