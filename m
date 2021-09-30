Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264DA72
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:06:00 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id i83-20020a256d56000000b005b706d1417bso3306000ybc.6
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ED+/GzZlK6Ch13ba2R4bfh465Q8WBKVR8XLcZW0S8Fc=;
        b=a4wIEk16Yi3WBVYxNj/u51ELotSd+Td/UHu5Z2iCoJjh7G9jRGSdAmVPqtg7kE8Moe
         I4F+ko0NAisazC4HsQaML3NwV2zmrg9GU8RMTzl4nNV0YQZGmSlwHt67AOxxn0feNH3F
         nQZUM2xnZ/CZVNrQn9LgEvChc7hWBZ0Bu8GusDtqOg/P6nNDmjVzBfhQiA41rlfFFdt1
         uio94UCFZ4s7qAecfPVlGTyQcFmmy2BmWsE8b+uKB7X+mRvERwX512m9RWqmmcbA7p7m
         BtC11Cog4hGglHVBuwF6TI8qFMjDv0NG8yTE62Oqgj9Ec0mcPRwdgMiO3dqPzNKINnMk
         bwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ED+/GzZlK6Ch13ba2R4bfh465Q8WBKVR8XLcZW0S8Fc=;
        b=nUkze+Tnd7Fvl7YYFMQK2gE/yMGOSbCpgWmIXXOwA05k5cOfIws/TK9nJPC+moAkhl
         OSqrI+4wriX8vI6sd20YCyuJK8HQXBeEBHFEKOJLHtBX1xprYBmQo7iAd5QPIFqOOgcD
         guYsRfYrvKApOL8osd+Sp2zW/303bYBUOgm9tGV4dax5q6NTM4R2ALwxz3FXX1lbfwyv
         r0c5QRHnxU5MYak+lwjfsthnjmZ5RpFHM5Zd675OSCPIoGCcYFEkm+dVXTuozhXuC3Rk
         5CrUYzdMaaTMtt3bHgfEBpP24u8jxkRdBAWEQKr0pJHytlGnQ+cOZUbYU72ugCYgtVF5
         tGhA==
X-Gm-Message-State: AOAM533kDqic/hogFmJDBN5ylRG4hcdZAueiK1WszMBpPYopBW1N57/4
	LKe8Q0swsUYbvit+7EjmPXMHglwx31WDfUFOor8=
X-Google-Smtp-Source: ABdhPJyvNbwNfpOpt6OxAXYurh0/xz6gRjcukdf9v0nRCwRueYu27FjQKWVhrCW4pcvTUYbPjtDzmue7U+ITV+Khz+c=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:1106:: with SMTP id
 o6mr823986ybu.201.1633025159268; Thu, 30 Sep 2021 11:05:59 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:26 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-11-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 10/15] x86/purgatory: Disable CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Disable CONFIG_CFI_CLANG for the stand-alone purgatory.ro.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/purgatory/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index 95ea17a9d20c..911954fec31c 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -55,6 +55,10 @@ ifdef CONFIG_RETPOLINE
 PURGATORY_CFLAGS_REMOVE		+= $(RETPOLINE_CFLAGS)
 endif
 
+ifdef CONFIG_CFI_CLANG
+PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_CFI)
+endif
+
 CFLAGS_REMOVE_purgatory.o	+= $(PURGATORY_CFLAGS_REMOVE)
 CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS)
 
-- 
2.33.0.800.g4c38ced690-goog

