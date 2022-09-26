Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF3563A
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 08:55:31 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id x18so9078458wrm.7
        for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=RPGb704O3Bne5Y0UDhxFzj56eq4BOkDrW8rdj0cFxk4=;
        b=CqX+VBGfBXp/8y3OsL5mmBRTzQ/gqge2jlgfxI2WfNDlKUfLT7hzoHcGhmHU4nXHkD
         eE96W4LQwIHsBEOUEIWcPhnDNGnhSwtx6HOUYuizQi6ags76Yb5V7lprDlCqV1SX0oLT
         wSQTfHyFbzZblumxxOLIzJMIjneffXwS7i5rJZ4x9sunKDuWYEj9AKai6t0JHwD058CE
         vz0GQI7U/Hz7HkODfhSH4DvyzLQDSeBBLJQTf2UBKefsS03onvcbVIHRJvyLR9zUNCRW
         Ih+vXFlcp/QqhI1t91XcpJQEu6QZdgEdoEiDZgzH7ua6VxCAKEqpM7t0a8YFKe2d6kpZ
         vrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RPGb704O3Bne5Y0UDhxFzj56eq4BOkDrW8rdj0cFxk4=;
        b=SFNsN17YM4/odjgmxenr3ERmx46k4ms3dCccUHrcUsJyTUVKl+v5MWI4yOJkKW66HV
         U861vXn7p4IQk/LKmmXfLQo2AZ5huOUlOw+yTbAOLyKTOw6M9sl9V5ulbtlvmm4dEw+P
         Tzgxf2qUfNdLisdIuucYUAPAtzwn0QLOxvUy/yJZpMFPL/cNMTNGSDk+3smcTgcDp0PL
         6LmWl5lzvKMRUgkseEUHk/LVVLlCaWQUZnfngPv3kVW3KR07ujwE+F+fm2+uIqju1gvk
         QH0NS4aw+0hM/Q3M3tfxa3zi2aZ6ZkIEgHj7m/5iyYxWvPk2zqIYt9zlATbVSAzoPSRe
         Vjlg==
X-Gm-Message-State: ACrzQf0rThXgAVhJN9xFVyX5G+8dtIIejxfQEVI4oqIEx2N936VVa261
	Xv+Uug8jEpzDCRbiLqDHIvE=
X-Google-Smtp-Source: AMsMyM7Q6ghS34g3/envwAUDHV+tFvaUN83njjBhlCE46x9SHw6GkbOe0qXVnHV/iIwgbBV03o9AdQ==
X-Received: by 2002:adf:fe08:0:b0:22b:311:afcd with SMTP id n8-20020adffe08000000b0022b0311afcdmr12704761wrr.629.1664182529596;
        Mon, 26 Sep 2022 01:55:29 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id c3-20020a5d63c3000000b0021e51c039c5sm13606592wrw.80.2022.09.26.01.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 01:55:28 -0700 (PDT)
Date: Mon, 26 Sep 2022 09:55:27 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: nathan@kernel.org, ndesaulniers@google.com
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: mainline build failure for x86_64 and arm64 with clang
Message-ID: <YzFo/+uF1jJ7gMIN@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

Yesterday I updated my clang to:
clang version 16.0.0 (https://github.com/llvm/llvm-project.git bcb1397bda667e75200ae0be9a65fd17dd0763d4)

And with that I see new build failures of mainline.

I am not copying all the errors but others look similar to these.
From x86_64 almodconfig:

In file included from scripts/mod/devicetable-offsets.c:3:
In file included from ./include/linux/mod_devicetable.h:13:
In file included from ./include/linux/uuid.h:12:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:159:10: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
        q_len = strlen(q);
                ^~~~~~~~~

From x86_64 defconfig:

In file included from arch/x86/kernel/asm-offsets.c:9:
In file included from ./include/linux/crypto.h:20:
In file included from ./include/linux/slab.h:15:
In file included from ./include/linux/gfp.h:7:
In file included from ./include/linux/mmzone.h:8:
In file included from ./include/linux/spinlock.h:55:
In file included from ./include/linux/preempt.h:78:
In file included from ./arch/x86/include/asm/preempt.h:7:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:9:
./include/linux/find.h:119:31: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
                unsigned long val = *addr & GENMASK(size - 1, 0);
                                            ^~~~~~~~~~~~~~~~~~~~
./include/linux/bits.h:38:3: note: expanded from macro 'GENMASK'
        (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/bits.h:25:3: note: expanded from macro 'GENMASK_INPUT_CHECK'
                __is_constexpr((l) > (h)), (l) > (h), 0)))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/const.h:12:25: note: expanded from macro '__is_constexpr'
        (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                               ^
./include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))


From arm64 allmodconfig:

In file included from scripts/mod/devicetable-offsets.c:3:
In file included from ./include/linux/mod_devicetable.h:13:
In file included from ./include/linux/uuid.h:12:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:159:10: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
        q_len = strlen(q);
                ^~~~~~~~~
./include/linux/fortify-string.h:131:24: note: expanded from macro 'strlen'
        __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/const.h:12:25: note: expanded from macro '__is_constexpr'
        (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I dont know if its some regression introduced in clang, or really a kernel issue.

I will go back to my previous clang version (329b972d416a) for now untill I know more.

-- 
Regards
Sudip
