Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53F40BFE;
	Sat,  6 Apr 2024 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712430110; cv=none; b=DK0iyCGJlZQOGcvquoUMCdzXQxO36xZkwBeaTKuUxyUMAWdzDER5unjNGVbTsj6OHr71HhcLl8VOsaJGSXnV3I+ynyYi8DhVsue+GonN5UncnPKWk1lCRh91Sie9+8wb7Y1Bm5UODmDcjWnTJcjqYraCmfPiySe2RcboeDoE8m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712430110; c=relaxed/simple;
	bh=//MYeLRGeF3aktaU/CGqZkxj5GDSbySTTwda27UORSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gAqOBSb4/418cvGLFJ2kVGJcjACmyuosCxiejI0bJEANJBAfDO4MOvzSSgwe1lfNnoTifSkzy9dQqSyxW7Xcf0af6tzxaBUvgSaHrNJ7eb9+vwkviT/i/qKcY4NrBs91FjZakdh6KGnMpfdG0tl72/xJSATggTvP2ihKkAWak2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddzST5h4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddzST5h4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712430108; x=1743966108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=//MYeLRGeF3aktaU/CGqZkxj5GDSbySTTwda27UORSg=;
  b=ddzST5h4+FzWSyPu9y3XeMAoVC+4IOAqqikm+DIUmn79WyoFYRwONpo0
   2NHulxovuanABtLuZcaecUq6AezJj773heGjfvsYG5ebqPLauZBXROoyU
   XrNC4N2fHb0n3xeDZUaheOKxMr2v3k1dGcdJkL07FM63+AmM19j4YUaRp
   HGKiYuN0FK6ajhr1jr8nh0dIRqvQc4lC2N+J/YmeUBECqEnFYmuXChDBp
   S1s9tXq0egBi795AuzJwoiPMPXdW7/jz3ocPD4KI/kNTN+LPQWyIS6+ma
   xcUjPkDc180V1Z9ju3w2+XcdqhBYq7yzEOwEaILPxwUS8nxCEWWmFPWgl
   Q==;
X-CSE-ConnectionGUID: qROwztHSR6CdNvbmJvTeMA==
X-CSE-MsgGUID: jiaENJ6SQjCbkKCisutP7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="11568836"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="11568836"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 12:01:47 -0700
X-CSE-ConnectionGUID: DxkPB3wATSKo7trPGgE22Q==
X-CSE-MsgGUID: QnmN0twHQtODfHK7Sw9hGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="56953781"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Apr 2024 12:01:47 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtBIO-0003mI-0F;
	Sat, 06 Apr 2024 19:01:44 +0000
Date: Sun, 7 Apr 2024 03:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 105/106] samples/vfio-mdev/mtty.c:887:15:
 error: call to undeclared function 'iov_iter_count'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202404070215.itiTTElr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f5a71066e2fa8ca66dd137e17bac2e2090b3802d
