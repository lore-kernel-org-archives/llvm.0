Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBDA20E4
	for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 20:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679864237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ufG0EzSJoZX2ZjEcM3na2tjubK9S5CNNR2tM4hGa6ao=;
	b=Bcz4GXrpXL+WupZFte8/JdOPiFUpQK6JnTpqfvNGWfijajtCVtmu8tIKR+b6PqHT2hlqnM
	lpaayfRg/SerAXyuQHflYvmMhHoeP/NuUIYGHHBrEDeOhh6VNGyS2rcFZY1U5v9suIxyUZ
	5g4fENuqLaL8TNIpb7kHXf8Tzf2PBH0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-_Qw0rKXUNe2W35ex51W3uA-1; Sun, 26 Mar 2023 16:57:16 -0400
X-MC-Unique: _Qw0rKXUNe2W35ex51W3uA-1
Received: by mail-qk1-f200.google.com with SMTP id c80-20020ae9ed53000000b007468c560e1bso3153632qkg.2
        for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 13:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679864236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufG0EzSJoZX2ZjEcM3na2tjubK9S5CNNR2tM4hGa6ao=;
        b=xSs0NyNh+4ilKB46jOWKYUkTewFUI4u+HFxZbXj2fwh6xB84/vBZX/cIXDb4C1TbZA
         Z2NtASot3P4Bx7CwIeNkvwySRV8RN72pig6g3xXKqwedQRbGurPkLfSMmImHp14jvckp
         RAg6AtJr3IOxJSboaRwPx5jRIrk2mchTW6aZU5WKBt7Ilq5BIlrcMH2U8tIB5E1QI2kk
         CWOgrusGxLwoNm6bqNvnIiizu1f3r0FKNhBM5H2oxvFXbdeSCDR5eg4spBfidkfh5FcI
         gEYIyaX9JHpuVTnzozkmObiG6OALtC6vEwSpef9dyghcaTL3vBb/XMiIk9gAzTBJTYMz
         syhQ==
X-Gm-Message-State: AAQBX9cXg4YBWhQEmCHcFQetwb/bRr+19aL53EEJgDd368Pp8dj1ijNZ
	MqePWgmNkXDR1qX/mvXo6+iADTsPR8l582PFROd9WT76ozZFXNrT6ZIpRQ5Ry3lED/5kUVT1rBW
	bmqbMJ3rBDwJMSA==
X-Received: by 2002:a05:6214:27c6:b0:5cd:f9fd:f66a with SMTP id ge6-20020a05621427c600b005cdf9fdf66amr17047957qvb.0.1679864235982;
        Sun, 26 Mar 2023 13:57:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350bvbaW/HvmNUD1O5GI6KZgnKPbVGv3bPPwbsQ+CWQB5zxGNwM7H9VkAJkVX4CFGJxeRjvsYFQ==
X-Received: by 2002:a05:6214:27c6:b0:5cd:f9fd:f66a with SMTP id ge6-20020a05621427c600b005cdf9fdf66amr17047944qvb.0.1679864235774;
        Sun, 26 Mar 2023 13:57:15 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id l4-20020ad44244000000b005dd8b9345cesm2409267qvq.102.2023.03.26.13.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 13:57:15 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	wangjianli@cdjrlc.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ALSA: remove unused loop_count variable
Date: Sun, 26 Mar 2023 16:57:12 -0400
Message-Id: <20230326205712.1358918-1-trix@redhat.com>
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

clang with W=1 reports
sound/pci/asihpi/hpi6000.c:1256:6: error: variable
  'loop_count' set but not used [-Werror,-Wunused-but-set-variable]
        u32 loop_count = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/asihpi/hpi6000.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/asihpi/hpi6000.c b/sound/pci/asihpi/hpi6000.c
index 88d902997b74..72aa135d69f8 100644
--- a/sound/pci/asihpi/hpi6000.c
+++ b/sound/pci/asihpi/hpi6000.c
@@ -1253,7 +1253,6 @@ static u16 hpi6000_dsp_block_read32(struct hpi_adapter_obj *pao,
 	int local_count = count;
 	int xfer_size;
 	u32 *pdata = dest;
-	u32 loop_count = 0;
 
 	while (local_count) {
 		if (local_count > c6711_burst_size)
@@ -1273,7 +1272,6 @@ static u16 hpi6000_dsp_block_read32(struct hpi_adapter_obj *pao,
 		pdata += xfer_size;
 		local_hpi_address += sizeof(u32) * xfer_size;
 		local_count -= xfer_size;
-		loop_count++;
 	}
 
 	if (time_out)
-- 
2.27.0

