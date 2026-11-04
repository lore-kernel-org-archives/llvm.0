Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771194;
	b=sIEuU9BJ8yTfjdmrHw9pCMosSrdCMxzOjavucTp9EZ9sQdl9LJkBbYxfMqH7m+QGJevy
	 S9RgrMQGzHTop+T8ubj1fdSwQ9WLFQhAVYJY0Z2WC0AkEfJ3Ze/i8zcrSWG5X0sR8x4HU
	 y4QDNwTz07e9AbZYk/A0fpIT93CC7u1VtBnhgJjbM0vQmts+hCuHhRQ3P7VNZQaB7o/Qx
	 LE4mEveaty8TT8GOH6sMqhk0DQcs6I161tt1PbErGKqVqN5I94NajcXeqBTxWe9L9V5sc
	 d5TylLPE+9HjL4wtYvn8Z/usrT6TIOGqIPhuse1L3SMCXd1twVfci8PyAniv9QbzrQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771194;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/XElJ/vuq1SwLGtyX+F17co0pIB8RbfDNZq585Gfwe8=;
	b=UOkuExX47l1aWyCUUHi94vc7ZhQc7Nif8kOannGgIHkpOwqy/rRT6ihGlJ84h/CZI37q
	 QAGzJCbSWmPuSNsV4CqXjEdj47gZvVMsrHLPe5nFEJX1vWTqq2tskCSXy0VTH7MfENj8r
	 81de9XPhywwtx5SHdwxUo4aUbWp3K2bxxj9QT/ZPKcaKeHeGLSRvVzPIBmpyJF/oqZela
	 MqJSRGyGtbMmslz5OFxdtUydaJ7Y1YxHrNmpGuPD2IO8CHPQD6JTnFopm0zOaOBgnVwW8
	 f5t5pGQ6A3h8mwq/atHGz4JNTePCbSzAnvkEwmWrBn9+bS27EI537CbT7f7QUcMeUGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q0Uvf17o;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A52606D817;
	Wed,  4 Nov 2026 05:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A52606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q0Uvf17o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793771192; x=1825307192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qO95KoHbh8hDYGZZwY+ruFe95BLqg616buZ+rn93unc=;
  b=Q0Uvf17o1KWLzL0SMkbz81yQ82xLTSD/QE9x1sZdO1AFyAAWWY0LlzTX
   6nhvf7tDRIXNpvXr+hDJnaI76AL71rzSwyncNDopNv9y1FrKkDf4XljRO
   me8+8S7yWEhOwN5YXgm1z13hkS6uiAzIH7RIVsoOjMluW/7R4AlDG9kQr
   FN5ltE9gWHF0gluhA69+kZKkEgGlRS7++KySZNZxzGDQXBlvfhZ9VTlHQ
   ai8vzaz+Z5pJ0TGvuxYdymcqTiqwqUEc9Ki0009Dr7ngMPn/qPRopsYtw
   YjAxNd7hOyC7HHK+ieS8A5RNnFZyCOsxV99fNiTQfS6krp/9dJ4wvXh9i
   Q==;
X-CSE-ConnectionGUID: wR8O2UowRpG7Xip21KWyug==
X-CSE-MsgGUID: GynOOjVTQH6dR6KWq54Nlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2608627"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2608627"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 21:46:31 -0800
X-CSE-ConnectionGUID: sgDZ13A9QUuiUIO6fvhxHg==
X-CSE-MsgGUID: 4T1pDiC4TsSgcxuL8me7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6448713"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2026 21:46:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOTpL-00000000jpr-1kzf;
	Wed, 04 Nov 2026 05:46:27 +0000
Date: Wed, 4 Nov 2026 13:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ketan Bhardwaj <ketan@armoriq.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/6] security: kap: add the securityfs control
 plane
Message-ID: <202611041314.Q11k5Ls1-lkp@intel.com>
References: <20261028133335.75899-5-ketan@armoriq.io>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028133335.75899-5-ketan@armoriq.io>

Hi Ketan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907]

url:    https://github.com/intel-lab-lkp/linux/commits/Ketan-Bhardwaj/docs-security-Describe-the-Kernel-Assurance-Plane-design/20261028-093330
base:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
patch link:    https://lore.kernel.org/r/20261028133335.75899-5-ketan%40armoriq.io
patch subject: [RFC PATCH v2 4/6] security: kap: add the securityfs control plane
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261104/202611041314.Q11k5Ls1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 65303e81f481bbfe386b8596423f94c43198ba94)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041314.Q11k5Ls1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041314.Q11k5Ls1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/kap/kapfs.c:53:23: warning: variable 'kap_sfs_igroups' set but not used [-Wunused-but-set-global]
      53 | static struct dentry *kap_sfs_igroups;
         |                       ^
   1 warning generated.


vim +/kap_sfs_igroups +53 security/kap/kapfs.c

    49	
    50	static struct vfsmount *kapfs_mnt;
    51	static struct dentry *kap_sfs_dir;
    52	static struct dentry *kap_sfs_default;
  > 53	static struct dentry *kap_sfs_igroups;
    54	static struct kap_file_ctx kap_default_ctx = { .kind = KAP_FILE_DEFAULT };
    55	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
