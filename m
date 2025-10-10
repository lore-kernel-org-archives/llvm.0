Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD2302170
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 21:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130108; cv=none; b=BZu3KFCD39f+uhwMBy8PDx6xHZntsIsVgCVILbNKCwFYJrzhW+Tg7qQQQM70Rjg9LM9TXA/GfHTa/EazdUHXS6zmCblvwt8E/d3yUsaNYiCvVcq0vDbOTilngrlBQoDK+FICHsLiggzCby6bi7JvfUoGFmt5EKflaUG2BzeMlFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130108; c=relaxed/simple;
	bh=1tNnIlZv+wCE3kcdtXTHXlfMZ0yGaIOe9oMVqOUMQOg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ypy6GVOUZ5rq1E8G6c3Z7feQWFvBsZSU5CQti12Ti+476rWG9YlWdfHx4xNI7l6aax6zyzSMtflzyhQizooRnPCNzpAR3FMI+FvreAGPZcrRBDBNWheuK4PR7/pvqUsdk7gcKE9O0oRW7gqwWC9rDtWRWfGgUTYV/TD2uK0R9w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Vt6EQcq; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Vt6EQcq"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3305c08d975so5557209a91.3
        for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 14:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760130106; x=1760734906; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXUz0ruU1YA2Qg4rcZrXatiuVPj0CSzoMucbvJcULP4=;
        b=2Vt6EQcqN2NAUkWC97B/8voNYf02uK1l4L7Oz5m2fcWCZb+arqcfnJ0S106CGL6o/7
         O8peo/WTdB2e1gXio0/DrHT0qoFbFX9nszl2l/bE0omkFHk8rsVVxlUqKjw/d2UDKTd+
         xymraV1JVNRwPjQa50etgyFp4OTs5tImN9tPEld7PcTnLqO3iQCcY595Wh5zsnF7EbSM
         NpKPpbVd+KX1HWvyYdwRFYCbhmyYUewXDEJrxF/5nrO6ycFwfF3gPw/LufHCXXKdcMVs
         kwTj1hZ5rtuy6nIaJeADXyeLJj0e03Y8nSyLMIRrqSePkcvGRSmJBpXvca0fLjnFiz0T
         OMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760130106; x=1760734906;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXUz0ruU1YA2Qg4rcZrXatiuVPj0CSzoMucbvJcULP4=;
        b=OqwcsoJ4FlUpqehb/3NiRpaWmBMAdbiXHrrXk53VjL6ZijKGy/2ioal5uc4ctEmRqf
         JYekiDb/1phm5sYDEC3rrcgW7bGUSuFbVjd0GCnOPJr/EgkT0M1/7zd3S1FEJleXsDQy
         F1lXTJ3HJZi2CMI6lYd/EUnwShLo0On/AVqQBTWYmCCUzHHpxLiI30I35B5peze7ZZ03
         ECgbTiu+DaRApxLUZ4vnmxbUrxNFSfO6U6wC72WOJTIUvmktdQMabocruQ+UkpHwu8f4
         fkA85bcfmBTI0t/1n92tO9DwmZDUsiaA3E4k+KjPFMrvNlzwYIjo7I+GsoUgm0VcqCNm
         Chuw==
X-Forwarded-Encrypted: i=1; AJvYcCWpCb63WFUCbHZf5cTxYSwoH2PIt7lNr6cpNbiwoS1TNHsk8P/bjuFJtPxn0YqU6kxqp205@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6jm2Nn1jAtmElnteOHFZ8VZX3fIG9CBeRw1LySjm5QZ81asLY
	1w11GKY80wVqWwFOhJ5Pwp0dNtQawNyNeofNCj30KYO8XLqvWXXrUWmzzADHdL+4BC4Pvg==
X-Google-Smtp-Source: AGHT+IEL18I3C/IsW+RSJN6mqkTxkt6ylMjhVG9XKQ6e/h83iNo20YGDVvCHYqnvKVi3lRioj4PMQpE=
X-Received: from plat12.prod.google.com ([2002:a17:902:e1cc:b0:267:fa7d:b637])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3148:b0:327:e59d:2cc2
 with SMTP id 98e67ed59e1d1-33b51148bcbmr17641763a91.10.1760130105796; Fri, 10
 Oct 2025 14:01:45 -0700 (PDT)
Date: Fri, 10 Oct 2025 21:01:33 +0000
In-Reply-To: <20251010210134.2066321-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010210134.2066321-1-xur@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010210134.2066321-3-xur@google.com>
Subject: [PATCH 3/4] kbuild: Remove MFS flags from Propeller profile generate builds
From: xur@google.com
To: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Yabin Cui <yabinc@google.com>, 
	Sriraman Tallam <tmsriram@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

Propeller profile generation requires Machine Function Splitter (MFS)
to be disabled.

Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.propeller | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
index fa018098506b8..8c3e514dbcc04 100644
--- a/scripts/Makefile.propeller
+++ b/scripts/Makefile.propeller
@@ -13,8 +13,14 @@ else
   else
     CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
   endif
+  # Disable Machine Function Splitter for Propeller.
+  # Propeller profile generation requires Machine Function Splitter to be disabled.
+  # We use -fno-split-machine-functions to override any prior AutoFDO/PGO flags
+  #(in Makefile.lib), assuming Propeller options are applied afterward.
+  CFLAGS_PROPELLER_CLANG += -fno-split-machine-functions
 endif
 
+
 # Propeller requires debug information to embed module names in the profiles.
 # If CONFIG_DEBUG_INFO is not enabled, set -gmlt option. Skip this for AutoFDO,
 # as the option should already be set.
@@ -33,6 +39,8 @@ ifdef CONFIG_LTO_CLANG_THIN
     else
        _ldflags_propeller += --lto-basic-block-sections=labels
     endif
+    # Again, we need to disable Machine Function Splitter.
+    LDFLAGS_vmlinux := $(filter-out -plugin-opt=-split-machine-functions, $(LDFLAGS_vmlinux))
   endif
 endif
 
-- 
2.51.0.740.g6adb054d12-goog

