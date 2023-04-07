Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C704AFE7
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 21:54:14 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-54c08fa9387so71069717b3.10
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680904453; x=1683496453;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=60/gaWjqwxGxXAf1RFA4/q2SLdJZklouAa0oPsZCWds=;
        b=Qhw2EW+4aO8HOMqvj77ihzfS9g7ZnLOebOfTVGs6Bp9HHfKeM/qrmTLAdJ4l6ISnyn
         RxMjmlopmXxB72k1bOqeirBew5mWplug6Ewd97bK1c3CHX6xS57pmGQ+IXE9usrR4rqu
         CxicbSo6xuyGKKBUUpSlvjtrI4dqhONtSgvPMZBVKouvL/OLtM04DwPcvFAbakyMoCnH
         4nuyN5Mdb437ug/HXqRLDNACmbsJZBnLF42y8Ynk40Q36E/WunmTExf0Zt4zDPxozIlI
         1LO7SJm6yWEA+Nl785MDoP6Nu4ULYAKyV1tUp2ac/sm6ZgSxwOi0KJQ8kCFw6DAVvFDJ
         13rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904453; x=1683496453;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=60/gaWjqwxGxXAf1RFA4/q2SLdJZklouAa0oPsZCWds=;
        b=wmJYI0FVBsx62u0e1SggIU6xXe7NU2+vH0tn6+ru0yRYeJX9huKopOipWUeRB1DlTT
         Jd0mN0c4KTRvmxqchT2scjWRJN3wQn5fgqG9u+yeB/2pcyFPGIGFzBAMEMq7+WnHcZL/
         dnPdtyCGPTzlTnmIQo7dJVqa4+PQYNNmOw30cFxUfzV2qkmDBM72vXPmP9tu3eyUPn7P
         gwEf/7iMCpNTREy9+TPA+Ptdd92TAiB0mTGyjatoBdE13VgHKXAoXaPvllPADLfzpYzf
         E4XyQ3ZcenueTKpzqgIZptPcSzV6SF4M5/fClvDKGqh4YrcJIIdzZZBu/+ULexnWOqk8
         pEDw==
X-Gm-Message-State: AAQBX9cT2MI78mV0+QAOk0YqhUhACbEejB7XM/Snb6FApzjNxMjqkmIY
	AMNaiYxJ/3v2/tXcK6/inJN1tXd9K21qorfNPeA=
X-Google-Smtp-Source: AKy350YZGLQttBsJBiSzvsH4GXxX/gr2XTEnt3Gm4td0CS9uL/uv9ncEDsszE1P48ehWX4928Not5n2uGYBZW+FTRjY=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:5eb4:e720:fec7:a2d3])
 (user=ndesaulniers job=sendgmr) by 2002:a25:be11:0:b0:b7d:4c96:de0 with SMTP
 id h17-20020a25be11000000b00b7d4c960de0mr228715ybk.5.1680904453185; Fri, 07
 Apr 2023 14:54:13 -0700 (PDT)
Date: Fri,  7 Apr 2023 14:54:06 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680904446; l=996;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=C5/yj3qDa9KhR4UNMrn1PEBO+c6lL+GF6BnPy8SNCPE=;
 b=pIUDMTLAc1jlTZb6Z0m7DMdK+Ax1Hgzz92XKoj37sCgoRZKH8ki7vbYVV0XRchPisfI/FnNeR2bn
 plcEouwqAu8IQbI4r2ZX1l3w0OCcB2wrdspMuUqOfJy5KMBscdN+
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <20230407215406.768464-1-ndesaulniers@google.com>
Subject: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
From: Nick Desaulniers <ndesaulniers@google.com>
To: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miroslav Benes <mbenes@suse.cz>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

-fsanitize-undefined-trap-on-error has been supported since GCC 5.1 and
Clang 3.2.  The minimum supported version of these according to
Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Drop
this cc-option check.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Masahiro, Kees: get_maintainer.pl leaves much to be desired for this
file. Can one of you please pick this up?

 lib/Kconfig.ubsan | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index fd15230a703b..0e7ad0782399 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -15,7 +15,6 @@ if UBSAN
 config UBSAN_TRAP
 	bool "On Sanitizer warnings, abort the running kernel code"
 	depends on !COMPILE_TEST
-	depends on $(cc-option, -fsanitize-undefined-trap-on-error)
 	help
 	  Building kernels with Sanitizer features enabled tends to grow
 	  the kernel size by around 5%, due to adding all the debugging
-- 
2.40.0.577.gac1e443424-goog

