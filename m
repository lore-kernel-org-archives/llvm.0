Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F3448D1D;
	Sun, 18 Oct 2026 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309967; cv=none; b=MInDA5Sk68amc0RDEizBBeikW2S1qWf+Qbw+bv6komHV5sJQYqCK+nOhTEHfHHB55w6U4sCnEdYP3cgcyqss5BiuA8QYCC3QCBf326u0pKm0DoXA3vx10n5a7e+o7GRrIjjAnSbD8FYv59oP7ICl+UJb/OU8/nYfTuh4AzACQtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309967; c=relaxed/simple;
	bh=OKJgmjKos8BeQqOvQHHZfy/Qo2rKCnOBeIDaMRkegwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E4k/8FGGyPGC2yC6xczC2UA4kXk8fBef6BVH3DlxipzWNOhOQqSom44Z0Lv0G128XHqYs+5Eary6uP01fae4F033+3yWokaUUjSkcqedB6kcSajWO3Nir6esmrURmC5bhqwUyHo8/huqXpvLyHWvDrt8bQs6ivKfhf7g7zuctn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJRAJiMF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJRAJiMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309963; x=1823845963;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OKJgmjKos8BeQqOvQHHZfy/Qo2rKCnOBeIDaMRkegwo=;
  b=HJRAJiMFj+stooe8nCtlw1+wyJAAp+LYnCPnCyJ8S4DbQvPnmhALk6oA
   5pi9adAiUracwfc5nMSQ2Uq7U3hWgWXiEwukqtDHusDYDP+ya1LQPj3Pi
   MxnVpZKK4fx7Igxepbsyz3NqIvF+3a+q+WJpcg97EIEiePW29hJFxnuUL
   zSMpuYS1Ii1niWC6QrZRJdUel9/VDXdtRtp7Aey1MqR6H4+xqKKXu/2+v
   14WQXevL7bTGQ6EMRUilnHlXW3qpC7rbTGmffvpAfJgbhX65S6U5Rdg5l
   1pOJdKrSvWPkYYa0Aik8vKdzb3LAn9L4naLd9/GeM94MwNJKeVX6FtvRu
   g==;
X-CSE-ConnectionGUID: UfxBqHeVRcC1kZMMT7ZTzw==
X-CSE-MsgGUID: W+m8OrF6Q4m3ZA2oREOdVA==
X-URL-LookUp-ScanningError: 1
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908861"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908861"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:37 -0700
X-CSE-ConnectionGUID: RpvKxAz2RS699rYscI3d3A==
X-CSE-MsgGUID: wyjdF1C2RgKYlE+wycO1Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115558"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xi-1iCR;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:46:01 +0200
From: kernel test robot <lkp@intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: [tip:sched/core 35/37] ld.lld: error: relocation refers to a
 symbol in a discarded section: __UNIQUE_ID_addressable_overflowuid_553
Message-ID: <202610170544.6hPndDUW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64

dHJlZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
aXAvdGlwLmdpdCBzY2hlZC9jb3JlCmhlYWQ6ICAgYjk5YjdmNjBjNWI0NzNkMzc0YzY4YjUzNzUz
MTUzYjRhYTllMDcwMgpjb21taXQ6IGZjY2ViN2RhOTQ2NTk2OTVkNmNiYTk3MTkwZTE4ZTg3ZDlj
Y2U4MmMgWzM1LzM3XSBzY2hlZC9jYWNoZTogQXZvaWQgcHVibGlzaGluZyBwYXJ0aWFsIExMQyB1
dGlsaXphdGlvbgpjb25maWc6IHJpc2N2LXJhbmRjb25maWctMjAwMC0yMDI2MTAxNiAoaHR0cHM6
Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjYxMDE3LzIwMjYxMDE3MDU0NC42
aFBuZERVVy1sa3BAaW50ZWwuY29tL2NvbmZpZykKY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMjQu
MC4wZ2l0IChodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QgOGE2Nzk0NjRmMTlj
NDI2ZWY3NmFhZDlmNDU4N2I3MDNkZDNlNTg0ZCkKcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1
aWxkKTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI2MTAxNy8y
MDI2MTAxNzA1NDQuNmhQbmREVVctbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpCgpJZiB5b3UgZml4
IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5l
dyB2ZXJzaW9uIG9mCnRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5n
IHRhZ3MKfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cnwg
Q2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjYxMDE3MDU0
NC42aFBuZERVVy1sa3BAaW50ZWwuY29tLwoKQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQg
YnkgPj4pOgoKPj4gbGQubGxkOiBlcnJvcjogcmVsb2NhdGlvbiByZWZlcnMgdG8gYSBzeW1ib2wg
aW4gYSBkaXNjYXJkZWQgc2VjdGlvbjogX19VTklRVUVfSURfYWRkcmVzc2FibGVfb3ZlcmZsb3d1
aWRfNTUzCiAgID4+PiBkZWZpbmVkIGluIHZtbGludXgubwogICA+Pj4gcmVmZXJlbmNlZCBieSAE
BRQD0gQIrAUGBkoFCQYDAwk6MjM3MTkKICAgPj4+ICAgICAgICAgICAgICAgdm1saW51eC5vOihs
dGMyNjY0X2RhY19jb2RlX3dyaXRlKQoKLS0KMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQpo
dHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzL3dpa2kK
