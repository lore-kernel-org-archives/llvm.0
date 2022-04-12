Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEB61FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 17:17:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id u7so16264835lfs.8
        for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5V/Upaciu1rdVXXB4sSZScHsFUHEgkIrez1AIm0SE5U=;
        b=bQXkiSJWoVjKgWuXDIoPnkrXITM+lUm9P/nH8r2bVjMU6GNqD9EBTU4mY/l/Qgngaz
         xdSxV4sI+QtnyVa2HE7ehYdgyaHNK2WpcUhhDyybnxWsDT9vHmC5dbqAHnVexiHp0P1H
         5QxdnfDhJziqv0HurjgJmdufcQwhohnkL13JMC5XpP+TXHq97PrRgsDfZ1sjLtUtmReZ
         a0WBOP5tQY0XFBUoel6C54+VuQxmIp7U1IIPlfk3cHUtUeamn5+b79AYa4IBTD8+IXCW
         p5lcFfxC4+TCqUdp7PXD4sy0SdsVYpWD+wAEIj1TLrmODUof4WimxDeX/2w1MBd8eVZM
         6yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5V/Upaciu1rdVXXB4sSZScHsFUHEgkIrez1AIm0SE5U=;
        b=sfgeXiKmZNaZFsKACAv8+NOm7ChQViIazYRObqqg9RRWrXXOAR70415npmuTs5zDk/
         ch9u3/QtYkK+bkAb7eSFVuSQYf7QQF9BdhWxMDbuYPIAJrJJ1aqZANOPjRTPbZ3Mr+FM
         c/Dimo7/h4puAWx1aOHXvEV61uwhJDhAGXlPg9xWdWeczH4rkUURAawxGZyS87+6HNMz
         VJt+2otZvtOxD5QEAEAuNft8d4kjZyg3PR7d55ccNmVBflXuzotaUifPcN94F+LhSxmG
         ab6mjiSB2iTV2EEM3L/ccv3r5OC6c6FVs7d+ges0PmgHZ8Iz8wYHt8Mnu4grcdKINK4A
         NBww==
X-Gm-Message-State: AOAM532itbeTZqFYb6eBKm+JmljhtipkVLp2tJA4j7ZjQKfOxcW45NCy
	+ptjU6WrGTQl4BCQ98TK5uA=
X-Google-Smtp-Source: ABdhPJw/GHTfiH2lFKrIuL1p4Fi7m7wi79+u1/1ElPtvKctByA85Z8OdbXwaY0arrJ+sH9dUKJWfpA==
X-Received: by 2002:a05:6512:402a:b0:45d:6b6a:a547 with SMTP id br42-20020a056512402a00b0045d6b6aa547mr26961226lfb.25.1649783825099;
        Tue, 12 Apr 2022 10:17:05 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id m2-20020a05651202e200b0046ba665cd6dsm723928lfq.141.2022.04.12.10.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:17:04 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/5] block/badblocks: Remove redundant assignments
Date: Tue, 12 Apr 2022 19:16:47 +0200
Message-Id: <20220412171651.19812-1-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of redundant assignments to a variable sectors from functions
badblocks_check and badblocks_clear. This variable, that is a function
parameter, is being assigned a value that is never read until the end of
function.

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
Changes since v1:
-move the change into a separate patch
-add analysis
---
 block/badblocks.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/badblocks.c b/block/badblocks.c
index d39056630d9c..3afb550c0f7b 100644
--- a/block/badblocks.c
+++ b/block/badblocks.c
@@ -65,7 +65,6 @@ int badblocks_check(struct badblocks *bb, sector_t s, int sectors,
 		s >>= bb->shift;
 		target += (1<<bb->shift) - 1;
 		target >>= bb->shift;
-		sectors = target - s;
 	}
 	/* 'target' is now the first block after the bad range */
 
@@ -345,7 +344,6 @@ int badblocks_clear(struct badblocks *bb, sector_t s, int sectors)
 		s += (1<<bb->shift) - 1;
 		s >>= bb->shift;
 		target >>= bb->shift;
-		sectors = target - s;
 	}
 
 	write_seqlock_irq(&bb->lock);
-- 
2.25.1

