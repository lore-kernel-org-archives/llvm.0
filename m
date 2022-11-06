Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4923A9
	for <llvm@lists.linux.dev>; Sun,  6 Nov 2022 09:51:24 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 64so8016994pgc.5
        for <llvm@lists.linux.dev>; Sun, 06 Nov 2022 01:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EV/3kxf+JYStgK+8mVTMI1s6/+ytl6YUPKqqhQP70b0=;
        b=a0Y5uLuqtiJAMKqE/NZ5uFs9XzJB4NAt2xmaqsK57kjOyJoOPZoNMAZ5NG7yCeA4xF
         jyAdIsEcwrwhJNZqPkVcR5x6K2AQQ7ax6oh0odY9H67C70hZ/drIUFG3qxCKMMOYQQNL
         tPOw0AH3OQJsU22eIynFO75b2QWfpotg/ZkuRUNa2i3O0zAiB11fHvyx44aL6t4SlWk8
         TfqVIHu7yKNcjSIFibHQ5Xy2TJNJXGcRGhmFw33gmtGjxRJkw7q9+tynK6KmA/K1Ai2j
         tkgTiGr6bf/HfIv+XvaF2B1S4IcNbl2faMnP10kVKWGJXTvYCX3k2NEoLgYHUmqCFVks
         hkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EV/3kxf+JYStgK+8mVTMI1s6/+ytl6YUPKqqhQP70b0=;
        b=JrslCjCCEtO1S29ThKrWxZm2FYvdKnJ2Yze5D9fTY+D19ZAUNxNQXqFCxfPzEQZowy
         2wlBrVqPYzSMnZL6EfZLNs22/IxBN10bewPud0ukGKgs8LlrPizUu5FlMANJ4KtBs6Eh
         LzpU9p1d2tpKX6ibChW0W7VeJogUjiSKLjAS9emHPfnl322jc5Vn++J3F8UP3i2XudZW
         ey1XzFLpPoeENNbkVBXiiR0c46fGHLSVozmDiFtsWXLtt9U5SX2OZ8WORDzcqRwmwACv
         VdaP58P64+avkZS/pU1ja6kFIfxS1Vw0YjQjUB586k35m2LfCR1jYzF65qOSBRo/YONC
         B6tg==
X-Gm-Message-State: ACrzQf3Pz06GjXkeEcBgy+fvnQBZl8JKdP7HXWGcR/h2i6PCN8NTM3DK
	A4BBhA+0Mn0EtXBdwBiy3yU=
X-Google-Smtp-Source: AMsMyM4giBWvuuh/UBWaftSlfsZqJJHC6BdhoGFblLVwMVYxEi0pCX4KR5+2uyXKyFloLWjNC07M3w==
X-Received: by 2002:a65:6bc7:0:b0:44a:dcee:18a5 with SMTP id e7-20020a656bc7000000b0044adcee18a5mr37749031pgw.413.1667728283714;
        Sun, 06 Nov 2022 01:51:23 -0800 (PST)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id b5-20020aa79505000000b0056bfd4a2702sm2368677pfp.45.2022.11.06.01.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:51:23 -0800 (PST)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	llvm@lists.linux.dev,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v1 0/2] x86/asm/bitops: optimize fls functions for constant expressions
Date: Sun,  6 Nov 2022 18:51:04 +0900
Message-Id: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.37.4
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compilers provide some builtin expression equivalent to the fls(),
__fls() and fls64() functions of the kernel.

The kernel's x86 implementation relies on assembly code. This assembly
code can not be folded when used with constant expressions.

This series replaces the kernel assembly by a builtin equivalent when
appropriate. It is a follow-up on this previous series:

  https://lore.kernel.org/all/20220907090935.919-1-mailhol.vincent@wanadoo.fr/

in which I promised to also modify the fls() functions.

Vincent Mailhol (2):
  x86/asm/bitops: Replace __fls() by its generic builtin implementation
  x86/asm/bitops: Use __builtin_clz*() to evaluate constant expressions

 arch/x86/include/asm/bitops.h | 71 ++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 30 deletions(-)

-- 
2.37.4

