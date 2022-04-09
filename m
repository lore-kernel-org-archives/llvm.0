Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49B77EF
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649515918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t/bg9kn7ROahCSJyzfOEtwvtDCZszZoWTbNGij2GrjE=;
	b=EM0oVDdNWtKxbSmCS6/TGo91YfNrbpzrBXghRbKV8CUkmByTJ9aIin267P+68Lj7IrYLTj
	nEHtvIgwlH/NL7+CfAOpaV+1BzcSpypqRvi0rSdIDH+t1Lgr/90i7U2bjRehgC466YlEBk
	wmYz6MF0WN/yRbs4ll7qGLiaIp+gHKI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-lix8W3TMOoGIq4vDA-_ndw-1; Sat, 09 Apr 2022 10:51:56 -0400
X-MC-Unique: lix8W3TMOoGIq4vDA-_ndw-1
Received: by mail-qt1-f198.google.com with SMTP id d18-20020ac81192000000b002ebdd6ef307so4466920qtj.20
        for <llvm@lists.linux.dev>; Sat, 09 Apr 2022 07:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t/bg9kn7ROahCSJyzfOEtwvtDCZszZoWTbNGij2GrjE=;
        b=kG3McByxhhjmU0SwMT17iT37uSk/R4+f999AP6LLegaVBl4+xyuCIVep9ABih49NSb
         yLsFRh7CXC9Ak0mIWDbuVUQhgWbe2mNQusyvGrdyHSCCrpEj0rQfZoXCkJdemajTSFMt
         LgPsVW063p0DhVtu+a9RFPF06pzqzD5ig/Xu0peh+p99/EaQ2fNoXVMx/D3dc44qsveB
         cDbINJgHO+lEQ3/C3b8mGmwVTGKwNO/Oh/V9/SfFsJS3bKBhT0DJgu0DCxggmY9/KmEx
         0yPs4kbbzoQS7CYD0rj86eTTnOPcGfujbqvjY3rd0eBolUVYE5mIz6MXvUD5qcd53gsS
         C1XA==
X-Gm-Message-State: AOAM530iQlkfbyrmhQg1QK/a984saCvqklR3awpmHn9jZ88v/2f/bd+x
	oNwkXj6XG6LftAtuZA06Ab4qkzllsvAgGx4keBN/xLTkrMBMc7mp0VQSaQ+0OIprkTLL1t1bITQ
	o5reErWjLW+jPMQ==
X-Received: by 2002:a05:620a:2544:b0:680:a53b:ec1a with SMTP id s4-20020a05620a254400b00680a53bec1amr16685994qko.544.1649515916289;
        Sat, 09 Apr 2022 07:51:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGn6fJ9jRuJMb+wl3Tw8IkHfFNGvG+cEzqACp3UVw8jPRAuuFK+9VOOBkb8ed4Kksz+lzgVw==
X-Received: by 2002:a05:620a:2544:b0:680:a53b:ec1a with SMTP id s4-20020a05620a254400b00680a53bec1amr16685978qko.544.1649515916047;
        Sat, 09 Apr 2022 07:51:56 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id a23-20020a05620a16d700b0067e98304705sm14845602qkn.89.2022.04.09.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 07:51:55 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: tim@cyberelk.net,
	axboe@kernel.dk,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] security: do not leak information in ioctl
Date: Sat,  9 Apr 2022 10:51:37 -0400
Message-Id: <20220409145137.67592-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang static analysis reports this representative issue
pcd.c:832:22: warning: Assigned value is garbage
  or undefined
  tochdr->cdth_trk0 = buffer[2];
                    ^ ~~~~~~~~~

If the call to pcd_atapi fails, buffer is an unknown
state.  Passing an unknown buffer back to the user
can leak information and is a security risk.

Check before returning this buffer to the user.

The per-case variables cmd and buffer are common.
Change their scope to function level.
Change colliding parameter name cmd to request.

Cleanup whitespace

pcd.c comment
/* the audio_ioctl stuff is adapted from sr_ioctl.c */

