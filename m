Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1434168
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 13:48:39 +0000 (UTC)
Message-ID: <8d0991b0-6f8b-b73b-0187-142e71fdd42f@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1636120117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bt2UYARdq18DuretV5C+L0t/gSCr9kXhEkzjBw+Ts2U=;
	b=3F458kjETRf7jRVmypzCsmCU9ttUiGKMJGU1A1VBWnE0AFc/YTOR0kn1AS7Hpw4hve0Ez0
	Jaeb1QecFqGlIfpIiYn9i+ucboq5cVdwR+cLZWgQlYg4RIx4hFSGcxl6VmA8PK6CLQG8gN
	M9hj8OQoxdUq08YOced9mVcdPOLrlGZGY1ZchGGNAU6rdsHM6uqVHg/25Nx04T2yq4xBU8
	4LzydPX9v3XQLBOg2WQMz5TGJuQPVNhbNl2AhMWgv06LcZkZSNkWnorZqn/ic3kbbZAaSH
	vrUnzE+NueCWqKdTC0qhqg7qGriW/DIW3zRGE9zGi7MxIPU5vVZ5vveNcnQhQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1636120117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bt2UYARdq18DuretV5C+L0t/gSCr9kXhEkzjBw+Ts2U=;
	b=qLC5HHRsUfNB9LLwVGuNbeEowxzJF9PLw7EkzeowieNCuBxZiCN3bLK/mHjfy9GXmO6fK8
	rYOkrJ0zl9kb09AA==
Date: Fri, 5 Nov 2021 14:48:36 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] net: dsa: b53: Add logic for TX timestamping
Content-Language: de-DE
To: Vladimir Oltean <olteanv@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Richard Cochran <richardcochran@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>
References: <20211104133204.19757-7-martin.kaistra@linutronix.de>
 <202111051954.rPDqSaCq-lkp@intel.com>
 <b99aa58c-26c0-768a-ebcd-f46cb49a2ca7@linutronix.de>
 <20211105133706.3dxnnxurwrxrqczs@skbuf>
From: Martin Kaistra <martin.kaistra@linutronix.de>
In-Reply-To: <20211105133706.3dxnnxurwrxrqczs@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 05.11.21 um 14:37 schrieb Vladimir Oltean:
> On Fri, Nov 05, 2021 at 01:59:52PM +0100, Martin Kaistra wrote:
>>
>>
>> Am 05.11.21 um 12:17 schrieb kernel test robot:
>>> Hi Martin,
>>>
>>> Thank you for the patch! Yet something to improve:
>>>
>>> [auto build test ERROR on net-next/master]
>>> [also build test ERROR on net/master linus/master next-20211105]
>>> [cannot apply to tip/timers/core v5.15]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url:    https://github.com/0day-ci/linux/commits/Martin-Kaistra/Add-PTP-support-for-BCM53128-switch/20211104-213538
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 84882cf72cd774cf16fd338bdbf00f69ac9f9194
>>> config: x86_64-randconfig-r033-20211105 (attached as .config)
>>> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 847a6807332b13f43704327c2d30103ec0347c77)
>>> reproduce (this is a W=1 build):
>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>           chmod +x ~/bin/make.cross
>>>           # https://github.com/0day-ci/linux/commit/b484f272339c8b2fd87f5d3493849439003c0026
>>>           git remote add linux-review https://github.com/0day-ci/linux
>>>           git fetch --no-tags linux-review Martin-Kaistra/Add-PTP-support-for-BCM53128-switch/20211104-213538
>>>           git checkout b484f272339c8b2fd87f5d3493849439003c0026
>>>           # save the attached .config to linux build tree
>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> drivers/net/dsa/b53/b53_common.c:2304:20: error: incompatible function pointer types initializing 'void (*)(struct dsa_switch *, int, struct sk_buff *)' with an expression of type 'bool (struct dsa_switch *, int, struct sk_buff *)' (aka '_Bool (struct dsa_switch *, int, struct sk_buff *)') [-Werror,-Wincompatible-function-pointer-types]
>>>              .port_txtstamp          = b53_port_txtstamp,
>>>                                        ^~~~~~~~~~~~~~~~~
>>>      1 error generated.
>>>
>>>
>>
>> oops, I will fix the signature of b53_port_txtstamp() for the
>> !CONFIG_B53_PTP case in v2.
> 
> Can you please ensure that it also _works_ when CONFIG_B53_PTP is disabled?
> FYI I will not start reviewing this patch set until it compiles correctly.
> Thanks.
> 

Yes, I will make sure it compiles and works without errors for both 
cases before sending v2.

Thanks,
Martin
