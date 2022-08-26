Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1312E4401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 18:10:49 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-340a4dcb403so15423277b3.22
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 11:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc;
        bh=rDKGbIWlt5Gc791EqDZPKPzTTSlSMP6vk6lOe6XzVfU=;
        b=lGjRGty+ST9TMLxhTjOyI4ogWlDEC9tFmGQYjFZ8KYQHVB1PfLyudgypP8U6DG0qtO
         JOWs0y0EMC/Tt+JMX/cCVbfGHj/VP6NfwlxTp5qypJ3g63H26wUd3vmVF0Viom3ajf1/
         pnOqywB1S4A3h9hvZE8UpfNfV7qBMeEuUyp9VzCkFsmq+SEql3OtIJ4H14Xk7LIVliEt
         nNVrQum6NJXPJAYR2LPevGIPiQMVJ3LliJ6MzdFdrBocCWZpZUu+y+u/Zwtmgc2yZ2PK
         QFPjd4afx+6HpDaa7WdWfZqMie36ti93DFu6pcm+AfNVePa/YZZ5rZlbYnKYx7GQEo06
         EjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc;
        bh=rDKGbIWlt5Gc791EqDZPKPzTTSlSMP6vk6lOe6XzVfU=;
        b=esXWnDauprYjNws6dXYrdihqCCL6dMPH/33d4kzrQfKkcUyr5s4JqWEj3QOzc5ocaD
         GJqYmd3CDfUsmBNEUXSBHSvkLQMf7JZbG+N+Fy0xJrDkUCId1OUuznAZqBGqqLYRuXfs
         uteWfIAOUSrtkCxbDHs/b9OVqP03oxs8+syV2F9FhvAL2TjX39wcAu1e9vr39xSBqCyY
         bAYztNmPq5eE0mohuvYpuvHszBc5VQEdrKIz1NPSiQIjduHcWL75ZiFGN9im5OFBYzoc
         kODUzKpeDR1XPiX0vqFjolak2ZVz/eT8NHapSR2219PnG7GaLj7C/msgAP5wsQexJO8C
         pI3A==
X-Gm-Message-State: ACgBeo3dR9t60d7/P3nWpurSY9w+71K6B0Xt7NcC0Pto+t2HjjDvbtv0
	IUotJUME9pjbb2FOYY8+iBaos4U5tpQOcGzZHHw=
X-Google-Smtp-Source: AA6agR6x0aJapVWHTSUcy9KCD+JVq6gqRyP8iRgPybJCOX2vqDnifbhfOScFPu0XB8NRUFez9maUVkidASzMhfpRMuY=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:8d7b:b933:5438:2a88])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:72a:b0:694:d1a9:612f with
 SMTP id l10-20020a056902072a00b00694d1a9612fmr877316ybt.505.1661537448129;
 Fri, 26 Aug 2022 11:10:48 -0700 (PDT)
Date: Fri, 26 Aug 2022 11:10:32 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661537434; l=1299;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=vbnUKTrzZYx5zvY9/fWp8T7D0Mw2VG0BTmrBgetfzUY=;
 b=DA2AX+YJeEATy8NJW5byVKUVKyvrA31rEO6Ns1T+FOWnbSxMkE39xP8vPKtZdtI3+wcK3MsBwnbB
 cSgZdC9sAVMAK4LQTe3IJFsjyyZ2arpya/gc5nDmbGwOqKck96SG
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220826181035.859042-1-ndesaulniers@google.com>
Subject: [PATCH 0/3] fix debug info for asm and DEBUG_INFO_SPLIT
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, 
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, Fangrui Song <maskray@google.com>, 
	Alexey Alexandrov <aalexand@google.com>, Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Alexey reported that the fraction of unknown filename instances in
kallsyms grew from ~0.3% to ~10% recently; Bill and Greg tracked it down
to assembler defined symbols, which regressed as a result of:

commit b8a9092330da ("Kbuild: do not emit debug info for assembly with LLVM_IAS=1")

In that commit, I allude to restoring debug info for assembler defined
symbols in a follow up patch, but it seems I forgot to do so in

commit a66049e2cf0e ("Kbuild: make DWARF version a choice")

Do so requires a fixup for as-option, which seems to be failing when
used in scripts/Makefile.debug.

Also includes a fix for DEBUG_INFO_SPLIT while I'm here.  Dmitrii
reports that this has been broken since gcc-11+ & clang-12+. I'm
guessing no one uses this .config option...since no one else has
reported it being broken yet...

Nick Desaulniers (3):
  Makefile.compiler: s/KBUILD_CFLAGS/KBUILD_AFLAGS/ for as-option
  Makefile.debug: re-enable debug info for .S files
  Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT

 arch/x86/boot/compressed/Makefile |  5 +++--
 scripts/Makefile.compiler         |  6 +++---
 scripts/Makefile.debug            | 26 +++++++++++++++++++-------
 3 files changed, 25 insertions(+), 12 deletions(-)

-- 
2.37.2.672.g94769d06f0-goog

