Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E110E9
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 08:47:54 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id t2so3985653qtw.9
        for <llvm@lists.linux.dev>; Sat, 02 Apr 2022 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fsubz5SlxAuGM72VzibPMlOmxFez1kWGrcQSufu8qOM=;
        b=IsmaR8ABleRm+6oVe1mXzrlLfe3Bw4vh73ABlIp1KaXMC5Nwfxn+4XU94FiEQnS3gI
         AiINyw49kmdfDR9pziKbUf3jP4S/0Mlk03KDKQUCajsPA/wyw9JBAyg9EqkWQ+0AXKWs
         MbVNgVM/JU9d/d+N/VAJ0giIHkUX7ry1WaqZpCxy5+dsxxiribXc3jjyrXQCsIAlIHPh
         yP204MCS660glqc2IV4YfZ8ywvLwkcN9AxhlolvokhB27PlL4iQltqUaC2MjLGZRNssf
         hS05niVcV0jZT7nPnoC4Ns/hfENGD6CVO2Iv804tMpeSkVlXUeVtjDhIy+gyW5Br10tU
         B+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fsubz5SlxAuGM72VzibPMlOmxFez1kWGrcQSufu8qOM=;
        b=c/+Syf0jErb6YB+BayPY/csw5ly15VVp2B4UkEyqRIYuRsFyPOev7sJZpDI5cUvHUp
         /dVbvHjThTgkRcMFC3Ge2LIq49VB7HCyxa9LMh7oIuI5xuAortSwsKoEfVhWfLPYefcn
         BV9WWoN0UYAktkkSfxlDzERlzbEP/52TErTA50+9UHM0gRH/dado49jdgDwufTZpFbEE
         cYHnVTxnJZhQ70HiSq4gk8um9Cf0VRnY771nh8zl7e8sDOsCfaPIjSDBJu+bd0coPZKu
         JmPvgAMmJi3/WQPgv06n5OhxJ44XsMC26ioOkzui8lT6AonBDgwchbN/CVwSMopE/oq/
         Uixg==
X-Gm-Message-State: AOAM533Mf8ETFljlkvm8pz3Fn5hcF2yc9o7B/T2ePKcI2s2LZ0zwK3uc
	un6+O0I9sdxC6SqA3L4pfMc=
X-Google-Smtp-Source: ABdhPJw5YqJ8EEi0P5ochvddolehJ2oQojL0Sdm9i1qI8ofY4WUdoMNRhtyAS63jEvr8ZfyD7WIG5A==
X-Received: by 2002:ac8:4417:0:b0:2e1:a82c:1a6f with SMTP id j23-20020ac84417000000b002e1a82c1a6fmr11148476qtn.375.1648889273627;
        Sat, 02 Apr 2022 01:47:53 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id x12-20020a05620a12ac00b0067d4bfffc59sm2510938qki.118.2022.04.02.01.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:47:53 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: viro@zeniv.linux.org.uk
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Lv Ruyi <lv.ruyi@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] fs/buffer.c: remove unneeded code
Date: Sat,  2 Apr 2022 08:47:46 +0000
Message-Id: <20220402084746.2413549-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lv Ruyi <lv.ruyi@zte.com.cn>

fix clang warning: Value stored to 'err' is never read in line 2944.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 fs/buffer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index bfc566de36e5..b2045871e81c 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2941,7 +2941,6 @@ int block_truncate_page(struct address_space *mapping,
 		pos += blocksize;
 	}
 
-	err = 0;
 	if (!buffer_mapped(bh)) {
 		WARN_ON(bh->b_size != blocksize);
 		err = get_block(inode, iblock, bh, 0);
-- 
2.25.1

