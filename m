Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A210D748C
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 23:23:41 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-31e55518830so591687b3.23
        for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 16:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=R+/1pbXuzmkVkOVy5qVFEBVHEW28THt6o2fZNxe3Mxk=;
        b=PdnjK40uqE0rlZAfyoGITLGrx0eRz5JxZ7VRQIerUO+mUtU6DdggO5Ajy3NGMqmKow
         IeTieM6BTy5sLQqE8tqL1gpZrGtnd8WELTcYjwIotVkVpwAmvUXJSnkmcFGeAh4xIinb
         7RBd2n0ycGcN6sTR2j6mt5AOt68f/L+sYICQWEAnAyOAx2po/n6Ub2jx+vDZ3Ys7cOR/
         cLNwNFxXPYWtryBkP+jxU/WJARD+Up+a9L3wTOxEIWs6amWDeG9gjWhf2pMlFsiXhGCB
         qqDicb5nVMv2sAlb/DqGazIarpYZDaOi91FxuwIMwuUd+WPztxwagBMiWLBinCi1D6Sw
         34MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=R+/1pbXuzmkVkOVy5qVFEBVHEW28THt6o2fZNxe3Mxk=;
        b=c2QJRbpp4fFsMOlbqZ0x2fi6x3WeDgRJNKE2vTUNhFcjbizqu97ekB5j7FjO6mkTM+
         C4qMwJD7za7zL4beAmyJU+x4QiacxTk5efLjT2a7Ho+szwB7UczxLUgvWkzrxSonsasA
         1AaKNNi0naOqu/lYrBScx1B9DwVeSeNQuM4+p/goABlojvAfa2TQnHdBDtyYBO7ax3e5
         v5e6QVwPAZ2WQQU4eGaY0EMq1yQWmtQ1/v6vay8QVHIHx1NHKCXXwhg34RV+T0Bmu11g
         FzGGDoWPx85CcRjzcC1Emh0szpigrauDDvn9FFujOP6uSxNJkm1qmzDZU/uWuQgUZoHk
         GDRg==
X-Gm-Message-State: AJIora9nSUQbg3/Eth7hd/nSuq1Af3GTvZn45RYmhWns80c8YYG2Yc+B
	XJckMNi2PPCa2mBkVXNDxsZan+os6QMqEJ2wkg==
X-Google-Smtp-Source: AGRyM1s5yy+h6QaK+AjrtLq6y3FlnydodI5uH79guzSZhcFTGxDYwsSbdfDP6/AXl1R0X9J2R2ETP9lL6nC7QgPDCw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:c00d:c17d:52be:ff65])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:102f:b0:66f:1145:af6e with
 SMTP id x15-20020a056902102f00b0066f1145af6emr38142323ybt.509.1658359420516;
 Wed, 20 Jul 2022 16:23:40 -0700 (PDT)
Date: Wed, 20 Jul 2022 16:23:32 -0700
Message-Id: <20220720232332.2720091-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH] Makefile.extrawarn: re-enable -Wformat for clang
From: Justin Stitt <justinstitt@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

There's been an ongoing mission to re-enable the -Wformat warning for
Clang. A previous attempt at enabling the warning showed that there were
many instances of this warning throughout the codebase. The sheer amount
of these warnings really polluted builds and thus -Wno-format was added
to _temporarily_ toggle them off.

After many patches the warning has largely been eradicated for x86,
x86_64, arm, and arm64 on a variety of configs. The time to enable the
warning has never been better as it seems for the first time we are
ahead of them and can now solve them as they appear rather than tackling
from a backlog.

As to the root cause of this large backlog of warnings, Clang seems to
pickup on some more nuanced cases of format warnings caused by implicit
integer conversion as well as default argument promotions from
printf-like functions.


Link: https://github.com/ClangBuiltLinux/linux/issues/378
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Previous attempt: (https://patchwork.kernel.org/project/linux-kbuild/patch/20190201210853.244043-1-jflat@chromium.org/)

Note:
For this patch to land on its feet, the plethora of supporting patches that
fixed various -Wformat warnings need to be picked up. Thanfully, a lot
of them have!

Here are the patches still waiting to be picked up:
* https://lore.kernel.org/all/20220718230626.1029318-1-justinstitt@google.com/
* https://lore.kernel.org/all/20220711222919.2043613-1-justinstitt@google.com/

 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index f5f0d6f09053..9bbaf7112a9b 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -47,7 +47,6 @@ else
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-initializer-overrides
-KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
 KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
-- 
2.37.0.170.g444d1eabd0-goog

