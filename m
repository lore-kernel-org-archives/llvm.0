Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87F64420
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 18:11:18 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-31c89c753b3so49869957b3.5
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=37XjpwINbIdCZOixjlZ7DvCc9OsQ74PUxXtDLJLAMo4=;
        b=IGiyhqhxriPnKAgqV311rQDmdO12mi2/guaqtzz3mgBzIbpqRQMHf7uelOX72j4nGc
         MYbky0QOOv8+y7b5C9oVG4vxM7XJDppT1Sx+Un/13hdgwUdPIF/wuesJYIrsSNdOxEhC
         3jZAR38HwfyjjdawLFfgrHZmGHp5crwHTY5xWVXsHgsHTQ9qgwCUOIrCBscNWnKCIrRr
         9tqXJG4uZSX+5Ug0rC1T3GoYb6pMwZGFpZ0upBjcRHXeKd+KunH/etzIhdbD+9mYUhU8
         7kBkGn8xR8SDxMHYd+GgA35EdNby72zVXx92yrj7VpYLw0WXVlrl6H1KbTFBVgSZHQwh
         ZEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=37XjpwINbIdCZOixjlZ7DvCc9OsQ74PUxXtDLJLAMo4=;
        b=R7qFWlkPF4c/m5eGaH1216YoglWTJYcQgMTxkxmfPIMWHsEuAbjitoOVqc9oAxOVJS
         Fy17X8rsI+3qyXa74w3oUcawO7josW4gyEF2l7vjmE6qJDmqDeJx23V2uXxhxgO54b2J
         QWlFNFn8D/PgjLKjHmsHaHg9vUpzNmTGDXWbVARTjgRD11k7zecsf1UFAofIp9vjUOp4
         c92BopPl7NYY8z5HCz1NyLjs/kWm84ttxbj0jisNHGUYBbpkDwLb0BjBSQSk+4IwPfMx
         EItvh7UpnDxlecePcjNhCV9s3mQSZle4wwW8fYAX1EnK2RfZJjZv8klweN/vwxZQZXey
         t1cQ==
X-Gm-Message-State: AJIora91WgoGxgA/nnyk5SAh2tfzo5rQkQJn6b3OLDH+w7iAVE3q1B32
	dILoeNUQctPwMyHmUnFhu7bzdh909oVow2ian+g=
X-Google-Smtp-Source: AGRyM1t3o9MGllrJmYwYsI6Eh1blY0EaoLJloeGoMm8iXYkkrvr9JNskwbGliGv3yrbPrkQJtDpHenoxX1qKCva3hq4=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:1f7d:643f:d86b:d30])
 (user=ndesaulniers job=sendgmr) by 2002:a81:998e:0:b0:31c:3c64:ceae with SMTP
 id q136-20020a81998e000000b0031c3c64ceaemr20750431ywg.494.1657563077827; Mon,
 11 Jul 2022 11:11:17 -0700 (PDT)
Date: Mon, 11 Jul 2022 11:10:58 -0700
Message-Id: <20220711181101.1559558-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657563058; l=1024;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=UwBPgIcopp176p+9NLELYyArInZxsbOzJt598/EPZHw=;
 b=FFllqwq8yPj+R6TWOEXNM/20Ih2vUuarPXeoC0vRo+LhfHMzE6uno3y1ovfyYPHNKok9IN7Pha/J
 vN/MdOtbBo/XF1PjkbttYs3NzLl3ApI8dCvX6b/3/k3hGvH9ArdI
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] Documentation/process: Add embargoed HW contact for LLVM
From: Nick Desaulniers <ndesaulniers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Darren Hart <darren@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Should the need for toolchain mitigations ever be necessary, add a group
for toolchain ambassadors.

Add Nick Desaulniers as LLVM's ambassador for the embargoed hardware
issues process.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/process/embargoed-hardware-issues.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index 95999302d279..48bd249d96b9 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -264,6 +264,9 @@ an involved disclosed party. The current ambassadors list:
 
   Amazon
   Google	Kees Cook <keescook@chromium.org>
+
+  GCC
+  LLVM		Nick Desaulniers <ndesaulniers@google.com>
   ============= ========================================================
 
 If you want your organization to be added to the ambassadors list, please
-- 
2.37.0.144.g8ac04bfd2-goog

