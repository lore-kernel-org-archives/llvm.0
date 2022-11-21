Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E3EC14;
	Mon, 21 Nov 2022 20:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E6BC433C1;
	Mon, 21 Nov 2022 20:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669061700;
	bh=9CCTvh1dhIFZPuxxoq4MvsctRlzXuKp2FFrCEjYPZ1M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=hRiM9LV76Y14pCwYUYe3o7TyId06gJN7VEgeb5Kn4mUvkLLqTBa/NN4ZUjUQMKwEY
	 6niYKqfRRiu0EqnrjTha6fDQZObu14f9LJko7NiyaZZspgHp85lZgQLdPCx0lqHbqA
	 u8ngpbZaQhnu6MF7q1lN8k9MlTKISLR0uptmHgRwvkfmUqPrFncH/jj6+BIjPUfuw0
	 ae6luP60fj/JZ2FNYSfmRkGnlEFKvx7+xI0vyj28XSOqmmFqpb+s/QLbO5MXj5UZrs
	 IyDucywk/RljlyuOPxhFMFVUTnQqXVg+EFCufNzPdJjN/wyziMtHb29IhEQipSGwB8
	 n6AhcH2eViFTg==
Date: Mon, 21 Nov 2022 12:12:59 -0800
From: Kees Cook <kees@kernel.org>
To: kernel test robot <lkp@intel.com>, Kees Cook <keescook@chromium.org>
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: =?US-ASCII?Q?Re=3A_=5Blinux-stable-rc=3Alinux-4=2E19=2Ey_910/43?= =?US-ASCII?Q?50=5D_fs/btrfs/volumes=2Ec=3A4681=3A3=3A_warning=3A_?= =?US-ASCII?Q?variable_=27max=5Fchunk=5Fsize=27_is_used_uninit?= =?US-ASCII?Q?ialized_whenever_=27if=27_condition_is_false?=
User-Agent: K-9 Mail for Android
In-Reply-To: <202211220116.YqtYsJot-lkp@intel.com>
References: <202211220116.YqtYsJot-lkp@intel.com>
Message-ID: <E3178442-1B78-4EA1-B30E-D3B4CB749A07@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 21, 2022 9:47:26 AM PST, kernel test robot <lkp@intel=2Ecom> wr=
ote:
>Hi Kees,
>
>FYI, the error/warning was bisected to this commit, please ignore it if i=
t's irrelevant=2E

Hi! Yeah, this commit isn't related=2E

-Kees

>
>tree:   https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/stable/linux-=
stable-rc=2Egit linux-4=2E19=2Ey
>head:   002bfba64dfd861e50556a611a3378bdca4ac7b9
>commit: 9000f2a528c0b58deea62a911454323090a67492 [910/4350] fortify: Expl=
icitly disable Clang support
>config: x86_64-randconfig-a006-20221121
>compiler: clang version 14=2E0=2E6 (https://github=2Ecom/llvm/llvm-projec=
t f28c006a5895fc0e329fe15fead81e37457cb1d1)
>reproduce (this is a W=3D1 build):
>        wget https://raw=2Egithubusercontent=2Ecom/intel/lkp-tests/master=
/sbin/make=2Ecross -O ~/bin/make=2Ecross
>        chmod +x ~/bin/make=2Ecross
>        # https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/stable/linu=
x-stable-rc=2Egit/commit/?id=3D9000f2a528c0b58deea62a911454323090a67492
>        git remote add linux-stable-rc https://git=2Ekernel=2Eorg/pub/scm=
/linux/kernel/git/stable/linux-stable-rc=2Egit
>        git fetch --no-tags linux-stable-rc linux-4=2E19=2Ey
>        git checkout 9000f2a528c0b58deea62a911454323090a67492
>        # save the config file
>        mkdir build_dir && cp config build_dir/=2Econfig
>        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make=2Ecross =
W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash fs/btrfs/ fs/ext4/
>
>If you fix the issue, kindly add following tag where applicable
>| Reported-by: kernel test robot <lkp@intel=2Ecom>
>
>All warnings (new ones prefixed by >>):
>
>>> fs/btrfs/volumes=2Ec:4681:3: warning: variable 'max_chunk_size' is use=
d uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized=
]
>                   BUG_ON(1);
>                   ^~~~~~~~~
>   include/asm-generic/bug=2Eh:61:32: note: expanded from macro 'BUG_ON'
>   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while=
 (0)
>                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>   include/linux/compiler=2Eh:56:23: note: expanded from macro 'if'
>   #define if(cond, =2E=2E=2E) __trace_if( (cond , ## __VA_ARGS__) )
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   include/linux/compiler=2Eh:58:6: note: expanded from macro '__trace_if=
'
>           if (__builtin_constant_p(!!(cond)) ? !!(cond) :               =
  \
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>   fs/btrfs/volumes=2Ec:4686:9: note: uninitialized use occurs here
>                                max_chunk_size);
>                                ^~~~~~~~~~~~~~
>   include/linux/kernel=2Eh:879:36: note: expanded from macro 'min'
>   #define min(x, y)       __careful_cmp(x, y, <)
>                                            ^
>   include/linux/kernel=2Eh:872:17: note: expanded from macro '__careful_=
cmp'
>                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), o=
p))
>                                 ^
>   include/linux/kernel=2Eh:866:25: note: expanded from macro '__cmp_once=
'
>                   typeof(y) unique_y =3D (y);               \
>                                         ^
>   fs/btrfs/volumes=2Ec:4681:3: note: remove the 'if' if its condition is=
 always true
