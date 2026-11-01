Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793526975;
	b=aAjYU1DfwIUYC7VnZRauxp7K2TopON1M4L01GqFWpwUaxnSqaQMz/PqsGowlPuOEM6IE
	 dByQRGW5hujdlI9hK6rMVUDBAA2RGXirFoshgBiRjnpxv0/a/g+J81D+W8SQoBZ+2Vcx7
	 54knw83mAamEdLmh2In4NJxYNxLGW2M3N2yDAAIZ/rqNWd2nYPjZDaCYWR1xHJ5bXcntc
	 Xd+gSju5DZlSQgmjU8LqvQOQ2RuJYgwDusKhaV8T3SEalsfHLZl136ULJ4x3ywVB6JdQK
	 kL9exGpToiEP1Jsb9TzIcgbCWARs1dzNyQJMd2AXZiEGgWGWwsI4DUEQbmSV2REWdjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793526975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NH5p8XFReWk5OnsBbt0kkc9aNsHf1J+jU8MERKjpPV8=;
	b=fC+2bvPWpooPihXbkQM5MXWEns20ShAjUSZUunK9AUfzJMjmTpfUNzP+7dPt2ukvXr1l
	 +R4jLulIhJpao/QmYVdSQFZrO2NpcdkLJSW/BZtCjlGbSStQAJUSFcjCYUVYTizxVYQ8e
	 1LMGpAqaWDOH81HPnB8/ivpwFy39LA13nQrbaXTOop1+7qOSafcELmvq3ycxlFh+9e+kT
	 8zZv530fEhEfo4tqHqh50CZssv1KlCS+MVjDD6VO3hbdeWrJQQ+p+wUH0foUPumJ1b6B8
	 t5+HbUN0/bgLl9+zNELzIPYqcoNl604dMrv21/bjCaLaBBZzMzksRQYkCSedgEvJkFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyXuLk8w;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5622C606A325
	for <llvm@lists.linux.dev>; Sun,  1 Nov 2026 09:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5622C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyXuLk8w
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso17967925e9.1
        for <llvm@lists.linux.dev>; Sun, 01 Nov 2026 01:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793526974; x=1794131774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NH5p8XFReWk5OnsBbt0kkc9aNsHf1J+jU8MERKjpPV8=;
        b=JyXuLk8wHXjgNagUe+HMe1nT9PYmJiAk2HTD7mlYcI5xL+PBfDekK0jAwL7u49R9KO
         WRkq1LsAR5Xq4nDHYYqtXjBiCf0TPNALMJC3l1AV+8y0MJBO7QisPlFKmEZveLB1wxxu
         rhp8+s+QUGlUIUKOhXDuSSXdKvTs4b7rTHOww15wi6uKIyCqjsMnokKqGrzZAkgZlcbX
         OzLIkaXUlHIsgLzrn0QdfhxZElcifN4FhhPO0eRDbGvu61MpAuM634ZSwEpr9/XzYGdK
         MnSjwMStuzTWX6XuI2Y1nqMNGITJ6OMMIfkItetdoPUtih4tdVocsuBXiQzc4WVC4eM+
         3ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793526974; x=1794131774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NH5p8XFReWk5OnsBbt0kkc9aNsHf1J+jU8MERKjpPV8=;
        b=sdBtDcJq6mdWrRFsDxkeCRo+pMlQDM+V8B+Jv8bgHYqDwSouWtGrl6y3wEBkdhUkyk
         NxDEKt98gGb91XJiNaCgXmRn+fyK5sVizxOW/KqDuNGdPNYjCoUhj3N3rzhis6yeXGpV
         05SPpFAyOXdeodprEu2hdwnl0+Sjyx92eRtjHcHZLhNkfhfsH8LCVaOet/Ozcb6QQxPQ
         sXJlu9RpkZnPoyJyuUnbflbNOwcrcugzru1mTdhZaZlijb+CoIpZWsL4KpFz6ZqIoY8d
         5a1jWwM4+DfUlC/3APsEleNCVVNkQwHEMuqSN1NO9WES/h8zkTWjr50PSySnxD9p/zQX
         EX+A==
X-Forwarded-Encrypted: i=1; AKwUvBx3CAtizCgl+S7yN5y0nEBw28tXnpjj3RbiGK2aP58QNvRjQMR8Qc0fEtXHfq39L9afkhs4@lists.linux.dev
X-Gm-Message-State: AFq9FYJDVzRSN8K7jFhr1RBBW8h6GnRTXhNOaPtJ8v0AxkZ2egCou0Xw
	y0X0LCy+3JpBhLTNLqtvz/FihPVxmPqwmMZUJxWB/FRM2XGp6tSojFFG
X-Gm-Gg: AYBFou1PbPTFDF3/+z9DjC364oDryAQqu5QRw9QUB92CBCdp6XO6OHyqn26uG9IvErY
	9qxND8B59RwFmHPHDWGdLJ7kXFCQmiAP+SRLb9S6ydtsa4lcXBtwLFk35P4ZMuPVYzu8ofDXrJx
	pqtaVcYjaliYozTb2RRej1yOE74KYEtl7xHa7TZS+2pmsP5X07GVjUr5L9JlmXh3XBZs3xXUZU4
	9f+R8DTcNlud5IMhi0EKaGI/lAP2CMWEd8ZvwvjeU1qrNW9Y8Xl5hw3/v8koAZ4deYzOqLR/MTZ
	QHXI9U6txsYoWiHjUk/jU1YCuOooRPWMYVrDIAvH4/xgwHRsP6CSS3J4zKQfcQ0BUUt0B9//HTx
	Dg8yCfU5tEl1I0Aki52NeaYX40lFeSfzYHwGsBC47uWjtBHQ6JLwsM9CK45PwsSpBoJdADklpP+
	BOYKUrAo5DFoz03Eu/ThUNxBmFXiTbs1/3Q+pxL/2QBmj7FNB1BfQP2QEmEJIzcOTj9ldq0LTp1
	ZwPuf+sMhn/hQfQAl9CaU00uFPW1FyKS7MWEzBeZkVkevJRcuNZ5nfoLFlg3tmTqBhZOApOUlgY
	/ATxhFi6heEZ+mGCDNFDOIfq
X-Received: by 2002:a05:600c:8706:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4ac1765d3ddmr174291005e9.21.1793526973501;
        Sun, 01 Nov 2026 01:56:13 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm179893505e9.8.2026.11.01.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:56:13 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH] clocksource/drivers/timer-mediatek: Fix "no-cfi indirect call" warning
Date: Sun,  1 Nov 2026 10:55:31 +0100
Message-ID: <20261101095538.1046918-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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

After converting the driver to OF probing, kernel-test-robot reported the
following new warning:

vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi indirect call!

This occurs because of_device_get_match_data() returns NULL when
CONFIG_OF is disabled, which results in LLVM dropping the kCFI setup
since it knows that there is no valid target for this call. Adding a
check for a NULL timer_init avoids the warning and it makes the probe
more robust since of_device_get_match_data() could return NULL even
when CONFIG_OF=y.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610290223.iOEGeDs2-lkp@intel.com/
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clocksource/timer-mediatek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..e772f5fe8742 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -353,6 +353,9 @@ static int mtk_timer_probe(struct platform_device *pdev)
 	int (*timer_init)(struct platform_device *pdev);
 
 	timer_init = of_device_get_match_data(&pdev->dev);
+	if (!timer_init)
+		return -ENODEV;
+
 	return timer_init(pdev);
 }
 
-- 
2.43.0

