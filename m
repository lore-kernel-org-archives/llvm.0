Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D142C82
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640009961; x=1671545961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SmmpPoWknX/04b0LTXOTnTFuxaObwEMDn3ClqW8vP7Y=;
  b=EjfiRoUfUT6qsYNYmaPUiZhokJVbB7qcubCXnR6T/m0TT71mO/f0nkQL
   AfaF4mFrHdeZ6OkYf7zOfJhTazPTmNcRMii7ZwlKZ4IX2umOt9FmjCvop
   0zzw4Nl49GSiuDCe1QpWqzhwkEoKzAgki/UsiTvDXnr8ZM7vRn3sZIW89
   BnAOGbAk/fXg/OGeFKzIIgb3cEFp37Mrlq+VNv/H0CbnHV5FW45YZrUJ9
   uosDPcCkQnPeC6fSyacodD3zvqQcXTJFu+hPwwklxDxuW8fKI8SyP21A+
   czpS216LGBSUNDaGYntzZVe1uOSXuBkynrVGcLBg3M5yAr2Z7XL5M7aMo
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="237712992"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="237712992"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 06:19:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="606727518"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2021 06:19:13 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzJVM-0007r2-6b; Mon, 20 Dec 2021 14:19:08 +0000
Date: Mon, 20 Dec 2021 22:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] sysfs: add sysfs_add_bin_file_to_group()
Message-ID: <202112202254.l5IadaDs-lkp@intel.com>
References: <20211220064730.28806-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211220064730.28806-1-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Rafał,

I love your patch! Perhaps something to improve:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on char-misc/char-misc-testing linux/master linus/master v5.16-rc6 next-20211217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rafa-Mi-ecki/sysfs-add-sysfs_add_bin_file_to_group/20211220-144856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git aa483f3ce655ed9ee4f32d050d1822eec2d20ada
config: x86_64-randconfig-r024-20211220 (https://download.01.org/0day-ci/archive/20211220/202112202254.l5IadaDs-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a9802080b6d35af5dfd7ae847a0978e47caafd59
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/sysfs-add-sysfs_add_bin_file_to_group/20211220-144856
        git checkout a9802080b6d35af5dfd7ae847a0978e47caafd59
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/sysfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/sysfs/file.c:379:5: warning: no previous prototype for function '__sysfs_add_file_to_group' [-Wmissing-prototypes]
   int __sysfs_add_file_to_group(struct kobject *kobj,
       ^
   fs/sysfs/file.c:379:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __sysfs_add_file_to_group(struct kobject *kobj,
   ^
   static 
   1 warning generated.


vim +/__sysfs_add_file_to_group +379 fs/sysfs/file.c

   372	
   373	/**
   374	 * sysfs_add_file_to_group - add an attribute file to a pre-existing group.
   375	 * @kobj: object we're acting for.
   376	 * @attr: attribute descriptor.
   377	 * @group: group name.
   378	 */
 > 379	int __sysfs_add_file_to_group(struct kobject *kobj,
   380				      const struct attribute *attr,
   381				      const struct bin_attribute *battr,
   382				      const char *group)
   383	{
   384		struct kernfs_node *parent;
   385		kuid_t uid;
   386		kgid_t gid;
   387		int error;
   388	
   389		if (WARN_ON((attr && battr) || (!attr && !battr)))
   390			return -EINVAL;
   391	
   392		if (group) {
   393			parent = kernfs_find_and_get(kobj->sd, group);
   394		} else {
   395			parent = kobj->sd;
   396			kernfs_get(parent);
   397		}
   398	
   399		if (!parent)
   400			return -ENOENT;
   401	
   402		kobject_get_ownership(kobj, &uid, &gid);
   403		if (attr)
   404			error = sysfs_add_file_mode_ns(parent, attr, attr->mode, uid,
   405						       gid, NULL);
   406		else
   407			error = sysfs_add_bin_file_mode_ns(parent, battr, battr->attr.mode,
   408							   uid, gid, NULL);
   409		kernfs_put(parent);
   410	
   411		return error;
   412	}
   413	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
