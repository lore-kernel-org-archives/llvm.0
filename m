Received: from out-11.mta1.migadu.com (out-11.mta1.migadu.com [95.215.58.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686548BE6
	for <llvm@lists.linux.dev>; Fri, 19 May 2023 11:05:54 +0000 (UTC)
Message-ID: <5e8a5f4f-e71c-97a4-6ace-974753a1a528@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1684494352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+f7q/+iPZrZx2NdGrm8LfceCd8cPvq8pKk+gPXnu86I=;
	b=wI1UWO9HY2djqaPvMvHuDdBCij+lS3XSpIled16qwu9240aoDzen8dn+RinWrVUT47f8NK
	O/VhnReI586owQNuJ9H8/qkTBljdgkr8QYuRFGT+J8HReiAfK0l5T9wqUannsiUoWq35Ap
	2uTsK6VA64qBYsaTdHEldrwMqxlh5Lg=
Date: Fri, 19 May 2023 19:05:46 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [song-md:module_alloc_test 5/6]
 arch/powerpc/kernel/module.c:108:8: error: unused variable 'ptr'
To: kernel test robot <lkp@intel.com>, Song Liu <song@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-raid@vger.kernel.org
References: <202305191808.4xsaLKSZ-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Guoqing Jiang <guoqing.jiang@linux.dev>
In-Reply-To: <202305191808.4xsaLKSZ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 5/19/23 18:41, kernel test robot wrote:
> Hi Song,
>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git module_alloc_test

Could you only post test results for md-next/md-fixes branches to raid 
list? Since this is
obvious irrelevant to the list.

Thanks,
Guoqing
