Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9001F4176
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778206299; cv=none; b=EFrfca8Et0hCAkjBmFFaBl/fZKZvbCyz40RcliZmWEfikGGTXDenJsBG5BPiL+ZBYX6dcSWP8FbuoudYQTGj556CJ0qdjzvnK2C0lU647ThyLAMUTLLeuYITW259TZ3ktqIIfueA20ONoBVIF6cY6ZdRE3tEmHFD3yZ+lUE2ogA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778206299; c=relaxed/simple;
	bh=zcuDlvfTQjwKaid2r4G4QhvfGnrUZyPpYyuO+iIQo/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tSDmyYt7Wcbedu3b1z6BIQn9Rm2BluBfSaKTHb1lSJXZJWdD7qLHVWGNihUcKCXXoNO5NsywF1QVtwC1+5ezgBD5MtcMC21ZwFEytfatR2GPQPSZpXKYN+UEYI/zGnRTEFKgb7FTlk8UQrsLtnyCXrW6CxzR0/r1L/tGTIDIUM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS6iMOFN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eS6iMOFN"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b4650d5f5cso5591425ad.0
        for <llvm@lists.linux.dev>; Thu, 07 May 2026 19:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778206298; x=1778811098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kjl5jAW0z3TEk+mYG+Ravixfsv3DlsZiiyMW4sxaDzQ=;
        b=eS6iMOFNurE26rU1ZgTV7tEfxKK5b/33F/KIkQebhKdO/bV2aDHyS2uIqkVaBVNJLI
         KoGI41BCJtJg3QJOf1fzdDuHyWs8A50ZIC7SVOTqpWIFlw8e6rYTAH26Fk69IlNQcJ8q
         GXbTwVVlcqvwEPikAAhJAkvc9cRDGDbZO1GUdq3FecWoWmiceTYqCiLx2ykljVT++4P9
         SkaJbnqeQSS3/dxvmABK8N5OmNzbnS862QFCI70RuLjJeOd3L3g1PcLl8fIaRH+gf7tj
         TgKz6SLuuYyrCpqa4SnTaLK5yfc9wyayKHy0QlEUsKyBGjnUqHBgxyGc/A6fm+7MHJQS
         L8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778206298; x=1778811098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kjl5jAW0z3TEk+mYG+Ravixfsv3DlsZiiyMW4sxaDzQ=;
        b=dkvl9LKNhVrPVWb8uKvVRnJsvVOmp1o6xrmPzFV2Zh7t6iMjhhiEsxjN4xDPzAJ6CC
         a+/d/8hzaoa1ZpG53OvxtxdkkQWVTDWSaYMlhotEBD6KTyOE1WtET/jWwVK2U0YsFrgA
         naRsd1rS6Hovg8cUAYfSd1BwOVHrJdMgXJ/uVXd/ljy0y+hqKbz6zm3N5VCTwK27gwNq
         csZTdXfWhzeiCkJJsmwpTjTH9a5QenFzTzoda9/jOsYDdsKydaZ0zdeyF0mNiQKX0xAw
         5Ozh0cuc+7CE4/rE10iVL+0bS20F80WenWZTHz123fPvPqrIOuk2ika+Nj9ELem/zre/
         +VwA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ihdl4sQ56Q3t+aQLQ/6MJeaNLtQGdVBKY5PjL+Kcoy1p+3s+u7tsQyZvQs/+YqTRCAsxY@lists.linux.dev
X-Gm-Message-State: AOJu0YyhgqmXErimYmGB7PrilTL+uLQ8/Hj54T5I5zzMLQ7vQPI5mLJw
	B+nImD8r4CZ3jb0ZuJAICS+irK7V5cnHv2+0tboIEnpBS9Be7Vdq9HMC
X-Gm-Gg: Acq92OGN2rtRxzYIcxlyV/UYaQB6y+RLHay8AbWWtd+yC/GI6xO11708w3OQnIMhC9E
	kiwEi8uPPTGsj3seyXJFkFjYXuNXeUNe+eNzZRcHG2Py3NYhHiKpoLF9cqQ8YrkkjgUUPenokA4
	2HBHWgYAlqGzYya89jhXEApogYrV9A4rRmcmtoYUw7o13S1UCIoVbpNl2qS4bqPjdLXv0dyTn+j
	YHzN+aApMzQKhKHKB6AtWrwskcDR70iqQXDjzZiFV+8+P82QQsIoUv9HOkNFTdmBE5K7pqIPIeD
	pgpgd6PxAyeIv23hvxilAj7UCzUsuwJoCI+em2N/UCE/wIO7ZgPO1aBjc4hiZUPbynuatAyfCLB
	2SMqjmINnijCCN9I8bHkuEuYpQ8FljLVD71GJjHBCKOLlmY0kWquRci66NsOxONhjQMFFzQFouE
	vFz9yj8L6iKA5Gi17lIm5GoSlWHs0GgLB8jdTdEV/dSYqxkb+b1+213S1FOt2RqZtxZWQvkB19y
	UDK8/aShdGajnhoLYG2b/wk4TnKq18RaNtFuuyGjFVIOA==
X-Received: by 2002:a17:903:46c6:b0:2ba:9e1c:7c93 with SMTP id d9443c01a7336-2ba9e1c7ddamr80600225ad.40.1778206297843;
        Thu, 07 May 2026 19:11:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d4094fsm2124135ad.19.2026.05.07.19.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:11:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: sparclinux@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] sparc: Export mcount for Clang-built modules
Date: Thu,  7 May 2026 19:11:19 -0700
Message-ID: <20260508021119.1635054-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang emits calls to mcount for -pg on sparc64, while the
existing ftrace support only exports the _mcount name. With
FUNCTION_TRACER enabled, modules can therefore keep relocations
against mcount and fail during modpost:

  ERROR: modpost: "mcount" [arch/sparc/kernel/chmc.ko] undefined!

_mcount and mcount are aliases in arch/sparc/lib/mcount.S. Export
the plain mcount alias as well so Clang-built modules can resolve
their profiling call target.

Assisted-by: Codex:GPT-5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/sparc/lib/mcount.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sparc/lib/mcount.S b/arch/sparc/lib/mcount.S
index f7f7910eb41e..0309ba2c4712 100644
--- a/arch/sparc/lib/mcount.S
+++ b/arch/sparc/lib/mcount.S
@@ -21,6 +21,7 @@
 	EXPORT_SYMBOL(_mcount)
 	.globl		mcount
 	.type		mcount,#function
+	EXPORT_SYMBOL(mcount)
 _mcount:
 mcount:
 #ifdef CONFIG_FUNCTION_TRACER
-- 
2.54.0