Shows there is a similar problem in sr_ioctl.c
sr_ioctl.c uses this pattern

  result = sr_do_ioctl(cd, &cgc);
  to-user = buffer[];
  kfree(buffer);
  return result;

Check result and jump over the use of buffer
if there is an error.

  result = sr_do_ioctl(cd, &cgc);
  if (result)
    goto err;
  to-user = buffer[];
err:
  kfree(buffer);
  return result;

Additionally initialize the buffer to zero.

This problem can be seen in the 2.4.0 kernel
However this scm only goes back as far as 2.6.12

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/block/paride/pcd.c | 87 +++++++++++++++++---------------------
 drivers/scsi/sr_ioctl.c    | 15 +++++--
 2 files changed, 50 insertions(+), 52 deletions(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index f462ad67931a..2315918e3647 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -810,67 +810,56 @@ static void do_pcd_read_drq(void)
 
 /* the audio_ioctl stuff is adapted from sr_ioctl.c */
 
-static int pcd_audio_ioctl(struct cdrom_device_info *cdi, unsigned int cmd, void *arg)
+static int pcd_audio_ioctl(struct cdrom_device_info *cdi, unsigned int request, void *arg)
 {
 	struct pcd_unit *cd = cdi->handle;
+	char cmd[12] = { GPCMD_READ_TOC_PMA_ATIP, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0 };
+	char buffer[32] = {};
 
-	switch (cmd) {
-
+	switch (request) {
 	case CDROMREADTOCHDR:
+	{
+		struct cdrom_tochdr *tochdr =
+			(struct cdrom_tochdr *) arg;
 
-		{
-			char cmd[12] =
-			    { GPCMD_READ_TOC_PMA_ATIP, 0, 0, 0, 0, 0, 0, 0, 12,
-			 0, 0, 0 };
-			struct cdrom_tochdr *tochdr =
-			    (struct cdrom_tochdr *) arg;
-			char buffer[32];
-			int r;
-
-			r = pcd_atapi(cd, cmd, 12, buffer, "read toc header");
+		if (pcd_atapi(cd, cmd, 12, buffer, "read toc header"))
+			return -EIO;
 
-			tochdr->cdth_trk0 = buffer[2];
-			tochdr->cdth_trk1 = buffer[3];
+		tochdr->cdth_trk0 = buffer[2];
+		tochdr->cdth_trk1 = buffer[3];
 
-			return r ? -EIO : 0;
-		}
+		return 0;
+	}
 
 	case CDROMREADTOCENTRY:
-
-		{
-			char cmd[12] =
-			    { GPCMD_READ_TOC_PMA_ATIP, 0, 0, 0, 0, 0, 0, 0, 12,
-			 0, 0, 0 };
-
-			struct cdrom_tocentry *tocentry =
-			    (struct cdrom_tocentry *) arg;
-			unsigned char buffer[32];
-			int r;
-
-			cmd[1] =
-			    (tocentry->cdte_format == CDROM_MSF ? 0x02 : 0);
-			cmd[6] = tocentry->cdte_track;
-
-			r = pcd_atapi(cd, cmd, 12, buffer, "read toc entry");
-
-			tocentry->cdte_ctrl = buffer[5] & 0xf;
-			tocentry->cdte_adr = buffer[5] >> 4;
-			tocentry->cdte_datamode =
-			    (tocentry->cdte_ctrl & 0x04) ? 1 : 0;
-			if (tocentry->cdte_format == CDROM_MSF) {
-				tocentry->cdte_addr.msf.minute = buffer[9];
-				tocentry->cdte_addr.msf.second = buffer[10];
-				tocentry->cdte_addr.msf.frame = buffer[11];
-			} else
-				tocentry->cdte_addr.lba =
-				    (((((buffer[8] << 8) + buffer[9]) << 8)
-				      + buffer[10]) << 8) + buffer[11];
-
-			return r ? -EIO : 0;
+	{
+		struct cdrom_tocentry *tocentry =
+			(struct cdrom_tocentry *) arg;
+
+		cmd[1] = (tocentry->cdte_format == CDROM_MSF ? 0x02 : 0);
+		cmd[6] = tocentry->cdte_track;
+
+		if (pcd_atapi(cd, cmd, 12, buffer, "read toc entry"))
+			return -EIO;
+
+		tocentry->cdte_ctrl = buffer[5] & 0xf;
+		tocentry->cdte_adr = buffer[5] >> 4;
+		tocentry->cdte_datamode =
+			(tocentry->cdte_ctrl & 0x04) ? 1 : 0;
+		if (tocentry->cdte_format == CDROM_MSF) {
+			tocentry->cdte_addr.msf.minute = buffer[9];
+			tocentry->cdte_addr.msf.second = buffer[10];
+			tocentry->cdte_addr.msf.frame = buffer[11];
+		} else {
+			tocentry->cdte_addr.lba =
+				(((((buffer[8] << 8) + buffer[9]) << 8)
+				  + buffer[10]) << 8) + buffer[11];
 		}
 
-	default:
+		return 0;
+	}
 
+	default:
 		return -ENOSYS;
 	}
 }
diff --git a/drivers/scsi/sr_ioctl.c b/drivers/scsi/sr_ioctl.c
index ddd00efc4882..fbdb5124d7f7 100644
--- a/drivers/scsi/sr_ioctl.c
+++ b/drivers/scsi/sr_ioctl.c
@@ -41,7 +41,7 @@ static int sr_read_tochdr(struct cdrom_device_info *cdi,
 	int result;
 	unsigned char *buffer;
 
-	buffer = kmalloc(32, GFP_KERNEL);
+	buffer = kzalloc(32, GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
 
@@ -55,10 +55,13 @@ static int sr_read_tochdr(struct cdrom_device_info *cdi,
 	cgc.data_direction = DMA_FROM_DEVICE;
 
 	result = sr_do_ioctl(cd, &cgc);
+	if (result)
+		goto err;
 
 	tochdr->cdth_trk0 = buffer[2];
 	tochdr->cdth_trk1 = buffer[3];
 
+err:
 	kfree(buffer);
 	return result;
 }
@@ -71,7 +74,7 @@ static int sr_read_tocentry(struct cdrom_device_info *cdi,
 	int result;
 	unsigned char *buffer;
 
-	buffer = kmalloc(32, GFP_KERNEL);
+	buffer = kzalloc(32, GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
 
@@ -86,6 +89,8 @@ static int sr_read_tocentry(struct cdrom_device_info *cdi,
 	cgc.data_direction = DMA_FROM_DEVICE;
 
 	result = sr_do_ioctl(cd, &cgc);
+	if (result)
+		goto err;
 
 	tocentry->cdte_ctrl = buffer[5] & 0xf;
 	tocentry->cdte_adr = buffer[5] >> 4;
@@ -98,6 +103,7 @@ static int sr_read_tocentry(struct cdrom_device_info *cdi,
 		tocentry->cdte_addr.lba = (((((buffer[8] << 8) + buffer[9]) << 8)
 			+ buffer[10]) << 8) + buffer[11];
 
+err:
 	kfree(buffer);
 	return result;
 }
@@ -384,7 +390,7 @@ int sr_get_mcn(struct cdrom_device_info *cdi, struct cdrom_mcn *mcn)
 {
 	Scsi_CD *cd = cdi->handle;
 	struct packet_command cgc;
-	char *buffer = kmalloc(32, GFP_KERNEL);
+	char *buffer = kzalloc(32, GFP_KERNEL);
 	int result;
 
 	if (!buffer)
@@ -400,10 +406,13 @@ int sr_get_mcn(struct cdrom_device_info *cdi, struct cdrom_mcn *mcn)
 	cgc.data_direction = DMA_FROM_DEVICE;
 	cgc.timeout = IOCTL_TIMEOUT;
 	result = sr_do_ioctl(cd, &cgc);
+	if (result)
+		goto err;
 
 	memcpy(mcn->medium_catalog_number, buffer + 9, 13);
 	mcn->medium_catalog_number[13] = 0;
 
+err:
 	kfree(buffer);
 	return result;
 }
-- 
2.27.0