>                   BUG_ON(1);
>                   ^
>   include/asm-generic/bug=2Eh:61:32: note: expanded from macro 'BUG_ON'
>   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while=
 (0)
>                                  ^
>   include/linux/compiler=2Eh:56:23: note: expanded from macro 'if'
>   #define if(cond, =2E=2E=2E) __trace_if( (cond , ## __VA_ARGS__) )
>                         ^
>   include/linux/compiler=2Eh:58:2: note: expanded from macro '__trace_if=
'
>           if (__builtin_constant_p(!!(cond)) ? !!(cond) :               =
  \
>           ^
>   fs/btrfs/volumes=2Ec:4634:20: note: initialize the variable 'max_chunk=
_size' to silence this warning
>           u64 max_chunk_size;
>                             ^
>                              =3D 0
>   1 warning generated=2E
>--
>>> fs/ext4/inode=2Ec:565:4: warning: variable 'retval' is used uninitiali=
zed whenever 'if' condition is false [-Wsometimes-uninitialized]
>                           BUG_ON(1);
>                           ^~~~~~~~~
>   include/asm-generic/bug=2Eh:61:32: note: expanded from macro 'BUG_ON'
>   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while=
 (0)
>                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>   include/linux/compiler=2Eh:56:23: note: expanded from macro 'if'
>   #define if(cond, =2E=2E=2E) __trace_if( (cond , ## __VA_ARGS__) )
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   include/linux/compiler=2Eh:58:6: note: expanded from macro '__trace_if=
'
>           if (__builtin_constant_p(!!(cond)) ? !!(cond) :               =
  \
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>   fs/ext4/inode=2Ec:612:6: note: uninitialized use occurs here
>           if (retval > 0 && map->m_flags & EXT4_MAP_MAPPED) {
>               ^~~~~~
>   include/linux/compiler=2Eh:56:36: note: expanded from macro 'if'
>   #define if(cond, =2E=2E=2E) __trace_if( (cond , ## __VA_ARGS__) )
>                                      ^~~~
>   include/linux/compiler=2Eh:58:30: note: expanded from macro '__trace_i=
f'
>           if (__builtin_constant_p(!!(cond)) ? !!(cond) :               =
  \
>                                       ^~~~
>   fs/ext4/inode=2Ec:565:4: note: remove the 'if' if its condition is alw=
ays true
>                           BUG_ON(1);
>                           ^
>   include/asm-generic/bug=2Eh:61:32: note: expanded from macro 'BUG_ON'
>   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while=
 (0)
>                                  ^
>   include/linux/compiler=2Eh:56:23: note: expanded from macro 'if'
>   #define if(cond, =2E=2E=2E) __trace_if( (cond , ## __VA_ARGS__) )
>                         ^
>   include/linux/compiler=2Eh:58:2: note: expanded from macro '__trace_if=
'
>           if (__builtin_constant_p(!!(cond)) ? !!(cond) :               =
  \
>           ^
>   fs/ext4/inode=2Ec:523:12: note: initialize the variable 'retval' to si=
lence this warning
>           int retval;
>                     ^
>                      =3D 0
>   1 warning generated=2E
>
>
>vim +4681 fs/btrfs/volumes=2Ec
>
>53b381b3abeb86 David Woodhouse     2013-01-29  4611 =20
>73c5de0051533c Arne Jansen         2011-04-12  4612  static int __btrfs_a=
lloc_chunk(struct btrfs_trans_handle *trans,
>72b468c8daeba5 David Sterba        2017-02-10  4613  			       u64 start,=
 u64 type)
>b2117a39fa96cf Miao Xie            2011-01-05  4614  {
>2ff7e61e0d30ff Jeff Mahoney        2016-06-22  4615  	struct btrfs_fs_inf=
o *info =3D trans->fs_info;
>73c5de0051533c Arne Jansen         2011-04-12  4616  	struct btrfs_fs_dev=
ices *fs_devices =3D info->fs_devices;
>ebcc9301eacb99 Nikolay Borisov     2017-06-27  4617  	struct btrfs_device=
 *device;
>73c5de0051533c Arne Jansen         2011-04-12  4618  	struct map_lookup *=
map =3D NULL;
>73c5de0051533c Arne Jansen         2011-04-12  4619  	struct extent_map_t=
ree *em_tree;
>73c5de0051533c Arne Jansen         2011-04-12  4620  	struct extent_map *=
em;
>73c5de0051533c Arne Jansen         2011-04-12  4621  	struct btrfs_device=
_info *devices_info =3D NULL;
>73c5de0051533c Arne Jansen         2011-04-12  4622  	u64 total_avail;
>73c5de0051533c Arne Jansen         2011-04-12  4623  	int num_stripes;	/*=
 total number of stripes to allocate */
>53b381b3abeb86 David Woodhouse     2013-01-29  4624  	int data_stripes;	/=
* number of stripes that count for
>53b381b3abeb86 David Woodhouse     2013-01-29  4625  				   block group s=
ize */
>73c5de0051533c Arne Jansen         2011-04-12  4626  	int sub_stripes;	/*=
 sub_stripes info for map */
>73c5de0051533c Arne Jansen         2011-04-12  4627  	int dev_stripes;	/*=
 stripes per dev */
>73c5de0051533c Arne Jansen         2011-04-12  4628  	int devs_max;		/* m=
ax devs to use */
>73c5de0051533c Arne Jansen         2011-04-12  4629  	int devs_min;		/* m=
in devs needed */
>73c5de0051533c Arne Jansen         2011-04-12  4630  	int devs_increment;=
	/* ndevs has to be a multiple of this */
>73c5de0051533c Arne Jansen         2011-04-12  4631  	int ncopies;		/* ho=
w many copies to data has */
>73c5de0051533c Arne Jansen         2011-04-12  4632  	int ret;
>73c5de0051533c Arne Jansen         2011-04-12  4633  	u64 max_stripe_size=
;
>73c5de0051533c Arne Jansen         2011-04-12  4634  	u64 max_chunk_size;
>73c5de0051533c Arne Jansen         2011-04-12  4635  	u64 stripe_size;
>73c5de0051533c Arne Jansen         2011-04-12  4636  	u64 num_bytes;
>73c5de0051533c Arne Jansen         2011-04-12  4637  	int ndevs;
>73c5de0051533c Arne Jansen         2011-04-12  4638  	int i;
>73c5de0051533c Arne Jansen         2011-04-12  4639  	int j;
>31e502298d80e2 Liu Bo              2012-11-21  4640  	int index;
>593060d756e0c2 Chris Mason         2008-03-25  4641 =20
>0c460c0d70e104 Ilya Dryomov        2012-03-27  4642  	BUG_ON(!alloc_profi=
le_is_valid(type, 0));
>73c5de0051533c Arne Jansen         2011-04-12  4643 =20
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4644  	if (list_empty(&fs_=
devices->alloc_list)) {
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4645  		if (btrfs_test_opt=
(info, ENOSPC_DEBUG))
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4646  			btrfs_debug(info,=
 "%s: no writable device", __func__);
>321aecc65671ae Chris Mason         2008-04-16  4647  		return -ENOSPC;
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4648  	}
>9b3f68b9067441 Chris Mason         2008-04-18  4649 =20
>3e72ee8874f42d Qu Wenruo           2018-01-30  4650  	index =3D btrfs_bg_=
flags_to_raid_index(type);
>9b3f68b9067441 Chris Mason         2008-04-18  4651 =20
>31e502298d80e2 Liu Bo              2012-11-21  4652  	sub_stripes =3D btr=
fs_raid_array[index]=2Esub_stripes;
>31e502298d80e2 Liu Bo              2012-11-21  4653  	dev_stripes =3D btr=
fs_raid_array[index]=2Edev_stripes;
>31e502298d80e2 Liu Bo              2012-11-21  4654  	devs_max =3D btrfs_=
raid_array[index]=2Edevs_max;
>31e502298d80e2 Liu Bo              2012-11-21  4655  	devs_min =3D btrfs_=
raid_array[index]=2Edevs_min;
>31e502298d80e2 Liu Bo              2012-11-21  4656  	devs_increment =3D =
btrfs_raid_array[index]=2Edevs_increment;
>31e502298d80e2 Liu Bo              2012-11-21  4657  	ncopies =3D btrfs_r=
aid_array[index]=2Encopies;
>b2117a39fa96cf Miao Xie            2011-01-05  4658 =20
>9b3f68b9067441 Chris Mason         2008-04-18  4659  	if (type & BTRFS_BL=
OCK_GROUP_DATA) {
>ee22184b53c823 Byongho Lee         2015-12-15  4660  		max_stripe_size =
=3D SZ_1G;
>fce466eab7ac6b Qu Wenruo           2018-07-03  4661  		max_chunk_size =3D=
 BTRFS_MAX_DATA_CHUNK_SIZE;
>23f8f9b7caca83 Gui Hecheng         2014-04-21  4662  		if (!devs_max)
>062d4d1f4085c3 Qu Wenruo           2018-01-30  4663  			devs_max =3D BTRF=
S_MAX_DEVS(info);
>9b3f68b9067441 Chris Mason         2008-04-18  4664  	} else if (type & B=
TRFS_BLOCK_GROUP_METADATA) {
>1100373f8aa69e Chris Mason         2012-01-06  4665  		/* for larger file=
systems, use larger metadata chunks */
>ee22184b53c823 Byongho Lee         2015-12-15  4666  		if (fs_devices->to=
tal_rw_bytes > 50ULL * SZ_1G)
>ee22184b53c823 Byongho Lee         2015-12-15  4667  			max_stripe_size =
=3D SZ_1G;
>1100373f8aa69e Chris Mason         2012-01-06  4668  		else
>ee22184b53c823 Byongho Lee         2015-12-15  4669  			max_stripe_size =
=3D SZ_256M;
>73c5de0051533c Arne Jansen         2011-04-12  4670  		max_chunk_size =3D=
 max_stripe_size;
>23f8f9b7caca83 Gui Hecheng         2014-04-21  4671  		if (!devs_max)
>062d4d1f4085c3 Qu Wenruo           2018-01-30  4672  			devs_max =3D BTRF=
S_MAX_DEVS(info);
>a40a90a0420abd Chris Mason         2008-04-18  4673  	} else if (type & B=
TRFS_BLOCK_GROUP_SYSTEM) {
>ee22184b53c823 Byongho Lee         2015-12-15  4674  		max_stripe_size =
=3D SZ_32M;
>73c5de0051533c Arne Jansen         2011-04-12  4675  		max_chunk_size =3D=
 2 * max_stripe_size;
>23f8f9b7caca83 Gui Hecheng         2014-04-21  4676  		if (!devs_max)
>23f8f9b7caca83 Gui Hecheng         2014-04-21  4677  			devs_max =3D BTRF=
S_MAX_DEVS_SYS_CHUNK;
>73c5de0051533c Arne Jansen         2011-04-12  4678  	} else {
>351fd353215944 David Sterba        2014-05-15  4679  		btrfs_err(info, "i=
nvalid chunk type 0x%llx requested",
>73c5de0051533c Arne Jansen         2011-04-12  4680  		       type);
>73c5de0051533c Arne Jansen         2011-04-12 @4681  		BUG_ON(1);
>9b3f68b9067441 Chris Mason         2008-04-18  4682  	}
>9b3f68b9067441 Chris Mason         2008-04-18  4683 =20
>2b82032c34ec40 Yan Zheng           2008-11-17  4684  	/* we don't want a =
chunk larger than 10% of writeable space */
>2b82032c34ec40 Yan Zheng           2008-11-17  4685  	max_chunk_size =3D =
min(div_factor(fs_devices->total_rw_bytes, 1),
>2b82032c34ec40 Yan Zheng           2008-11-17  4686  			     max_chunk_si=
ze);
>9b3f68b9067441 Chris Mason         2008-04-18  4687 =20
>31e818fe7375d6 David Sterba        2015-02-20  4688  	devices_info =3D kc=
alloc(fs_devices->rw_devices, sizeof(*devices_info),
>73c5de0051533c Arne Jansen         2011-04-12  4689  			       GFP_NOFS);
>73c5de0051533c Arne Jansen         2011-04-12  4690  	if (!devices_info)
>73c5de0051533c Arne Jansen         2011-04-12  4691  		return -ENOMEM;
>0cad8a1130f77c Josef Bacik         2010-03-17  4692 =20
>9f680ce04ea19d Chris Mason         2010-04-06  4693  	/*
>73c5de0051533c Arne Jansen         2011-04-12  4694  	 * in the first pas=
s through the devices list, we gather information
>73c5de0051533c Arne Jansen         2011-04-12  4695  	 * about the availa=
ble holes on each device=2E
>9f680ce04ea19d Chris Mason         2010-04-06  4696  	 */
>73c5de0051533c Arne Jansen         2011-04-12  4697  	ndevs =3D 0;
>ebcc9301eacb99 Nikolay Borisov     2017-06-27  4698  	list_for_each_entry=
(device, &fs_devices->alloc_list, dev_alloc_list) {
>73c5de0051533c Arne Jansen         2011-04-12  4699  		u64 max_avail;
>73c5de0051533c Arne Jansen         2011-04-12  4700  		u64 dev_offset;
>b2117a39fa96cf Miao Xie            2011-01-05  4701 =20
>ebbede42d47dc7 Anand Jain          2017-12-04  4702  		if (!test_bit(BTRF=
S_DEV_STATE_WRITEABLE, &device->dev_state)) {
>31b1a2bd758f43 Julia Lawall        2012-11-03  4703  			WARN(1, KERN_ERR
>efe120a067c867 Frank Holton        2013-12-20  4704  			       "BTRFS: re=
ad-only device in alloc_list\n");
>73c5de0051533c Arne Jansen         2011-04-12  4705  			continue;
>b2117a39fa96cf Miao Xie            2011-01-05  4706  		}
>b2117a39fa96cf Miao Xie            2011-01-05  4707 =20
>e12c96214d28f9 Anand Jain          2017-12-04  4708  		if (!test_bit(BTRF=
S_DEV_STATE_IN_FS_METADATA,
>e12c96214d28f9 Anand Jain          2017-12-04  4709  					&device->dev_st=
ate) ||
>401e29c124eac2 Anand Jain          2017-12-04  4710  		    test_bit(BTRFS=
_DEV_STATE_REPLACE_TGT, &device->dev_state))
>73c5de0051533c Arne Jansen         2011-04-12  4711  			continue;
>b2117a39fa96cf Miao Xie            2011-01-05  4712 =20
>73c5de0051533c Arne Jansen         2011-04-12  4713  		if (device->total_=
bytes > device->bytes_used)
>73c5de0051533c Arne Jansen         2011-04-12  4714  			total_avail =3D d=
evice->total_bytes - device->bytes_used;
>73c5de0051533c Arne Jansen         2011-04-12  4715  		else
>73c5de0051533c Arne Jansen         2011-04-12  4716  			total_avail =3D 0=
;
>38c01b9605923c liubo               2011-08-02  4717 =20
>38c01b9605923c liubo               2011-08-02  4718  		/* If there is no =
space on this device, skip it=2E */
>38c01b9605923c liubo               2011-08-02  4719  		if (total_avail =
=3D=3D 0)
>38c01b9605923c liubo               2011-08-02  4720  			continue;
>b2117a39fa96cf Miao Xie            2011-01-05  4721 =20
>6df9a95e63395f Josef Bacik         2013-06-27  4722  		ret =3D find_free_=
dev_extent(trans, device,
>73c5de0051533c Arne Jansen         2011-04-12  4723  					   max_stripe_s=
ize * dev_stripes,
>73c5de0051533c Arne Jansen         2011-04-12  4724  					   &dev_offset,=
 &max_avail);
>73c5de0051533c Arne Jansen         2011-04-12  4725  		if (ret && ret !=
=3D -ENOSPC)
>73c5de0051533c Arne Jansen         2011-04-12  4726  			goto error;
>b2117a39fa96cf Miao Xie            2011-01-05  4727 =20
>73c5de0051533c Arne Jansen         2011-04-12  4728  		if (ret =3D=3D 0)
>73c5de0051533c Arne Jansen         2011-04-12  4729  			max_avail =3D max=
_stripe_size * dev_stripes;
>b2117a39fa96cf Miao Xie            2011-01-05  4730 =20
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4731  		if (max_avail < BT=
RFS_STRIPE_LEN * dev_stripes) {
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4732  			if (btrfs_test_op=
t(info, ENOSPC_DEBUG))
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4733  				btrfs_debug(info=
,
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4734  			"%s: devid %llu h=
as no free space, have=3D%llu want=3D%u",
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4735  					    __func__, d=
evice->devid, max_avail,
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4736  					    BTRFS_STRIP=
E_LEN * dev_stripes);
>73c5de0051533c Arne Jansen         2011-04-12  4737  			continue;
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4738  		}
>b2117a39fa96cf Miao Xie            2011-01-05  4739 =20
>063d006fa06fbf Eric Sandeen        2013-01-31  4740  		if (ndevs =3D=3D f=
s_devices->rw_devices) {
>063d006fa06fbf Eric Sandeen        2013-01-31  4741  			WARN(1, "%s: foun=
d more than %llu devices\n",
>063d006fa06fbf Eric Sandeen        2013-01-31  4742  			     __func__, fs=
_devices->rw_devices);
>063d006fa06fbf Eric Sandeen        2013-01-31  4743  			break;
>063d006fa06fbf Eric Sandeen        2013-01-31  4744  		}
>73c5de0051533c Arne Jansen         2011-04-12  4745  		devices_info[ndevs=
]=2Edev_offset =3D dev_offset;
>73c5de0051533c Arne Jansen         2011-04-12  4746  		devices_info[ndevs=
]=2Emax_avail =3D max_avail;
>73c5de0051533c Arne Jansen         2011-04-12  4747  		devices_info[ndevs=
]=2Etotal_avail =3D total_avail;
>73c5de0051533c Arne Jansen         2011-04-12  4748  		devices_info[ndevs=
]=2Edev =3D device;
>73c5de0051533c Arne Jansen         2011-04-12  4749  		++ndevs;
>b2117a39fa96cf Miao Xie            2011-01-05  4750  	}
>b2117a39fa96cf Miao Xie            2011-01-05  4751 =20
>73c5de0051533c Arne Jansen         2011-04-12  4752  	/*
>73c5de0051533c Arne Jansen         2011-04-12  4753  	 * now sort the dev=
ices by hole size / available space
>73c5de0051533c Arne Jansen         2011-04-12  4754  	 */
>73c5de0051533c Arne Jansen         2011-04-12  4755  	sort(devices_info, =
ndevs, sizeof(struct btrfs_device_info),
>73c5de0051533c Arne Jansen         2011-04-12  4756  	     btrfs_cmp_devi=
ce_info, NULL);
>b2117a39fa96cf Miao Xie            2011-01-05  4757 =20
>73c5de0051533c Arne Jansen         2011-04-12  4758  	/* round down to nu=
mber of usable stripes */
>e5600fd6fc7d19 Nikolay Borisov     2017-06-27  4759  	ndevs =3D round_dow=
n(ndevs, devs_increment);
>b2117a39fa96cf Miao Xie            2011-01-05  4760 =20
>ba89b80268c162 Qu Wenruo           2018-01-31  4761  	if (ndevs < devs_mi=
n) {
>73c5de0051533c Arne Jansen         2011-04-12  4762  		ret =3D -ENOSPC;
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4763  		if (btrfs_test_opt=
(info, ENOSPC_DEBUG)) {
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4764  			btrfs_debug(info,
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4765  	"%s: not enough dev=
ices with free space: have=3D%d minimum required=3D%d",
>ba89b80268c162 Qu Wenruo           2018-01-31  4766  				    __func__, nd=
evs, devs_min);
>4117f207d4b0d8 Qu Wenruo           2018-01-22  4767  		}
>73c5de0051533c Arne Jansen         2011-04-12  4768  		goto error;
>b2117a39fa96cf Miao Xie            2011-01-05  4769  	}
>b2117a39fa96cf Miao Xie            2011-01-05  4770 =20
>f148ef4d3a8feb Nikolay Borisov     2017-06-27  4771  	ndevs =3D min(ndevs=
, devs_max);
>f148ef4d3a8feb Nikolay Borisov     2017-06-27  4772 =20
>73c5de0051533c Arne Jansen         2011-04-12  4773  	/*
>92e222df7b8f05 Hans van Kranenburg 2018-02-05  4774  	 * The primary goal=
 is to maximize the number of stripes, so use as
>92e222df7b8f05 Hans van Kranenburg 2018-02-05  4775  	 * many devices as =
possible, even if the stripes are not maximum sized=2E
>92e222df7b8f05 Hans van Kranenburg 2018-02-05  4776  	 *
>92e222df7b8f05 Hans van Kranenburg 2018-02-05  4777  	 * The DUP profile =
stores more than one stripe per device, the
>92e222df7b8f05 Hans van Kranenburg 2018-02-05  4778  	 * max_avail is the=
 total size so we have to adjust=2E
>73c5de0051533c Arne Jansen         2011-04-12  4779  	 */
>92e222df7b8f05 Hans van Kranenburg 2018-02-05  4780  	stripe_size =3D div=
_u64(devices_info[ndevs - 1]=2Emax_avail, dev_stripes);
>73c5de0051533c Arne Jansen         2011-04-12  4781  	num_stripes =3D nde=
vs * dev_stripes;
>9f680ce04ea19d Chris Mason         2010-04-06  4782 =20
>53b381b3abeb86 David Woodhouse     2013-01-29  4783  	/*
>53b381b3abeb86 David Woodhouse     2013-01-29  4784  	 * this will have t=
o be fixed for RAID1 and RAID10 over
>53b381b3abeb86 David Woodhouse     2013-01-29  4785  	 * more drives
>53b381b3abeb86 David Woodhouse     2013-01-29  4786  	 */
>53b381b3abeb86 David Woodhouse     2013-01-29  4787  	data_stripes =3D nu=
m_stripes / ncopies;
>53b381b3abeb86 David Woodhouse     2013-01-29  4788 =20
>500ceed807c4af Nikolay Borisov     2017-07-14  4789  	if (type & BTRFS_BL=
OCK_GROUP_RAID5)
>53b381b3abeb86 David Woodhouse     2013-01-29  4790  		data_stripes =3D n=
um_stripes - 1;
>500ceed807c4af Nikolay Borisov     2017-07-14  4791 =20
>500ceed807c4af Nikolay Borisov     2017-07-14  4792  	if (type & BTRFS_BL=
OCK_GROUP_RAID6)
>53b381b3abeb86 David Woodhouse     2013-01-29  4793  		data_stripes =3D n=
um_stripes - 2;
>86db25785a6e7c Chris Mason         2013-02-20  4794 =20
>86db25785a6e7c Chris Mason         2013-02-20  4795  	/*
>86db25785a6e7c Chris Mason         2013-02-20  4796  	 * Use the number o=
f data stripes to figure out how big this chunk
>86db25785a6e7c Chris Mason         2013-02-20  4797  	 * is really going =
to be in terms of logical address space,
>720b86a53a1024 Hans van Kranenburg 2018-10-04  4798  	 * and compare that=
 answer with the max chunk size=2E If it's higher,
>720b86a53a1024 Hans van Kranenburg 2018-10-04  4799  	 * we try to reduce=
 stripe_size=2E
>86db25785a6e7c Chris Mason         2013-02-20  4800  	 */
>86db25785a6e7c Chris Mason         2013-02-20  4801  	if (stripe_size * d=
ata_stripes > max_chunk_size) {
>793ff2c88c6397 Qu Wenruo           2018-01-31  4802  		/*
>720b86a53a1024 Hans van Kranenburg 2018-10-04  4803  		 * Reduce stripe_s=
ize, round it up to a 16MB boundary again and
>720b86a53a1024 Hans van Kranenburg 2018-10-04  4804  		 * then use it, un=
less it ends up being even bigger than the
>720b86a53a1024 Hans van Kranenburg 2018-10-04  4805  		 * previous value =
we had already=2E
>86db25785a6e7c Chris Mason         2013-02-20  4806  		 */
>720b86a53a1024 Hans van Kranenburg 2018-10-04  4807  		stripe_size =3D mi=
n(round_up(div_u64(max_chunk_size,
>720b86a53a1024 Hans van Kranenburg 2018-10-04  4808  						   data_stripe=
s), SZ_16M),
>793ff2c88c6397 Qu Wenruo           2018-01-31  4809  				  stripe_size);
>86db25785a6e7c Chris Mason         2013-02-20  4810  	}
>86db25785a6e7c Chris Mason         2013-02-20  4811 =20
>37db63a400d3ba Ilya Dryomov        2012-04-13  4812  	/* align to BTRFS_S=
TRIPE_LEN */
>500ceed807c4af Nikolay Borisov     2017-07-14  4813  	stripe_size =3D rou=
nd_down(stripe_size, BTRFS_STRIPE_LEN);
>9f680ce04ea19d Chris Mason         2010-04-06  4814 =20
>b2117a39fa96cf Miao Xie            2011-01-05  4815  	map =3D kmalloc(map=
_lookup_size(num_stripes), GFP_NOFS);
>b2117a39fa96cf Miao Xie            2011-01-05  4816  	if (!map) {
>b2117a39fa96cf Miao Xie            2011-01-05  4817  		ret =3D -ENOMEM;
>b2117a39fa96cf Miao Xie            2011-01-05  4818  		goto error;
>b2117a39fa96cf Miao Xie            2011-01-05  4819  	}
>b2117a39fa96cf Miao Xie            2011-01-05  4820  	map->num_stripes =
=3D num_stripes;
>9b3f68b9067441 Chris Mason         2008-04-18  4821 =20
>73c5de0051533c Arne Jansen         2011-04-12  4822  	for (i =3D 0; i < n=
devs; ++i) {
>73c5de0051533c Arne Jansen         2011-04-12  4823  		for (j =3D 0; j < =
dev_stripes; ++j) {
>73c5de0051533c Arne Jansen         2011-04-12  4824  			int s =3D i * dev=
_stripes + j;
>73c5de0051533c Arne Jansen         2011-04-12  4825  			map->stripes[s]=
=2Edev =3D devices_info[i]=2Edev;
>73c5de0051533c Arne Jansen         2011-04-12  4826  			map->stripes[s]=
=2Ephysical =3D devices_info[i]=2Edev_offset +
>73c5de0051533c Arne Jansen         2011-04-12  4827  						   j * stripe_=
size;
>6324fbf334f458 Chris Mason         2008-03-24  4828  		}
>6324fbf334f458 Chris Mason         2008-03-24  4829  	}
>500ceed807c4af Nikolay Borisov     2017-07-14  4830  	map->stripe_len =3D=
 BTRFS_STRIPE_LEN;
>500ceed807c4af Nikolay Borisov     2017-07-14  4831  	map->io_align =3D B=
TRFS_STRIPE_LEN;
>500ceed807c4af Nikolay Borisov     2017-07-14  4832  	map->io_width =3D B=
TRFS_STRIPE_LEN;
>2b82032c34ec40 Yan Zheng           2008-11-17  4833  	map->type =3D type;
>2b82032c34ec40 Yan Zheng           2008-11-17  4834  	map->sub_stripes =
=3D sub_stripes;
>0b86a832a1f38a Chris Mason         2008-03-24  4835 =20
>53b381b3abeb86 David Woodhouse     2013-01-29  4836  	num_bytes =3D strip=
e_size * data_stripes;
>0b86a832a1f38a Chris Mason         2008-03-24  4837 =20
>6bccf3ab1e1f09 Jeff Mahoney        2016-06-21  4838  	trace_btrfs_chunk_a=
lloc(info, map, start, num_bytes);
>1abe9b8a138c99 liubo               2011-03-24  4839 =20
>172ddd60a662c4 David Sterba        2011-04-21  4840  	em =3D alloc_extent=
_map();
>2b82032c34ec40 Yan Zheng           2008-11-17  4841  	if (!em) {
>298a8f9cf17d2f Wang Shilong        2014-06-19  4842  		kfree(map);
>b2117a39fa96cf Miao Xie            2011-01-05  4843  		ret =3D -ENOMEM;
>b2117a39fa96cf Miao Xie            2011-01-05  4844  		goto error;
>593060d756e0c2 Chris Mason         2008-03-25  4845  	}
>298a8f9cf17d2f Wang Shilong        2014-06-19  4846  	set_bit(EXTENT_FLAG=
_FS_MAPPING, &em->flags);
>95617d69326ce3 Jeff Mahoney        2015-06-03  4847  	em->map_lookup =3D =
map;
>2b82032c34ec40 Yan Zheng           2008-11-17  4848  	em->start =3D start=
;
>73c5de0051533c Arne Jansen         2011-04-12  4849  	em->len =3D num_byt=
es;
>2b82032c34ec40 Yan Zheng           2008-11-17  4850  	em->block_start =3D=
 0;
>2b82032c34ec40 Yan Zheng           2008-11-17  4851  	em->block_len =3D e=
m->len;
>6df9a95e63395f Josef Bacik         2013-06-27  4852  	em->orig_block_len =
=3D stripe_size;
>593060d756e0c2 Chris Mason         2008-03-25  4853 =20
>0b246afa62b0cf Jeff Mahoney        2016-06-22  4854  	em_tree =3D &info->=
mapping_tree=2Emap_tree;
>890871be854b5f Chris Mason         2009-09-02  4855  	write_lock(&em_tree=
->lock);
>09a2a8f96e3009 Josef Bacik         2013-04-05  4856  	ret =3D add_extent_=
mapping(em_tree, em, 0);
>0f5d42b287f324 Josef Bacik         2013-01-31  4857  	if (ret) {
>1efb72a3c3ea8e Nikolay Borisov     2017-08-21  4858  		write_unlock(&em_t=
ree->lock);
>2b82032c34ec40 Yan Zheng           2008-11-17  4859  		free_extent_map(em=
);
>1dd4602fa74273 Mark Fasheh         2011-09-08  4860  		goto error;
>0f5d42b287f324 Josef Bacik         2013-01-31  4861  	}
>0b86a832a1f38a Chris Mason         2008-03-24  4862 =20
>1efb72a3c3ea8e Nikolay Borisov     2017-08-21  4863  	list_add_tail(&em->=
list, &trans->transaction->pending_chunks);
>1efb72a3c3ea8e Nikolay Borisov     2017-08-21  4864  	refcount_inc(&em->r=
efs);
>1efb72a3c3ea8e Nikolay Borisov     2017-08-21  4865  	write_unlock(&em_tr=
ee->lock);
>1efb72a3c3ea8e Nikolay Borisov     2017-08-21  4866 =20
>e7e02096d98388 Nikolay Borisov     2018-06-20  4867  	ret =3D btrfs_make_=
block_group(trans, 0, type, start, num_bytes);
>6df9a95e63395f Josef Bacik         2013-06-27  4868  	if (ret)
>6df9a95e63395f Josef Bacik         2013-06-27  4869  		goto error_del_ext=
ent;
>2b82032c34ec40 Yan Zheng           2008-11-17  4870 =20
>7cc8e58d53cd22 Miao Xie            2014-09-03  4871  	for (i =3D 0; i < m=
ap->num_stripes; i++) {
>7cc8e58d53cd22 Miao Xie            2014-09-03  4872  		num_bytes =3D map-=
>stripes[i]=2Edev->bytes_used + stripe_size;
>7cc8e58d53cd22 Miao Xie            2014-09-03  4873  		btrfs_device_set_b=
ytes_used(map->stripes[i]=2Edev, num_bytes);
>fb814f2150136e Nikolay Borisov     2019-05-17  4874  		map->stripes[i]=2E=
dev->has_pending_chunks =3D true;
>7cc8e58d53cd22 Miao Xie            2014-09-03  4875  	}
>43530c46cc55cf Miao Xie            2014-09-03  4876 =20
>a5ed45f8224f2c Nikolay Borisov     2017-05-11  4877  	atomic64_sub(stripe=
_size * map->num_stripes, &info->free_chunk_space);
>1c1161870c8bcb Miao Xie            2014-09-03  4878 =20
>0f5d42b287f324 Josef Bacik         2013-01-31  4879  	free_extent_map(em)=
;
>0b246afa62b0cf Jeff Mahoney        2016-06-22  4880  	check_raid56_incomp=
at_flag(info, type);
>53b381b3abeb86 David Woodhouse     2013-01-29  4881 =20
>b2117a39fa96cf Miao Xie            2011-01-05  4882  	kfree(devices_info)=
;
>2b82032c34ec40 Yan Zheng           2008-11-17  4883  	return 0;
>b2117a39fa96cf Miao Xie            2011-01-05  4884 =20
>6df9a95e63395f Josef Bacik         2013-06-27  4885  error_del_extent:
>0f5d42b287f324 Josef Bacik         2013-01-31  4886  	write_lock(&em_tree=
->lock);
>0f5d42b287f324 Josef Bacik         2013-01-31  4887  	remove_extent_mappi=
ng(em_tree, em);
>0f5d42b287f324 Josef Bacik         2013-01-31  4888  	write_unlock(&em_tr=
ee->lock);
>0f5d42b287f324 Josef Bacik         2013-01-31  4889 =20
>0f5d42b287f324 Josef Bacik         2013-01-31  4890  	/* One for our allo=
cation */
>0f5d42b287f324 Josef Bacik         2013-01-31  4891  	free_extent_map(em)=
;
>0f5d42b287f324 Josef Bacik         2013-01-31  4892  	/* One for the tree=
 reference */
>0f5d42b287f324 Josef Bacik         2013-01-31  4893  	free_extent_map(em)=
;
>495e64f4fe0363 Filipe Manana       2014-12-02  4894  	/* One for the pend=
ing_chunks list reference */
>495e64f4fe0363 Filipe Manana       2014-12-02  4895  	free_extent_map(em)=
;
>b2117a39fa96cf Miao Xie            2011-01-05  4896  error:
>b2117a39fa96cf Miao Xie            2011-01-05  4897  	kfree(devices_info)=
;
>b2117a39fa96cf Miao Xie            2011-01-05  4898  	return ret;
>2b82032c34ec40 Yan Zheng           2008-11-17  4899  }
>2b82032c34ec40 Yan Zheng           2008-11-17  4900 =20
>
>:::::: The code at line 4681 was first introduced by commit
>:::::: 73c5de0051533cbdf2bb656586c3eb21a475aa7d btrfs: quasi-round-robin =
for chunk allocation
>
>:::::: TO: Arne Jansen <sensille@gmx=2Enet>
>:::::: CC: Arne Jansen <sensille@gmx=2Enet>
>


--=20
Kees Cook
