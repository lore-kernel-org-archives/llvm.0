Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D07E
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 02:33:53 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id w4so2819682plp.1
        for <llvm@lists.linux.dev>; Thu, 24 Nov 2022 18:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3ynaYc2KmE6H+RiMyNuG83Uvj+d7vH3kcd1RvLrvVE=;
        b=LZiLMbqEfNJ/UzarkS4hWdRi0UqvtipwE5umrihLJEfEpmnFKvTVAYgUxJA+hvUeS6
         6u6yKHwyJ6YyWMx3g7qlA16mQZBfsdXpg7X3rVGNF0VznaxVAqPSlpuS6kb418uU4RkX
         lRljPR5TngzJSNcKG0A1th0a84WzhacZLpeoVgnavSOzIeQqi2Rg44ph548q37Dtmq8V
         ytASQ/GqA7qrvQvBJbpttjVd+usCCZ0Ge/b6wUqQyfPAW2KBWLR/fHCrzlGQBjsDW9ur
         iLZN0mIn7+10nkXCnVpoHAsoV5/kePSQio7vdM0bZNemBqC6Rk+IrvonaJITj7Px2rQP
         +Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3ynaYc2KmE6H+RiMyNuG83Uvj+d7vH3kcd1RvLrvVE=;
        b=mkxsCarXH5RdA71EdOKYLLNeSC146mMbwQ9c3PJGu/AZieOqyKu3eXpm5KS0zRSc0v
         VKlm8NpjhjfTxOkOYIPl+aM0WQ4hI8YGBpdzm0ZWml7wIYP01Lh0Lpd6h+yd0ha2UcLY
         s7kGYgxS08TVXbDs5h8TzqQGANG+HIWuZfP0g/dN8BsC1+pqwBYxF7h8tuGa5alnDu89
         yIKopvq51TjUY7uFVhQwGbeaqtP9jgxuX/M6jV7X/psq2jD7embGX6PQQ43fZ3yhWzUy
         F9QnEvFRH9M9jcVXl2APXVW1p3HElQhxgtEDAaKbEqd6KnLZQj5gRoLmPFHCip2HsvtA
         Bc+A==
X-Gm-Message-State: ANoB5pnENBG7+A+SBexWZbKt0HhstOJ2fKcgSAjUR3VHWTIuKbC9WKtY
	dSmAwtgFhxZNyYt06d1aXIQ=
X-Google-Smtp-Source: AA0mqf4X1W4dSDu2L4XQm+rbEdzMxOkbnq92dTwKQ1DynkEBADnVfjtyPvqp5RrjMFgAyyrI5Ec2HA==
X-Received: by 2002:a17:902:eb86:b0:188:c395:1748 with SMTP id q6-20020a170902eb8600b00188c3951748mr18390066plg.155.1669343633332;
        Thu, 24 Nov 2022 18:33:53 -0800 (PST)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id m127-20020a625885000000b0056bc5ad4862sm1893822pfb.28.2022.11.24.18.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 18:33:52 -0800 (PST)
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
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v2 0/2] x86/asm/bitops: optimize fls functions for constant expressions
Date: Fri, 25 Nov 2022 11:33:28 +0900
Message-Id: <20221125023330.195581-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
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

* Changelog *

v1 -> v2:

  * [patch 1/2] add Reviewed-by: Nick Desaulniers tag.

  * [patch 2/2] replace:
       BUILD_BUG_ON(sizeof(unsigned long long) != sizeof(x));
    by:
       BUILD_BUG_ON(!__same_type(x, unsigned long long));
    and slightly modify the commit description.

Vincent Mailhol (2):
  x86/asm/bitops: Replace __fls() by its generic builtin implementation
  x86/asm/bitops: Use __builtin_clz*() to evaluate constant expressions

 arch/x86/include/asm/bitops.h | 70 ++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 30 deletions(-)

-- 
2.37.4

