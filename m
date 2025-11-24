Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F4313279;
	Mon, 24 Nov 2025 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003390; cv=none; b=AMDOVAzPQhOBpvvEcsgqvBh3qoDyDT4Xf7E3glysn5uxrUIdshMlWJ3wipY18Xcg1GHV5pZBTVRsJlSJHewQzVBIkZeT6Hf90LYrYeGAUkwKas0c9pgC+IfOy1EqP0gFs6z2IktQE67M7DpLilzBEqHTemr0P86omfmImFJ7y+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003390; c=relaxed/simple;
	bh=HwirAb/gLL+J5j3VximNgz6JNbZkPcvJA/jJoqA713A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfArFKup/lwiGWNsE6f5OJXBFxejYeWhpDfXoNxff9scllH9DRRV/I8UeApjAFXhSC6LbqJUpsmdpsEjtfmGOj2D4HMk6qimMWN2NAUZPQOHI8GIIDMNnN+9XvXtsb72PGGUqb3mkP/jmhSzrEQlraGMiFFFZgY5r2hzy735mMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3vwICNh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3vwICNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764003388; x=1795539388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HwirAb/gLL+J5j3VximNgz6JNbZkPcvJA/jJoqA713A=;
  b=P3vwICNhY6NS7rlUJtaCECGEWSHDAC60EgseXBvaKV+GuCCoNp8QV57E
   9B9WNzOvj7cfum6JT96/85VS+QFkvG74KLTf+wCU7BvEjBfqwz+tZ25MF
   v2O13cPwzGPQeWooqsbigQkw2NZmhF9RiD1abO/uQOmld4jwhKJkG60U0
   yTHLU7bsy392ebeSvvHDi+3Xd+9y4DKeDw3Pq1YCfPloZhq202nGzqJ39
   OtM6vjeyncIOl96jtSGCeKrT1EkZtKxKt5NJl0vo2TRRFW/w1mQ7L+sB5
   uM8NhsJbJqmYDsqaj6APNMTTAtqfE5TzQryrF84NYIYf/dnjNjyf/YaBn
   w==;
X-CSE-ConnectionGUID: XIgJ+RPnSQS0pFTk8+ksdw==
X-CSE-MsgGUID: BQtDr7gjR4iee0UtawmSTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83397664"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="83397664"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 08:56:27 -0800
X-CSE-ConnectionGUID: cTuJQOuKQZCYaFfbh5rctw==
X-CSE-MsgGUID: 3p6sIwp1TnKTVOKdX0HNFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="196827974"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2025 08:56:27 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNZrT-000000000vX-2mKC;
	Mon, 24 Nov 2025 16:56:23 +0000
Date: Tue, 25 Nov 2025 00:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [thesofproject:topic/sof-dev 3/12] sound/soc/sof/sof-client.c:282:3:
 error: cannot jump from this goto statement to its label
Message-ID: <202511250019.JSR3t07S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   cdadd7263fb81b49fc509aed5f284b183c88337f
commit: 9c64a0a3e4ce4e9f10ef3a088f4378415c493e2f [3/12] ASoC: SOF: Use guard()/scoped_guard() for mutex locks where it makes sense
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251125/202511250019.JSR3t07S-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250019.JSR3t07S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250019.JSR3t07S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/sof-client.c:282:3: error: cannot jump from this goto statement to its label
     282 |                 goto err_dev_init;
         |                 ^
   sound/soc/sof/sof-client.c:297:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     297 |         guard(mutex)(&sdev->ipc_client_mutex);
         |         ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:5:1: note: expanded from here
       5 | __UNIQUE_ID_guard330
         | ^
   sound/soc/sof/sof-client.c:277:3: error: cannot jump from this goto statement to its label
     277 |                 goto err_dev_add_data;
         |                 ^
   sound/soc/sof/sof-client.c:297:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     297 |         guard(mutex)(&sdev->ipc_client_mutex);
         |         ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:5:1: note: expanded from here
       5 | __UNIQUE_ID_guard330
         | ^
   2 errors generated.


vim +282 sound/soc/sof/sof-client.c

6955d9512d0ea8 Peter Ujfalusi 2022-02-10  253  
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  254  int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name, u32 id,
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  255  			    const void *data, size_t size)
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  256  {
075b7dd3e40a08 Peter Ujfalusi 2025-06-09  257  	struct sof_client_dev_entry *centry;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  258  	struct auxiliary_device *auxdev;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  259  	struct sof_client_dev *cdev;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  260  	int ret;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  261  
075b7dd3e40a08 Peter Ujfalusi 2025-06-09  262  	centry = kzalloc(sizeof(*centry), GFP_KERNEL);
075b7dd3e40a08 Peter Ujfalusi 2025-06-09  263  	if (!centry)
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  264  		return -ENOMEM;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  265  
075b7dd3e40a08 Peter Ujfalusi 2025-06-09  266  	cdev = &centry->client_dev;
075b7dd3e40a08 Peter Ujfalusi 2025-06-09  267  
075b7dd3e40a08 Peter Ujfalusi 2025-06-09  268  	centry->sdev = sdev;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  269  	auxdev = &cdev->auxdev;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  270  	auxdev->name = name;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  271  	auxdev->dev.parent = sdev->dev;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  272  	auxdev->dev.release = sof_client_auxdev_release;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  273  	auxdev->id = id;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  274  
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  275  	ret = sof_client_dev_add_data(cdev, data, size);
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  276  	if (ret < 0)
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  277  		goto err_dev_add_data;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  278  
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  279  	ret = auxiliary_device_init(auxdev);
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  280  	if (ret < 0) {
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  281  		dev_err(sdev->dev, "failed to initialize client dev %s.%d\n", name, id);
6955d9512d0ea8 Peter Ujfalusi 2022-02-10 @282  		goto err_dev_init;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  283  	}
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  284  
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  285  	ret = auxiliary_device_add(&cdev->auxdev);
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  286  	if (ret < 0) {
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  287  		dev_err(sdev->dev, "failed to add client dev %s.%d\n", name, id);
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  288  		/*
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  289  		 * sof_client_auxdev_release() will be invoked to free up memory
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  290  		 * allocations through put_device()
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  291  		 */
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  292  		auxiliary_device_uninit(&cdev->auxdev);
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  293  		return ret;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  294  	}
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  295  
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  296  	/* add to list of SOF client devices */
9c64a0a3e4ce4e Peter Ujfalusi 2025-09-05  297  	guard(mutex)(&sdev->ipc_client_mutex);
075b7dd3e40a08 Peter Ujfalusi 2025-06-09  298  	list_add(&centry->list, &sdev->ipc_client_list);
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  299  
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  300  	return 0;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  301  
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  302  err_dev_init:
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  303  	kfree(cdev->auxdev.dev.platform_data);
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  304  
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  305  err_dev_add_data:
075b7dd3e40a08 Peter Ujfalusi 2025-06-09  306  	kfree(centry);
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  307  
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  308  	return ret;
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  309  }
cdd30ebb1b9f36 Peter Zijlstra 2024-12-02  310  EXPORT_SYMBOL_NS_GPL(sof_client_dev_register, "SND_SOC_SOF_CLIENT");
6955d9512d0ea8 Peter Ujfalusi 2022-02-10  311  

:::::: The code at line 282 was first introduced by commit
:::::: 6955d9512d0ea814f1c2761bef7ad7b3cedf4d68 ASoC: SOF: Introduce IPC SOF client support

:::::: TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
