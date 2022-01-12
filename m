Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0072C9D
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 23:55:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h10so7116646wrb.1
        for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 15:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZrJnoV8ByVp01mrwYzfs3BpkSmN3S2DUUHlhgKf3S44=;
        b=VVT0NC1971pm7KJrYLjrND6wXdnBy4Fkz/NuATd6EdPB7ByJKyrJ0afI5SGvvRXz2X
         50ZqJy4nI9D9gJBtTUBrkaRKLvs9lZsw5k29MfgIoIu5wR7NJXXhceHyij6sn3KnQo/v
         101KK4ILIIy9LNQeBHo7LoBE3TeEu/FT99q1PtGFVefk/+mPyV1iHV6Swr0omhaMw/Wm
         cT2vOaYP996ZtAtk9NTEToEVNxMldvHLfoatdCFTpGTecvpuAY03QbV2xg5TnDohKGub
         EdYZ6tp6FS33cpLf7vvHzAxFOW6TTtRuqqce6e3+xxDWJJ5G8V5ZzlaPKylbuHWMkf/I
         N0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZrJnoV8ByVp01mrwYzfs3BpkSmN3S2DUUHlhgKf3S44=;
        b=UHzKHlrgSSxu7iDwlHLlRZfKj2w7HzCtVMqcrWZ99Cra4nFebHvkiTkeGX7IQeqbu1
         18tM+hW5jHduMTNK27TlUV5UP01Y3O3HQPV/fAbzMjMIPMPm+2u5eP4SzAf8MfEo7Z1G
         +R46yU+TdneMJM0MGDaagCCD7yLWUOD3CwG7biZZowQC4f5F0G03zkKL7e63xxZ6baoR
         SVVoana9TOSdnrGFQPPelACJCEnMerskSWWSJZEgYR1uTdaV8xS8cGiRVebUkxKpmhP6
         vl+RAgM2TPSYKh6QYLBo53DaBlAIPPQO3AR3HrlW+U9dzGTtwzsiFV7Z8w3Na6Rk9PDI
         FhMw==
X-Gm-Message-State: AOAM5325te6/hBvO7eaNErrbG/V7VEU3OKmIEHTzjidXGKUSzAVvCj4y
	fAy3DhCuCtUMYwT6NsZxYD8=
X-Google-Smtp-Source: ABdhPJy8XX5/dFYxJ5mkFUXKlNg3U36B1VmjIA6pRqoybdXmuNWLWzgHhjNNEEC94ODARsOq6v3/Hg==
X-Received: by 2002:a05:6000:1787:: with SMTP id e7mr1711033wrg.31.1642031734649;
        Wed, 12 Jan 2022 15:55:34 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id o8sm1337903wry.20.2022.01.12.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 15:55:34 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chas Williams <3chas3@gmail.com>,
	linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] atm: iphase: remove redundant pointer skb
Date: Wed, 12 Jan 2022 23:55:33 +0000
Message-Id: <20220112235533.1281944-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer skb is redundant, it is assigned a value that is never
read and hence can be removed. Cleans up clang scan warning:

drivers/atm/iphase.c:205:18: warning: Although the value stored
to 'skb' is used in the enclosing expression, the value is never
actually read from 'skb' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/atm/iphase.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index bc8e8d9f176b..3e726ee91fdc 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -178,7 +178,6 @@ static void ia_hack_tcq(IADEV *dev) {
 
 static u16 get_desc (IADEV *dev, struct ia_vcc *iavcc) {
   u_short 		desc_num, i;
-  struct sk_buff        *skb;
   struct ia_vcc         *iavcc_r = NULL; 
   unsigned long delta;
   static unsigned long timer = 0;
@@ -202,8 +201,7 @@ static u16 get_desc (IADEV *dev, struct ia_vcc *iavcc) {
            else 
               dev->ffL.tcq_rd -= 2;
            *(u_short *)(dev->seg_ram + dev->ffL.tcq_rd) = i+1;
-           if (!(skb = dev->desc_tbl[i].txskb) || 
-                          !(iavcc_r = dev->desc_tbl[i].iavcc))
+           if (!dev->desc_tbl[i].txskb || !(iavcc_r = dev->desc_tbl[i].iavcc))
               printk("Fatal err, desc table vcc or skb is NULL\n");
            else 
               iavcc_r->vc_desc_cnt--;
-- 
2.33.1

