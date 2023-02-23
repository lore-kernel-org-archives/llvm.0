Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7D128EF;
	Thu, 23 Feb 2023 13:55:02 +0000 (UTC)
Received: from biznet-home.integral.gnuweeb.org (unknown [182.253.183.169])
	by gnuweeb.org (Postfix) with ESMTPSA id 8B0DA8315F;
	Thu, 23 Feb 2023 13:49:09 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1677160153;
	bh=h+QxafZ65XI9UXAts5ZAjfzkRHWPAzp8uxMeWxzq98M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Om78Ve1vo7S96Ww6RH0/Y6QE4u78Z4KzPPMRanmxuINF22cmE/AqviY9mRyPn5V+3
	 R3s8aX3adSqZEPkRmhxdcFeLGHZFZUaGpFMaUO1yU+zO3FE+6YNkNKJyt/2vBW1L6b
	 u3ebeHmgIspwgyXGvDSmj1mNUrjPe4rYbutOv7ji6AUn5qNtolbvtBhe8JNOCGoM3a
	 XueA7FFvFaOjpkxqadrPRE2AHLdKyHKIj+SUXY7OaiY5O6bOsA6A0T3smrFZsvQwrk
	 PCgYnEQU/ue/V0SZ0qZZ+Sm8J4P/N45FSocIKNcCOLchqNqNquFtLXq6WCyMT6U5an
	 jRIGVpfRtPbZw==
Date: Thu, 23 Feb 2023 20:49:02 +0700
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: kernel test robot <lkp@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.4 15/15]
 kernel/bpf/core.c:1570:3: error: implicit declaration of function
 'barrier_nospec'
Message-ID: <Y/duzncICkBE4wSe@biznet-home.integral.gnuweeb.org>
References: <202302232136.AWzwjCvb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302232136.AWzwjCvb-lkp@intel.com>
X-Bpl: hUx9VaHkTWcLO7S8CQCslj6OzqBx2hfLChRz45nPESx5VSB/xuJQVOKOB1zSXE3yc9ntP27bV1M1

On Thu, Feb 23, 2023 at 09:31:08PM +0800, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.4
> commit: 3bb990ea37595b41a1f06a551e5dd35372ea404a [15/15] uaccess: Add speculation barrier to copy_from_user()
...
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302232136.AWzwjCvb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/bpf/core.c:1570:3: error: implicit declaration of function 'barrier_nospec' [-Werror,-Wimplicit-function-declaration]
>                    barrier_nospec();
>                    ^
>    1 error generated.

It's missing #include <linux/nospec.h>. The fix for this is:

Upstream f3dd0c53370e70c0f9b7e931bbec12916f3bb8cc ("bpf: add missing header file include")

That one needs to get backported too. Or just fold that in to maintain
the bisectability (for stable kernels).

Thanks,

-- 
Ammar Faizi

