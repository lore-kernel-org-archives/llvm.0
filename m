Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF387E0D
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 19:22:10 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so11815407pja.5
        for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Y1Vq3TVJb/VWSLfO0Rb19+4XJtG6XYStvEWudetclg0=;
        b=VfqVLJ45y647x0gXwo2gQ+z8ehdPiGmN765iLaQZImjK9/W6CfiT4udXBkZJQS5RWi
         5YUKsiZRaPGTmFqgMg0S6JrUAb3QT+mxnm8vI0rl1t7Uz1P0at2DCiu6MyDDIRqDVqp5
         mkNGp3A0YtuQgcMH37ZLEU/iA03FJATEvCmKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Y1Vq3TVJb/VWSLfO0Rb19+4XJtG6XYStvEWudetclg0=;
        b=zfbFTFQpO9L0NNyKYaPci3rAemyTKQaV+yudEIGdHWLWhNTIngXXFJO9Y1c4LOJVxE
         +DG9gTTMCcXaFehEHB9mV+Tz7lGzNOXjASoZzA6X4scU4Z2ynEEoIKHUk2J+9ouOwg3o
         CpAvB5PQFBpiOb8Jo6C6KJjZxUuyUezitmpxllISE2DoR3WkFbcv91QipKU59rQkpr2L
         3NrzwYMRAdJUDxoKM1CcH+yh2BT4yZQBrXbS/2x9Sk4TLmpMrgF0//p+X2X4tawePzdA
         GUZEyn6bFZSSlC6SQiSNYyX+9l04tYsXA05CbAo7gqrUjKbbbV3xl0Ukhj76O/LbUDlE
         xr+w==
X-Gm-Message-State: ACrzQf0mer2ZzJg3ge1ARqM/5aMpHr/Mx00e1XoJZq1/xbUJK5ONBqRt
	SqA5Ke45LET36bzKsoqiaJkQdA==
X-Google-Smtp-Source: AMsMyM7UlJUymG96TUt4dcAXXoMYIq3o2jMOjyUAGOo5qGscwQPpXzcr9kpEC2WhUoygo4z9X6EyFg==
X-Received: by 2002:a17:902:8307:b0:172:e611:491f with SMTP id bd7-20020a170902830700b00172e611491fmr1079757plb.111.1663701730500;
        Tue, 20 Sep 2022 12:22:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y23-20020aa79af7000000b00536aa488062sm249174pfp.163.2022.09.20.12.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 12:22:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Siddhesh Poyarekar <siddhesh@gotplt.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Tom Rix <trix@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/4] fortify: Use __builtin_dynamic_object_size() when available
Date: Tue, 20 Sep 2022 12:21:58 -0700
Message-Id: <20220920192202.190793-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=772; h=from:subject; bh=J1jKJHEXW6fuYZp0bwrwLqGsXtJ2fCfxnhbkDPep9j4=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjKhLY5BfaUkXVQJ7vCxL3yWuutd9/BjsHihL3Ygj4 bXMlY6aJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyoS2AAKCRCJcvTf3G3AJoxoEA CNWvotJduQ1+tj7cnZlwvQosnG4/aa+Tua7+dPMGebxam64/SsgNEoEDE+iYOFec1iIT+TWr8DmBMs EMbqXsh+5rZssPPBiIy/lKv6+nO58viHWBPTOrFOxjJezOdqzX5hdK95NTYC6eyawrsUC7KnHrfVyv 8uBqte82ZYL5hfRgO1u02u8C5Bf6vtyatkJ2a5nZLLcpnur5eQLS1TX6/TsVUqcbNF6RYURASxZYxq lNcTVV+DgbsaId76L8ljOwV7Dz08ykjlIWsJYinvKgJWtHh3Ya/FIg6Fg0wsSnoRpdKL2pEBS+mjw8 scvWa4vMb/CTqwBfYwJRi1l4lScrE/BeIUVBtCu+xcGpc+gp1l4FTKTxoTMk45DT0CXAWU9xxTqc6c gSsZV2A0ZaxVRmLjiXIVZBZyjq6GQ2v89cwHB25GBATaN7EksK82VcoD9hAPrZcOauqYKDNVOXZqcv PpO5iSx1rbRkKKc25kGoYIrCrM5qRXyBEQK/TJcmBLXtaqCGukGx0OBRVuBhi/+PKBc1unOPjp5s39 fBtan6hdZ+J2bxFNBlDxauaECtMUzhFuGY+UDK278LYJq5ucd/NRTst6+Tn32tg7T5c+nM37eKAa/C y46/iBV/2fCPGMCZHrv1f27M6fd0S4sj9JrAy2oCimhN5Gm+bmpFdDiS46lw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This adjusts CONFIG_FORTIFY_SOURCE's coverage to include greater runtime
size checking from GCC and Clang's __builtin_dynamic_object_size(), which
the compilers can track either via code flow or from __alloc_size() hints.

Thanks,

-Kees

Kees Cook (4):
  x86/entry: Work around Clang __bdos() bug
  fortify: Explicitly check bounds are compile-time constants
  fortify: Convert to struct vs member helpers
  fortify: Use __builtin_dynamic_object_size() when available

 arch/x86/xen/enlighten_pv.c         |   3 +-
 drivers/misc/lkdtm/heap.c           |   1 +
 include/linux/compiler_attributes.h |   5 ++
 include/linux/fortify-string.h      | 125 ++++++++++++++++------------
 4 files changed, 81 insertions(+), 53 deletions(-)

-- 
2.34.1

