Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C4C3FC5
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 17:25:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAE5560ED8;
	Mon, 13 Sep 2021 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631553938;
	bh=vRZtqSJKoBInU3ECzYfOutpLY0p8fHJj9qP1b5Quywg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=Tm0K3R4jZV+b4GK94Vi/PQliu6YS5icQl7MaPkxARWHZ9FsbR0KR7tx9aUD0TcJs2
	 wBkSI9WifQ1j99+mMrfFGrhv1Fe6N1MtLpEI1foOGUVWySA5irmzA07I60r0ctZqis
	 wPYN0WLkzNw0/YSN/7DiU8iZpE9MfhgaqAxPC2P/gqnAZGkKsgezfFKUNFpEUwl5li
	 xHQY4DtsayGJTs5/FkVpjdXjwJmw2RtQWBwie19T5pAD9ize3KJZkZqXZ8TkrTohK7
	 F/jAEcaysBDOGR4nOQxoB8pWFRuxHBTTE8gLYYAOsk2DBQUri2wPlKJx65+DCXCUtq
	 /Su+qFG1pdwXQ==
Subject: Re: [mcgrof-next:20210908-firmware-builtin-v4 2/11]
 drivers/base/firmware_loader/builtin/main.c:36:6: error: no previous
 prototype for function 'firmware_is_builtin'
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@suse.de>
References: <202109101524.pjY4q0Dy-lkp@intel.com>
 <YTv817Srt8hoySP5@bombadil.infradead.org> <YTwLw+frJLbntgCJ@archlinux-ax161>
 <YT90vvVi7oYH0xpb@bombadil.infradead.org>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <993e03a8-b07c-a8d8-8c9f-75bfbab00f0e@kernel.org>
Date: Mon, 13 Sep 2021 10:25:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YT90vvVi7oYH0xpb@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/13/2021 8:56 AM, Luis Chamberlain wrote:
> On Fri, Sep 10, 2021 at 06:52:03PM -0700, Nathan Chancellor wrote:
>> On Fri, Sep 10, 2021 at 05:48:23PM -0700, Luis Chamberlain wrote:
>>> On Fri, Sep 10, 2021 at 03:41:31PM +0800, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20210908-firmware-builtin-v4
>>>> head:   1c69d6a17750179d68bcaf6b16f9a08d2e475989
>>>> commit: 79e9fce20ee88ffe37542a66277628e6c53dde14 [2/11] firmware_loader: formalize built-in firmware API
>>>> config: hexagon-buildonly-randconfig-r004-20210910 (attached as .config)
>>>> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 261cbe98c38f8c1ee1a482fe76511110e790f58a)
>>>> reproduce (this is a W=1 build):
>>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>>          chmod +x ~/bin/make.cross
>>>>          # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=79e9fce20ee88ffe37542a66277628e6c53dde14
>>>>          git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
>>>>          git fetch --no-tags mcgrof-next 20210908-firmware-builtin-v4
>>>>          git checkout 79e9fce20ee88ffe37542a66277628e6c53dde14
>>>>          # save the attached .config to linux build tree
>>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=hexagon
>>>>
>>>> If you fix the issue, kindly add following tag as appropriate
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>>> drivers/base/firmware_loader/builtin/main.c:36:6: error: no previous prototype for function 'firmware_is_builtin' [-Werror,-Wmissing-prototypes]
>>>>     bool firmware_is_builtin(const struct firmware *fw)
>>>
>>> This is a lie though its defined on drivers/base/firmware_loader/firmware.h
>>
>> Unless I am missing something, you don't include the firmware_loader
>> copy of firmware.h in builtin/main.c (only the linux one)? Isn't that
>> the source of the warning?
> 
> You would think, but nope, its there:
> 
> #include "firmware.h"

I see that in drivers/base/firmware_loader/main.c but the warning is 
complaining about drivers/base/firmware_loader/builtin/main.c, where I 
only see

#include <linux/firmware.h>

Sorry for the issues with reproducing. For what it's worth, I can 
reproduce this locally and adding

#include "../firmware.h"

to drivers/base/firmware_loader/builtin/main.c fixes it for me.

Cheers,
Nathan
