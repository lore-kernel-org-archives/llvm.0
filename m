Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAC67B
	for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 08:40:01 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z97so19408622ede.8
        for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 01:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk3gcbpb6ZYdoK0dmBi4jOV1xqzE9DhnWLfW4dnfw1o=;
        b=bSckSaTpoDSYDnZKmrDGPhCnNoj7QmeLYurYpyqW/6AOT38+tutsL61JoVA1qAgC0R
         9RELEFzEPRkv5++j+WqaqPJjgS1OIT7fKLEIJI86snUsL04wlj/16nrzEZaCqfLKL+0K
         tl16JtlbvKcfnrPnppzAt2DpYWxzzakTLBOexPba+jG3jIf62KZnlMCDX6oG67LKNrEO
         UpY5O909xFk/eJgzqQ+9rURKUoiUhZEmmy2ITxIS8ZnvnE+J8fbNimgclFIVwOHHHUyN
         WPbiiC2sS4VxQqzSCPnGED/bqHy0HUmDNqK+ZXdqzDU4ZyTTPZiy9JDRN1nZkJEDLjls
         Vo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bk3gcbpb6ZYdoK0dmBi4jOV1xqzE9DhnWLfW4dnfw1o=;
        b=TQwFGo9XqlEi+sxJKLHAOn1bG+E4p+LoAYQuacw4KPhwVtSuoSQFOiBjk3cDMAyi25
         PvsVPOW4XUyOcAULYTnT9voTLc2TEb0276YY6DXS8gb9hS9xs9mrKnzjzLVUUDT9Wqog
         xrRb47dLyfrBuGm+9xqaOUTw1/10aU0uKhgvGz8OT+Y4r/r6UVu5GdkxhDnzykG4np6L
         XD/5oSyyWN239XIgFH41U38imfqN0aWVIrBMFMcw+GNKrynnYaFG8BJGGaaTlN7lmxlz
         PW4bEv7eVdu+53Ov1xYs7q8ww2XlD7sYXrfZh9y1fPQPxMdWWWe0UjPQJ6r5biEyb5MB
         pcJg==
X-Gm-Message-State: ACrzQf1KWgDF/QV1NS+wY/rYHtzQgbR94sZUhlYSVEqoVQ2TmVP7Xabe
	QkSOUdZ/ZGo18LcGE4JUm2XIajhthqkALJeugkA=
X-Google-Smtp-Source: AMsMyM5TFQMq+6oIkQC4pJeiFkR3ENjx2BxdlwqxF+j7Pdn6PVIhM6Dsu/6Z3Fc7NqyONQQt4tF1oifJsx8m1bPhmUA=
X-Received: by 2002:a05:6402:11c9:b0:45d:aa9b:5193 with SMTP id
 j9-20020a05640211c900b0045daa9b5193mr1599459edw.372.1666082399690; Tue, 18
 Oct 2022 01:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210181318.WUNV3QRv-lkp@intel.com> <CAD-N9QX8tHSePqzQ8QZEYmAy6XTV5DN1Q3C-s7YYeu304hi=YA@mail.gmail.com>
