Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214AE6D19
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 17:59:26 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id k126-20020a253d84000000b0068bb342010dso4928734yba.1
        for <llvm@lists.linux.dev>; Thu, 01 Sep 2022 10:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=Eznf++i6Hiz/WgIi82JzYKRSk0zp5tPqXtS/6z0a6sk=;
        b=h9YGObLHX574s+ltrn3qvuINtF7Mwp9izXYVcU/MiCMtbC+bh3egxPZtvsTwVTeAgG
         6b6GeDMbE4/+glo+q8cl6aUxaA+++6QSpSkAdZMgFF6EIZpx1z5hW02V/L8/QIz3FpLO
         oqexKNlYmrdBv5ZelOAxDTWCzejmPXDdexwdovsenVp34C20CiuugavdpmX7tvxTJ1Om
         9G0v9guIwUOxCTW2b+k3/6QZxkIy9lyrDQpyqXxFpLCup5veGSRnxx+oqVUk4S6to6SR
         0se0Vmp+9gjWe0RXXJSRyDvTMdL3SlJW071KmqmdpuMRVqg5s10e1OA7yogkADN2GxN9
         4Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=Eznf++i6Hiz/WgIi82JzYKRSk0zp5tPqXtS/6z0a6sk=;
        b=EISgQmiO6JQfyXOZPWuaRf7O90S0rrJ7XHndnAJotgCvh4bdRTtYawtRJMy069Vpps
         cJQWgC3xoV5OA0nYa4CN5eGQPJuiAYjMxzv7EfEDa2v/8QBUn6hcc205huFUmdn96Msv
         a5dHBkJaKrYKhv3353h1KwzizqEjOZgP6qQNQ9DnSH6RWHCOcU2qEGlIm366VwpOyn3E
         NjP4dsuVKMH5EpwaEcBPaYxc963hnYdLEfY0/en/aNUH0QFxJlLqsQv9FNJ7yFDkarbt
         62jqABNey7GhYe5l9DP7RPFpD0bW5E9RPzMNaSyRDH+5aE5oe2c1cyVgrVfVHCJi8hOs
         HgOg==
X-Gm-Message-State: ACgBeo0eX4QUtELmYTFuYUBPO6JcSBUHD73BR8OPIZFvCXDf1pztE17J
	1QUwgCxSRwswtCIwc4xIOAsHeT3trl62Qg7VJlU=
X-Google-Smtp-Source: AA6agR6RJOq/gy/EH6yiM3DkBfPhDnWdLGHnc6wAPOgfY+13FEVuqxmoAP2HSwm1jTlTOzhNNaAj/fpOCZD6V1SfPis=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:99db:dcd4:6e34:2651])
 (user=ndesaulniers job=sendgmr) by 2002:a81:149:0:b0:33d:b55e:7e7a with SMTP
 id 70-20020a810149000000b0033db55e7e7amr24083872ywb.413.1662055165101; Thu,
 01 Sep 2022 10:59:25 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:59:13 -0700
In-Reply-To: <CAHk-=wiW_LjFRE9wFMj-j2gp9=u8jqrMVZtT3n4-oJWtQ6E0iQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAHk-=wiW_LjFRE9wFMj-j2gp9=u8jqrMVZtT3n4-oJWtQ6E0iQ@mail.gmail.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662055153; l=3012;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=9aydxQMib3Wu+j+JM/2pa56zYSBHnbBYkj5Ry7clV1E=;
 b=V5pYURGX/bQh0MwFkI4b7b7jGl3OPcO1iK4p/wUDPggm9TysXodSu4OtOQNYCGxI1z+nJKDhCRmX
 6yxh8RG3BC4kr39mCeEaGf9u65MRqo6o2+OYMNjIzi3V7kaX4jzw
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901175913.2183047-1-ndesaulniers@google.com>
Subject: [PATCH] Makefile.extrawarn: re-enable -Wformat for clang; take 2
From: Nick Desaulniers <ndesaulniers@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Joe Perches <joe@perches.com>, Nathan Chancellor <nathan@kernel.org>, 
	"Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <jstitt007@gmail.com>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"

-Wformat was recently re-enabled for builds with clang, then quickly
re-disabled, due to concerns stemming from the frequency of default
argument promotion related warning instances.

commit 258fafcd0683 ("Makefile.extrawarn: re-enable -Wformat for clang")
commit 21f9c8a13bb2 ("Revert "Makefile.extrawarn: re-enable -Wformat for clang"")

ISO WG14 has ratified N2562 to address default argument promotion
explicitly for printf, as part of the upcoming ISO C2X standard.

The behavior of clang was changed in clang-16 to not warn for the cited
cases in all language modes.

Add a version check, so that users of clang-16 now get the full effect
of -Wformat. For older clang versions, re-enable flags under the
-Wformat group that way users still get some useful checks related to
format strings, without noisy default argument promotion warnings. I
intentionally omitted -Wformat-y2k and -Wformat-security from being
re-enabled, which are also part of -Wformat in clang-16.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Link: https://github.com/llvm/llvm-project/issues/57102
Link: https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2562.pdf
Suggested-by: Justin Stitt <jstitt007@gmail.com>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Linus, I figured I'd send this to you to see whether you'd prefer to
apply it, or let it "ride the trains" up through the kbuild tree? I do
have another series I'm working on to improve the compiler version
checks
<https://lore.kernel.org/llvm/20220831184408.2778264-4-ndesaulniers@google.com/>
where I can/will improve the checks used here, but I'm also interested in
having something that might backport cleanly to stable.

 scripts/Makefile.extrawarn | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 0621c39a3955..6ae482158bc4 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -47,7 +47,19 @@ else
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-initializer-overrides
+# Clang before clang-16 would warn on default argument promotions.
+ifeq ($(shell [ $(CONFIG_CLANG_VERSION) -lt 160000 ] && echo y),y)
+# Disable -Wformat
 KBUILD_CFLAGS += -Wno-format
+# Then re-enable flags that were part of the -Wformat group that aren't
+# problematic.
+KBUILD_CFLAGS += -Wformat-extra-args -Wformat-invalid-specifier
+KBUILD_CFLAGS += -Wformat-zero-length -Wnonnull
+# Requires clang-12+.
+ifeq ($(shell [ $(CONFIG_CLANG_VERSION) -ge 120000 ] && echo y),y)
+KBUILD_CFLAGS += -Wformat-insufficient-args
+endif
+endif
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
 KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare

base-commit: 2880e1a175b9f31798f9d9482ee49187f61b5539
-- 
2.37.2.789.g6183377224-goog

