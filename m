Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645331;
	b=MTpdX5tXhEfoABqo1yICNBjUMge6d5ePzaagO3ycObmSBOLSyFiug1zCvsdJKtIQkmQ3
	 ZaoYUFyejq907OIhBm8WbKnhmXgh8P9Q+aXwxn1D0ANWjhpos0b8uKgDT69Zjqm8ozzwC
	 lcSEd2pRavHjFleSH4apLDEgALH9JBVu7cQRXJK6H+RyIRHTAUefGujTr7mulU/+BOpgZ
	 zyFutJoNnB60nNGLA9yh7YuBfFoKBfR+TNG0bmg2tXX3Z5jvnd48KqjFIXdfqYG1baBzp
	 ZnZRYkbsB/SxP2DJPiasb+seyM/N5Hq55wWojROZbTYGApJ6QPxqer9jw8B2G6BzexA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QW8zqydOTZ07N3+e36tZRL749kq/NvBgBV68uNCfZKc=;
	b=aZAjadNpxvZ9CI/QGG0CX4wi7PvTFbyQk2iuEsx10teR4BlFFvHA905ze/X/+nzFj7jq
	 VBvsVF0Jr8mUuseF4trppkoGbR3pXwrEfLCdCsrB9ncXAHdcJEGvQ8w+ZLSoekJTcDH4W
	 x0OqUTk6cJrdmgNvu3WAqUh4UOBm9BQUg/+ZCM6lAziPvxegSf8QiP9+VxBpLtSNY2STR
	 yEkKslxN8cezq2UeMBH24aAdV/F1KGsQDDK7QB9zT7kgzmB94sKOtEsipt+naj5brtL6F
	 x0Z3n/lukyUsJ4uf2N9KKPgykX5bwgTDNMnakNKGo2MUF2kWGNgoqcRt+itbvk7KyUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PzfJhy6z;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48281606A321
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48281606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PzfJhy6z
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so1797660eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645330; x=1796250130; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QW8zqydOTZ07N3+e36tZRL749kq/NvBgBV68uNCfZKc=;
        b=PzfJhy6zsX9NQN8cX1ZjTNHdmvO8ojYaWsVcHrvSVsv2X5/04jLFD4VeQlGro/6jOc
         d0IX0dgGCu+q6OZ+mTL6C6Mw44rmpS8hS4+7OHwpF70gohxaf4cB+BQF57y2gmq5Q9yu
         +e/hx2cxqqQPXmuanj9IFhzKqP8gz50Vn9rxRaHYc/C3zmPEdxWwfiMKONXdTFxTVshE
         QDwvf/uFN0tg4sz/3hELIkkriT0iEMcASbNFFi5Blc2Szh0VFjcfVTw4bgrHdl+L3OSj
         qMa3WVo0kg8EUnMZr9PnaXhNAWQvPiDDZozExHPF3NY0FAKnUi70ummuVZ3S2w+NQWl0
         h0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645330; x=1796250130;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QW8zqydOTZ07N3+e36tZRL749kq/NvBgBV68uNCfZKc=;
        b=AOBwI2ftNRStdWsFMrjCLUbLL77/lnXGccZtYI8TQkFs+j3mhJ1DgJtgQjSEJgbq6j
         NHh9h9cOd/dF4VV2egfHQ5ewcTOnrS4FXu0UqVSWsqbBjKH+ZsirhMEnxrn1HDItS3d4
         IskSJhN6MGdHxakhgvFZQhpuw872uOpr1R1W71zEZZGTJaSaijCwxG2MzkQaAgMrHP4a
         DYnQUO35+mkASknaHSephVJvUpYDbgILrucfQn0L/4sbhAQtq4+AR36tiQlfLjBgxx28
         ESvviJrt4atFcADzUFLdmJbhlPrANzuZ2h9pTyMBlcIe/UYmdg011UkFi/qvslXZcFkR
         hdbg==
