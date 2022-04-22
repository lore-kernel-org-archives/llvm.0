Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359482901
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 15:17:59 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id n8so11544378plh.1
        for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ugUPrPCeG+4KNh4o4UU3L2XGTAsONRbVSCUPTlkzE7s=;
        b=a9+lKlXL3U13tWvDJ6tIe5Q55LL14Jf6zP882Dk0M4Bn8LCTX5wKMesGdJR9Kwkv9p
         Fr7H1cRJiofWgoj74aJUCUiCnHt5riiH/hUtlhavaUdyhjP8DgQ/8JP7VRhIbFuvvqEx
         hQVg01WfwiThjfFqmOqJkrXQfGHwEySV3DgWt8gu93HrwIDOgoK4zzseRN50ZoULGFw7
         mJkRVZU9dYxiZPNh46lxZM9MryhlTMGsjBYLPPUXiD6zw4oBlbmIkLlKQyi+FfLRBikq
         igpMyXwdJ6Qkk5MSDpbaiaYxnqgZwgIhIv3medhzTBWfKRB59oVa33b1Sa/AndcLvZEu
         3HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=ugUPrPCeG+4KNh4o4UU3L2XGTAsONRbVSCUPTlkzE7s=;
        b=dfLA3rqeQj8clWCRy6q4JXylT+/qrwqn11Nm4IY8mFVC9+wJJeoWObAa/g2d2mZCD/
         9CZbP4n0yDMmXZoQQ2w3mSvJPFXZIoeZLpEwm1edg8uhPtPJUYUNEvb3klKywMIsOOLn
         zR9RUtDbhZ+Y+eD6sxLFbkmE5nemNKwBMhL1jaugoJ46AjdJhzeXJ19jLUl0DoBEbCbp
         4fI+mKa3OE823/AFIJuvT016Ej/V+xilHyMnZ8oaNep/MPQxQScdcSgQtcJzo3uHY5Mi
         dK7EjPXdyXwkTT+0LgL66BuJiyNd0fleOYYmxppg9sDSs931wDrtq4QHSv5J+5tZnfjw
         0TkA==
X-Gm-Message-State: AOAM530vF9T6tatvuTYgrwe6FatTG+BWi4KOnflAoQYgnpciZsyh0+86
	WB1VNu+Vxgl7dy7YT7W9Vus=
X-Google-Smtp-Source: ABdhPJzG9sdIxFzivmJ9pmxye4wlB9xJam4o9CQAWzW4qnh2/VLQv+LZp+/fy6dblqPnLGOFLfwkUQ==
X-Received: by 2002:a17:902:f64e:b0:14d:20db:8478 with SMTP id m14-20020a170902f64e00b0014d20db8478mr5245444plg.158.1650640678527;
        Fri, 22 Apr 2022 08:17:58 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id o11-20020a62cd0b000000b0050ce8f98136sm2980459pfg.149.2022.04.22.08.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 08:17:58 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Palmer Dabbelt <palmerdabbelt@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH] checksyscalls: ignore -Wunused-macros
Date: Sat, 23 Apr 2022 00:17:25 +0900
Message-Id: <20220422151725.1336997-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros defined in this file are for testing only and are purposely
not used. When compiled with W=2, both gcc and clang yield some
-Wunused-macros warnings. Ignore them.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 scripts/checksyscalls.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index 9dbab13329fa..cde15f22ec98 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -255,6 +255,7 @@ cat << EOF
 /* 64-bit ports never needed these, and new 32-bit ports can use statx */
 #define __IGNORE_fstat64
 #define __IGNORE_fstatat64
+
 EOF
 }
 
@@ -268,4 +269,4 @@ syscall_list() {
 }
 
 (ignore_list && syscall_list $(dirname $0)/../arch/x86/entry/syscalls/syscall_32.tbl) | \
-$* -Wno-error -E -x c - > /dev/null
+$* -Wno-error -Wno-unused-macros -E -x c - > /dev/null
-- 
2.35.1

