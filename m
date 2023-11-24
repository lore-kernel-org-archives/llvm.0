Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CAD2FE17
	for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="Sf8zUpPP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6cb9dd2ab56so1820821b3a.3
        for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1700840623; x=1701445423; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ccxLVdh5QHe0sHWS5YZYhy7xD8GTlMefO9eHp9CVDBo=;
        b=Sf8zUpPPS3Z7LJVmG2NuHYMdiEsI2jqwKyDXtTeYmE5r1Ux7GIG1Geopjto6/3F1rE
         GkU0C8K75P+u1hkX2U88YBTqZwyhQlCUXcKgPK54qOBPxfo6LKjf/s/52VW/gmhXD+h+
         bQQTmOvEmjT4GrzbPeB6ccWqZx6amDdd06PJ5deoUzAl0f3mNMFH0+28/GsO2VZIba3G
         LKZsalv4YoA/mPQ03t+LlfqNB59tn5xXH8le0fQXLWcXgM3eT7rBihlo5sJmQlSq5P6V
         2r8libu1faCvBRjBJzNvBOStxdj7geuJWTBpJHFwZ1+rnbPTbMHCBW1v9pyolI8wKLhx
         FumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700840623; x=1701445423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccxLVdh5QHe0sHWS5YZYhy7xD8GTlMefO9eHp9CVDBo=;
        b=TpSoqT+GeBQxxfJLihfKRkv/LjGfme3V1s+QtjPG8eIv/ozR2fa6w278UxUBNpuiXc
         xuFzq08HU8cYuVZw+wH1wRmXbUW5Lyw84rqmlc8Xj5mB9S+jxaizSAPO6r8o3CzE5Y4w
         Khc0w8bZt1z+Qfxp/4Bn6yWJg6lU24ysIgMxdSZEre+9JgiJ6Mo9Oz58pqKiRt7eTISZ
         pWUbZzTS05jaynYyApPNEGiY/oagCeC2pKEPoc51p/xZZHEtvfv8VEoq5NWLnoTkzQYZ
         jBRyWuCQ8MZbsCubiLjEEUhcfbHsnOp7IVs6xlRctEZWTcIyAvQ7ccT4HxoxKOxm2dwT
         4GGg==
X-Gm-Message-State: AOJu0YzVQntg9QlSGKkQCqSbHKHXukUmVev9dPzU9T/L6iGUQ5Gc3Khn
	1184O4heeIWTNUL3Kgkxwb2cvw==
X-Google-Smtp-Source: AGHT+IH+F0/Tog/V3FPqwi/5b1xKQK3dDLRA2Wcasoy71mHr8RXKzKbvMnbhRmUo3wvfIHhrPbPX7g==
X-Received: by 2002:a17:902:c945:b0:1cf:a2aa:2360 with SMTP id i5-20020a170902c94500b001cfa2aa2360mr2442643pla.28.1700840623514;
        Fri, 24 Nov 2023 07:43:43 -0800 (PST)
Received: from rogue-one.tail33bf8.ts.net ([201.17.86.134])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b001cf9eac2d3asm1919743pll.118.2023.11.24.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 07:43:43 -0800 (PST)
From: Pedro Tammela <pctammela@mojatatu.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	xiyou.wangcong@gmail.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	Pedro Tammela <pctammela@mojatatu.com>
Subject: [PATCH net-next 0/5] selftests: tc-testing: updates and cleanups for tdc
Date: Fri, 24 Nov 2023 12:42:43 -0300
Message-Id: <20231124154248.315470-1-pctammela@mojatatu.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address the recommendations from the previous series and cleanup some
leftovers.

Pedro Tammela (5):
  selftests: tc-testing: remove buildebpf plugin
  selftests: tc-testing: remove unnecessary time.sleep
  selftests: tc-testing: prefix iproute2 functions with "ipr2"
  selftests: tc-testing: cleanup on Ctrl-C
  selftests: tc-testing: remove unused import

 tools/testing/selftests/tc-testing/Makefile   |  29 +-------
 tools/testing/selftests/tc-testing/README     |   2 -
 .../testing/selftests/tc-testing/action-ebpf  | Bin 0 -> 856 bytes
 .../tc-testing/plugin-lib/buildebpfPlugin.py  |  67 ------------------
 .../tc-testing/plugin-lib/nsPlugin.py         |  20 +++---
 .../tc-testing/tc-tests/actions/bpf.json      |  14 ++--
 .../tc-testing/tc-tests/filters/bpf.json      |  10 ++-
 tools/testing/selftests/tc-testing/tdc.py     |  11 ++-
 tools/testing/selftests/tc-testing/tdc.sh     |   2 +-
 9 files changed, 25 insertions(+), 130 deletions(-)
 create mode 100644 tools/testing/selftests/tc-testing/action-ebpf
 delete mode 100644 tools/testing/selftests/tc-testing/plugin-lib/buildebpfPlugin.py

-- 
2.40.1

