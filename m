Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92112F85B
	for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 22:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763247379; cv=none; b=QtgHoaItxcS1QErl5r7qSTqlfUmzn2ccwBIIeMO9mjaJU6HkXIflP7lHzVUfnyKa4miHOznBYvbk+AhXv18ywTTbL6M/3q11jWJUIsrkI5itXAD31mqZiq0jqei0RME+D5KlY6RtstUSNtW0iXW7HVUZ29nNyRY3Swxv2atWkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763247379; c=relaxed/simple;
	bh=ZhDzn/ld47q1+0vFmkFchwNH42k0db3ClRj5pV+jfV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CsjPudp7N4vF7Rw5gvM3gnViGH8iSlKiKbtJzOH00lLldAvVt6YWMa4EsdYWtULvwbWK1I+Gw4Z3zEzZEkRP+f6AU4Ce7WgGYWKO20rOI0zwkyzKPA2zffEqnUch68KUyYoeJlC0bqOqnQ3zIhaAHxIsyJn1TuX0oWW8X4llqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AWcbnFlw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AWcbnFlw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4711810948aso21645155e9.2
        for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 14:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763247375; x=1763852175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3rirvFwtgiK9myBJO3SkNaL50zpazm5MLi6a9zIWYCw=;
        b=AWcbnFlwS3fUy3xVXE836uZyQeeu85fZAC1Un00RZ8dtk/VjZ4uWnrbVG8CpiAV1Hb
         mulblyGYoh4ciMYowBneqeDZhD9D53iNK5Ot+we2oX2XmJg8bRUac7erf7RL8Z1kMuvp
         xVO1t4Uq/F6/T311klD6O9j4MFavCoQ/DWSxg7FJ+dkMjyql8Xqjv+MWJB6oz1K9FSaL
         iOPyvI/JkfGa0bS0uyJVAb7dYQI2QXvNusoj2u68wCRPQ13SzDSmbbS3U9VPFYMu554C
         6fspZ7BocBD0N4NBxgqH4CfJg1W3i8MBvBVCJ6U4s60V+vHXcfKD3U3VOCFNDci99aks
         XEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763247375; x=1763852175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rirvFwtgiK9myBJO3SkNaL50zpazm5MLi6a9zIWYCw=;
        b=ue4ZnqmqTX0xtE7Cgx+oykH8Nt6/Zcf6hgakbgcCmqK4rDgaxqs52UP9Jxr3+0/I3K
         yb4Ewxf2zCHeKH54J3YnltH3+jydUjE+Kb7ata+SYraeIvA4ct5l070vz+si6/+2MOnu
         u+EeqXA8Gyds8Mbv4a4mlTtoNQaSEvZD/X/GWXKEPDwNjMOU8CJyas27IRGvInkz5BZp
         PxZyeBEAIYTntcrYlxra0dIdzsEoOZ+iT1Z97TiG6Q4czz/IlF6VLUv4fdHd4NgELFj+
         bFbDtyea8LP21EtcYQq+omJ46afjFAhnqf05rtaRjoY0ZDTLBgV2OXbTEQ7avGORZLoq
         EJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+cqTKWhKO2IIPXdj279G+EhFAV1iLorjm0eJt9sXFabICM1wZhTXjvVk1KwZDWsT19SJW@lists.linux.dev
X-Gm-Message-State: AOJu0YzltjQkZo1qN6m0ww+KTv3Ha6F2Ra87d/65xOTsoh+eJ6ytkwhB
	81Mx3ljANTDTh7NoyDrRDyvHY09cWxOj0AmD+JA9E3kOq6to3Detk2XeMB85h9TnMco=
X-Gm-Gg: ASbGncvALMkAEir+5fazzLqme+4r1P7wIjiaiMvxwNYxcQrD1FdQtEvaTgr/Zg558OB
	0CwZeQpMsPCYpWXG4eVVj0Sq1ugEATXIzk2FmUS1cqL4w0FnNJEpTJ+7ePwSV0cLOXnkslq75FD
	SIoO1PV3LUJxzHBIcD4olJLf+ZGWdiS6T56yG528kGIWrqBx3Flhke7uZo70tHvED8zjg7TMFtk
	33pCzGxz6w04IKQqpVHiRZn4F0mkdBm1K28Y9K2aF+W1v1lkiCS1lwyeJMA5Dio9k53UH7M+6D5
	mmCIt/SGaNWeGfmnbu7pzrp4S64IO5fpFF1ldLF/cL6XzcPXIS3Og4xZ5oQ1zQxiwNv7PaJU7YA
	wPr2hlIU4HDhMyoS41cX10fpO7PKvzbi4umUrr4W0pi/XLn8VG8Vhbho6QTxu19+EUJYJ8tQyzO
	HvfLY7SN/n+CyFNVn5Tf4Vze8Z5m+FoCUvokzwq7o=
X-Google-Smtp-Source: AGHT+IFhHfehJmL/emYJozkeYLpGysI2URRv7p229WqUqyuhzY90JVFZqHeviqUdYwHL55ENJIkf2w==
X-Received: by 2002:a05:600c:1382:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-4778fea3098mr56506515e9.25.1763247375256;
        Sat, 15 Nov 2025 14:56:15 -0800 (PST)
Received: from F15.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ba1462c605sm6641971b3a.21.2025.11.15.14.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 14:56:14 -0800 (PST)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org
Cc: Hoyeon Lee <hoyeon.lee@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [bpf-next v1 0/5] selftests/bpf: networking test cleanups and build fix
Date: Sun, 16 Nov 2025 07:55:35 +0900
Message-ID: <20251115225550.1086693-1-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors several networking-related BPF selftests and fixes
a toolchain propagation issue in runqslower.

The first four patches simplify networking selftests by removing custom
IPv4/IPv6 address wrappers, migrating to sockaddr_storage, dropping
duplicated TCP helpers, and replacing open-coded congestion-control
string checks with bpf_strncmp(). These changes reduce duplication and
improve consistency without altering test behavior.

The final patch fixes a build issue where the runqslower sub-make does
not inherit the LLVM toolchain selected for the main selftests build.
By forwarding CLANG and LLVM_STRIP, the intended toolchain will be used
for the nested build.

Hoyeon Lee (5):
  selftests/bpf: use sockaddr_storage instead of addr_port in
    cls_redirect test
  selftests/bpf: use sockaddr_storage instead of sa46 in
    select_reuseport test
  selftests/bpf: move common TCP helpers into bpf_tracing_net.h
  selftests/bpf: replace TCP CC string comparisons with bpf_strncmp
  selftests/bpf: propagate LLVM toolchain to runqslower build

 tools/testing/selftests/bpf/Makefile          |  1 +
 .../selftests/bpf/prog_tests/cls_redirect.c   | 95 ++++++-------------
 .../bpf/prog_tests/select_reuseport.c         | 67 ++++++-------
 .../selftests/bpf/progs/bpf_cc_cubic.c        |  9 --
 tools/testing/selftests/bpf/progs/bpf_cubic.c |  7 --
 tools/testing/selftests/bpf/progs/bpf_dctcp.c |  6 --
 .../selftests/bpf/progs/bpf_iter_setsockopt.c | 17 +---
 .../selftests/bpf/progs/bpf_tracing_net.h     | 11 +++
 .../selftests/bpf/progs/connect4_prog.c       | 21 ++--
 .../bpf/progs/tcp_ca_write_sk_pacing.c        |  2 -
 tools/testing/selftests/lib.mk                |  1 +
 11 files changed, 87 insertions(+), 150 deletions(-)

-- 
2.51.1

