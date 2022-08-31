Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8967A320A
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 18:44:13 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id y81-20020a253254000000b0069339437485so2733421yby.5
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc;
        bh=HMnrAce4vWD3UCA7lMg2iTbiqidDXP3N3F6sBkVh6kA=;
        b=eptYYARpDhhvHfa2enq2HomA+8RjHyMXfGJJl4oe6djSqcQFOPAig8gbLpsABe8yXq
         OMj3SA6IAcf8NwGVsmCaYZoD+UeorfMMNsPm2D6WY/4GLSKJJIvKA1/FcLwWAm+V1Aio
         PEJXbg9147fZoOx7Pl6cvWv7DsSwszHIB7luuRgoBx9GbmFDZ2nhdumltWAXfzuACtRv
         M8mi+hGEjyYRJCvvK8V+6BJAqqBTxJU1N9PoDVo1lCiWf8AbFPD7CWy4za+a5EWn80u9
         1p7YbxOLD0Rpt0VDiFAHThf2RFnzotJYi8ki8bK57JW6p+3csDgYVZrQTTvszf0V7WU/
         Catw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc;
        bh=HMnrAce4vWD3UCA7lMg2iTbiqidDXP3N3F6sBkVh6kA=;
        b=OSkVvFDe545d2gh8DYLfETCsEilOUcs5ynngIUfIKGGWAiG7uuyre4mA3D0oGDcuWn
         5B2WIOfrrua+LDZAtNN5Pw2i6TrJgDM+JQatKGR5ZnBLak/4vWGCTThW3c/4+ChNoKqL
         wBRqEJaIdz5sdv/LigFSodyG6MO75otJXahROmEBGo1d6CrLMTfbIGtn9b0fLmVTIgyM
         di+/45rWThms/ZF0SryXUF568qMoYIAo2GTlE5Wh1lqSaz0bgZK5ZUkqC/5pP8zUMXW6
         ZLof6ICCvUuLYIt4/wDOL/A41JL36tAu9dVPiYoWy9ZgUir/g3cpw8pHh7PmgaVl0F5a
         8lTw==
X-Gm-Message-State: ACgBeo3MGvIfoqjwUvswduzUZY3sMY95rvBu4IKBolXF5yDmQSo+P3kY
	6IS+BtS//+kXQcDZgAfCy025dmgYR8y67XaohW0=
X-Google-Smtp-Source: AA6agR4HPXKyje7xDSih23ECowddXTnlM8omhB/HfshCPDzUrBPoRUAAnBwmr6M7l4LvcGfkA2OwfmoMhigVBQ0feKs=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:5f5d:95d5:9a3:d41])
 (user=ndesaulniers job=sendgmr) by 2002:a81:1243:0:b0:337:7a6e:9984 with SMTP
 id 64-20020a811243000000b003377a6e9984mr20145246yws.64.1661971452512; Wed, 31
 Aug 2022 11:44:12 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:44:03 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661971447; l=2027;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=MJ8zIIzbHDfP7Z3iWSiaUiv1c1n3/TDVg9Pl6Q1NkNc=;
 b=SLBxGFb8Uf8kJ3PXOwa6d70wUc9fm9s1Y8AVDT56OZAq30m5l4vm2Bm0fO5aCLmnwPjH1GzhwYdl
 mZtY1qPvB13iqhak8C0rk03P3rz7kYlC514lL/fGzXXEDli2SjpI
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220831184408.2778264-1-ndesaulniers@google.com>
Subject: [PATCH v2 0/5] fix debug info for asm and DEBUG_INFO_SPLIT
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

Changes from v1 -> v2:
* 5 patches now, rather than 3.
* Split change to arch/x86/boot/compressed/Makefile off of first patch,
  as per Masahiro.
* Introduce compiler specific macros, as per Bill, and eradicate
  cc-ifversion while I'm at it.
* Update commit message of final patch to refer to 866ced950bcd.

v1: https://lore.kernel.org/llvm/20220826181035.859042-1-ndesaulniers@google.com/


Nick Desaulniers (5):
  x86/boot/compressed: prefer cc-option for CFLAGS additions
  Makefile.compiler: Use KBUILD_AFLAGS for as-option
  Makefile.compiler: replace cc-ifversion with compiler-specific macros
  Makefile.debug: re-enable debug info for .S files
  Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT

 Documentation/kbuild/makefiles.rst          | 44 +++++++++++++++------
 Makefile                                    |  4 +-
 arch/x86/boot/compressed/Makefile           |  2 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile | 12 ++----
 scripts/Makefile.compiler                   | 21 +++++++---
 scripts/Makefile.debug                      | 26 ++++++++----
 6 files changed, 72 insertions(+), 37 deletions(-)

-- 
2.37.2.672.g94769d06f0-goog

