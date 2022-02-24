Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DE1373
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 22:05:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id s13so1721454wrb.6
        for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 14:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=et1Z6Z/KvYWUodJYfEuS39IO1XCVclEySq/foYvH8dk=;
        b=mnf1tq4FpyWGBrbpbVW1mM5mQw5kAPuj7gsOJFmF1yavYT2tdb6vETJ3pe6Dag3IHp
         pPBkr7t3Cn7aW2ZtN/KcQ7D60rgBUkHbNMjjvjP5KI3Ah3t2aLxXp6dTvlmNPY8r2ygn
         nMaPnuIHGiYTHyhzZqZSwiUt6yo2d90NYr6E9iH6J4Cgk1IrVQhUH6MY75fInLmHBYBa
         Q0i+KpyWeznUJbJ63DiwNXkkUiqOVuNJvX/7Yumxs8jnAKO/nVm5G0gSoHuT0x3tMYAV
         PanbL0lw5881Pf0gJ9d5nXpkzhVVe1LkbbIxv93q3SqzreIff097RpzuGM3udF0Vtn5A
         hs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=et1Z6Z/KvYWUodJYfEuS39IO1XCVclEySq/foYvH8dk=;
        b=emawP7oZ6bHZef1vu3Kk3d4xiMpLbkEVlC9RbQxbAGzZLLvS6brK9/53hH6YefmRu+
         qIY9d1tuzkhtngF1BnOf1PwJs2EAgLZMrlOOwc11Sk/LVw7C9VmJ69ZfiTdJSY5uYPTO
         0kUeV97+W04eHgJnQrG5CLLKoYwXy+5v7Y+GdeDySSRbms6XijfpaInU/f+nbnrSKBQQ
         tNCtbrGMFo3vpU4qX8RXLcEq2btWRWDNjmLA7D+BhgfWASGvMamGYcr49bbK7yPvHO3L
         VtTgvnj9eERStuwfTQQvGgOB0TRjvFP3eyPSSTv3WAUYK2YX27nYQmZOpoFzfjdGhScs
         9uoQ==
X-Gm-Message-State: AOAM531ARbNE0l5hZlCem2bDbGv34hbYg+QWDlneATMQ4SHOHs2D1TRP
	yQV9JBKeJb1nFClZ3FSTLFc=
X-Google-Smtp-Source: ABdhPJxdmTL9qm2lX9wZlAGeBlGH0yxb/0WSSYGgg/cAt1Yo78pwYN9T0mgdpPvBtnk+KcI6OE643w==
X-Received: by 2002:adf:910a:0:b0:1ed:c3fc:2dcf with SMTP id j10-20020adf910a000000b001edc3fc2dcfmr3845237wrj.430.1645740358055;
        Thu, 24 Feb 2022 14:05:58 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id v5-20020adfe4c5000000b001edc1e5053esm461372wrm.82.2022.02.24.14.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 14:05:57 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH][next] net: dsa: qca8k: return with -EINVAL on invalid port
Date: Thu, 24 Feb 2022 22:05:57 +0000
Message-Id: <20220224220557.147075-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently an invalid port throws a WARN_ON warning however invalid
uninitialized values in reg and cpu_port_index are being used later
on. Fix this by returning -EINVAL for an invalid port value.

Addresses clang-scan warnings:
drivers/net/dsa/qca8k.c:1981:3: warning: 2nd function call argument is an
  uninitialized value [core.CallAndMessage]
drivers/net/dsa/qca8k.c:1999:9: warning: 2nd function call argument is an
  uninitialized value [core.CallAndMessage]

Fixes: 7544b3ff745b ("net: dsa: qca8k: move pcs configuration")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/dsa/qca8k.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index 04fa21e37dfa..2ed45f69b8e4 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -1937,6 +1937,7 @@ static int qca8k_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 
 	default:
 		WARN_ON(1);
+		return -EINVAL;
 	}
 
 	/* Enable/disable SerDes auto-negotiation as necessary */
-- 
2.34.1

