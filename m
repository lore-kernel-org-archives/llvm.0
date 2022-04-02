Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4D21366
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 09:52:57 +0000 (UTC)
Received: from [192.168.165.80] (unknown [182.2.36.61])
	by gnuweeb.org (Postfix) with ESMTPSA id 232C57E2EE;
	Sat,  2 Apr 2022 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1648893169;
	bh=8tCRa13ZZsZGboLXAqosF0lcTrImP1d0N9Iedzf/FKM=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=sQ/Eg7Ugag8rSe2h0j6rD7H6xRrxmuMYqGA+P5VU5LnWLGIvYyu5YU25eup1lGa68
	 lsFMi2+8ae4Q+T+2FA6hp5hxjG6MmBU1z4HrBr92gMdO4x2/Zz1AkggLW+m2teO41F
	 LLjzaKQ+2lkX4C2BEB/cQe+uY9DNIHfnqVRoYaQLBBo6Ae36+Nm8TMAlZjCMHd4LJt
	 pQuN8SUHj80w/hMX4Kwg01EYD6UXmybs0M9yh+A1nwK9Gv46v8FzVu9tOWr/cWwXt8
	 ThShw+EgvEB/wTagd+LFSvgDObSdrQ+9qASDX4FxKqDTYqRs8Hn2tvTegNVpyrfsRT
	 nxFi5Lz8EmEMA==
Message-ID: <9fa2454e-aef5-c879-eb0d-2eb23e603b55@gnuweeb.org>
Date: Sat, 2 Apr 2022 16:52:39 +0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, linux-kernel@vger.kernel.org,
 Quentin Perret <qperret@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Will Deacon <willdeacon@google.com>
References: <202204021112.ErKMELRr-lkp@intel.com>
 <87r16fbzaq.wl-maz@kernel.org>
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: Re:
 [ammarfaizi2-block:google/android/kernel/common/android12-5.10-2022-03
 199/9999] arch/arm64/kvm/perf.c:58:36: error: implicit declaration of
 function 'perf_num_counters'
In-Reply-To: <87r16fbzaq.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marc,

On 4/2/22 4:38 PM, Marc Zyngier wrote:
> Hi Robot,
> 
> On Sat, 02 Apr 2022 04:47:04 +0100,
> kernel test robot <lkp@intel.com> wrote:
>>
>> Hi Marc,
>>
>> FYI, the error/warning still remains.
>>
>> tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-5.10-2022-03
> 
> Oh look, a random Android tree based on ... 5.10.
> 
>> head:   64099431c232d4a95f621411747a3972cc1c8061
>> commit: 13dbdc0759fd4b89417f64d399ffa6a86fdc7caf [199/9999] FROMGIT: KVM: arm64: Turn kvm_arm_support_pmu_v3() into a static key
>> config: arm64-randconfig-r024-20220331 (https://download.01.org/0day-ci/archive/20220402/202204021112.ErKMELRr-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project cc2e2b80a1f36a28fa7c96c38c2674b10868f09f)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm64 cross compiling tool for clang build
>>          # apt-get install binutils-aarch64-linux-gnu
>>          # https://github.com/ammarfaizi2/linux-block/commit/13dbdc0759fd4b89417f64d399ffa6a86fdc7caf
>>          git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>>          git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-5.10-2022-03
>>          git checkout 13dbdc0759fd4b89417f64d399ffa6a86fdc7caf
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/arm64/kvm/perf.c:58:36: error: implicit declaration of function 'perf_num_counters' [-Werror,-Wimplicit-function-declaration]
>>             if (IS_ENABLED(CONFIG_ARM_PMU) && perf_num_counters() > 0)
>>                                               ^
>>     1 error generated.
> 
> $ ls -l arch/arm64/kvm/perf.c
> ls: cannot access 'arch/arm64/kvm/perf.c': No such file or directory
> 
> What is the point of testing trees that have no resemblance with
> upstream?

It's my tree. Didn't realize it yields many irrelevant errors like this.
I will stop pushing Android stuff to this tree.

Sorry for bothering you.

-- 
Ammar Faizi
