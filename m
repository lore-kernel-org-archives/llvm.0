Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431620;
	b=ZhXLGxxWg8zSu+HZF3ntfL5jezz+pk+7Xkc90nLDiJbuWPW5LdJhpRr7G19jvhQX6Qen
	 ju0GjuGF4SPwDRBaB8P42h+J3+QacdQErvtiYc9rqOQVb1P6SHvs/uE+m91EQ5ne02L+S
	 UuL4zvlPJnpfY3eZgELURMZBkRk6N5V9n022qLBH61/hbDNulIBbSl2NCDe3UQknCZ8e7
	 fZaCdE32isiycldXdW1Zi9kYE5ojA8DV4Z4bUcB6w0n4zkOhmbR4slQkNmM6roY8KVcLW
	 qa9gkXYV84OaJ2I8w8+1suKeG29qbYbQGtx5hRvr06tPgBimei/OmnN+79r1cIS0v8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431620;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RiPlvIclKIHkb++bxVQkKuYeuOpiB3GRN0lNMPqxshc=;
	b=CjdjxB0Ef3zeo7nv7VWysUY3ByQciPUEaJdCS6gvVH2iAPGTGjBoEUkHFbWS6HiJdGgD
	 Ve6YSGdzOnQM1FVpmGJF6g508/+mHaDIUl2fclZzyWWBay+BYtASUJSs0sl2JVMSVc6C4
	 QHBXrTmuhZ6h1JVYYfl3e0WdYx/6Exj267bmwqHB5eX2ZLIEtbT/gcrdg4lSPfVJhL1Tn
	 KV5jRS8gsdpSdTH78kbGeDfio8YZqT75GyL73o3cp9e2DBBBLWGtdkCGagJfMb2qd06pV
	 hrV5OsvlvXZGop60x+9w1t+5lTqbjQ5DxE7d2NZ+ll19QtNrXh2vHsU/Arja2t0+81A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Evmqkfkt;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20174606A31F;
	Sat, 31 Oct 2026 07:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20174606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Evmqkfkt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793431619; x=1824967619;
  h=date:from:to:cc:subject:message-id;
  bh=lXof648fFRP7CSIpdU/T6NkRhRo2R+XsR1Dv4fB84kM=;
  b=EvmqkfktB/ppe70ONVOkIKQ/pnx7RLy7YeoCUlAOn8wjVsHP2YB1XAi5
   3CNcbwqLP5naNueZq7J1hUGrycOKCKMbcBejMjQ7IXLdM8Ia4OGZHxeP3
   3XnUA3V254VmQPKhhN74WoTqvdrvBWFKp9AjMvhif/vLfQxfNMw9ss1iG
   qJEho2uDWxgEjYhXpIvrExGdCr8du32APIb9UFRJqFhZoo+0X7SAfUXb3
   dPgQKtR8dNSkjetrM0LFHkhwtM0/u3PbbHCO1HsF+lgmMsgoGKMrA4J4T
   vvHeH8QREmIUpfLaKPBdPubwxYR29LisLhZU+hN3B9a6qUKj+wPEBXGS+
   Q==;
X-CSE-ConnectionGUID: 8nmmR5AGTqqdORv04/sE/A==
X-CSE-MsgGUID: 3KCJBpHiS6upkAlULu0u7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2219473"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2219473"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 00:26:58 -0700
X-CSE-ConnectionGUID: +p/aY0abTKOlkLyeh+6nyQ==
X-CSE-MsgGUID: JWKTPYC1RJCGSxWi2goovQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5960961"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2026 00:26:56 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN3UL-000000005uh-38l1;
	Sat, 31 Oct 2026 07:26:53 +0000
Date: Sat, 31 Oct 2026 08:26:15 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-30 327/343]
 sound/soc/soc-card.c:1505:3: error: cannot jump from this goto statement to
 its label
Message-ID: <202610310844.IFdxKyNR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-30
head:   09f1a103b1f1ef745ade1826d62438261db56245
commit: cf30bd670849d570767b65301fe6042a78f71e71 [327/343] ASoC: soc-card: use missing soc_card_ret()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261031/202610310844.IFdxKyNR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310844.IFdxKyNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310844.IFdxKyNR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-card.c:1505:3: error: cannot jump from this goto statement to its label
    1505 |                 goto err;
         |                 ^
   sound/soc/soc-card.c:1523:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1523 |         guard(mutex)(&client_mutex);
         |         ^
   include/linux/cleanup.h:416:2: note: expanded from macro 'guard'
     416 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:299:3: note: expanded from macro 'CLASS'
     299 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:29:1: note: expanded from here
      29 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:35:1: note: expanded from here
      35 | __UNIQUE_ID_unlock_415
         | ^
   sound/soc/soc-card.c:1523:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:416:15: note: expanded from macro 'guard'
     416 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:165:2: note: expanded from macro '__UNIQUE_ID'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:23:1: note: expanded from here
      23 | __UNIQUE_ID_guard_414
         | ^
   1 error generated.


vim +1505 sound/soc/soc-card.c

  1488	
  1489	int snd_soc_card_register(struct snd_soc_card *card, struct snd_soc_card_driver *driver)
  1490	{
  1491		int ret;
  1492	
  1493		if (!card->name)
  1494			snd_soc_card_set_name(card, driver->default_name);
  1495		if (!card->long_name)
  1496			snd_soc_card_set_long_name(card, driver->default_long_name);
  1497		if (!card->components)
  1498			snd_soc_card_set_components(card, driver->default_components);
  1499	
  1500		card->driver		= driver;
  1501		card->instantiated	= 0;
  1502		card->dapm		= snd_soc_dapm_alloc(card->dev);
  1503		if (!card->dapm) {
  1504			ret = -ENOMEM;
> 1505			goto err;
  1506		}
  1507	
  1508		dev_set_drvdata(card->dev, card);
  1509	
  1510		INIT_LIST_HEAD(&card->widget_list_head);
  1511		INIT_LIST_HEAD(&card->path_list_head);
  1512		INIT_LIST_HEAD(&card->dapm_list_head);
  1513		INIT_LIST_HEAD(&card->dapm_dirty_list_head);
  1514		INIT_LIST_HEAD(&card->aux_list_head);
  1515		INIT_LIST_HEAD(&card->component_list_head);
  1516		INIT_LIST_HEAD(&card->unbind_list);
  1517		INIT_LIST_HEAD(&card->rtd_list_head);
  1518	
  1519		mutex_init(&card->mutex);
  1520		mutex_init(&card->dapm_mutex);
  1521		mutex_init(&card->pcm_mutex);
  1522	
  1523		guard(mutex)(&client_mutex);
  1524	
  1525		ret = snd_soc_card_bind_call(card);
  1526	err:
  1527		return soc_card_ret(card, ret);
  1528	}
  1529	EXPORT_SYMBOL_GPL(snd_soc_card_register);
  1530	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
