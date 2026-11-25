Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645737;
	b=qmBbBGgbjOXquDO61i+gG1NGzByNfMf1uCqEyU87C4a7Q0/vdAFeqYoknp99+XcwgQQj
	 W+A0fU8kJkADMnkuYDalsZz6NxNHx5VmBmBDmvimFZo9IYBy00xVOIzo0TFtjRe+raDQJ
	 WfT+NgYMwZ80NNIQxPcmKZCbjYZK3UIaQ18JHNkoT7GjXgnNhG2hvYqnS9tK/fqjaoMv4
	 zvRe3zLoOQCcfNKMaFacvdhyg6ih/Oc4n7Ofh7+QHco18jIWYXi3+/5kQiryt8IsmQ7fi
	 DKMMqNtBPlP6Bu8Af1A/iEmZJNdQihjxlb7sR+vl+TzLRd+Q1JQZPkPxGP+DrJj5gLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+G+uV6wn4dA5VTXmYb7jbew/KoHfSprRvHUbv8X9R3I=;
	b=I3w7DdxPXuPAyCyz0fQI9pqw3FVtSzvC/x9iHe0k6SUwx31JxjbDtWSURwaGMjgyvxJ2
	 N00YL4y0XkjdCWWAwqd5oVqt+tNY4uO+TCn/t8bYJwDIXj6sjzwj5TbrH2UkxPCm+cYca
	 iDpKhB0lICqLm+eBVjzqe0vntgFxA0VZhJ3PmJVMQ/PCnRMqefEvXrEMSCHSkpMXpCRWf
	 QdkCSdZDsAIbbjdkxm5LGUwC14MFb6nUtQ+aYS5PNcEepsH8bQsswV4YHZ4x1hzywJs/e
	 zRoRRoQf6rRbRjLg0sVUx+Hmolud2FZZD9peZlxmOpw80zccYeXF4TOoe7U6ABTGRVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a93pBJXH;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D77606A339
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D77606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a93pBJXH
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6655353eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645737; x=1796250537; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+G+uV6wn4dA5VTXmYb7jbew/KoHfSprRvHUbv8X9R3I=;
        b=a93pBJXHs80jVGc+q9iYlKPDJMjBz7KAGTpDN7diZqozM9R6kZrUl2+HU/M0hO/13a
         pOZoeICN/HGheLL9W0C5kVdzcK/tbBOlaPmyxoOobWHHUUjPLTYBzK/W2j/TK7k+kMJ0
         6mD/Cgt9uJlOeoY8qCyPeM3rK683b0vExeKYkf7Tru6FJ+JqBxDI7mu8mRFyU8YJLmvA
         /+9PiQz/9TDTOW6OMbUc0/CMkNUUAfTsrk1UGMlcRmMlkfjlO8gE4rjMEzUX1zKOYZix
         HYqUGJC/ye05TjMALSaMu0PXYtw+Di3vrWGXu3h873BMRTADIcKeJjkE4eAJ2E/1R04m
         uNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645737; x=1796250537;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+G+uV6wn4dA5VTXmYb7jbew/KoHfSprRvHUbv8X9R3I=;
        b=GrIQ0dRMflhGAiy1F5vNxYP/6xrXva83zoEEMiRBMKfYyROU8lTTEwR+M3UB4EKeQN
         UVqL/98z0KGGu8ruxrod+bC299ZJzVdb7bnBsX4C2yvqtYlVXJeAI/jRUxCGliZq4Fvj
         HHfaDGQVmzUWy2195bZ3mWSkDZPj3NIpa2xWndPfVH4+2oBnSJq6FuBuwAvCxPB2Zkqt
         fo5y8nqf8jf1a+6S1/I/Lat1gyq+E9JtdWsHGAdPwGiaV01fXYwM+9fYCGxQGexmOldf
         wvwg+1MChr6TCkxFL3fuBtJrvxDbPBfJbmXKyCdUi5J5pm3eszndvk3lR7037hMF7qWp
         aCng==
X-Forwarded-Encrypted: i=1; AL+hErFQIO7CxjRtG0Pux7a0TzJup/KMVmJGZu7hcg8c1QySBVp+f/Yot+1FYs8k8mLMJing8R5m@lists.linux.dev
X-Gm-Message-State: APuU4Z83eCnw4PcOyP1MDSoXKkXhJXDZGf9YkvjXrLMRfVP5KPLFcBnS
	wBKNUxFNxw+g9OeZXPTwhqNAlY/zA0SrWQe4/rS74krRChb8uW5+QVwKg0amEAHgk4wOD1WQqf1
	27w==
X-Received: from dlaf15.prod.google.com ([2002:a05:701b:240f:b0:195:cde8:ab41])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:8148:20b0:1b5:227:7d1f
 with SMTP id a92af1059eb24-1b55689eac0mr18892001c88.11.1795645736109; Wed, 25
 Nov 2026 14:28:56 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:27 +0000
In-Reply-To: <20261125222828.1452483-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125222828.1452483-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222828.1452483-2-elkin@google.com>
Subject: [PATCH 1/2] usb: misc: usbio: stop resubmitting bulk IN URB on fatal status
From: Elkin Cruz <elkin@google.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

usbio_bulk_recv() unconditionally resubmits usbio->urb in softirq
completion context regardless of urb->status. When the bulk IN endpoint
encounters a terminal status such as -EPIPE, -ESHUTDOWN, -ENODEV,
-ECONNRESET, or -ENOENT (for example on endpoint stall, disconnect, or
usb_kill_urb()), resubmitting the URB causes either a tight softirq
resubmission loop on persistent errors or a wasted submission against a
terminating URB, and zero-length completions also inspect stale
bpkt->header.flags bytes.

Return without resubmitting on -ENOENT, -ECONNRESET, -ENODEV, -ESHUTDOWN,
and -EPIPE (matching usb-ljca), verify urb->actual_length covers the
packet header before checking USBIO_PKTFLAG_RSP, and log unexpected
usb_submit_urb() errors.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/usb/misc/usbio.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 7b5f8669aee3..6142a32c18a9 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -239,17 +239,31 @@ static void usbio_bulk_recv(struct urb *urb)
 {
 	struct usbio_bulk_packet *bpkt = urb->transfer_buffer;
 	struct usbio_device *usbio = urb->context;
+	int ret;
 
-	if (!urb->status) {
-		if (bpkt->header.flags & USBIO_PKTFLAG_RSP) {
+	switch (urb->status) {
+	case 0:
+		if (urb->actual_length >= sizeof(bpkt->header) &&
+		    (bpkt->header.flags & USBIO_PKTFLAG_RSP)) {
 			usbio->rxdat_len = urb->actual_length;
 			complete(&usbio->done);
 		}
-	} else if (urb->status != -ENOENT) {
+		break;
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ENODEV:
+	case -ESHUTDOWN:
+	case -EPIPE:
+		dev_dbg(usbio->dev, "Bulk in urb terminated: %d\n", urb->status);
+		return;
+	default:
 		dev_err(usbio->dev, "Bulk in error %d\n", urb->status);
+		break;
 	}
 
-	usb_submit_urb(usbio->urb, GFP_ATOMIC);
+	ret = usb_submit_urb(usbio->urb, GFP_ATOMIC);
+	if (ret && ret != -EPERM)
+		dev_err(usbio->dev, "Submit bulk in urb error %d\n", ret);
 }
 
 int usbio_bulk_msg(struct auxiliary_device *adev, u8 type, u8 cmd, bool last,
-- 
2.56.1.839.g22a8290db9-goog

