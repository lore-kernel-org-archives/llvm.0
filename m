Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C8D20E4
	for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679833408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yc3tSWFy8F/Ma/k22PF1PgCvVFqwDef49qSBC1AuUS8=;
	b=Z9laSQKJBGJ1ugJ/nc2mP8mZMegS/3MWGFd+NdduDE49QfpXQmrS8E/WYwFshFVd2MhojG
	LaXHSDCHxLWFTbn1PASMBoHddsnVZMV8P/GT2nScdOcyEhd4xJhvGnXp1fChaE0iGvUzjI
	KplOuXYjbdoXOs9XAwBbUK3S087k0Ts=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-cpqVoKwgMCGmnnF1aWycYA-1; Sun, 26 Mar 2023 08:23:27 -0400
X-MC-Unique: cpqVoKwgMCGmnnF1aWycYA-1
Received: by mail-qk1-f197.google.com with SMTP id 195-20020a3705cc000000b00746a3ab9426so2761941qkf.20
        for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 05:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679833406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yc3tSWFy8F/Ma/k22PF1PgCvVFqwDef49qSBC1AuUS8=;
        b=j2tejpXrSnS/OXXM343t/7BcZZBNbeeaT55cmQY44N0/VTgK2zGUnrz7qfIOFqkliS
         4mz0RgmDIU9GjGKWxX2y2YGs+kcew4Xoz1FHgKFJzAAS+0HeqGn2JZAdgzmOGTEszUQV
         ts7HB0sROnYxhUjDwcdKy/cK5sEWBs5cg4NpwMyOJNEyab3PAJLewigwe2dws0Uodnvf
         cyw1KYGpH72zNWwPjn1kXm9ULkHp0A1I308DKY+bjOJ/uJhjuhvFzFcT66V6eaSmdezP
         v2VAB9Mg/V2+ENWqqYQI2VaCsf4PQu0YaqVHwSrktyHyN4pXs/ccRNFLRuZRoETJcjMQ
         2K7Q==
X-Gm-Message-State: AO0yUKXLsjyTQJ4YvX/arz6QUU3F9+UeXcNP6jhavCIPTVzS8HoP5GKb
	wIB9oDMdQIHKkHTjMVKuxKSitjIUfW9Muinv6tjnpVz0h1aBFAfnXTTdVb3LbOH+jq8t1DDkTdh
	QirJQ1eCSEEVAyA==
X-Received: by 2002:a05:622a:1d5:b0:3d5:cf4e:bd0 with SMTP id t21-20020a05622a01d500b003d5cf4e0bd0mr13788986qtw.63.1679833406662;
        Sun, 26 Mar 2023 05:23:26 -0700 (PDT)
X-Google-Smtp-Source: AK7set/SjWVqj/O4lGKRqnZTZTusLMliKY76/cDdrQiWz7osrH7ryyoxsJgBtD86j4cTIA4gTy+woQ==
X-Received: by 2002:a05:622a:1d5:b0:3d5:cf4e:bd0 with SMTP id t21-20020a05622a01d500b003d5cf4e0bd0mr13788968qtw.63.1679833406450;
        Sun, 26 Mar 2023 05:23:26 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id w9-20020ac843c9000000b003d8f78b82besm6518765qtn.70.2023.03.26.05.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 05:23:26 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	artur.bujdoso@gmail.com,
	namcaov@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] staging: rtl8723bs: remove unused pHalData variable
Date: Sun, 26 Mar 2023 08:23:21 -0400
Message-Id: <20230326122321.1352337-1-trix@redhat.com>
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
drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:23: error: variable
  'pHalData' set but not used [-Werror,-Wunused-but-set-variable]
        struct hal_com_data *pHalData;
                             ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index e36f8c369a04..0cb2adcc1f78 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1179,10 +1179,6 @@ bool hal_btcoex_IsBtDisabled(struct adapter *padapter)
 
 void hal_btcoex_SetChipType(struct adapter *padapter, u8 chipType)
 {
-	struct hal_com_data *pHalData;
-
-
-	pHalData = GET_HAL_DATA(padapter);
 }
 
 void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum)
-- 
2.27.0

