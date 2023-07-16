Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69DC8F40;
	Sun, 16 Jul 2023 23:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6A3C433C7;
	Sun, 16 Jul 2023 23:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689551854;
	bh=PuyqwBxfrkbckdxlqhleCiD/Nk3qhnMFowRg13wCIwM=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=I+B9g3kEorgSeWYzmroedymSg59ipN+kR17pncI968RNdKqNNw3WXYTVnmIBlE9rA
	 e1E1qdgebpIvgillI5rVz0xyTs4oL3hRb4hdPearFIHnSiq7oLpJ6atlNFLZtGUazh
	 3CHSF2vIcW0XMu12Ed8L56llYmXX/k+pE93OoPGpnp379LOeVYUI5qmOOO8oDUxr5k
	 3vpI5Lh2s2x/cvSKQGQs2Z9xJLlLIQ3966fPp7ShQypA059NcXP4ratD/euhaoa7lv
	 g086LPZmjlrU+rk9hKJ4nI/NBrG4gIR6c8cTL3itQv18Cg9rUbuL4dKo0ycgPWzG5R
	 2rJD4N4fdzEjw==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5633b7e5f90so2691975eaf.1;
        Sun, 16 Jul 2023 16:57:34 -0700 (PDT)
X-Gm-Message-State: ABy/qLYtGgPU5oY/nk4ppuiuHfUObcIoHtlAcwTx0/IUTyfj2Jlu6Umi
	vFDglmfJ4H6jo14zklVeK2TpGYcgL7eqiojCMUw=
X-Google-Smtp-Source: APBJJlGsg2yEge4lcxVvhFmGlY+vrK99GxDKpzCMHwhp8yL6NlNa8Dk44u1CllkEQQqxwpCOWjxQQNlcjKXu39J+P2A=
X-Received: by 2002:a4a:3906:0:b0:567:154:40ee with SMTP id
 m6-20020a4a3906000000b00567015440eemr4553313ooa.2.1689551853549; Sun, 16 Jul
 2023 16:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:4c7:0:b0:4e8:f6ff:2aab with HTTP; Sun, 16 Jul 2023
 16:57:33 -0700 (PDT)
In-Reply-To: <202307170312.GpAReBVJ-lkp@intel.com>
References: <202307170312.GpAReBVJ-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 17 Jul 2023 08:57:33 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9NdWq+G4i5ACdtBFMso6JtbgqUTT+egB1kRYW_3xCmxA@mail.gmail.com>
Message-ID: <CAKYAXd9NdWq+G4i5ACdtBFMso6JtbgqUTT+egB1kRYW_3xCmxA@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 2/2] fs/smb/server/vfs.c:113:41:
 error: use of undeclared identifier 'KSMBD_SHARE_FLAG_CROSSMNT'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

Hi kernel test robot,

Thanks for your report.
I have fixed it and push it again.

Thanks again!

