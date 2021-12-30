Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7825A2C82
	for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 15:09:06 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id v10-20020a05600c214a00b00345e59928eeso9651457wml.0
        for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 07:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sf/3KqcCBGZ0jjyoE9sxhd/PuBCJYLVQgneAgtveI+Q=;
        b=VrLKSJJHDL2DA29VZEX7N3edD3i7J1oADh0QdE+Ge+67lM+yQkAOci75Oz2ljErixb
         JGWYKOGDUm81Gr6QLvLWyvaiEWCS9H7/kchC8IP3E52+Wsm5Wniu2I9z3T0LgHkPWT2k
         CYbmpkhZXP1xP/aGCwh0RRl768aTvEWeyotCQfaHpj2oDihdO8fPQ9qywBgnMO0sNP5L
         XJwkIpZihkbNfjsPPljHiv2BHjV70T1/6IY/dbtMMokE9kEBKsSbFUEWmzn8jmfUZma0
         N4hvkcBYVHlX834+yXrVnuS5yY+0RPM/ffnmu46nSi/88lDqu2Pwg6o/D6hbY4Dkqt4j
         ZLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sf/3KqcCBGZ0jjyoE9sxhd/PuBCJYLVQgneAgtveI+Q=;
        b=1tKRrrDuB6xw0aGwH/FNyyIo2y6NvZtAKTJnn8aUYtz8C/BDjH0+ANWQQzB5UjdY2a
         HBdKKUg4c94IcVEylNAh+ENxW5Crd8zV8UCzGr63OpOj3bLZo1jQELvlk/en9rFAfaX8
         HIwJDaf35rK3Xt+OnWhyczKw3TfZakugGJ/GQWjHTJ07LyBMtjPrzxvbF+Lt16VF6bd5
         QqtLPDUqdNpYbHKoFZaPbV98k23j4jEfoa4j9mbAgxPettxSN7Yw3hrTsAiEfEAR2tr1
         A+E+fP97g2aDxC31u3bLLITS0D1DgoW0JN9gDCJDUXGP+YiHpBqiQ7OjMNYY+anGMHhA
         XAeg==
X-Gm-Message-State: AOAM530KaimP0z8tvdlEPpFPA3GwXYQnOp83Xoqxhzu/fDwYdIODT0qb
	HZh+HT6vAiqbAxbK4+wbX98=
X-Google-Smtp-Source: ABdhPJwkiMs/OeTQoco6BR7K7opw58ewBVj+GETPXIuGVQyoCDEIJ0BNvZTdWtwtYsATV6WazqvGwg==
X-Received: by 2002:a1c:3b86:: with SMTP id i128mr26609703wma.50.1640876944798;
        Thu, 30 Dec 2021 07:09:04 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id l4sm27466631wry.85.2021.12.30.07.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 07:09:04 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Stefan Berger <stefanb@linux.ibm.com>
Cc: kernel-janitors@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib/oid_registry.c: remove redundant assignment to variable num
Date: Thu, 30 Dec 2021 15:09:03 +0000
Message-Id: <20211230150903.190860-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable num is being assigned a value that is never read, it
is being re-assigned a value in both paths of the following if
statement. The assignment is redundant and can be removed.

Cleans up clang-scan warning:
lib/oid_registry.c:149:3: warning: Value stored to 'num' is never
read [deadcode.DeadStores]
                num = 0;

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 lib/oid_registry.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/oid_registry.c b/lib/oid_registry.c
index e592d48b1974..fe6705cfd780 100644
--- a/lib/oid_registry.c
+++ b/lib/oid_registry.c
@@ -146,7 +146,6 @@ int sprint_oid(const void *data, size_t datasize, char *buffer, size_t bufsize)
 	bufsize -= count;
 
 	while (v < end) {
-		num = 0;
 		n = *v++;
 		if (!(n & 0x80)) {
 			num = n;
-- 
2.33.1

