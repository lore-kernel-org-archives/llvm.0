Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2725A12
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 12:07:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id v21so20158303wrv.5
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 04:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hSCwK5xS8mlQDgYKMAx0VBG8XXlCG6EJdzqrXuBG+YQ=;
        b=PpIqQKZ/2cNpIDY6gBqHhJnRr265H0PDVQynomcMHlTr8MsfRqVJqI2q7fFxPqx+jk
         yD9E3CnSgSUgB6+WYe5d4PMZG/SZhYkwSFAV5ZDa81V+sMuo2PS4m130jA0ho6Cn163k
         F87UvbKWCHi9DDRimZOlxMQopfOeMis2dq/2HLkqxgVJR2vCIUnL2tFk9D840vMpT2XN
         yi7h/zb7UkrNeoGmxhGCdptDY7X452KHD6msiDrQ7e85MnA67pRcgpd3V2LtW6WDlhK5
         zxlpPZ81ImFOlWyrh2WMVKGXfupAmMfgICFs9YVG6ZSpIk7gkA+yVFVMokP1P0GB4dat
         YzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hSCwK5xS8mlQDgYKMAx0VBG8XXlCG6EJdzqrXuBG+YQ=;
        b=onm/pzDtCu7aDdCqun9+9DL7NEesife3mq6H04aAsnZD5qTn8uj+N43hziu7aaPrU/
         heYAWI97ezMnekWf6h0a1ynvFzjqRs9s1qD3iXNDO7ITJbv47BecWLuo07P47IExAVcY
         k3D0q3v8fPHvJKY/A/xPhjH1O4EBybauetmXrjfWi2Lc8z+umOMOn4DAfpK5yzo9T6Pc
         0HfXiRtZLtQvQqmm+6VniZy8kVk5ZwQaxGkqxJCS/aCW1Fv26htvn0Yxw4VHQTfPtrBT
         XzdE0fx4TpEyXW6y9EJH5/qj5EFTWGqOAZghqG8XluWdWC4W7iCoKmx1rsNjuRvFHJuN
         /1ig==
X-Gm-Message-State: AOAM530q6NmERg4K9Db4rIIAlg0zc7jV/mpxQNdWJ3Xzq04hJlvf9qtd
	6NZsrOonZZAtKa48PowfQgA=
X-Google-Smtp-Source: ABdhPJy5w8b76F7DObiS0Zj5X/X3oN+Cn8tf+9SnqcR5dCpBJywM51JSJ2UGavHd5lzX1XYQiGhoSQ==
X-Received: by 2002:a05:6000:114b:b0:1ed:c1d5:95a8 with SMTP id d11-20020a056000114b00b001edc1d595a8mr18938705wrx.539.1646136454271;
        Tue, 01 Mar 2022 04:07:34 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600011cf00b001edc2966dd4sm13256718wrx.47.2022.03.01.04.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 04:07:33 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mimi Zohar <zohar@linux.ibm.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ima: remove redundant initialization of pointer 'file'.
Date: Tue,  1 Mar 2022 12:07:32 +0000
Message-Id: <20220301120732.670168-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer 'file' is being initialized with a value that is never read,
it is being re-assigned the same value later on closer to where it is
being first used. The initialization is redundant and can be removed.

Cleans up clang scan build warning:
security/integrity/ima/ima_main.c:434:15: warning: Value stored to 'file'
during its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 security/integrity/ima/ima_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index c6412dec3810..41b91a0bc8dc 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -431,7 +431,7 @@ int ima_file_mmap(struct file *file, unsigned long prot)
 int ima_file_mprotect(struct vm_area_struct *vma, unsigned long prot)
 {
 	struct ima_template_desc *template = NULL;
-	struct file *file = vma->vm_file;
+	struct file *file;
 	char filename[NAME_MAX];
 	char *pathbuf = NULL;
 	const char *pathname = NULL;
-- 
2.34.1

