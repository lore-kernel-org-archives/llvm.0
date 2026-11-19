Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107949;
	b=aV7lXmdT9cKrzob+GPmBq1TZc+r6jmw5KsJK5aZMg+5qjlzCPoXbajbCUfTV30okGnkk
	 p61U96XRi1IiHntmwGGReBgHaVgT+aUdBDqbeTyUf5KDOKjwO1pDPcUzn9Zha9YObVx88
	 tKGTqsCk/plhs3cPFy42GPeZYnxFxaoy/X73J8ouMqb6f6hr8pDmxUVrg6SWmRMB3NiLu
	 Q/L093kx0afX+ohJi22/oiS4IeL7/uVCadMi+WY8W4VfPkwrYnCR4y5QqNg2I38eIKFcp
	 TbLeSA4+f3V00ApR585aAXfO335uxqnaNgwTf0U/qm0kTcRVe8Ynzxx+KqoPdKQC7HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cXCYn/0B4iRLLG05BKoGcd3OGmZM5xlbdyRfY3dPeOU=;
	b=jwg+BMRffW8sEo5PGWyCtf/lUPK8nS2w5LiTvIsmMpH7/0Yh3xAU5fs1bRbeBGwmRq93
	 YnkOCREz8cQQ+27iiTh09wJGPr2bVOw1f5+ywYbJL0ve5gFoVb/FkZ9tLfSbFBTyjcMjL
	 GlkRDqKSUtnPTFBO1TS1OI5ZZCEqkHUdNviW6oi24nIZaJHwu/PG3wRbB+EzUF79xcL/G
	 qMRd/cK8UPpud8OLPfvy8wL3/R+NcDsdhI154GrVCp+hevyrrWVCOwy984SstbkfwofmM
	 IwIPHSHc0dkmVcIEAyD3QvD64X3rjzUPKc5cUrXWkJViJXKfWLMNLMHYB2FDTzPeecw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UPk3odIz;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BBC606A32A
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BBC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UPk3odIz
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1027268eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107948; x=1795712748; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXCYn/0B4iRLLG05BKoGcd3OGmZM5xlbdyRfY3dPeOU=;
        b=UPk3odIzdSPFzBb+CeVQjsviVI4f6ASah/WkbZHgY/HoswiavfpDqA0R6H7LdCFBN4
         4ghy6R5m+8JSsrQqwpi5dBsu24g5eKA7HIe+jFmOWLosgEW8zxUWDcnKTpIidV8K3pwU
         /d0cfEwdsH410nT9SUCkzWJxpCdZOEpnlu9mMIRZ80RfP477nw7KmZhm4mIUZuALFwFk
         yxwAXpzwUZ6oL7f8YM27jbyjwjIgSjTAhiwsLFx9pS+t9mEPBIHEPb8ov7NKSjKjeLNi
         xquVVUpBnQytydtlyPRMWEtIac2TZUi5eaIkM/lWUIpfatr0Fih1thbeYsCmebOLHT6e
         VIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107948; x=1795712748;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXCYn/0B4iRLLG05BKoGcd3OGmZM5xlbdyRfY3dPeOU=;
        b=F2nxFKFYzhN/S62HgBuVsWV49lSaQDzb29IEMWJblLpmHYTLk7sSiwusitQdsliWvx
         xB2fxWFqeFib4I/nvgZ0MO1iBf5/sP6JdBB8LSoNFeVJ0qUKngLd9Ss+bX/psmEidtQM
         u98GOy4bUTxdxukWqyd0tO1BbCFaFTPAdDk1VlhVZkbFOEblagahvgPYd6hxzPuXUPW1
         ZDAo9sw7whRJ5sfys/TElO9jjSFFJBgCv3jhFKVp4rcQjUr8rQvSFZQ/GNCp/HGW4Cfe
         z4jnAd8vH8fqDN5EUADSpbAKyL15MllZLnmC/hn1kVI6IZfUky5wEpKbgrCWigZBJGV3
         tQrg==
X-Forwarded-Encrypted: i=1; AL+hErENdvLNkDnjvsLHM8PShpS53cxZ+FlS7ua4nVfoYYP8WaUngmMXS365DAy9nHQC+J3hs/8B@lists.linux.dev
X-Gm-Message-State: APuU4Z+qdgPrQyYZ7Y5Z63gtT33hUBskIZO86qYU5sBP0c31SbuWIc13
	iT69Y4ZP6bUE7GkTQQtw0uMtR1GANDqTedLAxN4mxM4zDf6/cadEqF+dN6V9wPUBPDzZMsMC3dV
	25bEGN0Xm+w==
