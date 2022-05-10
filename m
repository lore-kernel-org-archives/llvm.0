Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157328F2
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 14:26:24 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 15so14773930pgf.4
        for <llvm@lists.linux.dev>; Tue, 10 May 2022 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q/4OMoOisXN8wgorRRpJSfEX8ZMva/BqopRiI+UKWb0=;
        b=BlPulR8Fp/JTyA0pfCnpTqyw6Nu0O+9DBLCDHXHeZ8S+CH7g8744UkBQRVCIetJOK/
         IIAH24/fVld/Cs4G3GzQEUa57M75T5KOVuq+Vqadszmt3leFQ/K/jtZTvfh3xUWHpy5e
         8Neqw/wspJbx8pYPACTS5J/g3ir1tRKMlWncMuVsFKlFFzlX06pE7caJP3TbMJVNMLyI
         JFX5RrOcI/M710QVHbdjJj7lD8vw9nuF+mj5oKSPzx8C6Q5BNWeP6P3FKw9WMnxHU3iC
         0Ym/nc8MHBH/YAg3KywTYNHkvJDIp8V0py7u9AEa/ffKfe8uDpXrShPmF/Oxy6gysOQx
         eZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Q/4OMoOisXN8wgorRRpJSfEX8ZMva/BqopRiI+UKWb0=;
        b=KVHPtqA5YevgCTu4rq9KHWWN49LKXLUbv84hS4cNflmR3ZIHg0d7Q99UNe6kpL4ufR
         olxjq1OckFKCradT4ZT86ggay+ASbv25ALL9fdVrayyH0ePSA8Mealk4Uoi/85hToyLA
         j2j73IJzTM6ZseWP1vtV8YvdNnodCYpP0Pi4CaZH0aZ6sb6oLpX6fYxWyAyYaPGPphd/
         jA2jcjGxvMldrdaWN4VFBYhwnsVry/OmJDfFBlfergC2LCPyTY/2q9fT/uLHZNfLUG1n
         jDaUUFK6AcPySLh1Xoe0mNE0x6E95OOV7trI6ICHbBhfNpX89va7So/pzmgif/U/XSRm
         6Tbw==
X-Gm-Message-State: AOAM530jEnrnrD47VYTONhoOnI18S0GbdseKHwE+1lemtiiSTsXyEdUr
	kbH4RiFALhp0ur6qGrrZNfY=
X-Google-Smtp-Source: ABdhPJwuH24MXw1hiWrbBjUG2xMrHIhDrTGzUjtMX/hwxFUuztneBXjm7sUgNvPiq0WzvRTcg6fptw==
X-Received: by 2002:a05:6a00:198a:b0:50e:a2a:32e9 with SMTP id d10-20020a056a00198a00b0050e0a2a32e9mr20402461pfl.82.1652192783580;
        Tue, 10 May 2022 07:26:23 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709028eca00b0015ea8b4b8f3sm2057568plo.263.2022.05.10.07.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:26:23 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH 0/2] x86/asm/bitops: optimize ff{s,z} functions for constant expressions
Date: Tue, 10 May 2022 23:25:48 +0900
Message-Id: <20220510142550.1686866-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compilers provides some builtin expression equivalent to the
ffs(), __ffs() and ffz() function of the kernel. The kernel uses
optimized assembly which produces better code than the builtin
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

On a allyesconfig, before applying this series, I get:

| $ objdump -d vmlinux.o | grep bsf | wc -l
| 1081

After applying this series:

| $ objdump -d vmlinux.o | grep bsf | wc -l
| 792

So, roughly 26.7% of the call to either ffs() or __ffs() were using
constant expression and can be optimized (I did not produce the
figures for ffz()).

(tests done on linux v5.18-rc5 x86_64 using GCC 11.2.1)


Vincent Mailhol (2):
  x86/asm/bitops: ffs: use __builtin_ffs to evaluate constant
    expressions
  x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to evaluate constant
    expressions

 arch/x86/include/asm/bitops.h | 65 +++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 25 deletions(-)

-- 
2.35.1

