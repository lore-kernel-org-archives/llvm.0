Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E94A3B
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 18:44:26 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-340e618b145so141884367b3.2
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 11:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=nxmpsFmEnqVW7vmZQzr2xRuU6Ch0EkVsaTgU/u2vV4k=;
        b=SAAFmWyauBySzjpJrNvt73SE2HPay3Orf8jgDhjx36QAx7OjiDOdYgsm0SfNZdYfwR
         1aWZ13i7QRQptij6GuG9iGtF5yNsL2kRXMc/dvOv+5aTsicc+ef1Ql2h5biLg+VJPx0G
         rmMAQwuOVN9lN15VJGyMBfX+4vBc79LhEGOh+DryEgZCI6vTG2qdzrFp2UzJi1YWMD9a
         vVxzoMSlkBRJLBl9oBX4X28ujseOHFASxxhznifxHhpBPOECjZcdTeTNVIfpWNZ/Xz1a
         F2xgmh8MU7SgOqR7WoUtklnxM60uI9cp0b8xB0qwWelT9D1xKvMAqzogZGtG4cA2VV1t
         OZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=nxmpsFmEnqVW7vmZQzr2xRuU6Ch0EkVsaTgU/u2vV4k=;
        b=X4aOxtXgI2Dza4fA+KkmDvhpluD/0ljGCP7EwmBl26YqK+lxHTN4517+L610znR/SW
         qsjScDLSvjOP8srI7946boDjER0VVMBDPOX/7m+ajc7TNApBLfrP8eR7f5Fit8hi/HYX
         h4dBpoFKHQT7dDHtagddGpziRACfi1oYUAFuvV+gS3No2bS1Ca/HWjxh3y1rHX52AHE6
         TepFcwZwF73tXF60fg1YH3qrJ5n4zDuMDt8Py//8V916chjj+m4C3aG5FD7UjLp00B/l
         3Rn0FvbOVWOortxuqLEAZAMn4TKM4Z+UsC0FO4eB3Bv2nev4wU1rAzv0nYdx8EH6I+SH
         gpNg==
X-Gm-Message-State: ACgBeo2+QXQec4PR8wwOKoHQIft65huzVrYxSwxsCINyUtguJ3DgqDt4
	8B4yvuxyqHNpetErRaRyE7SmgxHE+zV2MIfh7RI=
X-Google-Smtp-Source: AA6agR79hkk5fE74ISpRQrASiipyjZ0iIGE2aErmcWn9sSqmbylmLaYlnrPt+lkeerueBeb+/SoRGdoJiwqeKBj6cUk=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:5f5d:95d5:9a3:d41])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:e850:0:b0:33d:c65e:db0f with SMTP
 id r77-20020a0de850000000b0033dc65edb0fmr19134259ywe.253.1661971465422; Wed,
 31 Aug 2022 11:44:25 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:44:08 -0700
In-Reply-To: <20220831184408.2778264-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661971448; l=1621;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=vWDrWFVICt3Ai14ovaPS7sV9hqYwW1jW8tWWfH+heHY=;
 b=7NUjXNp3Kko38nPRelaw4RlNwQnLJ60Pq2Feeg9ta5r0PFwgmr+eznfGI29OX44l2Ycx4qKFO/UY
 y+0hS6/tAzQOJuSLTxlLvDIvqPKvb5NZIizBF2kXCnKd1dlp6AQn
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220831184408.2778264-6-ndesaulniers@google.com>
Subject: [PATCH v2 5/5] Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, 
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, Fangrui Song <maskray@google.com>, 
	Alexey Alexandrov <aalexand@google.com>, Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Andi Kleen <ak@linux.intel.com>
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
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Add reference to 866ced950bcd, cc Andi, in commit message.

 scripts/Makefile.debug | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 46e88f0ca998..b6eb532af3cc 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -1,10 +1,8 @@
-DEBUG_CFLAGS	:=
+DEBUG_CFLAGS	:= -g
+KBUILD_AFLAGS	+= -g
 
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+= -gsplit-dwarf
-else
-DEBUG_CFLAGS	+= -g
-KBUILD_AFLAGS	+= -g
 endif
 
 ifdef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
-- 
2.37.2.672.g94769d06f0-goog