X-Received: from dycrt1.prod.google.com ([2002:a05:693c:2d81:b0:36a:209:2e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:e2d:b0:384:dc16:121c
 with SMTP id 5a478bee46e88-384dc161ae8mr1326751eec.23.1795107947654; Thu, 19
 Nov 2026 09:05:47 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:22 -0800
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
Message-ID: <20261119170522.1516239-1-irogers@google.com>
Subject: [PATCH] scsi: megaraid: Fix uninitialized DMA handle and passthru
 length TOCTOU
From: Ian Rogers <irogers@google.com>
To: Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, 
	Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, 
	Chandrakanth patil <chandrakanth.patil@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In megadev_ioctl(), data_dma_hndl is declared uninitialized. On the DCMD
path, when uioc.xferlen == 0, dma_alloc_coherent() is skipped, yet
mc.xferaddr = (u32)data_dma_hndl unconditionally writes 32 bits of
uninitialized kernel stack into the mailbox command sent to the adapter.

On the MEGA_MBOXCMD_PASSTHRU path, pthru resides in coherent DMA memory
shared with the controller, and pthru->dataxferlen is re-read after
mega_internal_command() for both copy_to_user() and dma_free_coherent().
If the device modifies pthru->dataxferlen in coherent memory, the cleanup
path can over-read data or pass a mismatched size or uninitialized
data_dma_hndl to dma_free_coherent().

Initialize data_dma_hndl to 0 and snapshot pthru->dataxferlen into a local
variable once copied from userspace.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wconditional-uninitialized; not tested on legacy MegaRAID hardware.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/megaraid.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/megaraid.c b/drivers/scsi/megaraid.c
index a4079866f747..970e9b2ec781 100644
--- a/drivers/scsi/megaraid.c
+++ b/drivers/scsi/megaraid.c
@@ -2966,7 +2966,7 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	mega_passthru	*pthru;		/* copy user passthru here */
 	dma_addr_t	pthru_dma_hndl;
 	void		*data = NULL;	/* data to be transferred */
-	dma_addr_t	data_dma_hndl;	/* dma handle for data xfer area */
+	dma_addr_t	data_dma_hndl = 0; /* dma handle for data xfer area */
 	megacmd_t	mc;
 #if MEGA_HAVE_STATS
 	megastat_t	__user *ustats = NULL;
@@ -3137,6 +3137,7 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		/* Is it a passthru command or a DCMD */
 		if( uioc.uioc_rmbox[0] == MEGA_MBOXCMD_PASSTHRU ) {
 			/* Passthru commands */
+			u32 dataxferlen;
 
 			pthru = dma_alloc_coherent(&pdev->dev,
 						   sizeof(mega_passthru),
@@ -3170,9 +3171,10 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			/*
 			 * Is there a data transfer
 			 */
-			if( pthru->dataxferlen ) {
+			dataxferlen = pthru->dataxferlen;
+			if (dataxferlen) {
 				data = dma_alloc_coherent(&pdev->dev,
-							  pthru->dataxferlen,
+							  dataxferlen,
 							  &data_dma_hndl,
 							  GFP_KERNEL);
 
@@ -3199,12 +3201,13 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			/*
 			 * Is data coming down-stream
 			 */
-			if( pthru->dataxferlen && (uioc.flags & UIOC_WR) ) {
+			if (dataxferlen && (uioc.flags & UIOC_WR)) {
 				/*
 				 * Get the user data
 				 */
-				if( copy_from_user(data, (char __user *)(unsigned long) uxferaddr,
-							pthru->dataxferlen) ) {
+				if (copy_from_user(data,
+						   (char __user *)(unsigned long)uxferaddr,
+						   dataxferlen)) {
 					rval = (-EFAULT);
 					goto freemem_and_return;
 				}
@@ -3228,9 +3231,9 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			/*
 			 * Is data going up-stream
 			 */
-			if( pthru->dataxferlen && (uioc.flags & UIOC_RD) ) {
-				if( copy_to_user((char __user *)(unsigned long) uxferaddr, data,
-							pthru->dataxferlen) ) {
+			if (dataxferlen && (uioc.flags & UIOC_RD)) {
+				if (copy_to_user((char __user *)(unsigned long)uxferaddr,
+						 data, dataxferlen)) {
 					rval = (-EFAULT);
 				}
 			}
@@ -3244,9 +3247,9 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 				rval = -EFAULT;
 
 freemem_and_return:
-			if( pthru->dataxferlen ) {
+			if (dataxferlen) {
 				dma_free_coherent(&pdev->dev,
-						  pthru->dataxferlen, data,
+						  dataxferlen, data,
 						  data_dma_hndl);
 			}
 
-- 
2.56.1.708.g77570a6a1d-goog

