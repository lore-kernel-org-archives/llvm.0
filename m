Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474710;
	b=wBCSzgCjViepYnXvM0aIiFrQKmg8bdqEE0aU/oD6b7+v0EqsvzOtn7LPCTnLHPQB3Rjv
	 hKE62eI5X4cKExOrx1siRLrKyzNxJYu1cllHPEqxrAWNaKRpt5oNNLGLd3cM06py0D44W
	 lhZx0bYILBmjTLr0INMPoe7u+5yoohVnkFMzpdDKTFp0RQmwTIAcZfD0vW1MpLyOhpPh4
	 dibLtOx9ohNWYCjPZ/Y+gsreVV/HiMB2Ceq4lhNJZYUqTQuuTJtaNCvcbY9bTIIxo+18X
	 wwLZGy+SBCYtrXBKhdedVfWj2J2u1jHk2coguqDvBMC8JTGZmOcEXjxuPY+2w9TgPYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474710;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lqk/lzctgl2EnU9POHNhSvyxLWhw+3C4u7RGP3+BPUc=;
	b=X2mSUesrwvPWcccDqURfqnycCalHn8UNaFaZQxlqT8GMhfGPx0ZjLjPyZYpmyb5sGOav
	 BMXmX6BNbLmyiUX/sranxsIytjnanFVl3ODbc/dTqnMxZAUG1Xqj0ILJ0oXlovjGuxz+3
	 OGTaW0otQAU5eyGcAbgipQtJyFbKImQJs4WibciQjTJBR7vOjHcq73wRkWgPHfnzwMywG
	 F5Vqy0qkN5S43rFR0DTS7MSjZdBdfwX1buk99xksVVttCk4XDGemp1WId/mOoAfvn82ud
	 HMv/YcVOmVI8s5apY9o+dk6N0JHSeDtSsFTNfS5tdhIFxm/0YqQ/ITlEsXAOzMViKjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=O2KDHPXD;
	arc=none smtp.remote-ip=91.218.175.123
Received: from mta0.migadu.com (out-123.mta0.migadu.com [91.218.175.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB533606A327
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 09:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB533606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=O2KDHPXD
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=lqk/lzctgl2EnU9POHNhSvyxLWhw+3C4u7RGP3+BPUc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794474707; v=1; x=1795079507;
 b=O2KDHPXDKTXPdjQpssoT7uq3epoWF5BoE3Pm38apQQwc/1A3Cp/arx/yRF2LLYiwrgx2vGVj
 EtoFtHHrLdI3siPqe85N2NhIPuQyQfkIWQWw70qBcarXKlm9r9rhIMibH9cfLkxRfPkMfPYP1xi
 6Fdu7q2VvE91eHPtvRS5DjU4=
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7cfd7655f2e19544;
	Thu, 12 Nov 2026 09:11:47 +0000
X-Mizu-Trace-ID: 7cfd7655f2e19544
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jan Kara <jack@suse.cz>,
	Qiliang Yuan <odys.yuan@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mm/shmem: drop the second folio batch from shmem_undo_range()
Date: Thu, 12 Nov 2026 04:11:35 -0500
Message-ID: <20261112091135.4142199-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8fb62131-db10-491c-9839-a3835d7aaf32@kernel.org>
References: <20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev> <787a1ba3-df93-45f9-abe1-3fcdefbe41cc@linux.alibaba.com> <8fb62131-db10-491c-9839-a3835d7aaf32@kernel.org>
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

On Thu, Nov 12, 2026 at 09:33:00AM +0100, David Hildenbrand (Arm) wrote:
> On 11/12/26 09:05, Baolin Wang wrote:
>> I think you should send out a complete v2, and David could queue your new version.
>
> Yes please. I'll drop the old patch from core.git. Should be gone later today.

Thanks. This patch is superseded by v3, the complete patch rebuilt from
the v2 in shmem-7.5.misc with this fix folded in. It fixes the stack
frame warning reported at
https://lore.kernel.org/oe-kbuild-all/202611112032.TMyPU6Rm-lkp@intel.com/

v3: https://lore.kernel.org/r/20261112-bug-mm-shmem-undo-batch-v3-1-212db8c24058@linux.dev
