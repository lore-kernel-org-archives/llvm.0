Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512462C82
	for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 16:12:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so13551585wme.4
        for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 08:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Pnjdq429wkLvZ7QQ8EgNC1pfMpkmAT54Uvk5bVoFhM=;
        b=BEiSf4gbp1br/LVg3r+zcs+4bkXIDqrEeZ85F9p58DS3Qt02rlPTygB3F5hgf5kbTz
         FDipKDJduJOGHsrGf8lv3+Tkw0ieW3jmAOrem+U0/Z2gGjpHDWWpM/ZM2A+k4VuSgy5A
         GDgjKrEZj3y1iPneHT+EJOvU1dH4FFTuGbRrv4qYMN8qW/ciRXMLT+Z6/Jvfy390SZ3V
         ElLRAc7herXxFKTThTPXr9m8FoRPtzECxfrP/S1N1vTNOZfFBKc0jgc+oX9HWBx6AsbS
         C0J3/uGz8XIzuov5xDD+Vb4vfC4ngCdM3F1SRlgY7cMgnYt5UcKkH4/EBKlITRZpFTos
         4zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Pnjdq429wkLvZ7QQ8EgNC1pfMpkmAT54Uvk5bVoFhM=;
        b=KsE2Q/muPRC4FwY15wVgXg0CTfNmkILWWUqeQW7fyEau0xM2NXbbg22tUz/8BqQsCl
         ZtFUhjrvnx5J8jCMsm/NpkrrXMnBU4JquCpXvrQ31IWT9gDKSHWiEDV8YUneNGdK6rGC
         qyiEN1JjTWtZEes3JMKBQbeM3pKxTIDCI4j3MXfviVJAmdlKQVj2wpKYAZ3BAgDCd7zy
         PFBKkQZ/YonTe2uvmmdyJZTLpUUIjONQ+YpauYHA4No9ecw1bF7uaBGWeiO7KGQarV0c
         bpNMhbdHbD/DPdCdxQyCczm+vGqceY3g09U/2pwh+cdPdCVqK8QNBbg5KupK6ArUp50f
         aLJg==
X-Gm-Message-State: AOAM531mbNn95Uwgeo2DuDNXeJ7M8aNjGuodB8QoL2WkfQZOtiGbv2js
	PywFGZ9JjyGB4y13LDPBUMY=
X-Google-Smtp-Source: ABdhPJy2dR79PiS8oIFSey0wDOUHMJPpwdSHdt3d8X6C2mRhOqvFfHypLxgtkKGOIHePbSSjleoqZA==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr26172837wml.75.1640880751645;
        Thu, 30 Dec 2021 08:12:31 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id m17sm24300651wrw.11.2021.12.30.08.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 08:12:31 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S . Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nfc: st21nfca: remove redundant assignment to variable i
Date: Thu, 30 Dec 2021 16:12:30 +0000
Message-Id: <20211230161230.428457-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable i is being assigned a value that is never read, the
assignment is redundant and can be removed. Cleans up clang-scan
build warning:

drivers/nfc/st21nfca/i2c.c:319:4: warning: Value stored to 'i'
is never read [deadcode.DeadStores]
                        i = 0;

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/nfc/st21nfca/i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index f126ce96a7df..05157fc0f4eb 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -315,10 +315,8 @@ static int st21nfca_hci_i2c_repack(struct sk_buff *skb)
 		skb_pull(skb, 1);
 
 		r = check_crc(skb->data, skb->len);
-		if (r != 0) {
-			i = 0;
+		if (r != 0)
 			return -EBADMSG;
-		}
 
 		/* remove headbyte */
 		skb_pull(skb, 1);
-- 
2.33.1

