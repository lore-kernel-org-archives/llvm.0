Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D13D9049
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669763; cv=none; b=Ft8UwJbO7A2ttrTlmPATwmuBYpvS2SLTlZPmyYIQ3LDTjziiOIGymAH06W32RQxJzIcEdszzY6KDy00v+yK8aR9a+8PgZp0/HQ0sXIOoBH5zFhnuvcHSyjFQsPSfixI9Ni8aVi7S6q29e4sgthDoSE0MN5eqcSd4G41JY826LoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669763; c=relaxed/simple;
	bh=ATtcFHVILuwhxiuVHOtYpT89mQVo+LwTBA6qFD6jsOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgFFPGkcDWDAeJPzeStDbaxi/aJ3z2DVEc/1aYJZRVT3oOuHQn3YsmreYKQAQB4bnQvQSzq+S57GP1LE9sPfecfgxzwodd4T25vsmq+h775q3Zo4ihhCPUBfievK0yzuC+7bP8yZX8mcOQf7AoOCYdLnRPZUCUn8dF722/R4Ml8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GjtLbvgC; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GjtLbvgC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783669755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATtcFHVILuwhxiuVHOtYpT89mQVo+LwTBA6qFD6jsOY=;
	b=GjtLbvgCAEf3UAHx9VTQZOPDszDuigfoOiCkuDYPQFlHw/q3x9MaWqNQAZAX/F14PiL1OA
	IDTpGoChGCw51L1SI7anL4wU/TWMcBZXL342Zcd4m2+Z25uOJ0BY6vWYLan6D0yMHhBIYL
	QxcL2HrpOLgIjYLMpPunZ1zR9oU00DE=
From: George Guo <dongtai.guo@linux.dev>
To: joe.lawrence@redhat.com
Cc: chenhuacai@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	kernel@xen0n.name,
	rostedt@goodmis.org,
	ardb@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	yangtiezhu@loongson.cn,
	jiaxun.yang@flygoat.com,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	xry111@xry111.site,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/12] klp-build: Add LoongArch syscall patching macro
Date: Fri, 10 Jul 2026 15:49:02 +0800
Message-ID: <20260710074902.27569-1-dongtai.guo@linux.dev>
In-Reply-To: <ak6ibxwACKMK8it2@redhat.com>
References: <ak6ibxwACKMK8it2@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Joe,

> Nit: The other macros in livepatch_helpers use tabs to pad out to the
> line continuation '\'.

Right, I'll pad the LoongArch macro with tabs to match the others.

Thanks,
George
