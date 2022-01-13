Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C582C9D
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 00:14:34 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p1-20020a1c7401000000b00345c2d068bdso4437962wmc.3
        for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 16:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nrycIVytOAWKwlTZ8w/ilWkQGwSx5+f1dHu/8y6N/pg=;
        b=a5njH7Cztbo3QbtdGcyKyoTMyUtlQJsxqlzKkWKEIfbWXIsN71da5Z/xrNnGXkCf02
         g1Em62HCYMugKat3UKDt/LZu3XMEaqlybt+gLzPfyFBHJhdrrnmgDrTRzlMSxekNtaZf
         YtFe+WRGbXF/EO7hGdJ1/gQuwtdMhG8Lj3sVOIomo8rQa+cLHlgPHQz5eVgLp70/jnoj
         6Hhy85tZnyfANAw1RyglEUob4q+sl79VTXnwMQ2KpYknTZv/Tgd4GsMPbJQqyQOA4WpV
         i5qcHpHpQVP+d0Xvmxtc/ORerQIP7N5lx6j7E0mFDwMK2FYoLTbGRXi8kFt+4KVm0T+4
         /Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nrycIVytOAWKwlTZ8w/ilWkQGwSx5+f1dHu/8y6N/pg=;
        b=ID/Rus4BaZJtPIyvBykKayLiR8YzH8UP0nHD5O+1Y0yWv1JKFkFHtjlHLA2MXnmvBo
         yXdFoZJ48YmsU2SSK3SYkaJ8atYeNZqK8Yb3qX5MIreNhb1SqLOghR0DR5IK34LrStsY
         er8RSYI3aLT/ZArR7bjqPcykJTlZhcJzHBtpwyicVBPGrWLwp2PpJD6mqLJaZaKKF3DX
         3DuoaHg81wTOjKIh8Z3aQM5ZwsoiC7+LKmeQCLf25NTNH9MgqJSYZTQh6ib5b0lcNP4i
         HM5lfG1rXoCUgdyksrBYcGIMU6RACvcGxqc5hfbLvmqP0ToJ/Zer5MbhO2EXD/mWbPlR
         DDvg==
X-Gm-Message-State: AOAM5305FJNk6w3lqQEN/iCHCSehJZinBHuetmb0YQDGDAkUl3QHqz59
	GFX6n/s+6xHUsZkGbs6pO9w=
X-Google-Smtp-Source: ABdhPJzFRXF9OXm4/EgGBsukO61paY1VNAwGvoqc5gvww2Qjl1zPJXbwmOs2F+J66qK1yHYXQaSWcQ==
X-Received: by 2002:a05:600c:4f93:: with SMTP id n19mr1573262wmq.64.1642032873277;
        Wed, 12 Jan 2022 16:14:33 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id bh26sm6581197wmb.3.2022.01.12.16.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 16:14:32 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] loop: remove redundant initialization of pointer node
Date: Thu, 13 Jan 2022 00:14:32 +0000
Message-Id: <20220113001432.1331871-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer node is being initialized with a value that is never
read, it is being re-assigned the same value a little futher on.
Remove the redundant initialization. Cleans up clang scan warning:

drivers/block/loop.c:823:19: warning: Value stored to 'node' during
its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/block/loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index b1b05c45c07c..01cbbfc4e9e2 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -820,7 +820,7 @@ static inline int queue_on_root_worker(struct cgroup_subsys_state *css)
 
 static void loop_queue_work(struct loop_device *lo, struct loop_cmd *cmd)
 {
-	struct rb_node **node = &(lo->worker_tree.rb_node), *parent = NULL;
+	struct rb_node **node, *parent = NULL;
 	struct loop_worker *cur_worker, *worker = NULL;
 	struct work_struct *work;
 	struct list_head *cmd_list;
-- 
2.33.1

