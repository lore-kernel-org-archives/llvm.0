Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F63D89
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 21:15:00 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id b129-20020a25e487000000b0066e1c52ac55so14149445ybh.11
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 14:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=qSHdgGbpXhivocKOF8obQspta2jJCcet6Y7m8IlB0FE=;
        b=eruosEj+j8n8myliab6/ptl973Q0ZXiNMt6UUDheQNd7pnmyszOGFDf+GDlr7eL8uS
         hdca4eZ5qUiIDcup6y1Canc4LvG+Fvn+yr7mQAyFEKjAmT0UJu2HEhhyzDDI8YLxk0Fd
         EeTRQoPSqmilnT/J9DeHmpahsCPR9f5ZCWS9BXgx+QDfCcIT/TW/rYUOw2vfc6OeSWbA
         ncBQTQ/t3m5KouK0Gm9XJ360+XoCbBsf0HSTutjeZauKG5LVUCuxi5HLfyYKaObseGvb
         rYs+GPWldYsgt1ipEkRc22K6DILfhi16spn41fYYk4PP57TowU75f90w3nq8ef7fPf2n
         td7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=qSHdgGbpXhivocKOF8obQspta2jJCcet6Y7m8IlB0FE=;
        b=u2y4xPlU8981NScgFEANkm08c85TdqhpvvNEYjNnBwo84KOI68zoe2eDCs3fl9bJwD
         F0N/ctg6mckf3Lqw8ORYE7uqsjzipqsnKQmGbCTVYC+G0Jf5LW8iSMOA/Ipi2Muoy4bX
         /lgH9swuaP93u8Ek61qH9GcbRRqtRRb0W7OkQvFwdd40MYZFGs06eYWhyfnjlXp+cRIx
         KXPRM6YmdX7wsdP4r5d97dX02FO3MYnN7iUDxzIUr2LTI2lEsMjj4JHUa7I+S8pLAaKi
         NVnDpDfhCTKitKLYkVSTxk0Y6iIcxaEy74OF/dJmhfebHlJ0oWfhzr3Hnzyd9s5l3kY8
         nvtQ==
X-Gm-Message-State: AJIora9ilQGWZle2FjIO+lCgSQdRJ+UFvU67rfLXeOZ/GQxaa8rbthio
	GDXylHPWPE9KJQ8hJfkhrACO3US6FjxFNLtHdg==
X-Google-Smtp-Source: AGRyM1uadBJfbfldQBG3bWmaKwMY9oR7OdO3yCwtqywlN5csybNvYWICIA7nMB70vrKcu2KBBRATcenb9irlXL5AyQ==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f21c:9185:9405:36f])
 (user=justinstitt job=sendgmr) by 2002:a0d:f285:0:b0:31b:c2d6:2ce9 with SMTP
 id b127-20020a0df285000000b0031bc2d62ce9mr6555061ywf.172.1657314899764; Fri,
 08 Jul 2022 14:14:59 -0700 (PDT)
Date: Fri,  8 Jul 2022 14:14:47 -0700
Message-Id: <20220708211447.135209-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] target: iscsi: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Mike Christie <michael.christie@oracle.com>, 
	Max Gurtovoy <mgurtovoy@nvidia.com>, Mingzhe Zou <mingzhe.zou@easystack.cn>, 
	Justin Stitt <justinstitt@google.com>, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter these warnings:
| drivers/target/iscsi/iscsi_target_login.c:719:24: error: format
| specifies type 'unsigned short' but the argument has type 'int'
| [-Werror,-Wformat] " from node: %s\n", atomic_read(&sess->nconn),
-
| drivers/target/iscsi/iscsi_target_login.c:767:12: error: format
| specifies type 'unsigned short' but the argument has type 'int'
| [-Werror,-Wformat] " %s\n", atomic_read(&sess->nconn),

For both warnings, the format specifier is `%hu` which describes an
unsigned short. The resulting type of atomic_read is an int. The
proposed fix is to listen to Clang and swap the format specifier.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/target/iscsi/iscsi_target_login.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
2.37.0.rc0.161.g10f37bed90-goog

