Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E227B34A
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 19:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757706834; cv=none; b=SAAwHLQqQ5Ntq0NY8ZoOtNBJmSUapXkyHRl2enfZ6748H8yhcy07txJSHWeZUQ8pdDMSQsW7od/rHeWiR8f6ZDROOsFbc/tZpwiaubbZzct5SYyujcrGgD98Wi8x2T6GH9k4flTHMbsY8PHjrQkcShO/CRHmfmpFrWIHHulUHY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757706834; c=relaxed/simple;
	bh=fCUTGtNGsGZ5r8jfbbLtppKMsWLoWvtOButsYG55zPw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=csm7rxbSU2TCiTJBbYl+ZzUt5+eeqfHZhWdtPbtOmwXYDe1M9s9EdYI2lR0+zF7JBo82Gc80OEVYpgBompl3jDwEJMFb05OFeZyYSSS1QcimGjfXiUpCO48+5nt9nX0bfIqSiQe1cPPr0IOvJbb0Pd+OdsqjLlQyV3E79WcTk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtYavmS5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtYavmS5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so20910935e9.0
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 12:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757706830; x=1758311630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=im9Lq21+8J5Mf+5Q2uEKKjoiHcxVE9gd6Lc8gRvhOVI=;
        b=ZtYavmS50HXWNnhdTR7ZAjIrNU/MLjeOMq9Fikqaf4dhzp6+yI0BnkWuE2hQNAK79Q
         ocOTLvgQRZ79sAjris4H5B9b4tMG2ncS4kqnkKyKr2uhkiPetGoZPYBNLrydRM7SVTtJ
         PnNhXNN6fyvqFsGNzmre9Gon0U1TLt+IDuGjTg3KIIjSL4rZ8PHFsve5mOP4ihW1vB7g
         0amzHWPIi3aQ8FVntHKcVvnsG7fh6QO69n40SsGimD2yF9QILj5YIclasHcY9cBLZJTQ
         gKkuux9sAU3ofGPncgAR4FU93OHpV0UJf8zeFKdl03Jep/Ul/Df9F53NfWCKwS1RuOMe
         CJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757706830; x=1758311630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=im9Lq21+8J5Mf+5Q2uEKKjoiHcxVE9gd6Lc8gRvhOVI=;
        b=VhyHvqffZYrd21yUJtoSqWb7Dwel1KVxPLx/mIj4VPg7opJVERI+MBw1IcAitiEssj
         Jy5ex08bWh86b43HLy2vz+0e9HiT0yTPuAoqEvUP4C1jET+ahJo+Dd5VIj1pfQQqVeq6
         Q7/aMXU4L7LrHOwHgLBG6Vz89Fk+Zbwhru9m2D639/VXlivFDKBuCMbBi5ty0/XWQO7I
         JR68rzxrQs6Zzk6EapDROQoWETybeyXNj+q1/VJDKYdktfhYXtbqXFOU+H4CznqHcYtc
         ywUFYoogxC/dt6+XU7VoFuy4Nf+iiru6rSYY5zqranKcQ1i5Ll6JOsQkXqRvQIa6m5Vz
         u6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0udz5jugduYasbuoLLbBYJOoMDVAg7Rm8Xtgbcx9Ze7MbB7IMGVzzOQWJgn9A0SiIZ4ic@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8RNueRXz5DG2shMK9t3s3Cl2c+w9Vk0TTaGHMtSC0UETeizTG
	73UdlsNtL0aFOGvxRranSqZPemZlI4DK0YoAlHnye6M5t1s5O3Dp5aX2
X-Gm-Gg: ASbGncvIMwxg+kqOXQe5DYKdcW3OYsSxHFE/Fi3O40E05zVCp69Ie+MPe6JNW5PM8ke
	95YswkqWvdasaq0VWuimIfEgvAfACY8oZ/d7nUgZ4qY9lnzFfC9c2reaKpwhn2DPn/50RIQRIxA
	yxABP46StyaZT2DEBcHQy0SSKTpkvhIE0zVcwZUg6sZgQwSWYp7iteeaQL/xCjZniV2b+FbuMFs
	W45L9wEpXVW8cZACLH/ef0R4QYGkioCS4WPnOY9cma4RrkL0wbrfJmxhPwKZvZgoWXFzJhFpgHL
	/T1moUt3UUBSVk2weoKjSeMZCXf3MzL1lkUq80Sx4WHaUzddCV2jkJWqox+lDTQw9tULdkRfRG/
	wZKiToumyeyogV87SD6tASP/zejCVhbPQs/TE+O0VO6+noIKw7P3Dh5ZekzvIGA==
X-Google-Smtp-Source: AGHT+IG9aZcd6e5qxsZVmaWzgC1SbVThJULp4P95JK54XvdW/IaMNxg/kygFEwGzo4IyxjxCygpjwA==
X-Received: by 2002:a05:600c:898:b0:45f:21e6:3ef7 with SMTP id 5b1f17b1804b1-45f21e6403bmr28589515e9.17.1757706829510;
        Fri, 12 Sep 2025 12:53:49 -0700 (PDT)
Received: from yanesskka.. (node-188-187-35-212.domolink.tula.net. [212.35.187.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017bfd14sm74650375e9.21.2025.09.12.12.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 12:53:49 -0700 (PDT)
From: Yana Bashlykova <yana2bsh@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Yana Bashlykova <yana2bsh@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH 6.1 00/15] genetlink: Test Netlink subsystem of Linux v6.1
Date: Fri, 12 Sep 2025 22:53:23 +0300
Message-Id: <20250912195339.20635-1-yana2bsh@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds comprehensive testing infrastructure for Netlink
and Generic Netlink

The implementation includes both kernel module and userspace tests to
verify correct Generic Netlink and Netlink behaviors under
various conditions.

Yana Bashlykova (15):
  genetlink: add sysfs test module for Generic Netlink
  genetlink: add TEST_GENL family for netlink testing
  genetlink: add PARALLEL_GENL test family
  genetlink: add test case for duplicate genl family registration
  genetlink: add test case for family with invalid ops
  genetlink: add netlink notifier support
  genetlink: add THIRD_GENL family
  genetlink: verify unregister fails for non-registered family
  genetlink: add LARGE_GENL stress test family
  selftests: net: genetlink: add packet capture test infrastructure
  selftests: net: genetlink: add /proc/net/netlink test
  selftests: net: genetlink: add Generic Netlink controller tests
  selftests: net: genetlink: add large family ID resolution test
  selftests: net: genetlink: add Netlink and Generic Netlink test suite
  selftests: net: genetlink: fix expectation for large family resolution

 drivers/net/Kconfig                           |    2 +
 drivers/net/Makefile                          |    2 +
 drivers/net/genetlink/Kconfig                 |    8 +
 drivers/net/genetlink/Makefile                |    3 +
 .../net-pf-16-proto-16-family-PARALLEL_GENL.c | 1921 ++++++
 tools/testing/selftests/net/Makefile          |    6 +
 tools/testing/selftests/net/genetlink.c       | 5152 +++++++++++++++++
 7 files changed, 7094 insertions(+)
 create mode 100644 drivers/net/genetlink/Kconfig
 create mode 100644 drivers/net/genetlink/Makefile
 create mode 100644 drivers/net/genetlink/net-pf-16-proto-16-family-PARALLEL_GENL.c
 create mode 100644 tools/testing/selftests/net/genetlink.c

-- 
2.34.1

