Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5209A33CC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 18:04:32 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31ce88f9ab8so98714217b3.16
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 11:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=NWd4oljylJpm15QI+9XW2O50oFX4hIWhG0QplH8ZUcc=;
        b=WZP90pTPH10CAWvZhZJBuczOui98Td8io0fgStFdSWAL73qQaJOJaqCxLfQdQpGnex
         h33Pw3BOS4ET/QLPR1qNefP/G6rXf1JHCz52O8Ex/DUD674t9qZBWErA0swipGhzp+HS
         R1XZQHVH523oSJJKwFazN8Ti51cG/nzXH6QkKYO4+f5VaUYhkINc+gbpJigOkK1C43/l
         mh8zdvBek5v4XHA/4GWHxm8pAfC3WrLHYwGGi+Pq8WQVmbiV3AY9biHCAVSPzRsCku9d
         8L9f/sbHn50lydL6aMWRg5XLmS8aV0h6tLek/icbhqlibGJsit49/PtmhrUwMxvxt7Wi
         UYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=NWd4oljylJpm15QI+9XW2O50oFX4hIWhG0QplH8ZUcc=;
        b=dsfqBudrfnIqMQZFkKbyfm2sdg3XbYOiHoGGA+4V9/iJ8q2DJ++eXgyoDRkX+CXV6Q
         anSikSK5Hd82AsPZ05GEfQKi2hlLt4/GphtNMZwK5rY6ecWRL/DABTKpW29NPOj6PiNM
         EmQfRx8viV3eyNUTVJT6BFSdyhKUVRTxmTsfjGYCbe003L+VujZS0/QiCk3aODbwzHXv
         hduEF139GmEeCbwpJ73w6VZ5N4311E4JkCaJuBH5dvRLlK895rD6KC5lOALlQaC7r31m
         p3siZCsYO3qxYQ7x8tBPYkyrdVu64QctFhpTZZ45iatL8hEClbQ/SlhN+Njx55nIcmS2
         xr7w==
X-Gm-Message-State: AJIora9hH4y7hrHrp6EpTv55t0zUVHZ3veermq+RNvCekD9k8mC2sn8I
	3Ocu+J1wj+Ana2HUuIyCemFPuRaqglgZWLWMCw==
X-Google-Smtp-Source: AGRyM1uB1P/tEFzS7Z6lx8XrCNRWsqlv7V1H3xl8sl1/sKEhqaX33ZIQYN0i8q9S8220iDZ4ZD8+1sQkqrtnq9PlHQ==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f922:7e91:d8e8:24c4])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:124c:b0:66e:d96f:2661 with
 SMTP id t12-20020a056902124c00b0066ed96f2661mr28116509ybu.499.1658167471383;
 Mon, 18 Jul 2022 11:04:31 -0700 (PDT)
Date: Mon, 18 Jul 2022 11:04:21 -0700
In-Reply-To: <20220708211447.135209-1-justinstitt@google.com>
Message-Id: <20220718180421.49697-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220708211447.135209-1-justinstitt@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v2] target: iscsi: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: justinstitt@google.com
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	llvm@lists.linux.dev, martin.petersen@oracle.com, mgurtovoy@nvidia.com, 
	michael.christie@oracle.com, mingzhe.zou@easystack.cn, nathan@kernel.org, 
	ndesaulniers@google.com, target-devel@vger.kernel.org, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter these warnings:
| drivers/target/iscsi/iscsi_target_login.c:719:24: error: format
| specifies type 'unsigned short' but the argument has type 'int'
| [-Werror,-Wformat] " from node: %s\n", atomic_read(&sess->nconn),
-
| drivers/target/iscsi/iscsi_target_login.c:767:12: error: format
| specifies type 'unsigned short' but the argument has type 'int'
| [-Werror,-Wformat] " %s\n", atomic_read(&sess->nconn),
-
| drivers/target/iscsi/iscsi_target.c:4365:12: error: format specifies
| type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]
| " %s\n", atomic_read(&sess->nconn)

For all warnings, the format specifier is `%hu` which describes an
unsigned short. The resulting type of atomic_read is an int. The
proposed fix is to listen to Clang and swap the format specifier.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
diff from v1->v2:
Combined two similar patches into one:
* https://lore.kernel.org/all/20220708221314.466294-1-justinstitt@google.com/
* https://lore.kernel.org/llvm/20220708211447.135209-1-justinstitt@google.com/

 drivers/target/iscsi/iscsi_target.c       | 2 +-
 drivers/target/iscsi/iscsi_target_login.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
index e368f038ff5c..bfb717065344 100644
--- a/drivers/target/iscsi/iscsi_target.c
+++ b/drivers/target/iscsi/iscsi_target.c
@@ -4361,7 +4361,7 @@ int iscsit_close_connection(
 
 	spin_lock_bh(&sess->conn_lock);
 	atomic_dec(&sess->nconn);
-	pr_debug("Decremented iSCSI connection count to %hu from node:"
+	pr_debug("Decremented iSCSI connection count to %d from node:"
 		" %s\n", atomic_read(&sess->nconn),
 		sess->sess_ops->InitiatorName);
 	/*
diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index 6b94eecc4790..0778591abae7 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -715,7 +715,7 @@ void iscsi_post_login_handler(
 
 		list_add_tail(&conn->conn_list, &sess->sess_conn_list);
 		atomic_inc(&sess->nconn);
-		pr_debug("Incremented iSCSI Connection count to %hu"
+		pr_debug("Incremented iSCSI Connection count to %d"
 			" from node: %s\n", atomic_read(&sess->nconn),
 			sess->sess_ops->InitiatorName);
 		spin_unlock_bh(&sess->conn_lock);
@@ -763,7 +763,7 @@ void iscsi_post_login_handler(
 	spin_lock_bh(&sess->conn_lock);
 	list_add_tail(&conn->conn_list, &sess->sess_conn_list);
 	atomic_inc(&sess->nconn);
-	pr_debug("Incremented iSCSI Connection count to %hu from node:"
+	pr_debug("Incremented iSCSI Connection count to %d from node:"
 		" %s\n", atomic_read(&sess->nconn),
 		sess->sess_ops->InitiatorName);
 	spin_unlock_bh(&sess->conn_lock);
-- 
2.37.0.170.g444d1eabd0-goog

