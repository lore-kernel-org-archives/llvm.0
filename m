Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645711;
	b=b+8/MrlfXyodgtFyHB7zKV1ULglZTBXmV+Yyf7Dqpl2+svHcg7sF7KPCnCYS11Y7rqO8
	 xQ/FhqQJYmJz/3ADb34lK9smeVXEMPIiNvv5iRiDw4MqOYvgMv8FjcgN9PshAfRhUfdEw
	 Jh1/trF1lKpDAXcekqB987Uo2OI/PZHi/AJ3hdmNTcvw6zcW+nBJSVf9IOulF7XahLaGw
	 kRDhqD+MfMTJO1sDAT3lVlmCOPywle0Y5nqr7i2jDuQ+9RrHFfIJLdRVPjjIfor8G7Mqb
	 XMjvOOd8URdVToXUgK64tXQsdJfUohP3uIJ20QUeeqT3x+C3WneItujMpOL2gUXXSXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=bB9dahbauIY6gVR9GUf26/TEEIOmcwn74D5zXKoaRTs=;
	b=dAywBo7/UyjHkuHeokjcwKVavp3NFJqGlmPRFGwHdjABd1F8VbtDbb7vXbONdDfbLeND
	 XoWdWL1wsOWMHpByHYPdoszuq7h5GhesTmK+ixW61LgNGfygqTPSH6Ur4+a6st3SHGM9W
	 IwN/3qGwaB5XIPM3Vel/2UPHON0/nwNr239tvAko10+B1RFCO1fpHCL+gKX8U+Y3FN4vn
	 aSRKixjdgYmbfbp6uFU/oB23V9854GqQcgKj6MlVA+5kksfZoceAKyCFV87j3sUHvKkNI
	 ZC4KXbcUay99RRSZH9ZWYjRMpu0odt2eHRHDSN5exAhxKcZNOYKEzlyNWCi/0/qSpTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iizAeEjt;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3E2606A327
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B3E2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iizAeEjt
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so3791411eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645709; x=1796250509; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bB9dahbauIY6gVR9GUf26/TEEIOmcwn74D5zXKoaRTs=;
        b=iizAeEjtsUUEpxbmLZDHmBO4UJH2OdrYARJFzyDHNoG8NsPW9285obZVtdzIxra4gz
         JyQgoKJcF9rl+c873wF8hF6x4uzX5KK3il0NpSsVWMp1Zjuozmf7l4fZK/liFgpGMi3b
         c8Ncb5ZDmD1ZH9GLM3AzZCA2EkpgoK7Gq8Bw6m7xMnylEAjXW6IrsJNzZdFoNYUtuOzB
         9PpMnchT9sSvl35TBFBVpqTofQ4VObH9amBdd76yc0anf6ORzpUB1LJXHaFvjVkLUJsi
         /hFvJeG3YDf37ZIAGOgULHZ7UBRcEIBwnwlNi9eqazzlwGFfswc7UPf14y4hgVuUwhOh
         bPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645709; x=1796250509;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bB9dahbauIY6gVR9GUf26/TEEIOmcwn74D5zXKoaRTs=;
        b=jjBbhwhsvEBrU2WncJ+EWtNYiHgdguNNpNlwcG6Hh/mtD8f6vARDYWWJG6s/2pDH+i
         nPu3cGpRFjKhxKkTDyf9TyLc2vjGUf2Le7SMDQLMDgiwFyZkMrUgMN9tKG3+TrI6txLi
         ki6UFn/BNlFygrPzBCCMYicW5pyAZ1nhx8S7li/KdVpE8ilndlwTyuDo+buvRdWRwU8d
         LkULtZ15jCrYIE9zfBspPJQZ/gexrPECErPg4WhWTYkoHire/AZCFSOMYYvvQwqXKU7x
         KqbdF7ff3rxk+Lxg//v7TbE8rirImWlbun8SzAHpRxHWA22un2Mq7IokZI3m4BhIZ8yR
         OglQ==
X-Forwarded-Encrypted: i=1; AL+hErEGCH+3DTOWFVtcnJPdtMejTbSjKBqeuxkTJ29Xog5uJLZc3x8R8hsAYYaoeYqj+j1J7tu0@lists.linux.dev
X-Gm-Message-State: APuU4Z9YFfh895d17h03nj0ZTn+OYw3TqDmclUxGFcKVnI/Og07Cyzyp
	pwwmISH5PaYIJK6u4XCKvjdOg+5sSucXh4ec0ID3atXzfQGVC1riEB+qJE83Vfylw4R2Evg1+hL
	3bw==
X-Received: from dleb17-n1.prod.google.com ([2002:a05:701b:4251:10b0:1a7:f7dd:f258])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2706:b0:192:a481:361
 with SMTP id a92af1059eb24-1b5568c12e0mr18196883c88.7.1795645707988; Wed, 25
 Nov 2026 14:28:27 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:02 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222802.1451781-1-elkin@google.com>
Subject: [PATCH] media: cx231xx: clamp bulk buffer copy length to vb2 plane size
From: Elkin Cruz <elkin@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In cx231xx-417, start_streaming() initializes bulk URB buffers of size
320 * max_pkt_size (up to 163,840 bytes for 512-byte USB 2.0 bulk
endpoints), whereas queue_setup() allocates vb2 plane buffers of size
mpeglinesize * mpeglines (65,536 bytes by default). Passing unchecked
len into buffer_filled() overflows the destination vb2 plane buffer
when actual_length exceeds the plane size.

Guard against non-positive lengths in buffer_filled(), clamp the copy
length to vb2_plane_size(), and record the payload length via
vb2_set_plane_payload().

Fixes: 64fbf4445526 ("[media] cx231xx: Added support for Carraera, Shelby, RDx_253S and VIDEO_GRABBER")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/media/usb/cx231xx/cx231xx-417.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 55af8b9f2038..0b3e856f6d21 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1297,15 +1297,18 @@ static void buffer_filled(char *data, int len, struct urb *urb,
 {
 	void *vbuf;
 	struct cx231xx_buffer *buf;
+	size_t copy_len;
 
-	if (list_empty(&dma_q->active))
+	if (len <= 0 || list_empty(&dma_q->active))
 		return;
 
 	buf = list_entry(dma_q->active.next, struct cx231xx_buffer, list);
 
 	/* Fill buffer */
 	vbuf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
-	memcpy(vbuf, data, len);
+	copy_len = min_t(size_t, len, vb2_plane_size(&buf->vb.vb2_buf, 0));
+	memcpy(vbuf, data, copy_len);
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, copy_len);
 	buf->vb.sequence = dma_q->sequence++;
 	buf->vb.vb2_buf.timestamp = ktime_get_ns();
 	list_del(&buf->list);
-- 
2.56.1.839.g22a8290db9-goog

