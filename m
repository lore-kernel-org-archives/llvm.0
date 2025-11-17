Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B0715855E;
	Mon, 17 Nov 2025 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394800; cv=none; b=KSK4nYXb38CMNXSqYbqjA+f33qUW7LHp33eNIKX+YxdjcfVrOgtn/YBeE7ZKojNOz0kQPyheT7SIk1xs2LAo/W9ISYaXLdmtZU3bptjh+k9tiApivuZ5F39ftd01HS03tGOprx+wBjMTuwFM0+dF4lWclIoYdnFqwd2TeckOOd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394800; c=relaxed/simple;
	bh=WrpVZWLvf9yKHVXda3GnKIbGptsEeVba7Z9By/Qmn2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emyL5UBayPM4hHdRrAAsDSdM1gLlY9S6ZrXo8SS3HmqBpHdAtuhuaxHTIQO7Esxw53bT3vzSwezksOnbIW+502ET4bTdCePYzyUDgEq7faA49jwgiKkbM0E05ck0lNC/G883fe7APFbJ98XSkJNucpdp7qyo44Tn9RFG3PHrQnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuS/rpkl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuS/rpkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763394800; x=1794930800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WrpVZWLvf9yKHVXda3GnKIbGptsEeVba7Z9By/Qmn2Y=;
  b=OuS/rpklLwFRTljGUnliTAjkRrTpFkxIz57NjNZlq6OQy/4h9LkCA74b
   zM3hgrokcLGG4QSm2QCqnJsg6THTzopSL0UsK1DlV0m5J743j8cDUldeT
   TtZab2i1oOool40fzi+aZzJLhpWQEXAjjzzkusWvXbNYOpeWgRl2moChf
   9z84hZAfONPKvnv99EOOjsLf0m4FIhSY0kuNoiYLnkvzft3ubcMuRj1KV
   Kf2P6wE8M4ot7NVX1ciJQajvzt6PJWPyV/hRtSZGcPJWurEOMhSAR5zxi
   MKaWgMdQhLuujP8Dj6i3WA1NLtUc/ZhOJ4N38fBd/OocbARezHB/zODly
   A==;
X-CSE-ConnectionGUID: pgzS+u1vRzC96uRNaESv7g==
X-CSE-MsgGUID: yZQCkHO/SrOonZ9OJxcsZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69017578"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="69017578"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 07:53:19 -0800
X-CSE-ConnectionGUID: BW2/G3/gTEeIutSEbKtEcA==
X-CSE-MsgGUID: ZEUUF18OQluQzvZwRPW5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195619679"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2025 07:53:18 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL1XX-0000l1-0i;
	Mon, 17 Nov 2025 15:53:15 +0000
Date: Mon, 17 Nov 2025 23:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 41/55] fs/nfsd/nfs3xdr_gen.c:194:2: warning:
 switch condition has boolean value
Message-ID: <202511172336.Y75zj4v6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   6158ace3b663c4e9ab201f2cc644f4290fa30905
commit: 2b5b97ec0f7a484e81bedf71e223f38b0feb98ca [41/55] Documentation: Add the RPC language description of NFSv3
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20251117/202511172336.Y75zj4v6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511172336.Y75zj4v6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511172336.Y75zj4v6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs3xdr_gen.c:194:2: warning: switch condition has boolean value [-Wswitch-bool]
     194 |         switch (ptr->attributes_follow) {
         |         ^       ~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:220:2: warning: switch condition has boolean value [-Wswitch-bool]
     220 |         switch (ptr->attributes_follow) {
         |         ^       ~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:244:2: warning: switch condition has boolean value [-Wswitch-bool]
     244 |         switch (ptr->handle_follows) {
         |         ^       ~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:269:2: warning: switch condition has boolean value [-Wswitch-bool]
     269 |         switch (ptr->set_it) {
         |         ^       ~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:285:2: warning: switch condition has boolean value [-Wswitch-bool]
     285 |         switch (ptr->set_it) {
         |         ^       ~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:301:2: warning: switch condition has boolean value [-Wswitch-bool]
     301 |         switch (ptr->set_it) {
         |         ^       ~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:317:2: warning: switch condition has boolean value [-Wswitch-bool]
     317 |         switch (ptr->set_it) {
         |         ^       ~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:425:2: warning: switch condition has boolean value [-Wswitch-bool]
     425 |         switch (ptr->check) {
         |         ^       ~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:2080:2: warning: switch condition has boolean value [-Wswitch-bool]
    2080 |         switch (ptr->attributes_follow) {
         |         ^       ~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:2106:2: warning: switch condition has boolean value [-Wswitch-bool]
    2106 |         switch (ptr->attributes_follow) {
         |         ^       ~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:2130:2: warning: switch condition has boolean value [-Wswitch-bool]
    2130 |         switch (ptr->handle_follows) {
         |         ^       ~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:2150:2: warning: switch condition has boolean value [-Wswitch-bool]
    2150 |         switch (ptr->set_it) {
         |         ^       ~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:2166:2: warning: switch condition has boolean value [-Wswitch-bool]
    2166 |         switch (ptr->set_it) {
         |         ^       ~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:2182:2: warning: switch condition has boolean value [-Wswitch-bool]
    2182 |         switch (ptr->set_it) {
         |         ^       ~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:2198:2: warning: switch condition has boolean value [-Wswitch-bool]
    2198 |         switch (ptr->set_it) {
         |         ^       ~~~~~~~~~~~
   fs/nfsd/nfs3xdr_gen.c:2306:2: warning: switch condition has boolean value [-Wswitch-bool]
    2306 |         switch (ptr->check) {
         |         ^       ~~~~~~~~~~
   16 warnings generated.


vim +194 fs/nfsd/nfs3xdr_gen.c

   188	
   189	static bool __maybe_unused
   190	xdrgen_decode_post_op_attr(struct xdr_stream *xdr, struct post_op_attr *ptr)
   191	{
   192		if (!xdrgen_decode_bool(xdr, &ptr->attributes_follow))
   193			return false;
 > 194		switch (ptr->attributes_follow) {
   195		case TRUE:
   196			if (!xdrgen_decode_fattr3(xdr, &ptr->u.attributes))
   197				return false;
   198			break;
   199		}
   200		return true;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
