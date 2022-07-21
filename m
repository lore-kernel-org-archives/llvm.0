Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CF86AB3
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 21:57:12 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id o135-20020a25738d000000b0066f58989d75so2241906ybc.13
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=pKP7CCgXGMWOvGx6gHAf0azIJTDG1kATrVwV3TY6IK4=;
        b=Y2J6Bchnkv+CY7fj9Wg7lOCkYCImN7mDM66RaF7ySai5rB75A1FN0zw5F+fIPv9T2i
         XriQ1hOaSoMJ/M/vF/GNwl+97zU2D3oixxzVdYiRYPqltnj+aUBZK2+ugRbgZUQk6/e4
         eBT189goXoh2IdOFfAPXLycvPQfowcO0oQzEfAN1Rou+7VleNXBJcpxoHanw1EwjSrJz
         txBT+QMJhq62eoEPVOsz8/fI6snPBcyCZMoc4wJ86mLh6hu3KNt2frJgGAOUnOh3CKjA
         4w6Tg2NEIauF3wdnBVhZCGmDjYvwbGwa20MzgYOIIpludL8Xgob6vOCiezbmg0OL4axi
         dyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=pKP7CCgXGMWOvGx6gHAf0azIJTDG1kATrVwV3TY6IK4=;
        b=SpT2ZmeOhFTlmpU533nNKZwPii0nhB8RYbW4VwP4A05Lg5QDOWaQ97weCD5xwUgNgD
         OBrR1C/SYXAkjfCk2n6XnSut70VUfwkL837nQSE+Sbj2N7xSNeGBAceGCDddTDWmZu67
         fnL95bnJm8qPY4+88j9GV50mDiF2Zpu9iHWMtN+DazAJDhuMdNjV8EdnMNnryqCUHJ+e
         hdcNdu3BGSd6u45cCejrmHXRxGhc5P6vNBW+TynmIrKMVzs8qmMPf8h5zFGZm/Zitvps
         yErWQmeo4uMqZxN6BIpnn04sl19Vm9mOeFftuz7S1XM3xfy772AYsQyqpjdKVAfzvMlC
         wE/w==
X-Gm-Message-State: AJIora/6vhWsUbvC6WIKGDVuygFjDX8HJbt97H20+lhlk27h+gl835FG
	xZ0JovfSpkulIjmVIwHU07ojg1uZZ96gdEn9QQ==
X-Google-Smtp-Source: AGRyM1ucB1iTL8zgj8W57h3Rx8oXpnUalg0cp4kTWx7rwMHAc+CSjlaYwWcNIv3Tb73PXxLNcck91OaL+08S0h4qTQ==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:21e:d672:5a6a:420e])
 (user=justinstitt job=sendgmr) by 2002:a81:7c85:0:b0:31e:6c01:f06b with SMTP
 id x127-20020a817c85000000b0031e6c01f06bmr530100ywc.327.1658440632141; Thu,
 21 Jul 2022 14:57:12 -0700 (PDT)
Date: Thu, 21 Jul 2022 14:57:06 -0700
In-Reply-To: <CAKwvOd=wn=tbX7ixs9a=4zoVSbAU1qP-6NE04hGG9dzvo0zFJw@mail.gmail.com>
Message-Id: <20220721215706.4153027-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAKwvOd=wn=tbX7ixs9a=4zoVSbAU1qP-6NE04hGG9dzvo0zFJw@mail.gmail.com>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH v2] drivers: lkdtm: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: ndesaulniers@google.com
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, justinstitt@google.com, 
	keescook@chromium.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	nathan@kernel.org, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter the following warning
(ARCH=hexagon + CONFIG_FRAME_WARN=0):
| ../drivers/misc/lkdtm/bugs.c:107:3: error: format specifies type
| 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
|                 REC_STACK_SIZE, recur_count);
|                 ^~~~~~~~~~~~~~

Cast REC_STACK_SIZE to `unsigned long` to match format specifier `%lu`
as well as maintain symmetry with `#define REC_STACK_SIZE
(_AC(CONFIG_FRAME_WARN, UL) / 2)`.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Reported by Nathan here:
https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/

changes from v1 -> v2:
* Use implicit division conversion with `/ nUL` instead of verbose
`(unsigned long)` ~ Thanks Nick

 drivers/misc/lkdtm/bugs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 009239ad1d8a..48821f4c2b21 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -29,7 +29,7 @@ struct lkdtm_list {
 #if defined(CONFIG_FRAME_WARN) && (CONFIG_FRAME_WARN > 0)
 #define REC_STACK_SIZE (_AC(CONFIG_FRAME_WARN, UL) / 2)
 #else
-#define REC_STACK_SIZE (THREAD_SIZE / 8)
+#define REC_STACK_SIZE (THREAD_SIZE / 8UL)
 #endif
 #define REC_NUM_DEFAULT ((THREAD_SIZE / REC_STACK_SIZE) * 2)
 
-- 
2.37.1.359.gd136c6c3e2-goog

