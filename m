Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A92C81
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 19:23:47 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n29so34606102wra.11
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 11:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f1TMbyXiJVA42KdLp4ZFbmRsgl75h8nNEAfazPDRdSo=;
        b=nhhon0a0iJU4XOZWM/q37EKtUelf0QHDpAhbCB8lcjLZtSMuKiebEWR1N0cjpvVzjX
         lq0i5CoypVZUW/BLxpVE48hfeBCo9N0n+7KW+COEAvCNxvOxqSWOZ7vWWHObiPst7cLH
         D0/n5PRLiJwzSfv0wO0reWHD8sK0eXeJgjyWDJD0E7fefYkhdLSLXzVi6W+wykwljJr6
         07HTE0zO95Z6mZ0Vh67X9/v4FTznzPfcV3R35jBwLM55DyGqHKOtHfTjadBp4tYhhEZ7
         GAT5m8WBfS7qh/RhDZ+P+1hVjOPhHCIkeOPAMZkC5fe3XAqmrGjm3/E+GMrS04s7hIcG
         pktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f1TMbyXiJVA42KdLp4ZFbmRsgl75h8nNEAfazPDRdSo=;
        b=DooWS7CNi/23sxqJpdi46sUjO7arXGfqcvWfk8e2Hb7KJcxmn6JobnjJUQ17N8aneJ
         vCcs6+ZXtjAcbkC/N0Ij7T1EyfRU7DW1rI5v9BaBaAkEEf41z5HasjRoffRos4RCqpKD
         kMYU8EFgLRew6F/rPnAAMDfiCfx06bGcnIhXvytqMLSD5a2Ik8XuYG3u9gFgpar329tY
         8Av4Mnbeq0HsJWGdRT+SzRjI2VTdLKGd1VcehfuYlTYtJSwjK4jMdHKI/J+0z/VchBXB
         snjsILzD8OQ2dV2eZUCENEUpY6KpE/3O0tWB4PeE8zLXVZlnPKEUPposLoYc1XiKFKRX
         ufFw==
X-Gm-Message-State: AOAM531rD4b7dzmnnvEj4rUS0AzioCQhZZpQhP1/cswOknPTIUBfa3dO
	b6TCQWo2cEQJnzn0/58+7q7cSA==
X-Google-Smtp-Source: ABdhPJwQ8aZvv1YZb9IPjYbrNXZtHXn9m9sywsW/sxTcxH21tqoOkAhPc9B+7Xb7xCMvKs9HpsrMmQ==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr41535510wrt.271.1637609025957;
        Mon, 22 Nov 2021 11:23:45 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id b188sm9916150wmd.45.2021.11.22.11.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 11:23:45 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	shuah@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: kafai@fb.com,
	songliubraving@fb.com,
	yhs@fb.com,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH bpf-next 0/6] tools/bpf: Enable cross-building with clang
Date: Mon, 22 Nov 2021 19:20:14 +0000
Message-Id: <20211122192019.1277299-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for cross-building BPF tools and selftests with clang, by
passing LLVM=1 or CC=clang to make, as well as CROSS_COMPILE. A single
clang toolchain can generate binaries for multiple architectures, so
instead of having prefixes such as aarch64-linux-gnu-gcc, clang uses the
-target parameter: `clang -target aarch64-linux-gnu'.

Patch 1 adds the parameter in Makefile.include so tools can easily
support this. Patch 2 prepares for the libbpf change from patch 3 (keep
building resolve_btfids's libbpf in the host arch, when cross-building
the kernel with clang). Patches 3-6 enable cross-building BPF tools with
clang.

Jean-Philippe Brucker (6):
  tools: Help cross-building with clang
  tools/resolve_btfids: Support cross-building the kernel with clang
  tools/libbpf: Enable cross-building with clang
  bpftool: Enable cross-building with clang
  tools/runqslower: Enable cross-building with clang
  selftests/bpf: Enable cross-building with clang

 tools/bpf/bpftool/Makefile           | 13 +++++++------
 tools/bpf/resolve_btfids/Makefile    |  1 +
 tools/bpf/runqslower/Makefile        |  4 ++--
 tools/lib/bpf/Makefile               |  3 ++-
 tools/scripts/Makefile.include       | 13 ++++++++++++-
 tools/testing/selftests/bpf/Makefile |  8 ++++----
 6 files changed, 28 insertions(+), 14 deletions(-)

-- 
2.33.1