2023-07-17 4:59 GMT+09:00, kernel test robot <lkp@intel.com>:
> tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
> head:   ad297d25edb98d80a162f7ab8280ffbc025e8ebf
> commit: ad297d25edb98d80a162f7ab8280ffbc025e8ebf [2/2] ksmbd: check if a
> mount point is crossed during path lookup
> config: hexagon-randconfig-r041-20230717
> (https://download.01.org/0day-ci/archive/20230717/202307170312.GpAReBVJ-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git
> 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce:
> (https://download.01.org/0day-ci/archive/20230717/202307170312.GpAReBVJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version
> of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202307170312.GpAReBVJ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from fs/smb/server/vfs.c:11:
>    In file included from include/linux/backing-dev.h:16:
>    In file included from include/linux/writeback.h:13:
>    In file included from include/linux/blk_types.h:10:
>    In file included from include/linux/bvec.h:10:
>    In file included from include/linux/highmem.h:12:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic
> on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      547 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:560:61: warning: performing pointer arithmetic
> on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      560 |         val = __le16_to_cpu((__le16
> __force)__raw_readw(PCI_IOBASE + addr));
>          |
> ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from
> macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from fs/smb/server/vfs.c:11:
>    In file included from include/linux/backing-dev.h:16:
>    In file included from include/linux/writeback.h:13:
>    In file included from include/linux/blk_types.h:10:
>    In file included from include/linux/bvec.h:10:
>    In file included from include/linux/highmem.h:12:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:573:61: warning: performing pointer arithmetic
> on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      573 |         val = __le32_to_cpu((__le32
> __force)__raw_readl(PCI_IOBASE + addr));
>          |
> ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from
> macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from fs/smb/server/vfs.c:11:
>    In file included from include/linux/backing-dev.h:16:
>    In file included from include/linux/writeback.h:13:
>    In file included from include/linux/blk_types.h:10:
>    In file included from include/linux/bvec.h:10:
>    In file included from include/linux/highmem.h:12:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:584:33: warning: performing pointer arithmetic
> on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      584 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:594:59: warning: performing pointer arithmetic
> on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE
> + addr);
>          |                                                       ~~~~~~~~~~
> ^
>    include/asm-generic/io.h:604:59: warning: performing pointer arithmetic
> on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE
> + addr);
>          |                                                       ~~~~~~~~~~
> ^
>>> fs/smb/server/vfs.c:113:41: error: use of undeclared identifier
>>> 'KSMBD_SHARE_FLAG_CROSSMNT'
>      113 |         if (test_share_config_flag(share_conf,
> KSMBD_SHARE_FLAG_CROSSMNT)) {
>          |                                                ^
>    6 warnings and 1 error generated.
>
>
> vim +/KSMBD_SHARE_FLAG_CROSSMNT +113 fs/smb/server/vfs.c
>
>     63	
>     64	static int ksmbd_vfs_path_lookup_locked(struct ksmbd_share_config
> *share_conf,
>     65						char *pathname, unsigned int flags,
>     66						struct path *parent_path,
>     67						struct path *path)
>     68	{
>     69		struct qstr last;
>     70		struct filename *filename;
>     71		struct path *root_share_path = &share_conf->vfs_path;
>     72		int err, type;
>     73		struct dentry *d;
>     74	
>     75		if (pathname[0] == '\0') {
>     76			pathname = share_conf->path;
>     77			root_share_path = NULL;
>     78		} else {
>     79			flags |= LOOKUP_BENEATH;
>     80		}
>     81	
>     82		filename = getname_kernel(pathname);
>     83		if (IS_ERR(filename))
>     84			return PTR_ERR(filename);
>     85	
>     86		err = vfs_path_parent_lookup(filename, flags,
>     87					     parent_path, &last, &type,
>     88					     root_share_path);
>     89		if (err) {
>     90			putname(filename);
>     91			return err;
>     92		}
>     93	
>     94		if (unlikely(type != LAST_NORM)) {
>     95			path_put(parent_path);
>     96			putname(filename);
>     97			return -ENOENT;
>     98		}
>     99	
>    100		inode_lock_nested(parent_path->dentry->d_inode, I_MUTEX_PARENT);
>    101		d = lookup_one_qstr_excl(&last, parent_path->dentry, 0);
>    102		if (IS_ERR(d))
>    103			goto err_out;
>    104	
>    105		if (d_is_negative(d)) {
>    106			dput(d);
>    107			goto err_out;
>    108		}
>    109	
>    110		path->dentry = d;
>    111		path->mnt = mntget(parent_path->mnt);
>    112	
>  > 113		if (test_share_config_flag(share_conf, KSMBD_SHARE_FLAG_CROSSMNT))
> {
>    114			err = follow_down(path, 0);
>    115			if (err < 0) {
>    116				path_put(path);
>    117				goto err_out;
>    118			}
>    119		}
>    120	
>    121		putname(filename);
>    122		return 0;
>    123	
>    124	err_out:
>    125		inode_unlock(d_inode(parent_path->dentry));
>    126		path_put(parent_path);
>    127		putname(filename);
>    128		return -ENOENT;
>    129	}
>    130	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
