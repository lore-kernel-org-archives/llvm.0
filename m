Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8988F66
	for <llvm@lists.linux.dev>; Thu,  8 Dec 2022 19:00:07 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 1so3459639lfz.4
        for <llvm@lists.linux.dev>; Thu, 08 Dec 2022 11:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/W799g4H7A5yLGYed0hlGgHikenhP/7pLE1Kadbh3I=;
        b=nrQxW6A1dy3JVnpiM6bAv5BaK8FvE+y0gkEzIokfxCalAzOZJ5a0oVWjA4+Gh7AQaM
         k4sDJV1dDIh0Fvh0rnyLI3Kc1eCT0udwY/zGy2ocYZRMJv8f7CTafDmmHy2ABKvGBVSn
         gV/uWps1aJ+ebUyuPQyQNMKFMfxljFLd62FgdvrcuYjcwvK/VyrQHy6DqtnZKp2bwPN1
         qoP3nKCfQe+AsWbDjQu3myYGeFWhSrGvzg2G3SIIhnfgDKTJY8RbDKLN/HKM89aEDk98
         opbjp1KJUj6R4VCuasJAaDhMvK/8tVAxa0Ttxi0RWIS/6L5YyZKk9XI1VuOTj94v6Mhe
         jb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w/W799g4H7A5yLGYed0hlGgHikenhP/7pLE1Kadbh3I=;
        b=KduXs4+yq/nfYF2TCgs0nXiLWmwM4oEOi3l/jVfPydzbV1OSwZkHpYut+M9LdsSxXl
         Rkw0LuzsbR/83oy4duJXGjsnx1Kq+jQY6V7+jYMkqy70s+KipOPVSVIraTbVM7flC/Kl
         gtl7xEpNVWDRK3ISpqMtE2MSNE4v1i1yAh6smaSZb26CVtOhgI+Pp4z2eCp/+Y7+R15t
         z27KTfnIZSRGIHJ5iuP4e/xdCv7TjWmFmtaeXwuooQfQ3YqBQrIjTSiyWVha3yxChXyP
         rgIexYEqstSSQKM2bsMFSZGbz/QpnMMA6+LY4Dqj2NdFeaOwMyfYdXBKQRUH0yE0GunH
         RvfQ==
X-Gm-Message-State: ANoB5pmMRmUXeanzv8GT0zGnD94iJvYR8gk3c8rLtLes9/NHNVo0gyd0
	EBhaUE+LRAMQVYWhqPLxVgo=
X-Google-Smtp-Source: AA0mqf4nIaT2k1eJAyaUs8xqOeMEt2aTZMz2kwJ+uQkGvVJgp7RGTm0WH64Aoch96jmiRwyaSHfq7Q==
X-Received: by 2002:a05:6512:b8d:b0:4b5:a9ca:9725 with SMTP id b13-20020a0565120b8d00b004b5a9ca9725mr451265lfv.28.1670526005496;
        Thu, 08 Dec 2022 11:00:05 -0800 (PST)
Received: from [172.22.204.227] (ppp85-140-58-71.pppoe.mtu-net.ru. [85.140.58.71])
        by smtp.gmail.com with ESMTPSA id b28-20020a19645c000000b004a100c21eaesm3461986lfj.97.2022.12.08.11.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 11:00:04 -0800 (PST)
Message-ID: <8bf10097-519c-a3de-8a08-d0c5d7ddb2de@gmail.com>
Date: Thu, 8 Dec 2022 21:59:43 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH] mtd: parsers: scpart: fix __udivdi3 undefined on mips
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 ", Nick Desaulniers" <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
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
@@ -50,7 +50,7 @@ static int scpart_scan_partmap(struct mtd_info
*master, loff_t partmap_offs,
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

