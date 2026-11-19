Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107876;
	b=1fdfanWh4AT5PafyMdFyeFlqmFj59FIPQsCocurdOD4Qi21r7SPcVZpG4gOREMibr+26
	 MxCBuSW2dEiKFoq0x6tQzNWmdgSj0GKTJxWGJphoYt5k6+Z9fISaGXWeVDEK6CAdp/l5r
	 cK+kTAbceuB/D/fF/W0NHIvzVA55FLvs81Jefkvt3zDbqX2a1b0DNmqB8/LUDhRxEMdRV
	 xFcQ0p26WLUkbwvDZKA25KMzc8GGicsJZQ4/no3MfXHz9ResrPqCWPfTRyOVOHaLejJvK
	 i2P6T/q05zSkmyX+44P/xz8YgIy37E3BNTXL7qijl7TqqxTg71zQsRp7KvE82k67d/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
	b=eDZxk6Z/jw2BHaG6l36hSf50eWW5j6c1BKWAtNmvexr+4CL3UQ96evrId0Mv+4EuXe8T
	 yInnHAw3GigZbzB2luqM48/trRFktAZuHp0TKmOYIGjaChhac0ZCYdYewjDTZOOaa7wXH
	 iL7m167KR5jVS7pUdrKxC+sBSe8hjizJRBlzWZg0xkY/u0+J2tLzF9qManrWk16rNaKM6
	 cMKgpDMZmmbjLmusdcG5MExq3YdkcHKAv17MWrMMgOK6rEH0Evx524DwgjcM0WlESYhil
	 JDYgaedJt1pQCbj6oOUXPqFKZRXEbSdBPHnpOaUoLKYLcnf0GbSA6Xyvz4LLh5qGERQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Lbv0sE/1";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E643560A262C
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E643560A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lbv0sE/1
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso3280084eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107875; x=1795712675; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
        b=Lbv0sE/1fYBw2iUOD5B9gOzwvZ/VES7HXg74bA2ECUcqxUsPiLzpY3gm4mg9fF6sn3
         O/L9Bo+GVEaz2Lj+4imNo5ylN5qxwoPH1p6PFlvxvNGJL7ZNfmCaRIiaRYrmbuKSVyRa
         Wn8EAW6ft+jyBQ6Y6FU+O+N+leqRsRthNujd9NHO3/Id12dizJzUdlM025XTBEXCuUfI
         HtFXXpDgbwzZZ0CUuANpOjjy4y+6pUXOBmbl0vUaYdApSrU9cW7jOna5OtRu7EICOuEG
         Jk/ohPLUYDe7rH0+duA0B65FsiTww7W2LqF9qODwZ5jwdptAbdpEa0zl7UVmoiADWoIr
         VOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107875; x=1795712675;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
        b=XjonAH0V4gNvErKj0Ber5fCi69juJSp2qfzgv4b3KcfqUbosm+25+ZBSdoJeLcKMAG
         aigPxS15o7/KsxD35nWDR3iiKSgrQtWhJxzEpGX6TDY1HBv7x9cFghDMmWzRrDeBA1/b
         7dG43md6Qjz/PbPyQNGc5M5SKLKMYSBFIBrZPbT0ytHpmqFlu+n5D7xToyGEiMGWkh7A
         bElbjAVSy/a62K8ay5VsDybMDwWczqSpl1zQRqpJoNt87e2kXyXfS/QnFr85e0Yp5Oc9
         4VhIVe/0JejJm/KQSCsQFHrXqTKmauprKq4lB9pfGmoPOJQfRw7YsJCg1L07++AtaFgn
         IzrQ==
X-Forwarded-Encrypted: i=1; AL+hErEQAkdFwE3LtjEnONpg7HE4KCCQ4QyZzVL7sXEQjtVhey7EKfAynHks9ssDHPKRgYq7AihV@lists.linux.dev
X-Gm-Message-State: APuU4Z8s5gkGSrKzxJfbfr7J3SUcVJGhWM79kDvR4O937OZ4M8/pTadf
	XBZ2UL2p7XO6DTJnbo6xuZqWSUK6UYOwRvLnYicic3fTfoJmQ/TGzZFeix1oelFs3WKqBsCEOSE
	Y9sWwVPUbsg==
X-Received: from dydd12.prod.google.com ([2002:a05:693c:61cc:b0:385:900:c492])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:b594:b0:381:5fe2:8008
 with SMTP id 5a478bee46e88-38281eebbb1mr7411711eec.39.1795107874469; Thu, 19
 Nov 2026 09:04:34 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:24 -0800
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
Message-ID: <20261119170424.1512172-1-irogers@google.com>
Subject: [PATCH] bus: mhi: host: Fix uninitialized status handling on BHI/BHIe
 read errors
From: Ian Rogers <irogers@google.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

mhi_download_rddm_image(), mhi_fw_load_bhie(), and mhi_fw_load_bhi()
poll BHI/BHIe status registers inside wait_event_timeout() using:

  mhi_read_reg_field(..., &status) || status

When mhi_read_reg_field() returns a non-zero error code before ever
writing *out, the short-circuit OR wakes wait_event_timeout() with a
positive return value while leaving status uninitialized on the stack:

- In mhi_fw_load_bhi(), only tx_status == BHI_STATUS_ERROR (0x3) is
  treated as an error after wait_event_timeout(), so any register read
  error where stack garbage is not 0x3 causes mhi_fw_load_bhi() to
  return 0 (success) despite failing to read BHI_STATUS.
- In mhi_download_rddm_image() and mhi_fw_load_bhie(), status is
  compared against BHIE_*_STATUS_XFER_COMPL (0x2), reading uninitialized
  stack memory if the first register read fails.

Initialize rx_status and tx_status to their *_RESET (0) constants and
require tx_status == BHI_STATUS_SUCCESS after a non-timeout wakeup in
mhi_fw_load_bhi() so register read failures reliably return -EIO while
genuine timeouts still return -ETIMEDOUT.

Found by enabling Clang's -Wconditional-uninitialized on an x86_64
allyesconfig build, with AI coding assistant help to audit the warning
and prepare the fix. Build-tested with Clang; not runtime-tested on MHI
hardware.

Fixes: cd457afb1667 ("bus: mhi: core: Add support for downloading firmware over BHIe")
Fixes: 6fdfdd27328c ("bus: mhi: core: Add support for downloading RDDM image during panic")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/bus/mhi/host/boot.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 19c84913cfb9..439bc9d0797f 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -158,7 +158,7 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 {
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	u32 rx_status;
+	u32 rx_status = BHIE_RXVECSTATUS_STATUS_RESET;
 
 	if (in_panic)
 		return __mhi_download_rddm_in_panic(mhi_cntrl);
@@ -213,7 +213,7 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
-	u32 tx_status, sequence_id;
+	u32 tx_status = BHIE_TXVECSTATUS_STATUS_RESET, sequence_id;
 	int ret;
 
 	read_lock_bh(pm_lock);
@@ -261,7 +261,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	void __iomem *base = mhi_cntrl->bhi;
-	u32 tx_status, session_id;
+	u32 tx_status = BHI_STATUS_RESET, session_id;
 	int ret;
 
 	read_lock_bh(pm_lock);
@@ -295,7 +295,10 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 		goto invalid_pm_state;
 	}
 
-	return (!ret) ? -ETIMEDOUT : 0;
+	if (!ret)
+		return -ETIMEDOUT;
+
+	return (tx_status == BHI_STATUS_SUCCESS) ? 0 : -EIO;
 
 invalid_pm_state:
 
-- 
2.56.1.708.g77570a6a1d-goog

