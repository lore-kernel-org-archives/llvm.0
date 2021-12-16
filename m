Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1305A173
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 16:50:47 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id z206so5087061wmc.1
        for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 08:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4o/bIaiCle/u0CRAKdnpmAIdr89DLFy6nwJYes7m+ik=;
        b=JGxpGKTDbceiFAUxrLE8YIUrdB+waqCx/4EZ4t1fpq5AOW4Fp75kUp6jh2axfDBiwk
         uqaNEPRin8DV4eZrreeGhBjOI0YPmwrvg66olmFaUo8hFA8fkNhkKf6lPs4utXm5RnMW
         QqrLJTuIoFG8nNi+jEWYY9WSxAADmeqtFaDCkISAWwCO/ziYf6bt921TzOBdkNMT530K
         OtX7osi+nqWaKwoPNJpDT6Vz7gypk7HqvBuTpnsU6DjYByogVmWy85D0BapUA2lsfiRd
         jQmHfni+8y2nbxs44zgf4voHAZvvXYgjhYyzqeYG2fooG6xTbuVOOHU4QFI1l3a1w9fD
         7xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4o/bIaiCle/u0CRAKdnpmAIdr89DLFy6nwJYes7m+ik=;
        b=45pqJbupqeaHc8Jh2UIEyTFfTE1dbskbMlsBTw1rxJZn1n5YEVTBO2wcT5AlRKtAqQ
         fpqz4JVXdmq5n89QHfwdZVvnAg7rDC8ewrtJqUhQ9VN5R40rx/H4qUWiAi2DkQuLEN3b
         9C5ZWNFYHRcK76j3mxkvxMLyP7oVtKdY4dEdyGrdhA74raDwZRwVCPa5n/ZGSFdbvS8g
         k8cJ+NvLOyh5d4iKXac/ONRZ57VDrlYmPXiejRa1gX8POAYjJz1s72YbJknt/rlNgCGJ
         QKq2VSmuALZQkh3/2pq9pedREkoKrARbP5zgjcQa4S8BK+xj4HCyZdVeE2g6ZCnW2OZK
         sPag==
X-Gm-Message-State: AOAM532syTJ1Ca9xByy4KJGDcJLGnUHo++YhbLuUfkKwJhZ4BAmoQqSw
	Akc25+Q3UZwTz3DngRM1wc36Yg==
X-Google-Smtp-Source: ABdhPJxQFiclxWcPcwPPjwLVhEvg8O/I45kjcBM1/PwOz5gz7U/LpnxEA2s0GJEECuQWjMwUcdnAfw==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr5808718wmi.113.1639673446336;
        Thu, 16 Dec 2021 08:50:46 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id y15sm7438906wry.72.2021.12.16.08.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:50:45 -0800 (PST)
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
	quentin@isovalent.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH bpf-next v2 0/6] tools/bpf: Enable cross-building with clang
Date: Thu, 16 Dec 2021 16:38:37 +0000
Message-Id: <20211216163842.829836-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since v1 [1], I added Quentin's acks and applied Andrii's suggestions:
* Pass CFLAGS to libbpf link in patch 3
* Substitute CLANG_CROSS_FLAGS whole in HOST_CFLAGS to avoid accidents,
  patch 4

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

[1] https://lore.kernel.org/bpf/20211122192019.1277299-1-jean-philippe@linaro.org/

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
2.34.1

