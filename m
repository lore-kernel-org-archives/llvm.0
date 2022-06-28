Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6759257A
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 12:27:47 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id o16so17483087wra.4
        for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XecWFv8BJ9dhDMzcKO9+pHi/v+FsHPKm0rD5CDzqQsQ=;
        b=eMuLBRclklQv7ZkZS+mcJWeuRRJB/06DrG4Wg3av5N283Jo90OYG9na6pIn/03AaT/
         quKhbFdkQ4hyjqp+niUXRQ9NIjMSiARtjd8Ut2zrgIyNonrTOxLEefQfON2oGAcW2bp7
         wLzI/tvHzckJu9rhEfrz7lgzbnFKBStezvvjjxY9a5xeNawmKYdjRzsHCj9yz6QbJ3Nj
         bX113jv7AASShx8buwmnkS1KWmf9UXBdTHkHb/9t0irgwQ/MjMSwjxj+Bq6DUYgDZ1tH
         pRlSUC0aqZtMOtSAld8QJi13nB+CDs8aICnLr3Q/TiG1gGPgcmvnqj6fEe74ZNMRPzUX
         //Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XecWFv8BJ9dhDMzcKO9+pHi/v+FsHPKm0rD5CDzqQsQ=;
        b=Z9XYAPLyEoo4HSmCh+9mrOsQjBSaOA7FCuHXIO2NgO2t1s7XrStQPfdPrK5pvWXHGt
         wfkWmOi4mHt7Vo7fSW02xNOFX1VsuwKLiP5mfhoF93s74QjCaXp0rAmJlHV/30pRsnRR
         jXN59LgGWVkR733mVQaH6HwvHrSSXjGjOxEm6JQIxAvkdKglijD4eKI+Yze7FBYAN19R
         gVUA6iFSaJMHJAl4dxMYZWXgjj91R0RHwJeZ/osKS2InWolQAnP3W49/L3FRHCvGLS0r
         eK2pCPi0eorMZYdorV/ibJ2CRbySRwAGDW6t1PuBQZ4CH1HWF7E1AKk8SmPvMVDwRA6V
         ar+w==
X-Gm-Message-State: AJIora9vRdi5I61HamYkWYPTzi6K9PWKtfYB5YsKVLZF56EGM25APThJ
	JovtfHBu4AJ2V0X22P25n/TBUw==
X-Google-Smtp-Source: AGRyM1tOh42lNgvUY/nPjcoLX2cbYvrNKo9Ve5tYdeDFc+WBu+DfqAKkBLSxlBKNPZvL4BAQe9Z6Xw==
X-Received: by 2002:a05:6000:156e:b0:21d:2031:e8fb with SMTP id 14-20020a056000156e00b0021d2031e8fbmr2729134wrz.715.1656419265845;
        Tue, 28 Jun 2022 05:27:45 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0039746638d6esm17184212wmb.33.2022.06.28.05.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 05:27:44 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Enable clang tools for kernels build using gcc
Date: Tue, 28 Jun 2022 13:27:38 +0100
Message-Id: <20220628122741.93641-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set makes it possible to use clang based tools, such as
the clangd completion engine, regardless of our choice of compiler
for the actual kernel build.

Most of the fine details are included in the patch header for the
first patch (since we'd like them to appear in the kernel history so
they can help future archaeologists).

Daniel Thompson (2):
  clang-tools: Generate clang compatible output even with gcc builds
  Makefile: Enable clang-tidy and clang-analyzer for gcc builds

 Makefile                                    | 11 ++--
 scripts/clang-tools/gen_compile_commands.py | 71 ++++++++++++++++++++-
 2 files changed, 74 insertions(+), 8 deletions(-)


base-commit: a111daf0c53ae91e71fd2bfe7497862d14132e3e
--
2.35.1

