Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A75F3D89
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 22:14:05 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id w2-20020a25ef42000000b0066d68be3fbcso17056935ybm.13
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 15:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=E20Nt12LsnkGtFpMkOvIRDlb9+mX9JX506hrC6n8tfI=;
        b=A6x6i+4QMeCkiuZ9qANdK/2cQfpMAeCB6bDJk4ZsZGw910nDKgog3Ylz7k8Xpd4oQK
         j4i4VYbhIT0VHMsfdeYlUsvrrJCWvZvSQK7Pmfieuk++8yDviKUuV2bA2gRRaCDej0MW
         rRbDC88IdQowNGoAIV1VTpNAUV49zsNJDOC7dj4QEYmHR4qLgkzMenAfXzJ0uT7MdA3z
         HKVxx3XKkzSeNdTLINSHA9nUoLG14ewxtkSaKQyYspvYbOrwZ3+9js1xfLjavk2xa2kl
         f/8CsqtyN7Cd1EhwJ60iNLBruJ1UHpRY4EbjzvF0eHk3frIGZanylB3kP5OO8o9C8DcQ
         7Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=E20Nt12LsnkGtFpMkOvIRDlb9+mX9JX506hrC6n8tfI=;
        b=DN9WV702Dk5g7BzLVOQG4JN7NNlK9pYStD3lHjMKwDpdKLxJ6SwDEW/eMyrqsDcxBj
         6fjrewYBOQYJSjQ13bJPOiWi6toUmRv4Bd/p9tyxn2GzkPJah7WdoJOYwCK4XteWUZIs
         xDPgExe+ZfEke8SPObee6sFs2ZMUz+E8CN6/+MhlnLl0T6rMQ7wp9Zu8Iu7OpKgpIDEj
         ghkvyoBd1b/a48yUCKo7Xces39vEPJtWbVN6OdW8FcKJ7dT/q2mGeoAuLKcyCtdDvzAe
         gcEP3/R8Xzq27zgTf2JT1Qyee6Ky/4bs9XvIpqIAg+3lOgPHJd4dLYLO4K3uK7YWUXjy
         ywJg==
X-Gm-Message-State: AJIora++11+I/GobOZNESSfdv9UYzNt8HSGp5OIPywRN2YeiulefVmFm
	sMgWPxriaLOSwVYz1qMoCLtBqpNfReIuKJsgTA==
X-Google-Smtp-Source: AGRyM1tbai2dfceIBCyizcjYkUf1XddOKPCwzP+Gz2PbecpsC1ry4B6MzxMbOc8QJ3HDBdHRwREkLhtVHneAH17JEA==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f21c:9185:9405:36f])
 (user=justinstitt job=sendgmr) by 2002:a81:a24b:0:b0:31c:95d5:1725 with SMTP
 id z11-20020a81a24b000000b0031c95d51725mr6572075ywg.403.1657318445014; Fri,
 08 Jul 2022 15:14:05 -0700 (PDT)
Date: Fri,  8 Jul 2022 15:13:14 -0700
Message-Id: <20220708221314.466294-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] iscsi: iscsi_target: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Mike Christie <michael.christie@oracle.com>, 
	Max Gurtovoy <mgurtovoy@nvidia.com>, Mingzhe Zou <mingzhe.zou@easystack.cn>, 
	Justin Stitt <justinstitt@google.com>, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter this warning:
| drivers/target/iscsi/iscsi_target.c:4365:12: error: format specifies
| type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]
| " %s\n", atomic_read(&sess->nconn)

The format specifier used is `%hu` which describes an unsigned short.
However, atomic_read returns an int which means the format specifier
should be `%d`.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/target/iscsi/iscsi_target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.37.0.rc0.161.g10f37bed90-goog

