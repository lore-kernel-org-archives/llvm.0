Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB6D28F7
	for <llvm@lists.linux.dev>; Fri, 30 Dec 2022 17:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672422832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zS+ReCHhGkT7QFOC9TzYb6JxbQDrW1Wtluedpd2unG0=;
	b=OTa2hpF79Rbrx5vveYudkwSQCLC3EsO1RMnWvB36ayOubVWVTHTKlcvO6zuum5Ho6Ecduk
	GxWzPLm6SgMY342iNYpYVAyROwKDVNxSNqd895jdctLdPJQpc/+NQmmciSRMAP5nnqkxhf
	Xtwrj/WIiQjlg4i7kRQGHLpZ7ksKCro=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-sdcpOzDgMmeQKk98Wb5-kA-1; Fri, 30 Dec 2022 12:53:51 -0500
X-MC-Unique: sdcpOzDgMmeQKk98Wb5-kA-1
Received: by mail-qk1-f199.google.com with SMTP id bi3-20020a05620a318300b00702545f73d5so14901784qkb.8
        for <llvm@lists.linux.dev>; Fri, 30 Dec 2022 09:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zS+ReCHhGkT7QFOC9TzYb6JxbQDrW1Wtluedpd2unG0=;
        b=Xrxi34u4i0MQYO1skRyxwX7j4ctXb2e56DwXMjunvYWslIkWiIHVPpGnEWvc54Xb4p
         KAXwZv18C/sY+mNEXe9wnbCY+Hdt9pkuuLdMHfWhvny3hcXvKiByZ9EW6mbXI55ZZcBG
         wVbOkHI6FbU8+A8wqYBeFdNA3RCHh22EYAha2oiqxwDz6gBAWM7TiiWRNDPhSFt9U0Do
         KCUTuscH2G3PQhG58tP7Pqi4BqKENPc6+BomTKL+7reyuRswk4yzfa9YwfpJFI9xBLqn
         y3StA3eMVLS2krH6nr4aQOI4vzyUQuikOdT5TYtki6vBAF9PoyswQfeiHVP0yMgkB+z8
         Sarg==
X-Gm-Message-State: AFqh2ko50vS9Ss8esGOROgmEpI0MroSAkYg7lmEuzhqACHFGseCzmnrb
	PDD6MLQY+V2ApuPBHv14sEG83HesRfxC6M5MY7oka2gkS8fzKJaMIW0IF2UJAhixvULEQWpt6TG
	9nurnKwVU7JIl/w==
X-Received: by 2002:a05:6214:2c06:b0:4e3:6a82:82ba with SMTP id lc6-20020a0562142c0600b004e36a8282bamr52843356qvb.33.1672422830302;
        Fri, 30 Dec 2022 09:53:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXswfUPFOUWp5uj7+1onFko68tLORHS1oNTFHjSp5SlL0aRkvPDcNnc+hUanoY6Xqlx2KsRGIA==
X-Received: by 2002:a05:6214:2c06:b0:4e3:6a82:82ba with SMTP id lc6-20020a0562142c0600b004e36a8282bamr52843333qvb.33.1672422830083;
        Fri, 30 Dec 2022 09:53:50 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t1-20020a37ea01000000b006fefa5f7fcesm15621878qkj.10.2022.12.30.09.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 09:53:49 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: jack@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] udf: initialize newblock to 0
Date: Fri, 30 Dec 2022 12:53:41 -0500
Message-Id: <20221230175341.1629734-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The clang build reports this error
fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (*err < 0)
            ^~~~~~~~
newblock is never set before error handling jump.
Initialize newblock to 0 and remove redundant settings.

Fixes: d8b39db5fab8 ("udf: Handle error when adding extent to a file")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/udf/inode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index 4a912e2edcec..31965c3798f2 100644
--- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -604,7 +604,7 @@ static sector_t inode_getblk(struct inode *inode, sector_t block,
 	struct kernel_lb_addr eloc, tmpeloc;
 	int c = 1;
 	loff_t lbcount = 0, b_off = 0;
-	udf_pblk_t newblocknum, newblock;
+	udf_pblk_t newblocknum, newblock = 0;
 	sector_t offset = 0;
 	int8_t etype;
 	struct udf_inode_info *iinfo = UDF_I(inode);
@@ -710,7 +710,6 @@ static sector_t inode_getblk(struct inode *inode, sector_t block,
 		ret = udf_do_extend_file(inode, &prev_epos, laarr, hole_len);
 		if (ret < 0) {
 			*err = ret;
-			newblock = 0;
 			goto out_free;
 		}
 		c = 0;
@@ -775,7 +774,6 @@ static sector_t inode_getblk(struct inode *inode, sector_t block,
 				goal, err);
 		if (!newblocknum) {
 			*err = -ENOSPC;
-			newblock = 0;
 			goto out_free;
 		}
 		if (isBeyondEOF)
-- 
2.27.0

