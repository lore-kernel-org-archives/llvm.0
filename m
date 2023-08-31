Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F184111722;
	Thu, 31 Aug 2023 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693490501; x=1725026501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OfZ7zTbIJkqPsN8qUSYq3+PItW+TPqpQwhSyp4ZYK4M=;
  b=JO3uI0oFZKEYwT0l62C2iUlgx9Ej3KaQpRdmlsF9nGW4WuVxUmkTVXGN
   wWhZOsJ9uaBbK6I6SaZJsMPAMpz+M+ucpNuZQP1k4djk9aD2JwJIB3Rcw
   UXWfwFKuqID22HQAhwcg5MP+uYjdkVFo4GbzTaS/rFFvCe8cvQLIY8lvY
   jkXOTt/6BcfwLYqMGHvnIKh5sJWvG6dHpcI7eKMLrhh/W+gZmIs5eBNOs
   0c+Qac75f7bgyrylJp2dRn06JQYc98ecuoA4t4Xy40h+Wvj7igheNGj1x
   aTLFldMzH7aFh8x4k6UtQh7NGV4A9RnU4+fLkrmq2PD6xYLvM4SgllFQP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="366167778"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="366167778"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 06:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739532428"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="739532428"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Aug 2023 06:39:51 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbhtl-0000Bv-0R;
	Thu, 31 Aug 2023 13:39:49 +0000
Date: Thu, 31 Aug 2023 21:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [driver-core:debugfs_cleanup 7/7] fs/sysfs/file.c:397:8: warning:
 variable 'uid' is uninitialized when used here
Message-ID: <202308312145.bv4S52ys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_cleanup
head:   2929d17b58d02dcf52d0345fa966c616e09a5afa
commit: 2929d17b58d02dcf52d0345fa966c616e09a5afa [7/7] sysfs: do not create empty directories if no attributes are present
config: i386-randconfig-012-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312145.bv4S52ys-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312145.bv4S52ys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312145.bv4S52ys-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/sysfs/file.c:397:8: warning: variable 'uid' is uninitialized when used here [-Wuninitialized]
                                             uid, gid, kobj, NULL);
                                             ^~~
   fs/sysfs/file.c:383:2: note: variable 'uid' is declared here
           kuid_t uid;
           ^
>> fs/sysfs/file.c:397:13: warning: variable 'gid' is uninitialized when used here [-Wuninitialized]
                                             uid, gid, kobj, NULL);
                                                  ^~~
   fs/sysfs/file.c:384:2: note: variable 'gid' is declared here
           kgid_t gid;
           ^
   2 warnings generated.


vim +/uid +397 fs/sysfs/file.c

   372	
   373	/**
   374	 * sysfs_add_file_to_group - add an attribute file to a pre-existing group.
   375	 * @kobj: object we're acting for.
   376	 * @attr: attribute descriptor.
   377	 * @group: group name.
   378	 */
   379	int sysfs_add_file_to_group(struct kobject *kobj,
   380			const struct attribute *attr, const char *group)
   381	{
   382		struct kernfs_node *parent;
   383		kuid_t uid;
   384		kgid_t gid;
   385		int error;
   386	
   387		if (group) {
   388			parent = kernfs_find_and_get(kobj->sd, group);
   389		} else {
   390			parent = kobj->sd;
   391			kernfs_get(parent);
   392		}
   393	
   394		if (!parent) {
   395			parent = kernfs_create_dir_ns(kobj->sd, group,
   396						  S_IRWXU | S_IRUGO | S_IXUGO,
 > 397						  uid, gid, kobj, NULL);
   398			if (IS_ERR(parent)) {
   399				if (PTR_ERR(parent) == -EEXIST)
   400					sysfs_warn_dup(kobj->sd, group);
   401				return PTR_ERR(parent);
   402			}
   403	
   404			kernfs_get(parent);
   405		}
   406	
   407		kobject_get_ownership(kobj, &uid, &gid);
   408		error = sysfs_add_file_mode_ns(parent, attr, attr->mode, uid, gid,
   409					       NULL);
   410		kernfs_put(parent);
   411	
   412		return error;
   413	}
   414	EXPORT_SYMBOL_GPL(sysfs_add_file_to_group);
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
