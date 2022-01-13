Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92D52C9D
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 00:05:47 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d19so7212088wrb.0
        for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 16:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B96Zf7JbGiWB8a0l9E4LUmhTdYONZVGjIpO5gBzcQpU=;
        b=nUWTJxjyqxw239n79lbq8UFam5zo7paOS3rJ/H9NI5WUpZefKsbDGUhKk57qXhppfS
         xr4A6cULiA7qoedsyMMi2l4KQyZjMfNdzpk7393cxz0J3ioIyLuuLNs9FDhFUTnpl0f5
         QI01BHdZBB8UyGS2+toen3wH0F2RKXI87F4CkycCJksHjOrgwhu/MQfUMZ1/IaXh9+JQ
         Icd6uhfCb7V5k+eVsPFgq7LF52QRRSKDwwg8Hj0mYGzBiKBRWrW89k82JmlUJVTYx2aG
         WCrkmmdiysKfChK2MV9ydbaxCf6ujZoXRT5Eyo+7GerKEG6fN5RyCUqYIyR5WLhbKyXV
         6SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B96Zf7JbGiWB8a0l9E4LUmhTdYONZVGjIpO5gBzcQpU=;
        b=2J3g2TcRru7WjWcRGeb4Tv810CYfNsDgjGI67UMJeuC7xqhQWo7hGos7ZqxK40FpXp
         PK0Kfp+AteLZY/zAPYSSmE5xCxacRaRp/wdA2uDM9MfLz6tGddTJs0IufC+r/GLpuFcv
         wOCc6cazrGYPRgR04m2noGO7BrNE2ArBH0dAeunmLtT9mB+KdNtjRj6tQC5vHhkVmEHb
         Zcq2D9r9DEUuF5pMMoYnIseliWleil0WU7gfAWjSVV+1SXCzAx4hWXdDQaHGUK7040dE
         ONAvwlfGAfAzwZKD2PazD/aVx+lDRP3L3+sWk1j+ZdxhBnpJYF7NWug5pSLD3/53g/5i
         UZLg==
X-Gm-Message-State: AOAM531rC22tQIvJDcf4M0PdHpu2OEzn4RSKQhR/FAqhQdlq20W1wewO
	3j2tqRUrYYuaaZg64Bc+Xw0Wu43KXU1kEfZ3
X-Google-Smtp-Source: ABdhPJwpRmxNptr0kCGBzfBMdeVGo5gGW6lImhDWjH6nq9cG/U50U1+eHHcQHwb59H/2QHvslDyRfw==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr1713767wrs.365.1642032346183;
        Wed, 12 Jan 2022 16:05:46 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id a3sm1255693wri.89.2022.01.12.16.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 16:05:45 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Justin Sanders <justin@coraid.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] aoe: remove redundant assignment on variable n
Date: Thu, 13 Jan 2022 00:05:45 +0000
Message-Id: <20220113000545.1307091-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable n is being bit-wise or'd with a value and reassigned
before being returned. The update of n is redundant, replace
the |= operator with | instead. Cleans up clang scan warning:

drivers/block/aoe/aoecmd.c:125:9: warning: Although the value stored
to 'n' is used in the enclosing expression, the value is never
actually read from 'n' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/block/aoe/aoecmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 588889bea7c3..6af111f568e4 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -122,7 +122,7 @@ newtag(struct aoedev *d)
 	register ulong n;
 
 	n = jiffies & 0xffff;
-	return n |= (++d->lasttag & 0x7fff) << 16;
+	return n | (++d->lasttag & 0x7fff) << 16;
 }
 
 static u32
-- 
2.33.1

