Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ECB6AA2
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 17:30:38 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-348c4a1e12dso258368907b3.11
        for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=s6uRkLrexDp9AuGMyAs7SqQv5eI0LnBw/AxscLv33eg=;
        b=K/Kvf34Ybxb1LFBqrZoKkACQgHyv4I1QScwmZvyn+qM1dIy+smtpSYautDp5op7gJU
         qnmLqtZCvZASSkHNNy7A0D0Lq+4YHS8o1qh8mZqKy9m/klmLjt3nRjrdgFcpsequdAcM
         68bvJZS3B7fbvfmV7CVjmq1CQA5y9Dnva7iT4sC7/GKUycyZe8YnGsdVDD4fAqH0EZpu
         +4MWmskGe66wmsRGjCL+p7sOZp3c5ncxumEFIokiC8/9pkkiJ611StSAi+qeFkc6W7rg
         tKPX3j6S2gqIQ75Q4R9hw93RYPYdeOov2NXSgSkZTP2uzTTJbSnPUd0ri+zoJyZfjvam
         wRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=s6uRkLrexDp9AuGMyAs7SqQv5eI0LnBw/AxscLv33eg=;
        b=WU3UK7JEqzOy5UI/Exd9xhyImR5PnsXrSN+Z11EANH2RleraXTBwvpXJUfxbKIzALV
         QH28iNzCXiHfFwuVRLS5T+g6toyi0eHyBMA3AlmGBfnO+O1nvU2PJNsQTj9az57Ni1Of
         a4Mef4DNf6GqiI2BRrqE4SIhpW74B7bTY5bFG09O/hupE1I3df/wcjzQq6drdVQrISmo
         CMS2/XYdT2mAdydCyH+bj0DfAruveNeaDp/IrkOol2qkiBpf5q2gZS4B0/jBec6mAaKG
         LjfAh2lb3beBy4+VoCAE7w70ueRgJZjCljfeh5Y6vmkixDzMNhZsoNORmrFzq90lSjLI
         zhbQ==
X-Gm-Message-State: ACrzQf1Fo4hktlRriojOixuF0VaA+Cm6mMfeQjD0L6reinZ5zi1lNxUV
	PihQVEkIDMXl0gW9ArsDQU70wLEy9jY/iaJVqLk=
X-Google-Smtp-Source: AMsMyM7Xw97MlDeNMoxeK4C9Q8yZvzyx5YmMmdhCqbBrCkMO2dSAQn1JLxTtaeoCnl54hW+OljS/Ds62sezBoCwwLGw=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:2923:f5c9:c5a4:11b5])
 (user=ndesaulniers job=sendgmr) by 2002:a81:a1c2:0:b0:345:350d:87a3 with SMTP
 id y185-20020a81a1c2000000b00345350d87a3mr15443885ywg.248.1663608637200; Mon,
 19 Sep 2022 10:30:37 -0700 (PDT)
Date: Mon, 19 Sep 2022 10:30:30 -0700
In-Reply-To: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663608630; l=1713;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=cdm/EgJkMgVfXemuVsGW5smIaKhzDdLe8UcPfmZXEsM=;
 b=Y4JtRN4iXagKcRSnVdBlksOjDtas21bn99X7rSkhO86XxKEYotN6z0T6jJuHh6tAcb1hMHaGeByh
 gwoIis1HC1A4hpsZ/yK7pCa0Caqzr6Go1ZktWCvEicmd/c4rLC/s
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220919173030.3726922-1-ndesaulniers@google.com>
Subject: [PATCH v4] Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, Fangrui Song <maskray@google.com>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Dmitrii, Fangrui, and Mashahiro note:

  Before GCC 11 and Clang 12 -gsplit-dwarf implicitly uses -g2.

Fix CONFIG_DEBUG_INFO_SPLIT for gcc-11+ & clang-12+ which now need -g
specified in order for -gsplit-dwarf to work at all.

-gsplit-dwarf has been mutually exclusive with -g since support for
CONFIG_DEBUG_INFO_SPLIT was introduced in
commit 866ced950bcd ("kbuild: Support split debug info v4")
I don't think it ever needed to be.

Link: https://lore.kernel.org/lkml/20220815013317.26121-1-dmitrii.bundin.a@gmail.com/
Link: https://lore.kernel.org/lkml/CAK7LNARPAmsJD5XKAw7m_X2g7Fi-CAAsWDQiP7+ANBjkg7R7ng@mail.gmail.com/
Link: https://reviews.llvm.org/D80391
Cc: Andi Kleen <ak@linux.intel.com>
Reported-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Reported-by: Fangrui Song <maskray@google.com>
Reported-by: Masahiro Yamada <masahiroy@kernel.org>
Suggested-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v3 -> v4:
* Split into its own patch; we don't have any out of line assembler
  files using .debug_* or .cfi_* directives that would produce
  meaningful debug info in .dwo files.

 scripts/Makefile.debug | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 9f39b0130551..26d6a9d97a20 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -1,9 +1,7 @@
-DEBUG_CFLAGS	:=
+DEBUG_CFLAGS	:= -g
 
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+= -gsplit-dwarf
-else
-DEBUG_CFLAGS	+= -g
 endif
 
 ifndef CONFIG_AS_IS_LLVM
-- 
2.37.3.968.ga6b4b080e4-goog

