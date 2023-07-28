Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CBC156D2
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 17:29:31 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7748ca56133so23305739f.0
        for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690565370; x=1691170170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRetka3XmHjrduRcLx8auHl/RYMdUC7YkqhFVrnaMJ4=;
        b=bP89L6dvIsj5o9kT4HZvJTW4rK3q1szR6j8h5AZVFErx80ziNL/0QSsSH0FzC5C7fE
         8wIjQLGud6CG1XEsMSUDxjnvq+IAFaBOVMbtwQGI+2u3qnecAY8kMMCWGvEgOhIRthZP
         NQVqr1kjTFzatLhzQDTlaAfpvh91DjUUQYdus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690565370; x=1691170170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRetka3XmHjrduRcLx8auHl/RYMdUC7YkqhFVrnaMJ4=;
        b=PMAWIo5DNVO3m3+hDDvkUruCNryzxijzuYRHiEbomOvpR7GXb50HruUxQhCvxRYuYf
         XLF9JIFSuMsLQjEn7xEJ0gPQtBMkIpw3tGgDjJPNNvBGP5PTZEgqjpClhNngCEsX6DG9
         r+oVi55DsWL38I2Ybv9amvnJVKFL/4soRv6FqbpqQSPRDH4Z6X7i5gAzEsJEn/Q7icg+
         ahqJIvH6LyFZt6uhPRXOOoaen5NnFAQ2T7GHgE6Mfj5f6Oc/IrtMVpbuxl3cdg7dXd5u
         7mSeGkplB0rwunjwC6EwLjdiOAYjqM8HCwgLByuHTgBNC9wPcsgY+0DgnEDsbOVtbY7x
         LquA==
X-Gm-Message-State: ABy/qLbMLUQOQtdVml4Fal35fEKY1im44oakkVqfonO1t7OV81z5/lRs
	fQJgVa50PF1G2kg8pjWMmBvOXQ==
X-Google-Smtp-Source: APBJJlG++dQGjr9Fm6NWZbXMUUHRFA6B5WaaKhVtSvn74pz3s9HPc7XbjI4la4/GVLUyqkW+AyakaQ==
X-Received: by 2002:a6b:c9d3:0:b0:788:2d78:813c with SMTP id z202-20020a6bc9d3000000b007882d78813cmr248459iof.0.1690565370474;
        Fri, 28 Jul 2023 10:29:30 -0700 (PDT)
Received: from shuah-tx13.internal ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id b2-20020a029a02000000b0042b37dda71asm1181050jal.136.2023.07.28.10.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 10:29:30 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
To: shuah@kernel.org,
	Liam.Howlett@oracle.com,
	anjali.k.kulkarni@oracle.com,
	naresh.kamboju@linaro.org,
	kuba@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	davem@davemloft.net,
	lkft-triage@lists.linaro.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH next 0/3] Connector/proc_filter test fixes 
Date: Fri, 28 Jul 2023 11:29:25 -0600
Message-Id: <cover.1690564372.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This 3 patch series consists of fixes to proc_filter test
found during linun-next testing.

The first patch fixes the LKFT reported compile error, second
one adds .gitignore and the third fixes error paths to skip
instead of fail (root check, and argument checks)

Shuah Khan (3):
  selftests:connector: Fix Makefile to include KHDR_INCLUDES
  selftests:connector: Add .gitignore and poupulate it with test
  selftests:connector: Add root check and fix arg error paths to skip

 tools/testing/selftests/connector/.gitignore    | 1 +
 tools/testing/selftests/connector/Makefile      | 2 +-
 tools/testing/selftests/connector/proc_filter.c | 9 +++++++--
 3 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/connector/.gitignore

-- 
2.39.2

