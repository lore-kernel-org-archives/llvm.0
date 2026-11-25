Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645333;
	b=Pnuo6xssruaqTI3ZhCHXMl+1fdy/zlQejFi9r33cykH2cFt1SutiBmcC3ma6+ctDweup
	 W6k8Z0+8e2WY9zPkcNBONAqTiVbogpebz9HG0fkSTdv8X+lgm1uwOcCBgI+AL0S5vrziJ
	 WxmqmkRvtvK9akpwFePRdw3hrCNegfAeBqB0NSvN883MZgwzEdhP+4srybHY5ukNWkvgI
	 aB6G+fNrJdCq4taNKEH7BFfKxnjv+6lyTeNaqVGa+eNpA7x/kkoSmg6ga+j/mq3T7DZ5+
	 GWg+tztwkU4eAJEcieBjKT2V2d7+mAEJNo47IRgHh9uiArBswx8NOk4NSK98DM+Lu6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SKmb0CjpLP4ITLhIHnRihH0kGoAN8DUIdYytp7QeTFg=;
	b=zMex7cipP7vL9M8lc9AF8oxZizr01VHno99y3f3VygtbbKbtb778d6HRyKkqi9uI509d
	 lNtSqdNYDJLJJm+8gJzRxouQtRHDcpILlNg2Wktt9sWk4LvILlQGKoBXOkoCbDvv/+PH/
	 KIsl7tbAY93O222DM3bdph1yAAiwgvtIXzSMIUAnC+NygbGMylRCOR29TJ87ewL1/glp/
	 ZNxOf3eEq7LuiwAmytGPj8j+BYAj8QLe1/iQ8zCSEeGlV7a/oUDuzplWj59w50MEnruH3
	 qFfS9xS6OjW86qGNtCylxlHFRVz3QyJNBfs1XmWwUudvq8F1elPp3uU4A9SBuK7E8og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pdqQQAOE;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3649B606A337
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3649B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pdqQQAOE
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7334255eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645332; x=1796250132; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKmb0CjpLP4ITLhIHnRihH0kGoAN8DUIdYytp7QeTFg=;
        b=pdqQQAOEpomqAo7f7Oqu9p48Py+3tmqM4L7kAldg2U0R1XtT1sk7Sovc4fur96maVl
         vC14z33Gxe+H5Xjem5kKDS4HAeztEgHZp6DPN1rWZVHnh5O/5t8s3W95uA820RJ2EhCS
         eZ8RLCXGtDDa98mMNLEfblsv+tt/yA9lt3t6eXcSnYpRwYdnlAK0r/lomLSjmYB2LWLI
         rBYr/wqWMTWtBu51MZojxkZg0lf5q35XLbAvwYo5hFcjFAKeZ0taJstwK+4ypFc6nmfD
         ClC1sOK1lTS8JyMt4+DNom4Dd+ohqWiHmf0Cuv+AqOfwTLC5gOor15h8EPFdSOmXX8KH
         GfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645332; x=1796250132;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKmb0CjpLP4ITLhIHnRihH0kGoAN8DUIdYytp7QeTFg=;
        b=DxF2dBvDDP4StUi7RgbhjVfwL6j1w+8EZ4825FbcaNpClIFTaqJ7l4ExL+UxxvcjDV
         1F4gdH4R7HZWCrs/JTBpJVUcKfai1UD8kR9aEUsR5B0qkRt7O+lMmJWuC6qqxPhSOyDw
         0CTOk3h0Y6mVFBhuvIiGq7c18h9zei9Ptl52Ibj1ShxHusUZG4jVwezYwRAQS3G/Ce1X
         YqSpJxg3uYAgIZxmcdJHSW89FaPvToBLozBCAhiGoMunIB1L4DAe6xzqLPXz4vtd1fg2
         Q3OV6tSYwwviZa7hCLLlNCoKOw7jtXbjHHVfhpSCvGHECcHhJ7pkyJ43h1/tZ3MhCCBB
         pfww==
X-Forwarded-Encrypted: i=1; AL+hErHvSMCjdIS19q1YhQ0sr8X9yOjvuJvUVUo93aV3r9whrSaU+N1j4njK09MHJd4mkf8/wEGb@lists.linux.dev
X-Gm-Message-State: APuU4Z/l1l8x5a8mfuj5gs0YH2rBFE/5vkpM50spGqeUYxz8MnyfJCaQ
	KcUAKCxYpSD2Gr2Bh5Z9N+HreWzRqhwJvNVhsTgDOTOP8ktu+jFzGTywUmfH2kKsD/OslNlvB1E
	Miw==
X-Received: from dlgw19-n1.prod.google.com ([2002:a05:701a:cc93:10b0:1b5:7477:ff02])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2701:b0:1b2:43cc:48
 with SMTP id a92af1059eb24-1b5568e8253mr16557418c88.33.1795645331978; Wed, 25
 Nov 2026 14:22:11 -0800 (PST)
