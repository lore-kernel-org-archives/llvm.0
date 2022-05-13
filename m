Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76657A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:04 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id t42-20020a25aaad000000b00649d5b19ee3so8223662ybi.4
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=7dzNFqFFreuuGTeKc8mtJ6zzQ7MnT/UZgCYnwegkikw=;
        b=n4tHKOJgDtPcp400cFfhloKlxJotstNLkDrF4z8JP1rzR6HPjAR9HOs6jJBLmYOB5l
         4+Y2KlsHR5sfl8hlG5Y2YO+uXY1XI0e2TXINNjhFpaz3QIuWawMkTRTCBrjaopQyaxLa
         cBhG2HDKSrXaUfoLLBgPjgOcp482uo/oyH92PRBXhbRR9yF3onu8TOJ/ZGaqiFzX2+MA
         ZJ5mlRUuYytvGHLeEX/wYO5xCTnb4kuxxKZm18if4rlYDNnia3kdXzS5XA/U0nmH95AC
         ve41FgmB9bTufogbJdpviDZ/EZU3vVH7ccMM08Dtf8J1ylIz0SSX0V+uQLGdW5GTIavt
         KFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=7dzNFqFFreuuGTeKc8mtJ6zzQ7MnT/UZgCYnwegkikw=;
        b=FXpspzO79tamkt4SLa5v64/XPxd/HNlRf/LRMBSpow2uxrZ2eymL12w8LJqgdj2qVh
         3Z/f1uCsUsL5r/UXI32R+sSgcvxn7p+3nvAvmqJi+s1/dA18wNZ4kgOSxnwqePupJtDX
         ZGLneq5n7NSwlruKYz+QSUzxpoI//xCWoIRWehrhsNSwfWBVQaJGGypvPOo+AP+ezrNO
         vD8yt+xaAJsWMw/bbNZKLF8mq2qq9e159DM9z1dxiUXFIVKtJDROOPrxupTNuXCmXd8p
         5MwpBNfqT8xrgkkVBnmexEwggTM8z9MMADwQ7WTyrr6JN7nAUoM6MwdUL0KEHel2ERnt
         BsgA==
X-Gm-Message-State: AOAM530zdF3jhqZFREmEPUp9IJl2krk81o9qzxqpzT3xKXwTbmkzFXls
	4L/2ZU19+m4Dmtm2Ca8y1oHmEPHAL4dUyR8qEj4=
X-Google-Smtp-Source: ABdhPJx1JJ0XmShhi74TIbh32BtvTGVhISwacttcRGpIVP/D3e+Li9khIRUZk3Job+crje8gCf5m3Gtudj8ga74RriM=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:704:b0:649:cadc:bcf0 with
 SMTP id k4-20020a056902070400b00649cadcbcf0mr6772144ybt.537.1652473323920;
 Fri, 13 May 2022 13:22:03 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:39 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-2-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; h=from:subject;
 bh=EZLomphfIH08U3z4yVCd/QNb6Zb3C1icGxpk/OdeOrs=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3ix9PIgN+KybiMjc7a7S4+3nkZ58mRwAo49nTd
 DGA2iOSJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn694gAKCRBMtfaEi7xW7vTLC/
 9hgHRRO5928cbJy0Lj4dyh/HzCmTIsX5aRyNv3FaExai4tXtGIkEc9t07OQsdSHwe+vOQ4GaN0K0Yo
 Ez6WpASKIqAWw1CeqAT9mb8YffUPQZ15oosx922RKgOBLn7W0GuI+uzyNSW4zK4l0XtGaSzZaCx+bO
 VwwGaaThKY0gplbHU9YXLsLgqQFHuUD4yvfaAmhmWNeltzIlMqEj5P7eTYsqRATnkmvNGQL5jBJkGw
 8MYNAlP6T/iaCDs7BeP0sPlgm3fIItcqzRKbtCg8953xYBCXp7UcapXhQYFZ+1fZ6g0txkD3HYt7bv
 /gdeVagNoIHK12tbnXliT67mMG/k2TufwaqBB4HbMNE6B51ElwuEdXvLY/cQftfGrkMKDn3/0c4UPI
 D5vLLZP1Z9I1is5YqP9C/K2jOqD2gPEXFjVPRK21z5UWzZe53fEZM39HScCeOsPT5AHuN9wQXQhzzD
 LW8o4It0Oany72uLq2n4E1wVX7ylkcng+6S6YFDEngVsM=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 01/21] efi/libstub: Filter out CC_FLAGS_CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Explicitly filter out CC_FLAGS_CFI in preparation for the flags being
removed from CC_FLAGS_LTO.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 drivers/firmware/efi/libstub/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index d0537573501e..234fb2910622 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -39,6 +39,8 @@ KBUILD_CFLAGS			:= $(cflags-y) -Os -DDISABLE_BRANCH_PROFILING \
 
 # remove SCS flags from all objects in this directory
 KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
+# disable CFI
+KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_CFI), $(KBUILD_CFLAGS))
 # disable LTO
 KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 
-- 
2.36.0.550.gb090851708-goog

