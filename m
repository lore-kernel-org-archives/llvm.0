Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123914;
	b=0uTblMHofH+EIVLi19+yIIBREXbs9/G+JCoFOQ5nQZlE3CQCvqGf9Ydh4PSWQKBoFXp9
	 8TRJ3Oq7FUfc1+I74OeF6gVzhRcgiYWntaPfDYlQ5jOEmNfOwMQJzmPemD0I7etvFD00l
	 +2KfSTaPmJsHUeVIuWkD8KeNlZkEckZByQgSTFEnvWcHCxyjPz+IMiUYiUp6lFdn/D4X5
	 /mc70+hiQCGZWbmjoOXE3LI+3IuTGaIiI1pFkrUnFVPEDdc2SUWyhLgzxF7opt0soCfED
	 JAqrgJEDdNveUvRdnRbanB3bILlfpukiF2E1tfUbVAgg8hOb9TC79ye2QrZl8770zQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123914;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dQz21Aw4+aAA80ySXmQcgJRTmMnpZE5b7/pXJb+9Veo=;
	b=2GFzA0SutrkZjKL7Fnn872gfDZk32cMZ7zHUslVkGzbjf7BuUpaVWZMNXdMo+nqhkRZT
	 9de5WvoH5Ng2RU6boPx9MxWCyEOuqxqZ7hhH1SDGdGUhd7vzLJznzEzdZ1NMpVi4pAVIu
	 Mx84rLk5JHPUbb3uImkZQazmV+Tk5dX6/UQvk2RRA2szKtzz5yLactw8AbdCzkZCgurG1
	 AF28UC78RNuNBj56GANn9HKnfr8Yi/jTjrifkF/075kJ99kr5iHb5g8nteSRYz3rpx/hF
	 q4h+YuroKck+b2llCsVtcoibs76WAPKmKdBBCtZlwmaPlyc1o+7NhJ2lNLjj8rSSv8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eAxy9vGD;
	arc=none smtp.remote-ip=91.218.175.116
Received: from mta0.migadu.com (out-116.mta0.migadu.com [91.218.175.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50EF606A338
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 21:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50EF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eAxy9vGD
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=3JL7T3LbQWO+ElSkWVtEQZdOEEkcR0/m7CwfXfyLAvo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795123911; v=1; x=1795728711;
 b=eAxy9vGDabS7cR5Dv+e+Cm40CiOB/qDr1Xjs99phEVmzTLCNQEU/SgDkeQc9EWyJXgyw9BjX
 XCGxQOxZVSvvz2EMhmME+rm4RZ3UMPjWPV45yZVm/8NQsaDj8KW8B1BvwgHt5TYPCpEoeWJL4eQ
 ku5hUskJIy83Ba4N9dKlTuO0=
X-Envelope-To: llvm@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 8e9d3d94edded809;
	Thu, 19 Nov 2026 21:31:50 +0000
X-Mizu-Trace-ID: 8e9d3d94edded809
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	kees@kernel.org
Cc: hpa@zytor.com,
	gustavoars@kernel.org,
	ardb@kernel.org,
	hca@linux.ibm.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH 0/2] x86/kstack_erase: Faster stack poisoning, plus a startup build fix
Date: Thu, 19 Nov 2026 13:31:06 -0800
Message-ID: <20261119213147.1094488-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With KSTACK_ERASE, every return to user space poisons the part of the
task stack used since the previous return, one 8-byte store at a time.
On Meta hosts running many small VMs, that loop costs about 1.5% of
non-idle host kernel cycles. Most of it is on the way out of futex,
epoll, procfs and socket syscalls that go 1-2 KiB deep.

Patch 2 makes x86-64 use REP STOSQ for spans above 512 bytes, through
the arch hook that s390 already uses. Shorter spans keep the loop, and
the range and value written do not change.

Patch 1 is an independent build fix I found while testing patch 2 with a
small KSTACK_ERASE_TRACK_MIN_SIZE. The startup code still uses the
pre-rename DISABLE_STACKLEAK_PLUGIN, so with Clang, AMD memory
encryption and a tracking minimum below about 90 bytes, vmlinux fails
to link. It can be applied on its own.

Zen 5c KVM guest, one vCPU, before -> after:

  stackleak_erase() per return to user       71 ns -> 46 ns
  futex wake/wait ping-pong                  5-7% faster
  Unix socket sendmsg()/recvmsg() ping-pong  5-8% faster
  open+read+close of /proc/self/stat         6-8% faster
  getppid() (spans below 512 bytes)          within 2%
 
Usama Arif (2):
  x86/boot/startup: Disable kernel stack depth tracking
  x86/kstack_erase: Use REP STOSQ for large stack fills

 arch/x86/boot/startup/Makefile   |  2 +-
 arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.53.1-Meta

