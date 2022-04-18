Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C6180F;
	Mon, 18 Apr 2022 14:00:41 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id u17-20020a05600c211100b0038eaf4cdaaeso11835391wml.1;
        Mon, 18 Apr 2022 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6x/x31zD6jdr7v3jc1uXumCewA6SO4UbVpg60xKCXk=;
        b=MzV3Dc04CvwAAiwc8eYESy/kUaiawkJiTKLqHR78r064hc0eGHjL0wY8jaNT6CT5u7
         aCZsjaiV/ws6ZL/JvWYudvnvWAvGUfJJlxJ4Hb48PqzawA817UQTH3dsQKlPAWtkvFsj
         Ih67M4YTAfVmXn4I2pee+/ksFZ5deFcTkONGa04NQt+PZ/j0UhBcY0BM34E8tJ5kzEdS
         D4yCc3nSVc87XqniZVIvrb7MPFYr4rB/N5hydMUpF1gcWlilGGpa/plQeImgOjuVeQTw
         EsICi6rN5bmvq/V+Z/aYb4kN6Pm808V2chgU+Zd/+k5ll2oQfbiAFEJv9J+FM8QdH+b3
         yqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6x/x31zD6jdr7v3jc1uXumCewA6SO4UbVpg60xKCXk=;
        b=s0cwAXOlmNwAD/LHqGfUq4A+gY+7OSGNoJDwaiGFgTwdpPYBv5bMNGl0vPYxpnyzfa
         2akvYM4XbU2t8sH/gTRsQig1RaAFz9IRx+GqQ/Caeid9/qnEOeGvZrwVEG1KtEKkMyYD
         h/GijVtEKNMhWWOYfsm+0j7gWXmgRYR+MahqWPKkJA+42LxKMCtCIo5I5FQFRjombG87
         pt81YR+541D23Tz9JfiEiWWTR0JxcHITam8r4y3Ud5VUNvXWyFZ/nmgpjwsbPHSZvzfe
         ySj4oSmq6udmWfPzgqc80XbK61+OGSsvh+qoH01Phdmp2nB4H1jmd/GVLe+gnrdiTp+p
         jaMQ==
X-Gm-Message-State: AOAM531Oe9pWR7gQ8qtju/dtRShUTIrt3kZCgIAFlP2k5Uqh50FfGUqS
	/bSkRsc6SJ4viDwqdKndzYSeevrktbk=
X-Google-Smtp-Source: ABdhPJymwRgSS/QTCpphJK2gWO5fWNVAensdOd5debCCtyT1eqh6vN7nhxp1YqM5axzZBxB5ViUQIA==
X-Received: by 2002:a05:600c:34c5:b0:38f:fbcb:e45 with SMTP id d5-20020a05600c34c500b0038ffbcb0e45mr15309073wmq.66.1650290439536;
        Mon, 18 Apr 2022 07:00:39 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c1d8e00b0038ecb2d2feasm12977678wms.4.2022.04.18.07.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 07:00:39 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] fs/ntfs3: remove redundant assignment to variable vcn
Date: Mon, 18 Apr 2022 15:00:38 +0100
Message-Id: <20220418140038.82843-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable vcn is being assigned a value that is never read, it is
being re-assigned again in the initialization of a for-loop.  The
assignment is redundant and can be removed.

Cleans up clang scan build warning:
fs/ntfs3/attrib.c:1176:7: warning: Value stored to 'vcn' during its
initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/ntfs3/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index e8c00dda42ad..fc0623b029e6 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1173,7 +1173,7 @@ int attr_load_runs_range(struct ntfs_inode *ni, enum ATTR_TYPE type,
 {
 	struct ntfs_sb_info *sbi = ni->mi.sbi;
 	u8 cluster_bits = sbi->cluster_bits;
-	CLST vcn = from >> cluster_bits;
+	CLST vcn;
 	CLST vcn_last = (to - 1) >> cluster_bits;
 	CLST lcn, clen;
 	int err;
-- 
2.35.1

