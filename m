Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782F2C82;
	Thu, 30 Dec 2021 15:59:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id e5so15475307wmq.1;
        Thu, 30 Dec 2021 07:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ElIR6SV1fiPS3Db/Lzyt+T8zyl4XcGvw2nOq8Z4FEE=;
        b=NQlx2zcOwB4ZlmjL8sh8qtALR9ZAIL7hqYDT012U86kTOdj2R7cb2rY/RR3nCj+19G
         dscWE1hNfj7ypnj4wqHsgHxT9nS1x0Jzt9rxEFTuD1Dgl/SLa0UJdsuPqIZAiRO3J2ew
         Rhqdg5uKBDhFwpZ2I3irFWdI3AIQSRCfvHPcA5M7wzqEQZRbANWDfJjYoeCeopfuaRqk
         yULVdN7mK6LMkOfWZ8VfZo4omTmLH0haX/fCracCKeBDxC4mwcwxNQk0/Lx8ZIfcrrPv
         xJmLNAuqbg1VY6TRv06psO8PXtdB3nwT6JK+6ccRMZeLukBUYlw+du50lMkaGTBiUkwL
         NeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ElIR6SV1fiPS3Db/Lzyt+T8zyl4XcGvw2nOq8Z4FEE=;
        b=j4GTgRqJfU/kCcoumsVIM97j7LsP0X//qTMpgtNRPfAtTvF0mbJFwWwlzl5VfSPdmY
         PtYtI49p76d3wvfDnab7gBnXK0SKVMpkv9aNuNpw3GYEt3LXQkjNASS3xlaB0PQGT/vC
         6NRh8mWrJ2Y3X3UUGi/AsH6L50p+I3xIAqmoVH0PgpCnb1+vnoSpDqOYDuoNdLP120TE
         NtknJ5x1uoftrcnYONnocvsSSUW8v7vMU45SkZgO8slqdAiHepao9FIYW+lMo5mwcZgG
         vGbmeyE5aMpcX8D/bF52xh/JestRVFs0HhZsbZHR5xLbYJUb8f+w9FtaLw7d2go7QvHo
         n99A==
X-Gm-Message-State: AOAM533FRz6wRlubC1/sdEm/9Fxylfle7t4v/H0/Y0foxQ6v8SG9uATl
	yww8L5GhLPV11KflEQcmzr8=
X-Google-Smtp-Source: ABdhPJwlVTezB17og28kivWq3KhIcT1izqy5mOu9TzI+W/ETJQFvP+0PwaMlPC0ejKF9v5U4hlBUdA==
X-Received: by 2002:a05:600c:1c9f:: with SMTP id k31mr26653681wms.170.1640879993149;
        Thu, 30 Dec 2021 07:59:53 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id m17sm28645320wms.25.2021.12.30.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 07:59:52 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] fs/ntfs3: remove redundant assignment to variable frame
Date: Thu, 30 Dec 2021 15:59:52 +0000
Message-Id: <20211230155952.379721-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable frame is assigned a value that is never read. The
assignment is redundant and can be removed. Cleans up the
clang-scan build warning:

fs/ntfs3/file.c:995:3: warning: Value stored to 'frame' is
never read [deadcode.DeadStores]
                frame = pos >> frame_bits;

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/ntfs3/file.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 3bae76930e68..27c32692513c 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -992,7 +992,6 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 		if (bytes > count)
 			bytes = count;
 
-		frame = pos >> frame_bits;
 		frame_vbo = pos & ~(frame_size - 1);
 		index = frame_vbo >> PAGE_SHIFT;
 
-- 
2.33.1

