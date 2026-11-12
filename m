Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794454850;
	b=SjE+wok/yhNaC/tnpb+qkVV3buRjnWSnUYq+1bObj0vv8YAHPZazIvfTGse/tE6jHgoT
	 iGt2OjIhibuWqkDmvHvUELiREZolODg258KNunXmuNzSfRIwtWwQ49SqrTLmMkZ9HemFa
	 teRn6fZ2No9JwsCgX37cbpnyjvLgcpBtDUgsPwojreU6FpkFzYHPzodf6qqlLu5is/oRd
	 2Uk+z2Qjox7HBycKve4nvWtzwKKSPodOUKEmnJ5Xk2uv3vcwDsmviyaobxn8HTQB3EAAA
	 CUttE5jgZ32BOXjUzTgPdfQ5Lz4WPcuTxxIYWFIdvYSil7+MD0O9jto+SNGNeNuEGHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454850;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CYgLt5XHcbwvgrzG4rC1YzZG9p9HiN2HotA+4b2pmb8=;
	b=uIDM3Ne14EtXTOFsg3sq4Rmp7Fvqgc3BtKzhcoLNKa+AJ4qNF6KCvc7prhic4y6GBUl5
	 VvDS16KGSNkGMAtHYx/zkKH/rQW6SoyWZVvOnkkptvKsBYc/8pphJvlKAhdMBen1NvCWM
	 X7tLJjL5Tpdy/OvvwUNdS3cEgyGFd5mln1pV6MPMAaZOrsQnte3E4wQNLfAfsEXsZlyAV
	 cVcKfQcnejYKjbN7aDVyqP11+govgX2PmLjz54GG43PHdS6h23imZ6RpsA4EfxOgWfU/t
	 5wxENuwppv33bkb5VfDiY1SS5lqjqs6MTkHEg5ZOYuz+WO5UMV8fwM2m3DlGvRJQReQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfatv2c3;
	arc=none smtp.remote-ip=91.218.175.140
Received: from mta0.migadu.com (out-140.mta0.migadu.com [91.218.175.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C8606A31C
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 03:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfatv2c3
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=CYgLt5XHcbwvgrzG4rC1YzZG9p9HiN2HotA+4b2pmb8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794454847; v=1; x=1795059647;
 b=jfatv2c3jjkn2TiEFGOjIYEUVVq2d6haF+MZemBeIGV3KavTtFBoqQGbcJ9KSvVtRMAtrEIj
 UgDarjr4U0K3Q2OdvKfkN9ajEJkRcojU3tgUyw07AkBiiSTSKmzy76HmkfbcVW6tpt3MnEN/hKW
 MYjazoEJ2Z2pfEALG5vjJFvc=
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c7b652940fdb96ba;
	Thu, 12 Nov 2026 03:40:47 +0000
X-Mizu-Trace-ID: c7b652940fdb96ba
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: kernel test robot <lkp@intel.com>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Qiliang Yuan <odys.yuan@gmail.com>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [linux-next:master 3495/6082] mm/shmem.c:1330:13: warning: stack frame size (1056) exceeds limit (1024) in 'shmem_undo_range'
Date: Wed, 11 Nov 2026 22:40:40 -0500
Message-ID: <20261112034040.2753887-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202611112032.TMyPU6Rm-lkp@intel.com>
References: <202611112032.TMyPU6Rm-lkp@intel.com>
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

Thanks for the report. Fixed by:
https://lore.kernel.org/r/20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev
