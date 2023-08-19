Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BC7362;
	Sat, 19 Aug 2023 07:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692428649;
	bh=1M+bC+oHJK8b1PDdoaJ9cM78a44wq3ERqGgn5/kiuLk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j1lqDDyFH06CSkGt/L2y1aW3x+76seWrPIMlAXvyTTtZoIXd+XgQVdEGCDX6wKAzH
	 wUXGIdEAfyIGZ/sew4feI0MtRqs8g6m2PX+I8qJROKQjEaNAmQAYPIhHhaxUGaMLB1
	 Vdl/LUW+VZc6j0oOxZJVvqPUain0qp3PyhTONRGQW4GoFkxID7XY/2y4UeAMbtDOuQ
	 2Vui5Af4U911gSjZ8+VA1h4wz0DooUYsEudZWC9c5AxDKBzgvD4uW/P8p/6fTGzjU+
	 N3DAJMuVVjJq68ixOluthFevp3i9JnzVRV/Ky3F3Kpa+CfpOnJU9vKhp+ujuuWoqmb
	 6922pXPMqobHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RSV8m5RRkz4wxm;
	Sat, 19 Aug 2023 17:04:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [powerpc:next-test 21/79]
 arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function
 'simple_feature_tweak'
In-Reply-To: <6173828b-183c-490d-abca-bdc72221bafc@app.fastmail.com>
References: <202308181501.AR5HMDWC-lkp@intel.com>
 <6173828b-183c-490d-abca-bdc72221bafc@app.fastmail.com>
Date: Sat, 19 Aug 2023 17:04:07 +1000
Message-ID: <87zg2nv7h4.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Fri, Aug 18, 2023, at 09:59, kernel test robot wrote:
>> tree:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git 
>> next-test
>> head:   c56963d48343b50998bacc6df949217c950163e3
>> commit: 54f30b83fe627453082f15d83d7820b28b2d24bb [21/79] powerpc: 
>> address missing-prototypes warnings
>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202308181501.AR5HMDWC-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function 'simple_feature_tweak' [-Werror,-Wunused-function]
>>    static inline int simple_feature_tweak(struct device_node *node, int type,
>>                      ^
>
> This looks unrelated to my patch, but is easily addressed by marking
> the function __maybe_unused. The warning is triggered by clang specific
> behavior that treats inline functions in .c files differently, see
> 6863f5643dd7 ("kbuild: allow Clang to find unused static inline functions
> for W=1 build")

It looks like it can just move inside the nearby ifdef. Will send a
patch.

cheers
