Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D167C
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 10:44:58 +0000 (UTC)
Received: from [192.168.165.80] (unknown [182.2.36.61])
	by gnuweeb.org (Postfix) with ESMTPSA id 91E3B7E356;
	Sat,  2 Apr 2022 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1648896298;
	bh=Fj/zOc2m5wPgUFQ7ymabonXvdGcHFYpQV8ZRUFwpB2o=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=FfPuMaGV3YewdDb3emorhUmC8cEIVXmjoEcs0MqlYBbSpSDT0m60J9nG18WQrc8xY
	 oMzAFNjMAxJMmlga4EthkNgprcquvCQP6MSSuKewv+YpxvH2fJ4WS6a+uMvAYTmxq/
	 CCdbb7P3fDA1JbLQ9LbeJKIFkIseVClMPb52EYQeIS5/k88B9h6kCMtoM7g7OtK1oL
	 IcJZ1c3xHjbcMjfD3n2+jDnkEE/SEyFXNqEBrZZW/lk+5YMxFsUfUBIWZEUALG4brs
	 0slMALKJ3IHHmJcqBEdpbSgPNQQ7xXeZWTI3avj2E0rHKmVun1QZU2ol3dFaFrKK/6
	 fw/CpD4PAb2zQ==
Message-ID: <60274552-dc33-e9ff-3fd8-d4d743a6f577@gnuweeb.org>
Date: Sat, 2 Apr 2022 17:44:49 +0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 linux-kernel@vger.kernel.org, Quentin Perret <qperret@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Will Deacon <willdeacon@google.com>
References: <202204021112.ErKMELRr-lkp@intel.com>
 <87r16fbzaq.wl-maz@kernel.org>
 <9fa2454e-aef5-c879-eb0d-2eb23e603b55@gnuweeb.org>
 <87pmlzbyff.wl-maz@kernel.org>
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: Re:
 [ammarfaizi2-block:google/android/kernel/common/android12-5.10-2022-03
 199/9999] arch/arm64/kvm/perf.c:58:36: error: implicit declaration of
 function 'perf_num_counters'
In-Reply-To: <87pmlzbyff.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marc,

On 4/2/22 4:57 PM, Marc Zyngier wrote:
> It doesn't bother me at all, and you shouldn't stop pushing stuff that
> is useful to you. My objection is to the testing of random trees and
> spamming of random people, specially when it is pretty obvious that
> the tree isn't targeting upstream Linux.
> 
> You really shouldn't change anything in your workflow on my account.

I sent a PR to lkp-tests to make the build error report private for my
google/android/.* branches. Should be good now.

https://github.com/intel/lkp-tests/pull/130

Thanks!

-- 
Ammar Faizi
