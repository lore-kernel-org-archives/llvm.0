Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202689;
	b=EbMox4rXGrurDpUKx6KjB4q9VqNUQlydDxrmYwNwDhK/b+zRqAWur9pe4ROi1SgI4XwG
	 sxoMm1vX9ANUcoH3MwLEnNb2mhjRqach4OGuhAlLFWcLTrQzYVJv7QWprgkT6lCRSEfDp
	 XboM+ohOw34yAxgB3Z6o9X5hWc2L+0FVlnjIcJffEcsdFuEdaKRMNtzuS5VU3sdvPhxyh
	 vC+mpbBdS/F/G1F41XKUT5n9fu6oZBvtz2FTVSzraEU3K0dFQ+xvX8WFdoOvoOBfEoVkS
	 0k9sPpDv6jinLMntdw0wsj9Yfur2w+edUxzW+Jw9YIvcDCv3fxg6FI0aW4U2uILr0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=q/fv2Bmd9wBtLji1WNEQDEdz1uwjcCB1ddxM9BJCZv8=;
	b=fZ+p0IjZBdqL5pgIhgOpObzuczWuDVv2lA6UU8Zh30eWbb/2ibSsKZA0tjbem9V5nv8Q
	 w0i9tLiXoM375t2j8M0Lzer8SmAu9hnKQ0LSn/Hqebvl8cLaW+H86MyjQ25NqOyhiTyfn
	 SfTCOzO8AVLscIE5+PRkFexs4rxy9k/ZXvYRASId2tFDL95tSAL0sCGt0oOO8XEj1H4Ga
	 iLNnhl3mhRL6b4/1qvWcMS1Wh/92IjEUAZhbQMrkcFDF80sJf/o3KTHor4o4k2y1y4fcV
	 wo+KEA45vrpGIzgPVtg6QVAupHsb0puA18uS5XcwYnu3TS/WmutCksLQUrxI0yQBeoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vj084W2o;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821D260A2602
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 821D260A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vj084W2o
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso3834346eec.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202687; x=1795807487; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/fv2Bmd9wBtLji1WNEQDEdz1uwjcCB1ddxM9BJCZv8=;
        b=Vj084W2oj4tm96Q/bIp5r7injyKhRl5XCTLUAVpnVuBuyh7xvrQshygf9uBNZINccr
         l6iRhmfeK6G2XC2LauVNij/2npVXgT/WBdgk5f7LFsPY1hrpPgPZHfZWlXnUnxV8c4+p
         tqukn8vh7UdGeJ8Z8XzO2NA7XK3YFPlfnk1VX9B0hjX0hNsjXz7f2hchoS2jkqlFU0TY
         G+KanpJ53CEiwt6xoimZkDnrRphtgwVHvEJp9eGW8IiTETo7SJsn6JSrubZKKVEu1B74
         ZUYihek3peTsFtFxsOecO919HGvFLj7NK8RXUxCfbuKCk2VlZDu+75Nq8yOinES+b8so
         Ps6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202687; x=1795807487;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/fv2Bmd9wBtLji1WNEQDEdz1uwjcCB1ddxM9BJCZv8=;
        b=esYXHMMAoSKKOa5RZERlFI4qhkhB8Ki6gECwUF3bpb6pniu3/QwbhRHv6zZZQXuM+E
         0S1erBVIHQHa7Fds7kSd1uRVAPUbvFJKdI2LVdG6vwvUVrb+PAlEUE/3QsZ2jjwjEZVR
         luxBD/wkESA0/KCoWrtyoMLZS6wx3NPXmTCqfHiWZkxuKPs365qi9Am+qorn9A2jbdrt
         2WAfHfSKbqBl1qftVUxnDHNfOSthdCVpo4Ch+jhyAzK4zFCimAZZd4TXz/mHm3Eu1tAJ
         wVJOpG8rcXJgXAqmlZm/RoLQXShu1pVDuSAFtcwuEMqO7JXzV2xnfAqhhLe4ZmhCQnCg
         p6KA==
X-Forwarded-Encrypted: i=1; AL+hErEpVrO2g2b7RUNwISptXfiy8YVW9JPcLloypnPATgaYYBoD7fWCpoq55GKFtX0i8E/Qcve9@lists.linux.dev
X-Gm-Message-State: APuU4Z/QcPs4vrQ2Zuq7L74A14LdBYC31PhZ3+MYvQ55VALGkJTVCJKn
	L/B9E4NNIk8QxcFfYUU2/IYzrFDuIP8+YIImv7i4IwTsgQtf6sA9YkaNTTN1Cru47Gkvu+7hhjm
	Wxw==
X-Received: from dyx8.prod.google.com ([2002:a05:693c:8208:b0:36c:a092:ca28])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ce11:b0:384:fe97:8ccc
 with SMTP id 5a478bee46e88-3856fb58443mr4028219eec.29.1795202686267; Fri, 20
 Nov 2026 11:24:46 -0800 (PST)
Date: Fri, 20 Nov 2026 19:24:32 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192432.2873409-1-elkin@google.com>
Subject: [PATCH] media: amlogic: c3-mipi-csi2: clear csi->src_pad on error in enable_streams()
From: Elkin Cruz <elkin@google.com>
To: Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

When media_pad_remote_pad_unique() fails in c3_mipi_csi_enable_streams(),
csi->src_pad is left holding an ERR_PTR() value. Subsequent calls such
as c3_mipi_csi_disable_streams() can then dereference the poisoned
struct member.

Reset csi->src_pad to NULL before returning -EPIPE.

Fixes: b63ef604a28d ("media: platform: Add C3 MIPI CSI-2 driver")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index b5e59e810e13..c261daef15b3 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -426,6 +426,7 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
 	csi->src_pad = media_pad_remote_pad_unique(sink_pad);
 	if (IS_ERR(csi->src_pad)) {
 		dev_dbg(csi->dev, "Failed to get source pad for MIPI CSI-2\n");
+		csi->src_pad = NULL;
 		return -EPIPE;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

