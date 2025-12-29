Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D42245014
	for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 20:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767040133; cv=none; b=D7xKB9ioV9Z/DVElx6AUeUEemYjgQ5sV0w+ezINXpRg1rqY0kPE9GnaW4c5zg2hVPGTCHe2vrtuqKMvVacsLjJ4LxQugbVNB4mkf1tkj1UN9YDMNzyiM1rlCqKay2kGKXo1wwtR5kf7cMPIHILze9llQW07i/2hCWuyroXoDOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767040133; c=relaxed/simple;
	bh=8l70OTim6XjUp23ekQsAZ33A3YoAPuKldtj6TuiRU28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T3E7flK24olyOvYt7x50sQrsUoCOAHi+O3TvEooTtePx/xPMNzHMcpIPtd5L3Oa+w6gI88cnhjvtAO0Pxq7mS+6y7Gv2K9YY7wAUhDix0QS8M0qmeyG+SA74KtnccYzh6MzzttfbWuixSu3Mc7yJZ+HAuMsnRtgJ7RgivsjPEBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aaM+eKAG; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aaM+eKAG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767040128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=66RyJtvFY4/td0oW3dHBamAjsmRJXPQckDimQmVLu+A=;
	b=aaM+eKAGmaBXwvnMTxR319XP55l+85bqCxm0N9ztJ2Kvyjph/zlmMCdNJ7m8rxJhdGMfXw
	fjgXyo/Ny+ZWjVnlmCUnSWpy66D+8iuL/bkNk1syePirgnPbL8ScDrwab19VLl0reYIhvF
	A5La9N10X/2tapVPpLqNx1rUSvKMTAI=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next] scripts/gen-btf.sh: Fix .btf.o generation when compiling for RISCV
Date: Mon, 29 Dec 2025 12:28:23 -0800
Message-ID: <20251229202823.569619-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

gen-btf.sh emits a .btf.o file with BTF sections to be linked into
vmlinux in link-vmlinux.sh

This .btf.o file is created by compiling an emptystring with ${CC},
and then adding BTF sections into it with ${OBJCOPY}.

To ensure the .btf.o is linkable when cross-compiling with LLVM, we
have to also pass ${KBUILD_FLAGS}, which in particular control the
target word size.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512240559.2M06DSX7-lkp@intel.com/
Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 scripts/gen-btf.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gen-btf.sh b/scripts/gen-btf.sh
index 06c6d8becaa2..12244dbe097c 100755
--- a/scripts/gen-btf.sh
+++ b/scripts/gen-btf.sh
@@ -96,7 +96,7 @@ gen_btf_o()
 	# deletes all symbols including __start_BTF and __stop_BTF, which will
 	# be redefined in the linker script.
 	info OBJCOPY "${btf_data}"
-	echo "" | ${CC} ${CLANG_FLAGS} -c -x c -o ${btf_data} -
+	echo "" | ${CC} ${CLANG_FLAGS} ${KBUILD_CFLAGS} -c -x c -o ${btf_data} -
 	${OBJCOPY} --add-section .BTF=${ELF_FILE}.BTF \
 		--set-section-flags .BTF=alloc,readonly ${btf_data}
 	${OBJCOPY} --only-section=.BTF --strip-all ${btf_data}
-- 
2.52.0

