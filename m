Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77388160
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 00:04:10 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id n18so3359234plg.5
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 17:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Du8y+3TBg8I2NiIb6Nb+MDSCb6olYthJ0zX2ujarAf0=;
        b=SWpJF80SqudeT/4smk+lrQtIdS+dYPdT4M5XoiBfPN1fuiqTSctEgwZOD3qhYYv6pi
         WBx13fXeNgNuntUc9o4zJajW2+D0nibznXc28BkDyBmF4jfQHi4/MheBsVxjjSlrcrGI
         /cJcdw9BUdCEn2Qz43+1nJmN8fk7c18WXDFH0cAMIqKABJ2QAJdYS/xTmYtZBB/zC4uS
         vYrtclIKrCrXiggQ2TkHkAKy56xdda68/7A/Bi8E1NW8UbghA0MoyT+NH8yvhtohfAwc
         hfzrkykv77bdxRJG6osYdt5EuGhUNlOZnJbTLUGWI6VPZI01wUytdoOUPyG5GVQ88nH1
         cAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Du8y+3TBg8I2NiIb6Nb+MDSCb6olYthJ0zX2ujarAf0=;
        b=sA2TY8YksWMiiwfQWfZvZ8F7D39Ac7RGSvbYWxP9SwdX/lJGm8+sLDfLMMrWNhbCdv
         XQejQfTWVkEyTdvLDJsVLpEwR3pMBuxcTbGGU1TOLcLHaTpZP8z8G06z2yUf98ebyQI1
         tDmq+9YI5VMjOGOdwn4xRZuJXrCKpO8NMa55QXKS/E3esu83nUHXRCZ4HLZTAp4TKA1d
         +KgLQmjt2B8amTXvaoJXXySWHI53e501nTHpD9YV4ligDbYux1gnOa+Goupt0XCMZiZ5
         yIdU7w3KqRWUHLN2eQl6aC73vMNBpTbUtfdYxcdwA51o1wDA3AMiuv/1LO4CdNRcyrLn
         6JwQ==
X-Gm-Message-State: AOAM5336l7i4Jbl07bHUuj+EbWFI7wAwIMPvug9Ytmb6CyeNu6s93vq3
	53TQFmWoLpS16x62rCeKRrQ=
X-Google-Smtp-Source: ABdhPJztYrd322lEcizPl8SZyJK9pwQmXTrX5c830/IReHH6IUvKVZEKaYXL8VlZxw9QR/DZK29OnQ==
X-Received: by 2002:a17:90b:1e50:b0:1dc:dc64:da90 with SMTP id pi16-20020a17090b1e5000b001dcdc64da90mr7905954pjb.58.1652313849684;
        Wed, 11 May 2022 17:04:09 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b0015f300ed0b7sm2491462pld.76.2022.05.11.17.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 17:04:09 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	David Howells <dhowells@redhat.com>,
	Jan Beulich <JBeulich@suse.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v3 0/2] x86/asm/bitops: optimize ff{s,z} functions for constant expressions
Date: Thu, 12 May 2022 09:03:38 +0900
Message-Id: <20220512000340.1171988-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compilers provide some builtin expression equivalent to the ffs(),
__ffs() and ffz() function of the kernel. The kernel uses optimized
assembly which produces better code than the builtin
functions. However, such assembly code can not be optimized when used
on constant expression.

This series relies on __builtin_constant_p to select the optimal solution:

  * use kernel assembly for non constant expressions

  * use compiler's __builtin function for constant expressions.

I also think that the fls() and fls64() can be optimized in a similar
way, using __builtin_ctz() and __builtin_ctzll() but it is a bit less
trivial so I want to focus on this series first. If it get accepted, I
will then work on those two additionnal function.


** Statistics **

Patch 1/2 optimizes 26.7% of ffs() calls and patch 2/2 optimizes 27.9%
of __ffs() and ffz() calls (details of the calculation in each patch).


** Changelog **

v2 -> v3:

  * Redacted out the instructions after ret and before next function
    in the assembly output.

  * Added a note and a link to Nick's message on the constant
    propagation missed-optimization in clang:
    https://lore.kernel.org/all/CAKwvOdnH_gYv4qRN9pKY7jNTQK95xNeH1w1KZJJmvCkh8xJLBg@mail.gmail.com/

  * Fix copy/paste type in statistics of patch 1. Number of occurences
    before patches are 1081 and not 3607 (percentage reduction of
    26.7% remains correct)

  * Rename the functions as follow:
    - __varible_ffs() -> variable___ffs()
    - __variable_ffz() -> variable_ffz()

v1 -> v2:

  * Use the ORC unwinder for the produced assembly code in patch 1.

  * Rename the functions as follow:
     - __ffs_asm() -> variable_ffs()
     - __ffs_asm_not_zero() -> __variable_ffs()
     - ffz_asm() -> variable_ffs()

  * fit #define ffs(x) in a single line.

  * Correct the statistics for ffs() in patch 1 and add the statistics
    for __ffs() and ffz() in patch 2.

Vincent Mailhol (2):
  x86/asm/bitops: ffs: use __builtin_ffs to evaluate constant
    expressions
  x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to evaluate constant
    expressions

 arch/x86/include/asm/bitops.h | 64 +++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 26 deletions(-)

-- 
2.35.1