Date: Wed, 25 Nov 2026 22:21:02 +0000
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
Message-ID: <20261125222102.1430675-3-elkin@google.com>
Subject: [PATCH 2/2] media: s2255: advance marker pointer and use unaligned
 reads in save_frame
From: Elkin Cruz <elkin@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In save_frame(), pdword was initialized once from transfer_buffer before
the marker-search loop and never updated as jj incremented, repeatedly
inspecting offset 0 instead of scanning through the transfer buffer.

Derive pdata from pipe_info->transfer_buffer + jj on each iteration and
read the 32-bit little-endian marker and header fields via get_unaligned()
and get_unaligned_le32() since jj advances one byte at a time.

Fixes: 3fa0060526ea ("V4L/DVB: s2255drv: fixes for big endian arch")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/media/usb/s2255/s2255drv.c | 34 ++++++++++++++++--------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 9ddc13c99a81..9b6979c811e2 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -31,6 +31,7 @@
 #include <linux/videodev2.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
+#include <linux/unaligned.h>
 #include <linux/usb.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-vmalloc.h>
@@ -1716,23 +1717,24 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 	if (frm->state == S2255_READ_IDLE) {
 		u32 jj;
 		unsigned int cc;
-		__le32 *pdword; /*data from dsp is little endian */
-		int payload;
+		u32 payload;
 
 		if (pipe_info->cur_transfer_size < 20)
 			return -EINVAL;
 
 		/* search for marker codes */
-		pdata = pipe_info->transfer_buffer;
-		pdword = (__le32 *)pdata;
 		for (jj = 0; jj <= (pipe_info->cur_transfer_size - 20); jj++) {
-			switch (*pdword) {
+			__le32 marker, resp;
+
+			pdata = pipe_info->transfer_buffer + jj;
+			marker = get_unaligned((__le32 *)pdata);
+			switch (marker) {
 			case S2255_MARKER_FRAME:
 				dprintk(dev, 4, "marker @ offset: %u [%x %x]\n",
 					jj, pdata[0], pdata[1]);
 				offset = jj + PREFIX_SIZE;
 				bframe = 1;
-				cc = le32_to_cpu(pdword[1]);
+				cc = get_unaligned_le32(pdata + 4);
 				if (cc >= MAX_CHANNELS) {
 					dprintk(dev, 0,
 						"bad channel\n");
@@ -1741,7 +1743,7 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 				/* reverse it */
 				dev->cc = G_chnmap[cc];
 				vc = &dev->vc[dev->cc];
-				payload = le32_to_cpu(pdword[3]);
+				payload = get_unaligned_le32(pdata + 12);
 				if (payload < PREFIX_SIZE ||
 				    payload > vc->req_image_size) {
 					vc->bad_payload++;
@@ -1749,7 +1751,7 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 					return -EINVAL;
 				}
 				vc->pkt_size = payload;
-				vc->jpg_size = le32_to_cpu(pdword[4]);
+				vc->jpg_size = get_unaligned_le32(pdata + 16);
 				break;
 			case S2255_MARKER_RESPONSE:
 				if (pipe_info->cur_transfer_size - jj - 20 <
@@ -1757,14 +1759,15 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 					jj = pipe_info->cur_transfer_size - 20;
 				else
 					jj += DEF_USB_BLOCK;
-				pdata = pipe_info->transfer_buffer + jj;
-				if (le32_to_cpu(pdword[1]) >= MAX_CHANNELS)
+				cc = get_unaligned_le32(pdata + 4);
+				if (cc >= MAX_CHANNELS)
 					break;
-				cc = G_chnmap[le32_to_cpu(pdword[1])];
+				cc = G_chnmap[cc];
 				if (cc >= MAX_CHANNELS)
 					break;
 				vc = &dev->vc[cc];
-				switch (pdword[2]) {
+				resp = get_unaligned((__le32 *)(pdata + 8));
+				switch (resp) {
 				case S2255_RESPONSE_SETMODE:
 					/* check if channel valid */
 					/* set mode ready */
@@ -1783,19 +1786,18 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 					wake_up(&dev->fw_data->wait_fw);
 					break;
 				case S2255_RESPONSE_STATUS:
-					vc->vidstatus = le32_to_cpu(pdword[3]);
+					vc->vidstatus =
+						get_unaligned_le32(pdata + 12);
 					vc->vidstatus_ready = 1;
 					wake_up(&vc->wait_vidstatus);
 					dprintk(dev, 5, "vstat %x chan %d\n",
-						le32_to_cpu(pdword[3]), cc);
+						vc->vidstatus, cc);
 					break;
 				default:
 					pr_info("s2255 unknown resp\n");
 				}
-				pdata++;
 				break;
 			default:
-				pdata++;
 				break;
 			}
 			if (bframe)
-- 
2.56.1.839.g22a8290db9-goog

