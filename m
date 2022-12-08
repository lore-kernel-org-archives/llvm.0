Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA668F76
	for <llvm@lists.linux.dev>; Thu,  8 Dec 2022 20:28:54 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id n21so6707470ejb.9
        for <llvm@lists.linux.dev>; Thu, 08 Dec 2022 12:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3XAlWDTwUy+qPERwsjX/N6IA9+HXDNBP1lE9yvcMsw=;
        b=RZmfjQenTaKPwkX673GVZVHPwq+AtNve08oJLxpuW2Uy1RNGLRDbRDFPZJdaPgUYrd
         lAAYPa5RYWLR0A3ngRAICrfd10N8oi2MOLL4JmxBQlzgGlYZi3UJwAXztM+NJq6+XDUu
         3HM8aJ4wskTcSUVIA5cO2sR3SlJ+kGl9YQfQo6T87Up6dKDfdUxKe/P1VEddFyqayA8m
         IXXOI6SGmMVWYNKiC/Ah6goMwRmzEWLTg4vCdFBYiNx7gt4WMogJpK6TTwZhXXzhexCH
         KCHPDLpZwdKMXEUTLZmNr1u0IPX3+lk9N2KBNWTgQWNpx6Kp6FH9Ro27JR9a/SxPQrGd
         +mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3XAlWDTwUy+qPERwsjX/N6IA9+HXDNBP1lE9yvcMsw=;
        b=rTUcM0+ljT7DCQE7TZbWLJjylgJCtkNKQTVkN7jdAVMXQbxhbdAzwTut6kjkHUQNyl
         alE4cm6sQH76Uf3SgmKPoOqPttYOaPNiOhWX3BXWb+z0XKixEEFVxZ9+bAF3idz4Eqbi
         ClskkjuCSTJczAVcKYhRt5tOCg7JMM8z8XjYYVfdQom8wsf+j9n9K0rJSCiZ1MYE3YqH
         //JI/GpGFEOkIbGiM6BSIV/Ar/iraDD8mEt9hHEm0bF+LhrUOZPLW6/eiT212lXkrCyE
         YGlsTpqsTRT7ljCTEdAUvY3LaZOP9KPZPU0ehpHOTPE3fn09sXGBhnamG/8QKRokvuTw
         c1NQ==
X-Gm-Message-State: ANoB5plmgkLwpGLKGpi/zeR02352P2BFGvKZ0ZuoHqbjLTF99AFF09vO
	Ym6fK1ZoFvBcSR8EvqgcNms=
X-Google-Smtp-Source: AA0mqf4fbW7udj0MMSsIORZ6NVRqkAFwYdeNjP4TlyfgNvUqOSLVTKP7XXw42rkomFIPB5wyMEMGMw==
X-Received: by 2002:a17:906:3917:b0:7bf:1081:9472 with SMTP id f23-20020a170906391700b007bf10819472mr2614605eje.69.1670531332474;
        Thu, 08 Dec 2022 12:28:52 -0800 (PST)
Received: from [172.22.204.227] (ppp85-140-58-71.pppoe.mtu-net.ru. [85.140.58.71])
        by smtp.gmail.com with ESMTPSA id k5-20020a1709063e0500b007ae32daf4b9sm8868052eji.106.2022.12.08.12.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 12:28:52 -0800 (PST)
Message-ID: <805fe58e-690f-6a3f-5ebf-2f6f6e6e4599@gmail.com>
Date: Thu, 8 Dec 2022 23:28:29 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH v2] mtd: parsers: scpart: fix __udivdi3 undefined on mips
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 NOGUCHI Hiroshi <drvlabo@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This fixes the following compile error on mips architecture with clang
version 16.0.0 reported by the 0-DAY CI Kernel Test Service:
   ld.lld: error: undefined symbol: __udivdi3
   referenced by scpart.c
   mtd/parsers/scpart.o:(scpart_parse) in archive drivers/built-in.a

As a workaround this makes 'offs' a 32-bit type. This is enough, because
the mtd containing partition table practically does not exceed 1 MB. We
can revert this when the [Link] has been resolved.

Link: https://github.com/ClangBuiltLinux/linux/issues/1635
Fixes: 9b78ef0c7997 ("mtd: parsers: add support for Sercomm partitions")
Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
---
 drivers/mtd/parsers/scpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/scpart.c b/drivers/mtd/parsers/scpart.c
index 02601bb33de4..6e5e11c37078 100644
--- a/drivers/mtd/parsers/scpart.c
+++ b/drivers/mtd/parsers/scpart.c
@@ -50,7 +50,7 @@ static int scpart_scan_partmap(struct mtd_info *master, loff_t partmap_offs,
 	int cnt = 0;
 	int res = 0;
 	int res2;
-	loff_t offs;
+	uint32_t offs;
 	size_t retlen;
 	struct sc_part_desc *pdesc = NULL;
 	struct sc_part_desc *tmpdesc;
-- 
2.34.1