X-Forwarded-Encrypted: i=1; AL+hErF5YK8f+FyxjYb9CcD4B0KSWI1CGAyi4OdH2PDQq8ctCU7Flnvh2B7QomxO1Ky/HZ9KAMaW@lists.linux.dev
X-Gm-Message-State: APuU4Z9QzGqUYaSS1beOEX5CeajDtvJ8cXlIxx7Wb4sW9QkxVvpRobnG
	V3LD3WYAA97damjUbNN17xYPRPXUsYSE2Z9qzRDRpz8skQX8RIvGOPbXoNe+HwBLd1Uu+TVq2o+
	4AQ==
X-Received: from dyblf15.prod.google.com ([2002:a05:7301:a0f:b0:384:e0d0:f88e])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:2728:b0:383:c2f0:e753
 with SMTP id 5a478bee46e88-3856c0d0a68mr22214108eec.3.1795645330238; Wed, 25
 Nov 2026 14:22:10 -0800 (PST)
Date: Wed, 25 Nov 2026 22:21:01 +0000
In-Reply-To: <20261125222102.1430675-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125222102.1430675-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222102.1430675-2-elkin@google.com>
Subject: [PATCH 1/2] media: s2255: validate transfer size, payload, and offset
 in save_frame
From: Elkin Cruz <elkin@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In read_pipe_completion(), pipe_info->cur_transfer_size is never
updated from purb->actual_length, so short USB bulk transfers leave
save_frame() scanning and copying up to 16384 bytes of stale data.
In save_frame(), marker scanning in S2255_READ_IDLE reads 20 bytes
(up to pdword[4]), but the loop bound only subtracts 12 from
cur_transfer_size without first checking cur_transfer_size >= 20.
In addition, skipping by DEF_USB_BLOCK can advance past the buffer,
payloads smaller than PREFIX_SIZE underflow vc->pkt_size - PREFIX_SIZE,
and frame offsets past cur_transfer_size underflow copy_size.

Record purb->actual_length (bounded by max_transfer_size) in
pipe_info->cur_transfer_size on completion while submitting URBs with
max_transfer_size, require cur_transfer_size >= 20, bound the loop by
cur_transfer_size - 20, cap DEF_USB_BLOCK skips against remaining
bytes, reject payloads smaller than PREFIX_SIZE, and validate offset
and frm->lpvbits before transitioning frm->state to S2255_READ_FRAME.

