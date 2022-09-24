Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC27F;
	Sat, 24 Sep 2022 06:34:14 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MZK1N0ZPVzHpc2;
	Sat, 24 Sep 2022 14:31:52 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 14:34:04 +0800
Message-ID: <6adf3447-8c28-85a3-7211-32e7672fa41f@huawei.com>
Date: Sat, 24 Sep 2022 14:34:03 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] fs/ntfs3: use strcmp to determin attribute type
To: kernel test robot <lkp@intel.com>,
	<almaz.alexandrovich@paragon-software.com>, <ntfs3@lists.linux.dev>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
References: <20220913064728.79092-1-yuancan@huawei.com>
 <202209132249.HHQnBWE6-lkp@intel.com>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <202209132249.HHQnBWE6-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected


在 2022/9/13 22:29, kernel test robot 写道:
> Hi Yuan,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.0-rc5 next-20220913]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yuan-Can/fs-ntfs3-use-strcmp-to-determin-attribute-type/20220913-145102
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e839a756012b6cad7a4eeb67b0598ac3f349f863
> config: hexagon-randconfig-r041-20220912 (https://download.01.org/0day-ci/archive/20220913/202209132249.HHQnBWE6-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/a3c3b0ca90ba6141ef6b740a3c1189277e49b0ae
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Yuan-Can/fs-ntfs3-use-strcmp-to-determin-attribute-type/20220913-145102
>          git checkout a3c3b0ca90ba6141ef6b740a3c1189277e49b0ae
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/ufs/core/ fs/f2fs/ fs/ntfs3/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> fs/ntfs3/xattr.c:869:33: error: use of undeclared identifier 'name_len'; did you mean 'range_len'?
>             err = ntfs_get_ea(inode, name, name_len, buffer, size, NULL);
>                                            ^~~~~~~~
>                                            range_len
>     include/linux/range.h:11:19: note: 'range_len' declared here
>     static inline u64 range_len(const struct range *range)
>                       ^
>     fs/ntfs3/xattr.c:993:33: error: use of undeclared identifier 'name_len'; did you mean 'range_len'?
>             err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
>                                            ^~~~~~~~
>                                            range_len
>     include/linux/range.h:11:19: note: 'range_len' declared here
>     static inline u64 range_len(const struct range *range)
>                       ^
>     2 errors generated.

Thanks for the report, the error related problems are fix in the v2 patch.

Best regards,
Yuan Can

