Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814DF173
	for <llvm@lists.linux.dev>; Tue,  4 Jan 2022 13:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E1BC36AE9;
	Tue,  4 Jan 2022 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641303484;
	bh=EdVWAtBvErepDJ7fxMKkJLBVt0sumgNOBJpCuQNcF8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CE5yAkymGpusGm7VzvDwx/g2cCeTl4/ZO/5GPr2OrKNojV80eS1FTPrjgHoo59slU
	 EbzT7Jrp2n19p4J0ghfZQYEfMDyUfkPRQW8VV7BsY7LBmuvryI4CeBJKvdsvnsiG+O
	 sPOyF2ADffqVxnAK0bq+HzzFY02TUeJiRyxQe7E38ddRuNuSb7zaIyZ5yFjrh3EVg9
	 KtzSe1VzYlKJQG+w0RfItGiVWILSW1dPR9NMo48gj4TGlc7fN31Jgbovf7u60yGwf6
	 wduqEJaJVectzOL5vIvPpP/yopuP1u9YOfQFVA3HVRC4YcTi728AnytfhZesu8OwM4
	 BY03hG+p/JIeg==
Date: Tue, 4 Jan 2022 13:37:58 +0000
From: Will Deacon <will@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jay Chen <jkchen@linux.alibaba.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [linux-next:master 6432/9897]
 drivers/perf/arm_smmuv3_pmu.c:889:34: warning: unused variable
 'smmu_pmu_of_match'
Message-ID: <20220104133758.GA1827@willie-the-truck>
References: <202201041700.01KZEzhb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201041700.01KZEzhb-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jan 04, 2022 at 05:49:36PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ea586a076e8aa606c59b66d86660590f18354b11
> commit: 3f7be43561766b7ad91661580376913c997613d6 [6432/9897] perf/smmuv3: Add devicetree support
> config: x86_64-buildonly-randconfig-r001-20220102 (https://download.01.org/0day-ci/archive/20220104/202201041700.01KZEzhb-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 104a827ea6de0cbe0f5faef4407552ede31d165c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3f7be43561766b7ad91661580376913c997613d6
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 3f7be43561766b7ad91661580376913c997613d6
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/perf/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/perf/arm_smmuv3_pmu.c:889:34: warning: unused variable 'smmu_pmu_of_match' [-Wunused-const-variable]
>    static const struct of_device_id smmu_pmu_of_match[] = {
>                                     ^
>    1 warning generated.
> 
> 
> vim +/smmu_pmu_of_match +889 drivers/perf/arm_smmuv3_pmu.c
> 
>    888	
>  > 889	static const struct of_device_id smmu_pmu_of_match[] = {
>    890		{ .compatible = "arm,smmu-v3-pmcg" },
>    891		{}
>    892	};
>    893	MODULE_DEVICE_TABLE(of, smmu_pmu_of_match);
>    894	

I've fixed this locally with an #ifdef CONFIG_OF around the match table.
I'll push out a branch once I've got on top of the other pending perf
issues.

Will