Fixes: 38f993ad8b1f ("V4L/DVB (8125): This driver adds support for the Sensoray 2255 devices.")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/media/usb/s2255/s2255drv.c | 51 ++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index ba717cdf31ad..9ddc13c99a81 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -1714,17 +1714,21 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 	idx = vc->cur_frame;
 	frm = &vc->buffer.frame[idx];
 	if (frm->state == S2255_READ_IDLE) {
-		int jj;
+		u32 jj;
 		unsigned int cc;
 		__le32 *pdword; /*data from dsp is little endian */
 		int payload;
+
+		if (pipe_info->cur_transfer_size < 20)
+			return -EINVAL;
+
 		/* search for marker codes */
-		pdata = (unsigned char *)pipe_info->transfer_buffer;
+		pdata = pipe_info->transfer_buffer;
 		pdword = (__le32 *)pdata;
-		for (jj = 0; jj < (pipe_info->cur_transfer_size - 12); jj++) {
+		for (jj = 0; jj <= (pipe_info->cur_transfer_size - 20); jj++) {
 			switch (*pdword) {
 			case S2255_MARKER_FRAME:
-				dprintk(dev, 4, "marker @ offset: %d [%x %x]\n",
+				dprintk(dev, 4, "marker @ offset: %u [%x %x]\n",
 					jj, pdata[0], pdata[1]);
 				offset = jj + PREFIX_SIZE;
 				bframe = 1;
@@ -1737,8 +1741,9 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 				/* reverse it */
 				dev->cc = G_chnmap[cc];
 				vc = &dev->vc[dev->cc];
-				payload =  le32_to_cpu(pdword[3]);
-				if (payload > vc->req_image_size) {
+				payload = le32_to_cpu(pdword[3]);
+				if (payload < PREFIX_SIZE ||
+				    payload > vc->req_image_size) {
 					vc->bad_payload++;
 					/* discard the bad frame */
 					return -EINVAL;
@@ -1747,9 +1752,12 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 				vc->jpg_size = le32_to_cpu(pdword[4]);
 				break;
 			case S2255_MARKER_RESPONSE:
-
-				pdata += DEF_USB_BLOCK;
-				jj += DEF_USB_BLOCK;
+				if (pipe_info->cur_transfer_size - jj - 20 <
+				    DEF_USB_BLOCK)
+					jj = pipe_info->cur_transfer_size - 20;
+				else
+					jj += DEF_USB_BLOCK;
+				pdata = pipe_info->transfer_buffer + jj;
 				if (le32_to_cpu(pdword[1]) >= MAX_CHANNELS)
 					break;
 				cc = G_chnmap[le32_to_cpu(pdword[1])];
@@ -1806,20 +1814,28 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 		return -EINVAL;
 	}
 
-	if (frm->state == S2255_READ_IDLE) {
-		frm->state = S2255_READ_FRAME;
+	if (offset > pipe_info->cur_transfer_size) {
+		frm->state = S2255_READ_IDLE;
 		frm->cur_size = 0;
+		return -EINVAL;
 	}
 
-	/* skip the marker 512 bytes (and offset if out of sync) */
-	psrc = (u8 *)pipe_info->transfer_buffer + offset;
-
 	if (!frm->lpvbits) {
 		dprintk(dev, 1, "s2255 frame buffer == NULL.%p %p %d %d",
 			frm, dev, dev->cc, idx);
+		frm->state = S2255_READ_IDLE;
+		frm->cur_size = 0;
 		return -ENOMEM;
 	}
 
+	if (frm->state == S2255_READ_IDLE) {
+		frm->state = S2255_READ_FRAME;
+		frm->cur_size = 0;
+	}
+
+	/* skip the marker 512 bytes (and offset if out of sync) */
+	psrc = pipe_info->transfer_buffer + offset;
+
 	pdest = frm->lpvbits + frm->cur_size;
 
 	copy_size = (pipe_info->cur_transfer_size - offset);
@@ -2072,6 +2088,9 @@ static void read_pipe_completion(struct urb *purb)
 	}
 
 	if (status == 0) {
+		pipe_info->cur_transfer_size =
+			min_t(u32, purb->actual_length,
+			      pipe_info->max_transfer_size);
 		s2255_read_video_callback(dev, pipe_info);
 	} else {
 		pipe_info->err_count++;
@@ -2083,7 +2102,7 @@ static void read_pipe_completion(struct urb *purb)
 	usb_fill_bulk_urb(pipe_info->stream_urb, dev->udev,
 			  pipe,
 			  pipe_info->transfer_buffer,
-			  pipe_info->cur_transfer_size,
+			  pipe_info->max_transfer_size,
 			  read_pipe_completion, pipe_info);
 
 	if (pipe_info->state != 0) {
@@ -2111,7 +2130,7 @@ static int s2255_start_readpipe(struct s2255_dev *dev)
 	usb_fill_bulk_urb(pipe_info->stream_urb, dev->udev,
 			  pipe,
 			  pipe_info->transfer_buffer,
-			  pipe_info->cur_transfer_size,
+			  pipe_info->max_transfer_size,
 			  read_pipe_completion, pipe_info);
 	retval = usb_submit_urb(pipe_info->stream_urb, GFP_KERNEL);
 	if (retval) {
-- 
2.56.1.839.g22a8290db9-goog