In-Reply-To: <CAD-N9QX8tHSePqzQ8QZEYmAy6XTV5DN1Q3C-s7YYeu304hi=YA@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 18 Oct 2022 16:37:57 +0800
Message-ID: <CAD-N9QXRz0+YiirOp+3wZzddR1dg4_W69W4-yZgp2a_EriDKkQ@mail.gmail.com>
Subject: Re: [linux-next:master 1304/1443] fs/jfs/jfs_dmap.c:196:23: warning:
 result of comparison of constant 8796093022201 with expression of type 'int'
 is always false
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Dave Kleikamp <dave.kleikamp@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 18, 2022 at 4:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> On Tue, Oct 18, 2022 at 1:50 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   4ca786ae6681b90b0ec3f4c55c89d12f835f8944
> > commit: 920f4b7e923b35fd9d117fd3cb616b310cd41010 [1304/1443] fs: jfs: fix shift-out-of-bounds in dbAllocAG
> > config: mips-randconfig-r005-20221017
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install mips cross compiling tool for clang build
> >         # apt-get install binutils-mipsel-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=920f4b7e923b35fd9d117fd3cb616b310cd41010
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 920f4b7e923b35fd9d117fd3cb616b310cd41010
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/jfs/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> fs/jfs/jfs_dmap.c:196:23: warning: result of comparison of constant 8796093022201 with expression of type 'int' is always false [-Wtautological-constant-out-of-range-compare]
> >            if (bmp->db_agl2size > MAXMAPSIZE - L2MAXAG) {
> >                ~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
> >    1 warning generated.
>
> Hi Dave,
>
> I did not double check the upper bound of db_agl2size. It seems the
> upper bound should be L2MAXL2SIZE - L2MAXAG, other than MAXMAPSIZE -
> L2MAXAG.
>
> And L2MAXL2SIZE = L2BPERDMAP + 3 * L2LPERCTL = 13+3*10 = 43.
>
> I will send a fixes commit.

The fixes patch is here:
https://marc.info/?l=jfs-discussion&m=166608184908883&w=2

>
> >
> >
> > vim +/int +196 fs/jfs/jfs_dmap.c
> >
> >    135
> >    136  /*
> >    137   * NAME:        dbMount()
> >    138   *
> >    139   * FUNCTION:    initializate the block allocation map.
> >    140   *
> >    141   *              memory is allocated for the in-core bmap descriptor and
> >    142   *              the in-core descriptor is initialized from disk.
> >    143   *
> >    144   * PARAMETERS:
> >    145   *      ipbmap  - pointer to in-core inode for the block map.
> >    146   *
> >    147   * RETURN VALUES:
> >    148   *      0       - success
> >    149   *      -ENOMEM - insufficient memory
> >    150   *      -EIO    - i/o error
> >    151   *      -EINVAL - wrong bmap data
> >    152   */
> >    153  int dbMount(struct inode *ipbmap)
> >    154  {
> >    155          struct bmap *bmp;
> >    156          struct dbmap_disk *dbmp_le;
> >    157          struct metapage *mp;
> >    158          int i, err;
> >    159
> >    160          /*
> >    161           * allocate/initialize the in-memory bmap descriptor
> >    162           */
> >    163          /* allocate memory for the in-memory bmap descriptor */
> >    164          bmp = kmalloc(sizeof(struct bmap), GFP_KERNEL);
> >    165          if (bmp == NULL)
> >    166                  return -ENOMEM;
> >    167
> >    168          /* read the on-disk bmap descriptor. */
> >    169          mp = read_metapage(ipbmap,
> >    170                             BMAPBLKNO << JFS_SBI(ipbmap->i_sb)->l2nbperpage,
> >    171                             PSIZE, 0);
> >    172          if (mp == NULL) {
> >    173                  err = -EIO;
> >    174                  goto err_kfree_bmp;
> >    175          }
> >    176
> >    177          /* copy the on-disk bmap descriptor to its in-memory version. */
> >    178          dbmp_le = (struct dbmap_disk *) mp->data;
> >    179          bmp->db_mapsize = le64_to_cpu(dbmp_le->dn_mapsize);
> >    180          bmp->db_nfree = le64_to_cpu(dbmp_le->dn_nfree);
> >    181          bmp->db_l2nbperpage = le32_to_cpu(dbmp_le->dn_l2nbperpage);
> >    182          bmp->db_numag = le32_to_cpu(dbmp_le->dn_numag);
> >    183          if (!bmp->db_numag) {
> >    184                  err = -EINVAL;
> >    185                  goto err_release_metapage;
> >    186          }
> >    187
> >    188          bmp->db_maxlevel = le32_to_cpu(dbmp_le->dn_maxlevel);
> >    189          bmp->db_maxag = le32_to_cpu(dbmp_le->dn_maxag);
> >    190          bmp->db_agpref = le32_to_cpu(dbmp_le->dn_agpref);
> >    191          bmp->db_aglevel = le32_to_cpu(dbmp_le->dn_aglevel);
> >    192          bmp->db_agheight = le32_to_cpu(dbmp_le->dn_agheight);
> >    193          bmp->db_agwidth = le32_to_cpu(dbmp_le->dn_agwidth);
> >    194          bmp->db_agstart = le32_to_cpu(dbmp_le->dn_agstart);
> >    195          bmp->db_agl2size = le32_to_cpu(dbmp_le->dn_agl2size);
> >  > 196          if (bmp->db_agl2size > MAXMAPSIZE - L2MAXAG) {
> >    197                  err = -EINVAL;
> >    198                  goto err_release_metapage;
> >    199          }
> >    200
> >    201          for (i = 0; i < MAXAG; i++)
> >    202                  bmp->db_agfree[i] = le64_to_cpu(dbmp_le->dn_agfree[i]);
> >    203          bmp->db_agsize = le64_to_cpu(dbmp_le->dn_agsize);
> >    204          bmp->db_maxfreebud = dbmp_le->dn_maxfreebud;
> >    205
> >    206          /* release the buffer. */
> >    207          release_metapage(mp);
> >    208
> >    209          /* bind the bmap inode and the bmap descriptor to each other. */
> >    210          bmp->db_ipbmap = ipbmap;
> >    211          JFS_SBI(ipbmap->i_sb)->bmap = bmp;
> >    212
> >    213          memset(bmp->db_active, 0, sizeof(bmp->db_active));
> >    214
> >    215          /*
> >    216           * allocate/initialize the bmap lock
> >    217           */
> >    218          BMAP_LOCK_INIT(bmp);
> >    219
> >    220          return (0);
> >    221
> >    222  err_release_metapage:
> >    223          release_metapage(mp);
> >    224  err_kfree_bmp:
> >    225          kfree(bmp);
> >    226          return err;
> >    227  }
> >    228
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
