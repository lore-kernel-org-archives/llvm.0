Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3FD89DB
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 23:06:00 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id v1so2707067plo.9
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 16:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=CIqDWj1JvWJuDQPIjOujIFiz2fQWA0hkz8EJEg+XinU=;
        b=kx+MgDSeb251HFeVAk0FRyyIoIhqwIWyCXO5uM6kvqgoV1sHnM3bVMLSP1MFXY3i9a
         +MAoZ6SEFRWv0QPURkz2ZzBzJuiNu/AQmBO+mQ6yMYnvqP65hOsFK8Mvgl234akvmQRl
         U9KwDoMbrc+4KFn0/WDWHlJ7y1vQ3/St0hPA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=CIqDWj1JvWJuDQPIjOujIFiz2fQWA0hkz8EJEg+XinU=;
        b=2Yw0pYHon7EElZNqN+h7ShOOaMgQUk3oQXlja0NObQ4jlB19waFELYozEg+Yz4JY3n
         YVlvSbQGSXoLBHCGqcEtWQnLU4RCnBlraya8Ri/eTTwvaFXSJZoH2zJcsX95GeGsNsRz
         NS0gTRp9Fi4NIq8kV+ison1rXdMRMNYyB82EEa/596PnF2vzSKNZri7rwFkUbv71sZNg
         7MJj9I+th5XWoBzqbD/8a/8PkW/JINEcS1qksRMui+g6V23ieuDiZl36hIufBGxcLtXr
         qaaXKU7yFoTg1a7ZrdtkbEav+nqAP6n1c7GdzrQwoMGOFFoqddif2F/hO4wgqHDYQHiJ
         lROw==
X-Gm-Message-State: ACgBeo2oWnggMztTABw89HYLhtah7GfiC4GdXQ2ufNKgHYjzn5nZhgL9
	peaXIQ4yCo45Ey4eIEamTj8AxQ==
X-Google-Smtp-Source: AA6agR5HbMH8Bnlqyvj1i1WVQbJowWlLSj55fNiv1IcXiwJbSfrqLmDiQQga1/RvXkiIZSsvo0o2cw==
X-Received: by 2002:a17:902:e5d1:b0:16f:15a1:6dbc with SMTP id u17-20020a170902e5d100b0016f15a16dbcmr6206140plf.73.1662591959818;
        Wed, 07 Sep 2022 16:05:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a126-20020a624d84000000b0053b8ea1c4f3sm10428028pfb.135.2022.09.07.16.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:05:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Kees Cook <keescook@chromium.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] MIPS: BCM47XX: Cast memcmp() of function to (void *)
Date: Wed,  7 Sep 2022 16:05:56 -0700
Message-Id: <20220907230556.73536-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565; h=from:subject; bh=HYwgIejLQejwtexj/VpuhMzJ1buPjL4x2gO6mUrU5Po=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjGSPUN5jNrKYHmyqMQrrZbes4AOSST0rSbvdaOEAu MY+6Qn6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYxkj1AAKCRCJcvTf3G3AJq4TD/ 4v77aKoHlGHVpUH2iPHDCB55Gh0KdX3GH+8S6yIe4gB1x/7dxBvdXZFIiGAbOS1dLGscvnVnpdy4Te Sj+DuKb0AUtcVsIcaFW0C6ZmCsnWewgIuqxz+/FT9oFN7D/q+E2A82GDHsc32Icw5ZkMFSw/3njzFQ wF2S2hgRHR+o//fli2/gMyR27oR8jMF3Eurm4AJF42gNEoOewKrfdXvpvzKcGjNfEZ2k1P9XNO9Cd7 Z8E9Gs+nQaA1P2yOe44NOUnGes7tiFubnZeyjhPnWpAlX39lN/AdQWIw0aSA+rei+WpCAv0dedlAS2 kix1/ddChcFM6qiXLM7GEDAwtZ9AB1MuxbS5H/O+ne5cXKVGju+gRuZQ7tyBJJGwUAlxtMRpbPXXWs dhI6h2z51BwAhHHGWXjEJtD1r0GnbAmttPjOAXx0QOu9a04lnSuQ+2G03KE/oVbSkBWPCScHgeBtEu 7hlUc0Y9M+cJ6jHpszBYJJHHtOy/bUadRwYfwV5g8hmR07gjyT7Wp/+oB3pXbOujwlm8j64Ql/ax70 ZWZ96nUXx0CSOTnFrEueoaX5Ojau2xAzmcpBjR3XrdkW2Y5fXIx5Rp4q7voFQZTRNLtWCLLqIfi64g ohzc4zpMzybvjmL2qMZg00Wz5ro+XwOzS1nmVugIFBfDqRonQWahLhb4/i0w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Clang is especially sensitive about argument type matching when using
__overloaded functions (like memcmp(), etc). Help it see that function
pointers are just "void *". Avoids this error:

arch/mips/bcm47xx/prom.c:89:8: error: no matching function for call to 'memcmp'
                   if (!memcmp(prom_init, prom_init + mem, 32))
                        ^~~~~~
include/linux/string.h:156:12: note: candidate function not viable: no known conversion from 'void (void)' to 'const void *' for 1st argument extern int memcmp(const void *,const void *,__kernel_size_t);

Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: "Rafał Miłecki" <zajec5@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202209080652.sz2d68e5-lkp@intel.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/mips/bcm47xx/prom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index ab203e66ba0d..eb5c04a24531 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -86,7 +86,7 @@ static __init void prom_init_mem(void)
 			pr_debug("Assume 128MB RAM\n");
 			break;
 		}
-		if (!memcmp(prom_init, prom_init + mem, 32))
+		if (!memcmp((void *)prom_init, (void *)prom_init + mem, 32))
 			break;
 	}
 	lowmem = mem;
-- 
2.34.1

