Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DBE2C80
	for <llvm@lists.linux.dev>; Tue,  4 Jan 2022 10:56:42 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id j21so146768876edt.9
        for <llvm@lists.linux.dev>; Tue, 04 Jan 2022 02:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z5izaHa8Yu92LDDoFb1xPLy6Z706YGp0YBj7HbtCpUk=;
        b=BxgwrlZpM7nQianx7SwyYuhm23kC0LaKP/VWl+GvFpiW6hEJrjUMNqtliTZSuWU57q
         5b6TZGKb7h5hPOHzzGsueJLL2UwO0F/Z8GtVyrRWDn8vDIrrZESWOivnP5P3NF8Ro71g
         zRn8ET7LfKEDg6QlHj8VO67gjfkMzZXiFO7Dqrnk5M5AXZh/BLPIZSktLnFPHwGsKe2l
         NiMoozTplQtMrb+MvSwPxWLg0gUOggNyEMWh6UjQnDAdBvqbjIdUwmAEUTUrowXw5afk
         0NtH+sInSAnVM/VXzSg7HBMgeoAuHmaohNsCtjGo1CZd6wjHbCUyWMr3cGjCGDi+sIuz
         vsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=z5izaHa8Yu92LDDoFb1xPLy6Z706YGp0YBj7HbtCpUk=;
        b=i5mNjfTI42UXrFg4gwlkbHWZCVJ9i5/dBVIdxR/floKug+iby7BgvFLKUI1ofqmAJG
         ThdIkASbmaKWuJ3yzUh06jVmRVvipJUxBxMJ0tB1GF0aB6ZsvOKBSnqB3//xdJmdUdyB
         3DUHbcxSupK6gCGl5EyHNQhBvYIca0u79BYHl6GRgwNuXs+7Owz8cT7bs4FmV/wdkWVZ
         BYTDy/stVBpxtx9hqmHvnfW4iMQQg+0DpCGFjvEEVGrr67Aq2ecmknpnyDJ9/yEIG1P+
         jAnVuo2CikHwkjuLKaqXHW7wuiWnxDWTURPZpVgGF8L9Wq8CqEBnZ8r3iFjNA5OMiiQb
         buSw==
X-Gm-Message-State: AOAM53025/qCN0YqXkJClML3WpERhwrW5GzcKte2eQ1PWc9auYdkFrsX
	XCGrLv47k0EgnNm2xdCEUdo=
X-Google-Smtp-Source: ABdhPJy8/Jr1RYDSn5PTcczK7FPK2eBXHF2KNo6Mn9CY46E6PfwlnHb/cHhlqNtMoDmofK5Tt8/G2g==
X-Received: by 2002:a17:906:888f:: with SMTP id ak15mr38530951ejc.0.1641293800985;
        Tue, 04 Jan 2022 02:56:40 -0800 (PST)
Received: from gmail.com (0526F11B.dsl.pool.telekom.hu. [5.38.241.27])
        by smtp.gmail.com with ESMTPSA id lv23sm11292605ejb.125.2022.01.04.02.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 02:56:40 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Tue, 4 Jan 2022 11:56:38 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Al Viro <viro@zeniv.linux.org.uk>,
	llvm@lists.linux.dev
Subject: [DEBUG PATCH] DO NOT MERGE: Enable SHADOW_CALL_STACK on GCC builds,
 for build testing
Message-ID: <YdQn5kTyXUJmdH9r@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdQlwnDs2N9a5Reh@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> > 2. Error with CONFIG_SHADOW_CALL_STACK
> 
> So this feature depends on Clang:
> 
>  # Supported by clang >= 7.0
>  config CC_HAVE_SHADOW_CALL_STACK
>          def_bool $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18)
> 
> No way to activate it under my GCC cross-build toolchain, right?
> 
> But ... I hacked the build mode on with GCC using this patch:
> 
> From: Ingo Molnar <mingo@kernel.org>
> Date: Tue, 4 Jan 2022 11:26:09 +0100
> Subject: [PATCH] DO NOT MERGE: Enable SHADOW_CALL_STACK on GCC builds, for build testing
> 
> NOT-Signed-off-by: Ingo Molnar <mingo@kernel.org>

Ok, I've attached patch again instead embedding it in the middle of a long 
discussion, for future reference.

Thanks,

	Ingo

=====================>
From: Ingo Molnar <mingo@kernel.org>
Date: Tue, 4 Jan 2022 11:26:09 +0100
Subject: [PATCH] DO NOT MERGE: Enable SHADOW_CALL_STACK on GCC builds, for build testing

NOT-Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 Makefile           | 2 +-
 arch/Kconfig       | 2 +-
 arch/arm64/Kconfig | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 16d7f83ac368..bbab462e7509 100644
--- a/Makefile
+++ b/Makefile
@@ -888,7 +888,7 @@ LDFLAGS_vmlinux += --gc-sections
 endif
 
 ifdef CONFIG_SHADOW_CALL_STACK
-CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
+CC_FLAGS_SCS	:=
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
 export CC_FLAGS_SCS
 endif
diff --git a/arch/Kconfig b/arch/Kconfig
index 4e56f66fdbcf..2103d9da4fe1 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -605,7 +605,7 @@ config ARCH_SUPPORTS_SHADOW_CALL_STACK
 
 config SHADOW_CALL_STACK
 	bool "Clang Shadow Call Stack"
-	depends on CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK
+	depends on ARCH_SUPPORTS_SHADOW_CALL_STACK
 	depends on DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
 	help
 	  This option enables Clang's Shadow Call Stack, which uses a
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c4207cf9bb17..952f3e56e0a7 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1183,7 +1183,7 @@ config ARCH_HAS_FILTER_PGPROT
 
 # Supported by clang >= 7.0
 config CC_HAVE_SHADOW_CALL_STACK
-	def_bool $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18)
+	def_bool y
 
 config PARAVIRT
 	bool "Enable paravirtualization code"
