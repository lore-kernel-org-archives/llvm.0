Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900535A12
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 12:16:47 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id c192so7416864wma.4
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 04:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntCFAlEG4RaBUbthb67COp2chYLeXJlzz0H3UgSJ+AM=;
        b=KcYzYyDqMO1QxjulQ3f7+DlAxeuh4ROCXjWrlw1dhlzpEsk2FlP+AQkW2NmZFH2I+B
         5Gg606bim3Z5sC2PnglpawRbDNvOQXcZjT9mCp59aNR+1HIQzE6iw/vm9ArjB4HhFvlt
         JPebVG09sopBNZvWG8fnRZqFSeMNaTFdV22XiyzeCTiVWDfuof03iQCdi32R69wzc61j
         ur0ApquHv84sLX9BkaLWCrm/5yZq/kEZJfpItx9NIOZIxO4+VyWkwASdLTmE3oZ0GJGe
         CnTvw3k0ZY0vMLM9TdjDplbKhn9LkJ+sZgzkKYgQ4/LxyybfWXaTdcyr7D1CAytYNKz0
         xQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntCFAlEG4RaBUbthb67COp2chYLeXJlzz0H3UgSJ+AM=;
        b=uqx7qXG/TQZNY2KVE9KnBXKZ2YAbmD+DNcLs5bmNvzqb2/FYN3QlT7jNwRTHHxmfZG
         EkLt1dxoBNN1o01BfrERnASlun6lK4arJzcv2FaeeJksJG8V+B5TrvQ/3auZsvPat5+Z
         b52TI6IDMWeVuqQLa4Qrb845km2/UsLYpylfNsAoHd0U82fWrodllbE+bvMlxHisrrsh
         hb5Yl1zkZcX5aUBYtiu3M7h+5Y+tCeJcOB6KrV1rdEpZJW6XMO9u0V4hkQUg3bF6++e4
         7oI7jv2fNMHel/qde+xQPNxPdFvu35bsfz3BUVpZz5S9Nn40MGo2BkQbWkmP+fJZ0mKQ
         iSNA==
X-Gm-Message-State: AOAM531yzHFXiwiHKhsE9KkHrSsQ/a9vIVFs020FbGc4hCe/BIwc4e5f
	cgjILimMB9Kh6afM60mInxE=
X-Google-Smtp-Source: ABdhPJyB2mh3Tl8wcItdVynl95uixjQ5gSbloQJscKVVCDQHi1TWabcRSPzxJFa4VifIWuIbrMF/yw==
X-Received: by 2002:a05:600c:3d13:b0:37b:b8e5:ed80 with SMTP id bh19-20020a05600c3d1300b0037bb8e5ed80mr16672940wmb.183.1646137005817;
        Tue, 01 Mar 2022 04:16:45 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c4ec600b0037bf934bca3sm2929921wmq.17.2022.03.01.04.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 04:16:45 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ext4: remove redundant assignment to variable split_flag1
Date: Tue,  1 Mar 2022 12:16:44 +0000
Message-Id: <20220301121644.997833-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable split_flag1 is being assigned a value that is never read,
it is being re-assigned a new value in the following code block.
The assignment is redundant and can be removed.

Cleans up clang scan build warning:
fs/ext4/extents.c:3371:2: warning: Value stored to 'split_flag1' is
never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/ext4/extents.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index c0f3f83e0c1b..0d98cf402282 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -3368,7 +3368,6 @@ static int ext4_split_extent(handle_t *handle,
 		return -EFSCORRUPTED;
 	}
 	unwritten = ext4_ext_is_unwritten(ex);
-	split_flag1 = 0;
 
 	if (map->m_lblk >= ee_block) {
 		split_flag1 = split_flag & EXT4_EXT_DATA_VALID2;
-- 
2.34.1