commit: d16395df532bf3f4343cc3445521c486d1925dcc [105/106] samples/vfio-mdev: convert to read/write iterators
config: x86_64-buildonly-randconfig-001-20240406 (https://download.01.org/0day-ci/archive/20240407/202404070215.itiTTElr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070215.itiTTElr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070215.itiTTElr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/vfio-mdev/mtty.c:887:15: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     887 |         size_t len = iov_iter_count(to);
         |                      ^
>> samples/vfio-mdev/mtty.c:912:8: error: call to undeclared function 'copy_to_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     912 |                 if (!copy_to_iter_full((void *)&migf->data + *pos, len, to)) {
         |                      ^
   samples/vfio-mdev/mtty.c:1026:15: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1026 |         size_t len = iov_iter_count(from);
         |                      ^
>> samples/vfio-mdev/mtty.c:1050:7: error: call to undeclared function 'copy_from_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1050 |         if (!copy_from_iter_full((void *)&migf->data + *pos, len, from)) {
         |              ^
   4 errors generated.


vim +/iov_iter_count +887 samples/vfio-mdev/mtty.c

   883	
   884	static ssize_t mtty_save_read(struct kiocb *iocb, struct iov_iter *to)
   885	{
   886		struct mtty_migration_file *migf = iocb->ki_filp->private_data;
 > 887		size_t len = iov_iter_count(to);
   888		ssize_t ret = 0;
   889		loff_t *pos;
   890	
   891		if (iocb->ki_pos)
   892			return -ESPIPE;
   893	
   894		pos = &iocb->ki_filp->f_pos;
   895	
   896		mutex_lock(&migf->lock);
   897	
   898		dev_dbg(migf->mdev_state->vdev.dev, "%s ask %zu\n", __func__, len);
   899	
   900		if (migf->disabled) {
   901			ret = -ENODEV;
   902			goto out_unlock;
   903		}
   904	
   905		if (*pos > migf->filled_size) {
   906			ret = -EINVAL;
   907			goto out_unlock;
   908		}
   909	
   910		len = min_t(size_t, migf->filled_size - *pos, len);
   911		if (len) {
 > 912			if (!copy_to_iter_full((void *)&migf->data + *pos, len, to)) {
   913				ret = -EFAULT;
   914				goto out_unlock;
   915			}
   916			*pos += len;
   917			ret = len;
   918		}
   919	out_unlock:
   920		dev_dbg(migf->mdev_state->vdev.dev, "%s read %zu\n", __func__, ret);
   921		mutex_unlock(&migf->lock);
   922		return ret;
   923	}
   924	
   925	static const struct file_operations mtty_save_fops = {
   926		.owner = THIS_MODULE,
   927		.read_iter = mtty_save_read,
   928		.unlocked_ioctl = mtty_precopy_ioctl,
   929		.compat_ioctl = compat_ptr_ioctl,
   930		.release = mtty_release_migf,
   931		.llseek = no_llseek,
   932	};
   933	
   934	static void mtty_save_state(struct mdev_state *mdev_state)
   935	{
   936		struct mtty_migration_file *migf = mdev_state->saving_migf;
   937		int i;
   938	
   939		mutex_lock(&migf->lock);
   940		for (i = 0; i < mdev_state->nr_ports; i++) {
   941			memcpy(&migf->data.ports[i],
   942				&mdev_state->s[i], sizeof(struct serial_port));
   943			migf->filled_size += sizeof(struct serial_port);
   944		}
   945		dev_dbg(mdev_state->vdev.dev,
   946			"%s filled to %zu\n", __func__, migf->filled_size);
   947		mutex_unlock(&migf->lock);
   948	}
   949	
   950	static int mtty_load_state(struct mdev_state *mdev_state)
   951	{
   952		struct mtty_migration_file *migf = mdev_state->resuming_migf;
   953		int i;
   954	
   955		mutex_lock(&migf->lock);
   956		/* magic and version already tested by resume write fn */
   957		if (migf->filled_size < mtty_data_size(mdev_state)) {
   958			dev_dbg(mdev_state->vdev.dev, "%s expected %zu, got %zu\n",
   959				__func__, mtty_data_size(mdev_state),
   960				migf->filled_size);
   961			mutex_unlock(&migf->lock);
   962			return -EINVAL;
   963		}
   964	
   965		for (i = 0; i < mdev_state->nr_ports; i++)
   966			memcpy(&mdev_state->s[i],
   967			       &migf->data.ports[i], sizeof(struct serial_port));
   968	
   969		mutex_unlock(&migf->lock);
   970		return 0;
   971	}
   972	
   973	static struct mtty_migration_file *
   974	mtty_save_device_data(struct mdev_state *mdev_state,
   975			      enum vfio_device_mig_state state)
   976	{
   977		struct mtty_migration_file *migf = mdev_state->saving_migf;
   978		struct mtty_migration_file *ret = NULL;
   979	
   980		if (migf) {
   981			if (state == VFIO_DEVICE_STATE_STOP_COPY)
   982				goto fill_data;
   983			return ret;
   984		}
   985	
   986		migf = kzalloc(sizeof(*migf), GFP_KERNEL_ACCOUNT);
   987		if (!migf)
   988			return ERR_PTR(-ENOMEM);
   989	
   990		migf->filp = anon_inode_getfile("mtty_mig", &mtty_save_fops,
   991						migf, O_RDONLY);
   992		if (IS_ERR(migf->filp)) {
   993			int rc = PTR_ERR(migf->filp);
   994	
   995			kfree(migf);
   996			return ERR_PTR(rc);
   997		}
   998	
   999		stream_open(migf->filp->f_inode, migf->filp);
  1000		mutex_init(&migf->lock);
  1001		migf->mdev_state = mdev_state;
  1002	
  1003		migf->data.magic = MTTY_MAGIC;
  1004		migf->data.major_ver = MTTY_MAJOR_VER;
  1005		migf->data.minor_ver = MTTY_MINOR_VER;
  1006		migf->data.nr_ports = mdev_state->nr_ports;
  1007	
  1008		migf->filled_size = offsetof(struct mtty_data, ports);
  1009	
  1010		dev_dbg(mdev_state->vdev.dev, "%s filled header to %zu\n",
  1011			__func__, migf->filled_size);
  1012	
  1013		ret = mdev_state->saving_migf = migf;
  1014	
  1015	fill_data:
  1016		if (state == VFIO_DEVICE_STATE_STOP_COPY)
  1017			mtty_save_state(mdev_state);
  1018	
  1019		return ret;
  1020	}
  1021	
  1022	static ssize_t mtty_resume_write(struct kiocb *iocb, struct iov_iter *from)
  1023	{
  1024		struct mtty_migration_file *migf = iocb->ki_filp->private_data;
  1025		struct mdev_state *mdev_state = migf->mdev_state;
  1026		size_t len = iov_iter_count(from);
  1027		loff_t requested_length;
  1028		ssize_t ret = 0;
  1029		loff_t *pos;
  1030	
  1031		if (iocb->ki_pos)
  1032			return -ESPIPE;
  1033	
  1034		pos = &iocb->ki_filp->f_pos;
  1035	
  1036		if (*pos < 0 ||
  1037		    check_add_overflow((loff_t)len, *pos, &requested_length))
  1038			return -EINVAL;
  1039	
  1040		if (requested_length > mtty_data_size(mdev_state))
  1041			return -ENOMEM;
  1042	
  1043		mutex_lock(&migf->lock);
  1044	
  1045		if (migf->disabled) {
  1046			ret = -ENODEV;
  1047			goto out_unlock;
  1048		}
  1049	
> 1050		if (!copy_from_iter_full((void *)&migf->data + *pos, len, from)) {
  1051			ret = -EFAULT;
  1052			goto out_unlock;
  1053		}
  1054	
  1055		*pos += len;
  1056		ret = len;
  1057	
  1058		dev_dbg(migf->mdev_state->vdev.dev, "%s received %zu, total %zu\n",
  1059			__func__, len, migf->filled_size + len);
  1060	
  1061		if (migf->filled_size < offsetof(struct mtty_data, ports) &&
  1062		    migf->filled_size + len >= offsetof(struct mtty_data, ports)) {
  1063			if (migf->data.magic != MTTY_MAGIC || migf->data.flags ||
  1064			    migf->data.major_ver != MTTY_MAJOR_VER ||
  1065			    migf->data.minor_ver != MTTY_MINOR_VER ||
  1066			    migf->data.nr_ports != mdev_state->nr_ports) {
  1067				dev_dbg(migf->mdev_state->vdev.dev,
  1068					"%s failed validation\n", __func__);
  1069				ret = -EFAULT;
  1070			} else {
  1071				dev_dbg(migf->mdev_state->vdev.dev,
  1072					"%s header validated\n", __func__);
  1073			}
  1074		}
  1075	
  1076		migf->filled_size += len;
  1077	
  1078	out_unlock:
  1079		mutex_unlock(&migf->lock);
  1080		return ret;
  1081	}
  1082	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
