Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12427A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:43 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id i17-20020a259d11000000b0064cd3084085so812036ybp.9
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=PfUOUCtWYZGmp8CXclCTWw0GE2v5WPFVxnxla7QB7vw=;
        b=nCubo4qm3EWLu8ph4cU0J48klMHpfNRcdDDHvRk87yHuzwBoIBJ/AU7Zj01a7RdZIF
         t6ik+RXGU61svm9iFsdm0UO6eotpCIPJMowDcoGi43HtZioBN2GSc7Bb/24mH+Y1XxI/
         H2UqwryguqTCBR6WTNv/1J0rrcU4SgUpj/DCVM+I43JCXI9PY0ZuqC6e3pyWT8kxLHXz
         aypLH1zJKclQCdpSo+hy/cCSzYH+emciZNSjzDJjmkCQGnRGZTqaCMDjwLCQp7F7hD8B
         lNK/pR0WZNB0QYRB2IObpdQwuIcXVOFy3fveUYDJmRy2HB/sObRtwd1nPyaJGlvjuvKx
         1jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=PfUOUCtWYZGmp8CXclCTWw0GE2v5WPFVxnxla7QB7vw=;
        b=Rgf3sbcaYph4O+S3oTresSTeT301OHg4NecVL97QZs2CidHJigGg+Kos+ldmsafHoT
         JTbtAA5ED0NxHXpNYBKPcehN1GoMyVtwQDgog1kP0vFkkCB+7oP9tFmirIt+yH+Iz2r0
         z8urYX5RqozXPnr45q+OASo9vm2fNzJhCuWh9YB3oLzVtCaROBymp8qwRz0syVq+PWgc
         rI3MQeyFBfIimQp6AqZy6W+TBXs9VGHqemmhQnQ+saX25d0F3z4+sFhYsKBiFxN8tT+r
         hGgT8OX2nYZPzEAOww5pz026kO7/WE94+OwupaKGzqZaMz6XAccojxWTcG3etC6QWIkr
         p60g==
X-Gm-Message-State: AOAM533YWX8ayO4Upj8QOyEfXyAPuqOn0YSbblXxj1DA11ZtX/Bu3UUj
	zkt7dUByoJnk6glfgQeL+JlUrdqGjTUCOmoy6rg=
X-Google-Smtp-Source: ABdhPJw+D7t6SSlbjDlENv5lafSoapQJ6Q274oZIPQGeVXoNM9Zg7HmZCxd74l5G/0JMvVqt1aRLChSV/AE8SNevvWU=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a25:8c03:0:b0:649:c7f8:1fc9 with SMTP
 id k3-20020a258c03000000b00649c7f81fc9mr6802241ybl.587.1652473363438; Fri, 13
 May 2022 13:22:43 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:56 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-19-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; h=from:subject;
 bh=1zGkTRBFsYQeOh1nY0Ftktys2F76fLo0aIs4c+r3/F0=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3lqAwmlxBUGYGrHtGRBycX29CVlKsWO3WkULXp
 4RXxZyyJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn695QAKCRBMtfaEi7xW7iRJC/
 40aO3dHx7HRqL5IBxJl4LEnss6Sben7NjXL1WF89h7qFltZ5dAJeU01SJQLXBbFrGMVwlJ6QXAdGEj
 635LhB+9rvz3J3LtnqvUssb7EF73SxuPBnb6OMm+qYoJRX6x4QzHFUBMSpT7nQgeSRXxgqGzkDSRup
 vh3xGCK6gB9qpNMP6tfQC0arD6MlBlA6GdKe9mp1HvtqGMQB7swpv2WD9cOCfE9KLcH0y91ynQ6g4U
 UZPiaQZWKDZYiQPJldKSe7moKZrikR0U0Qo5Q553qfQPjeadJ5XvtghpEAkLCafukyveKh4N09VV1w
 S5uP5cVYPc1iWKtXKqmCRwCpMMwF7IuEhjpg+hVIGDfAoBFfQZc7B4mxMlOChIzO8+9ddE4OTx6XxB
 YRAfx/UF3uy7/M0r/sDjqemuUQ62BUUmbl2fY3WLz7xKDa+6xiPI1E+yb9szaxBwq3DbFWH1ubyPnI
 mSllpHUKTR62DNzA8dewcd7rUu26o+Zb8p+isVc2xVeb0=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 18/21] x86/purgatory: Disable CFI
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

Disable CONFIG_CFI_CLANG for the stand-alone purgatory.ro.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 arch/x86/purgatory/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index ae53d54d7959..b3fa947fa38b 100644
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
2.36.0.550.gb090851708-goog

