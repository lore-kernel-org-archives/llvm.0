Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B75EEC3;
	Sun,  2 Aug 2026 01:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785635282; cv=none; b=VyKsglV/mmWUYWHx0xoa86DBFl2y3e4gPXWb1H8pwN+JLJqvIbDpL6xdqVo4gra/xIzM344XalfNTOSJ1NJps2PXVGyErqrgDvETMR8a+r8fla6p9xl9Jcyki31iXkijbFCVaARW3zI6z6xz7TBTF0UTfoaP/1QW3OZ8C6HdsUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785635282; c=relaxed/simple;
	bh=26KoS5FBBY/OGRo8yaEAiBYGG2PbapfbUP6bgYyugcw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nmy6wGmI7Hy4qAOhUBO7JfItlOkaSKW6o7LkYHVfAOV2sZJMuB9gamsBI3NHjetJLO21iXr1IZtVAw/NuDpWZNaakl1tyJ4l13yeGo+TzkH2qFh1zk41cCudokfBkynvk/RZxA0qznHPZcSYfVcmm/qgvSnpxquzGHa13cM267k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eG+/ua8V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eG+/ua8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785635280; x=1817171280;
  h=date:from:to:cc:subject:message-id;
  bh=26KoS5FBBY/OGRo8yaEAiBYGG2PbapfbUP6bgYyugcw=;
  b=eG+/ua8VOxQrfFD8T6sjrBdVv2PjPv2D0HgcWgyPo/VdB6fcFde+pjWQ
   blGHptqg2aKNwAgST6vGVC972uyHeMpF1tuCJykCOaJjUNpyprZmJEy56
   tai+YaoMlmmiUe2Gp7hFKnOeQbf03synM4ap3jQOjE9vzybWZXmyxeXwd
   mpW6c8H2MJJViehWaY6IKC04JBDpqZhNMa41RS42esCQqkx2aA8H4+ipL
   9zrr+NDw3hsdHQ/ISmBct75aO4wTx8VC9WkX+OG/qdNlF/n+O44Rf5GmF
   9bInYex9jf8FTxUcD+8IcP7Ztm+iBMHoSgnd7jNwXMRgj5B8BsT4AB8ej
   w==;
X-CSE-ConnectionGUID: gpEXQbeSTnGiFkj1/H/hjw==
X-CSE-MsgGUID: DnsW2LKaQFmmfjQje8mG6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86335217"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86335217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 18:47:59 -0700
X-CSE-ConnectionGUID: AGRMCYTcTEGNz8C8g8/dlw==
X-CSE-MsgGUID: qQz9HputSoGjleCGuiL6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="260332573"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2026 18:47:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqLIx-000000004FZ-2UII;
	Sun, 02 Aug 2026 01:47:55 +0000
Date: Sun, 02 Aug 2026 09:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 89/93] fs/rpdfs/super.c:251:7:
 warning: variable 'ret' is used uninitialized whenever switch case is taken
Message-ID: <202608020944.Zq9yfxSf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   7dd9571ed4664ad741e8519b4a4369a2d84523f6
commit: 007d92272595c74bef214041918d3a13e9b1daf1 [89/93] rpdfs: remove block granular cache design
config: hexagon-randconfig-002-20260802 (https://download.01.org/0day-ci/archive/20260802/202608020944.Zq9yfxSf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020944.Zq9yfxSf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020944.Zq9yfxSf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/rpdfs/super.c:251:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     251 |         case Opt_mkfs:
         |              ^~~~~~~~
   fs/rpdfs/super.c:265:9: note: uninitialized use occurs here
     265 |         return ret;
         |                ^~~
   fs/rpdfs/super.c:241:9: note: initialize the variable 'ret' to silence this warning
     241 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +251 fs/rpdfs/super.c

3dd054768bf09ee Zach Brown 2026-03-10  234  
e8e76da7ed715ef Zach Brown 2025-08-13  235  static int rpdfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
e8e76da7ed715ef Zach Brown 2025-08-13  236  {
e8e76da7ed715ef Zach Brown 2025-08-13  237  	struct rpdfs_fs_context *rfc = fc->fs_private;
a46ee3744c08232 Zach Brown 2026-07-28  238  	struct rpdfs_params *params = &rfc->params;
e8e76da7ed715ef Zach Brown 2025-08-13  239  	struct fs_parse_result result;
e8e76da7ed715ef Zach Brown 2025-08-13  240  	int token;
e8e76da7ed715ef Zach Brown 2025-08-13  241  	int ret;
e8e76da7ed715ef Zach Brown 2025-08-13  242  
e8e76da7ed715ef Zach Brown 2025-08-13  243  	token = fs_parse(fc, rpdfs_mount_parameters, param, &result);
e8e76da7ed715ef Zach Brown 2025-08-13  244  	if (token < 0)
e8e76da7ed715ef Zach Brown 2025-08-13  245  		return token;
e8e76da7ed715ef Zach Brown 2025-08-13  246  
e8e76da7ed715ef Zach Brown 2025-08-13  247  	switch (token) {
3dd054768bf09ee Zach Brown 2026-03-10  248  	case Opt_devd_addr:
a46ee3744c08232 Zach Brown 2026-07-28  249  		ret = parse_devd_addr(fc, params, param->string);
3dd054768bf09ee Zach Brown 2026-03-10  250  		break;
e8e76da7ed715ef Zach Brown 2025-08-13 @251  	case Opt_mkfs:
a46ee3744c08232 Zach Brown 2026-07-28  252  		params->mkfs = true;
e8e76da7ed715ef Zach Brown 2025-08-13  253  		break;
e8e76da7ed715ef Zach Brown 2025-08-13  254  	case Opt_source:
a46ee3744c08232 Zach Brown 2026-07-28  255  		ret = parse_devd_addr(fc, params, param->string);
3dd054768bf09ee Zach Brown 2026-03-10  256  		if (ret == 0) {
e8e76da7ed715ef Zach Brown 2025-08-13  257  			fc->source = param->string;
e8e76da7ed715ef Zach Brown 2025-08-13  258  			param->string = NULL;
e8e76da7ed715ef Zach Brown 2025-08-13  259  		}
e8e76da7ed715ef Zach Brown 2025-08-13  260  		break;
e8e76da7ed715ef Zach Brown 2025-08-13  261  	default:
e8e76da7ed715ef Zach Brown 2025-08-13  262  		return invalfc(fc, "Unknown option token '%d'", token);
e8e76da7ed715ef Zach Brown 2025-08-13  263  	}
e8e76da7ed715ef Zach Brown 2025-08-13  264  
e8e76da7ed715ef Zach Brown 2025-08-13  265  	return ret;
e8e76da7ed715ef Zach Brown 2025-08-13  266  }
e8e76da7ed715ef Zach Brown 2025-08-13  267  

:::::: The code at line 251 was first introduced by commit
:::::: e8e76da7ed715ef67ccc4436f4981a5b39983d9f rpdfs: initial commit

:::::: TO: Zach Brown <zab@zabbo.net>
:::::: CC: Zach Brown <zab@zabbo.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
