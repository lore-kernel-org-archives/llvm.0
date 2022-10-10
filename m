Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A85C6100
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 22:53:53 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 130-20020a251188000000b006be249d0a70so11871618ybr.2
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 15:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=35T83bsZ4xGPTaOlyecWSoUgFUedgbH6BlUxlOUBlR8=;
        b=oTutQm7Zb4sdm6oN3sN1aqtG9kDMiU7ItlRnISemwBS9t48mFyaPD6rfBkSxPsg5MP
         v+uAW4w+skMr8tqJESJ8HFSR8MfGgIPd8LFPNMJW8vWFnhx2Vu0AUiVJam3kOfWdAVdf
         QZpdTCS1rI1IY6gKaQlNlbqZzj4wDR8spjrOjq2YOuKCOdC2R4Ooaevctw5xKr+0kawn
         BRzg1g45r2R3f/XcFo/pc4gVT9clpnMN7wC7ahzTdEV2M6iYIevOesE7ZfULdGUg5UYX
         Tru+SL61avsmaetlHsZJTD8pk4dUTVGIvTSIggYlVaNqRlZ1oyCGMUmT0PLUkvZt2x0O
         Gx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35T83bsZ4xGPTaOlyecWSoUgFUedgbH6BlUxlOUBlR8=;
        b=ryyq9+bVF0Qh2zoG96/JTuwAO5miBHqmmhGmOXyPSXQ0W3v6fhAUhe0dyTnWKekK93
         ZodK27YqSDIYq1uyp9yyXZdwqtwlcloxIl6e8SPlHFMuBk1kXP6Llr/Uq+jbx6MiJglJ
         PVxpEf1rwiFiVT19o7fN4KBSVTV6DDeYbilmmIIYnBco15/3zHBUxnDWRablgtX3f922
         KglawF9c73upRYfRUtMQvUeUlItuXc8nR1MRpnVl1UOZNE7D3DmDHZr6Eu56d2TsuE2G
         zB/Jzhj/6jV7DSCMAY/X+ltEgqgp27/bFnY9tIv6Wxdwy7qQLVmd1b8dF/XAivkWrUGu
         PaKQ==
X-Gm-Message-State: ACrzQf3HgX01L/3p8UFVknbF4sGvlFQAD2ljLhz+0jo3yccsRPUcCjCD
	evcAkl8YrqjauTp7aSQd5nDctKRR2PI/Xi6n4eE=
X-Google-Smtp-Source: AMsMyM6q9jQ47MmC0Y/IsHY+Z0OQ3TlY1am07kfC8geRQ5Kno2DnoQbRAI62yZ3QiVelIrmwkSBy+pufO7a+InhVzBI=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:283b:bbf5:938:fb2d])
 (user=ndesaulniers job=sendgmr) by 2002:a25:9e83:0:b0:6be:ebbb:9d8b with SMTP
 id p3-20020a259e83000000b006beebbb9d8bmr20756154ybq.333.1665442431236; Mon,
 10 Oct 2022 15:53:51 -0700 (PDT)
Date: Mon, 10 Oct 2022 15:53:42 -0700
In-Reply-To: <CAKwvOdnQ-tWa0oY0CKAwJD5WQDgVBvxDtf6=E3hS8Ytz5J1OKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAKwvOdnQ-tWa0oY0CKAwJD5WQDgVBvxDtf6=E3hS8Ytz5J1OKg@mail.gmail.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665442422; l=2033;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=rZfNaR/aBwwpz1oPD+ZP2XMfcjdSORrzwrlR54g5esk=;
 b=+6wxScJxIKR3muVDZdynqydUM7ayvYaD10gSryPI/aKJaULM14Ikux1pjsPpQqfnmjRkAmi1dbwX
 zuTFcpdnC/vxxB97Gl2PE6kLYI17zVZxk/7LEp0vT7OK1OoWAzaP
X-Mailer: git-send-email 2.38.0.rc2.412.g84df46c1b4-goog
Message-ID: <20221010225342.3903590-1-ndesaulniers@google.com>
Subject: [PATCH] ARM: NWFPE: avoid compiler-generated __aeabi_uldivmod
From: Nick Desaulniers <ndesaulniers@google.com>
To: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Tom Rix <trix@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Craig Topper <craig.topper@sifive.com>, Philip Reames <listmail@philipreames.com>, jh@jhauser.us, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

clang-15's ability to elide loops completely became more aggressive when
it can deduce how a variable is being updated in a loop. Counting down
one variable by an increment of another can be replaced by a modulo
operation.

For 64b variables on 32b ARM EABI targets, this can result in the
compiler generating calls to __aeabi_uldivmod, which it does for a do
while loop in float64_rem().

For the kernel, we'd generally prefer that developers not open code 64b
division via binary / operators and instead use the more explicit
helpers from div64.h. On arm-linux-gnuabi targets, failure to do so can
result in linkage failures due to undefined references to
__aeabi_uldivmod().

While developers can avoid open coding divisions on 64b variables, the
compiler doesn't know that the Linux kernel has a partial implementation
of a compiler runtime (--rtlib) to enforce this convention.

It's also undecidable for the compiler whether the code in question
would be faster to execute the loop vs elide it and do the 64b division.

While I actively avoid using the internal -mllvm command line flags, I
think we get better code than using barrier() here, which will force
reloads+spills in the loop for all toolchains.

Link: https://github.com/ClangBuiltLinux/linux/issues/1666
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/nwfpe/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/nwfpe/Makefile b/arch/arm/nwfpe/Makefile
index 303400fa2cdf..2aec85ab1e8b 100644
--- a/arch/arm/nwfpe/Makefile
+++ b/arch/arm/nwfpe/Makefile
@@ -11,3 +11,9 @@ nwfpe-y				+= fpa11.o fpa11_cpdo.o fpa11_cpdt.o \
 				   entry.o
 
 nwfpe-$(CONFIG_FPE_NWFPE_XP)	+= extended_cpdo.o
+
+# Try really hard to avoid generating calls to __aeabi_uldivmod() from
+# float64_rem() due to loop elision.
+ifdef CONFIG_CC_IS_CLANG
+CFLAGS_softfloat.o	+= -mllvm -replexitval=never
+endif
-- 
2.38.0.rc2.412.g84df46c1b4-goog

