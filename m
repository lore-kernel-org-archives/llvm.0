Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1FFED1
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652706054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2uT7yQARA8zTV6HO5pae5HfOKv/Dq0SyPUtl99rYMNU=;
	b=OEHl8+DR8NWzB8NfNwrACUem0BPfSbmQOx7kmN7rdOANtPgraUwFHxFOTtuB6OLl84V3Go
	BbiKWdKcAhKbWY74sQAQW4nYPexCXoAUumO2HE979HQVlbuXikH57Mj16+ra95NorCS6F1
	o63vfArYOSbz2T16E5+ZSoclH2GiLJM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-PWR7FwaYM_mxn4Iwy4Xf5g-1; Mon, 16 May 2022 09:00:53 -0400
X-MC-Unique: PWR7FwaYM_mxn4Iwy4Xf5g-1
Received: by mail-qt1-f199.google.com with SMTP id a6-20020ac81086000000b002f65fd83048so5610812qtj.6
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 06:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2uT7yQARA8zTV6HO5pae5HfOKv/Dq0SyPUtl99rYMNU=;
        b=LJGLdQwaup44Gxyd72rb9h/pcj31mao6bL9h9vcevphbQSWn2sh3/w7dqV0YJ9FG2K
         lSghcj9YDoRbRiKo6PtmgdfRgFFLWsRxadr084nFYU3bNuBBQr1UXGjpTt6Z9ELewnNP
         1ux1Kuze7qSded0KftM58wcu0EK3DeZMxGCxYagJHadqLyeDhe6jHPvJ24tRyv8uhf7U
         FxEgpkQVS5R3SuYxUG6G4LC4/0dPgQB775+6S78eMds9kAdisaDcGYN9q4xOhiHYzhFh
         xBM3EEWPwmSPo6bS2dcPYFxqN7p8zOrd6Jjmai7VdU4+0rbluXdctPTZGFizM6Ypm3/u
         fqQA==
X-Gm-Message-State: AOAM5320F3a1BDPx/yhIv50jWcYhrQIE6kruCtAZ9GnUBU2L77oFfMLL
	IQI6f3WLe3a63GfX4dsza14tDxIevjE7rmuw7bUeQ48YLm9z0FtOUi89OabLI4hPMmKOmLtLwB+
	A9U+LeP2UonjMcg==
X-Received: by 2002:a05:622a:1007:b0:2f3:ce52:25cb with SMTP id d7-20020a05622a100700b002f3ce5225cbmr14709125qte.575.1652706052276;
        Mon, 16 May 2022 06:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNht8rGcaLaO05BcV93CYZW69Np2z7XC2tycEAx59FmOgMOIeugmyXFY/sA9nHZmHtxk6cqw==
X-Received: by 2002:a05:622a:1007:b0:2f3:ce52:25cb with SMTP id d7-20020a05622a100700b002f3ce5225cbmr14709098qte.575.1652706051876;
        Mon, 16 May 2022 06:00:51 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id g18-20020a05620a13d200b0069fd9de088esm5485582qkl.93.2022.05.16.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 06:00:51 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ricky_wu@realtek.com,
	kai.heng.feng@canonical.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] misc: rtsx: Set setting_reg2 before use.
Date: Mon, 16 May 2022 09:00:47 -0400
Message-Id: <20220516130047.3887590-1-trix@redhat.com>
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

The clang build fails with
rts5261.c:406:13: error: variable 'setting_reg2' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        } else if (efuse_valid == 0) {
                   ^~~~~~~~~~~~~~~~

setting_reg2 is set in this block
  if (efuse_valid == 2 || efuse_valid == 3) {
..
  } else if (efuse_valid == 0) {
    // default
..
  }
But efuse_valid can also have a value of 1.
Change the 'else if' to 'else' to make the second block the default.

Fixes: b1c5f3085149 ("misc: rtsx: add rts5261 efuse function")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/misc/cardreader/rts5261.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cardreader/rts5261.c b/drivers/misc/cardreader/rts5261.c
index 749cc5a46d13..f22634b14dc8 100644
--- a/drivers/misc/cardreader/rts5261.c
+++ b/drivers/misc/cardreader/rts5261.c
@@ -403,7 +403,7 @@ static void rts5261_init_from_hw(struct rtsx_pcr *pcr)
 			setting_reg1 = PCR_SETTING_REG4;
 			setting_reg2 = PCR_SETTING_REG5;
 		}
-	} else if (efuse_valid == 0) {
+	} else {
 		// default
 		setting_reg1 = PCR_SETTING_REG1;
 		setting_reg2 = PCR_SETTING_REG2;
-- 
2.27.0

