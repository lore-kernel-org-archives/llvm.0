Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B524C86
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 21:53:05 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id l14so7066607qvq.8
        for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=CNKYzF9I2YeaRkrIIwLDheAxIzD3Zi4Vv2DTzJLGgC4=;
        b=UjXxJ7hqnfs5LWBwU6bEJtVaB6IMJjv2C3Q7CnqHdQXyrQl91wIAs04byCTvAd+PiY
         uUCX/3R9PAik6ZuNV5EHt2vSksJxuobZ8whkTsRm41xNHkuQ1pebDWpgFKhM9aglzjU1
         mudTkiAe55dfLrOh1LKV+efzBONM3bB1XrTbFPNKFZUg4L90qEMOgGnHFoU1YMsIOmA5
         7H0WIM2WCgiGmsLpjZ6MD8BRxRjo55WcCIWUGLUnL/rRWplt1IW3+AgsUoMjI+GO3r48
         p3uKPepGDNsYbyZLKUD1/Fwh4sN6VBaLiGfppeKM+dH/PYyA4Mxjpi6VcYG43fi1CZIT
         Tk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=CNKYzF9I2YeaRkrIIwLDheAxIzD3Zi4Vv2DTzJLGgC4=;
        b=HT0d9Eyes0NTiq5ohxazjlpAcbKBGf729g+NRFdKS44a8dAyBhTmaHFdMG8sbdy/Qp
         f0TKE4J6Shz2jmyWCeIOxICKA6QfT/5ng3pblQb5CHuXAlDRqNBkhgqzmBEoVo7c/dpt
         /yOWXfiIj0knQasG8v9SWPgEoYJ+et7kNi7lrpnO8NG7FkHaDJOAmVMd8SrOz2agbghn
         wuxwWBbNczaqy406Cb1JjHJHqw2kAQOvxJZyrkxMk8Pc3T/yhH1EbqJKkZxw1hiRkU7d
         T90+ktSWuj90rhh454Z3CMUviwDQbvCo+O9UD3SHif+898bjdoUrlPuORNJ5oidPrnE/
         Y7+w==
X-Gm-Message-State: ACrzQf3AF9LGWH9acd5WmD141qi98MARUa4EfqGA0V6TVClIkZcZsPhO
	+uGfGC/oVplCwWABs2gcyGU=
X-Google-Smtp-Source: AMsMyM5MEUij1YHZqqzw2bIbbCwcB7/8XJEbwR5NpAgy3+ac7Sq6BIOhXVkUQypecRCPWdd/9sUSjg==
X-Received: by 2002:a05:6214:29e3:b0:4ad:5de4:accd with SMTP id jv3-20020a05621429e300b004ad5de4accdmr23214994qvb.60.1664315584032;
        Tue, 27 Sep 2022 14:53:04 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k13-20020a05620a414d00b006ce1bfbd603sm1850805qko.124.2022.09.27.14.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 14:53:03 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Matt Redfearn <matt.redfearn@mips.com>,
	=?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Justin Stitt <jstitt007@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Denys Vlasenko <dvlasenk@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT),
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	mmayer@broadcom.com,
	Khem Raj <raj.khem@gmail.com>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Kate Stewart <kstewart@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] include/uapi/linux/swab: Fix potentially missing __always_inline
Date: Tue, 27 Sep 2022 14:52:56 -0700
Message-Id: <20220927215256.528619-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Matt Redfearn <matt.redfearn@mips.com>

Commit bc27fb68aaad ("include/uapi/linux/byteorder, swab: force inlining
of some byteswap operations") added __always_inline to swab functions
and commit 283d75737837 ("uapi/linux/stddef.h: Provide __always_inline to
userspace headers") added a definition of __always_inline for use in
exported headers when the kernel's compiler.h is not available.

However, since swab.h does not include stddef.h, if the header soup does
not indirectly include it, the definition of __always_inline is missing,
resulting in a compilation failure, which was observed compiling the
perf tool using exported headers containing this commit:

In file included from /usr/include/linux/byteorder/little_endian.h:12:0,
                 from /usr/include/asm/byteorder.h:14,
                 from tools/include/uapi/linux/perf_event.h:20,
                 from perf.h:8,
                 from builtin-bench.c:18:
/usr/include/linux/swab.h:160:8: error: unknown type name `__always_inline'
 static __always_inline __u16 __swab16p(const __u16 *p)

Fix this by replacing the inclusion of linux/compiler.h with
linux/stddef.h to ensure that we pick up that definition if required,
without relying on it's indirect inclusion. compiler.h is then included
indirectly, via stddef.h.

Fixes: 283d75737837 ("uapi/linux/stddef.h: Provide __always_inline to userspace headers")
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
Reviewed-by: Petr Vaněk <arkamar@atlas.cz>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Apologies for the insanely long CC list. I encountered this problem
again while attempting to build perf with a LLVM 13 toolchain using
musl-libc. Not sure why it did not get picked up last time?

Khem did submit an alternative patch a few years ago, too which also did
not get picked up:

https://lore.kernel.org/lkml/20180913005654.39976-1-raj.khem@gmail.com/

 include/uapi/linux/swab.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
index 0723a9cce747..01717181339e 100644
--- a/include/uapi/linux/swab.h
+++ b/include/uapi/linux/swab.h
@@ -3,7 +3,7 @@
 #define _UAPI_LINUX_SWAB_H
 
 #include <linux/types.h>
-#include <linux/compiler.h>
+#include <linux/stddef.h>
 #include <asm/bitsperlong.h>
 #include <asm/swab.h>
 
-- 
2.25.1

