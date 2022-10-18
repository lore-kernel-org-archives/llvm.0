Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714C1FAF
	for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 08:13:13 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id sc25so30284833ejc.12
        for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 01:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg0IvBvRc/jWKoscgmv8LC7T7fuhyAMOnCOCCTW5TsM=;
        b=ezrJf0RfI2HtJjEOXT4vDbWHA7yh2Yc8eSv3LTUoq6q3I5esKSps5dXV7Q/vEKeVWz
         60pO3XMXlGI1qgNy5LzDTCiDm1b09K24N5jONKTDyxcVZ1lpIwE6vmltl6X7A55XQk+O
         kqWHbf8gUPZfEgrqeAorW5lEuJRAxKZqXJ4J4psHAygpjwCd1pejMVQmTunVtKjGhlMV
         xvDA0dToF9jGA53sg95KpWNv0LYgz2/3k7PsXth/PMNDGyDcSQh+6rk3XEb4wzIu9pax
         SqsoHfKM23hNui4lB8eOIgNLXjt4PHTJO8FZSb528bqfHcK9++3fPXJCXLXYSiGJtOPO
         B2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg0IvBvRc/jWKoscgmv8LC7T7fuhyAMOnCOCCTW5TsM=;
        b=dGqPqWImfUOxESyFysYH9nVw16SbQ2OK95DM5ZpFp+OOq8ILoiEEf078ueVmIqP5lQ
         CgS+fxiqS6mJu1sWXgQ13VPksO0aUblNWVR9W7uUjxTJF74AiihV0Pa7ZJKL7jgQtxYD
         QA19lhN6UxwoNx8nU/EQL42JRwq0THL5f95CRUwPZ6WPDuw2o1x0CIdgccGC5h4w0ZCY
         4+SYAC4hcY452fcinRm52FdvKvYhybGl/CvRYVeNb9nHUY9BtexmnK2dV0EKprfUTRa6
         jTePnbcRT/asZiiQjVHlIIFzlI0Fe6NR+3AkjCxatqpGfVJsYj0YTOBs3jOwwL8NIUNn
         Gv/g==
X-Gm-Message-State: ACrzQf1ftatzrcR3Qd2qy0d7s/hS6fiRBxR2UIANMwUO449hDsNtuB9K
	0wO7RYbXiOsMBJlM/wZtwtBwNtv/ssq6gPwK0S4oZB45nBhueSRl
X-Google-Smtp-Source: AMsMyM67Kc69Fsq4B4x4cUbiU+DBeqUy8a6ZNRx5F555H7x4SrGvXm2a9EMeJ16soNabymYYAMRSpR9SSYEQK2rpXuU=
X-Received: by 2002:a17:907:16a5:b0:78d:e608:f073 with SMTP id
 hc37-20020a17090716a500b0078de608f073mr1408077ejc.753.1666080791544; Tue, 18
 Oct 2022 01:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210181318.WUNV3QRv-lkp@intel.com>
In-Reply-To: <202210181318.WUNV3QRv-lkp@intel.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 18 Oct 2022 16:11:08 +0800
Message-ID: <CAD-N9QX8tHSePqzQ8QZEYmAy6XTV5DN1Q3C-s7YYeu304hi=YA@mail.gmail.com>
Subject: Re: [linux-next:master 1304/1443] fs/jfs/jfs_dmap.c:196:23: warning:
 result of comparison of constant 8796093022201 with expression of type 'int'
 is always false
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Dave Kleikamp <dave.kleikamp@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 18, 2022 at 1:50 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4ca786ae6681b90b0ec3f4c55c89d12f835f8944
> commit: 920f4b7e923b35fd9d117fd3cb616b310cd41010 [1304/1443] fs: jfs: fix shift-out-of-bounds in dbAllocAG
> config: mips-randconfig-r005-20221017
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mipsel-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=920f4b7e923b35fd9d117fd3cb616b310cd41010
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 920f4b7e923b35fd9d117fd3cb616b310cd41010
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/jfs/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> fs/jfs/jfs_dmap.c:196:23: warning: result of comparison of constant 8796093022201 with expression of type 'int' is always false [-Wtautological-constant-out-of-range-compare]
>            if (bmp->db_agl2size > MAXMAPSIZE - L2MAXAG) {
>                ~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.

Hi Dave,

I did not double check the upper bound of db_agl2size. It seems the
upper bound should be L2MAXL2SIZE - L2MAXAG, other than MAXMAPSIZE -
L2MAXAG.

And L2MAXL2SIZE = L2BPERDMAP + 3 * L2LPERCTL = 13+3*10 = 43.

I will send a fixes commit.

>
>
> vim +/int +196 fs/jfs/jfs_dmap.c
>
>    135
>    136  /*
>    137   * NAME:        dbMount()
>    138   *
>    139   * FUNCTION:    initializate the block allocation map.
>    140   *
>    141   *              memory is allocated for the in-core bmap descriptor and
>    142   *              the in-core descriptor is initialized from disk.
>    143   *
>    144   * PARAMETERS:
>    145   *      ipbmap  - pointer to in-core inode for the block map.
>    146   *
>    147   * RETURN VALUES:
>    148   *      0       - success
>    149   *      -ENOMEM - insufficient memory
>    150   *      -EIO    - i/o error
>    151   *      -EINVAL - wrong bmap data
>    152   */
>    153  int dbMount(struct inode *ipbmap)
>    154  {
>    155          struct bmap *bmp;
>    156          struct dbmap_disk *dbmp_le;
>    157          struct metapage *mp;
>    158          int i, err;
>    159
>    160          /*
>    161           * allocate/initialize the in-memory bmap descriptor
>    162           */
>    163          /* allocate memory for the in-memory bmap descriptor */
>    164          bmp = kmalloc(sizeof(struct bmap), GFP_KERNEL);
>    165          if (bmp == NULL)
>    166                  return -ENOMEM;
>    167
>    168          /* read the on-disk bmap descriptor. */
>    169          mp = read_metapage(ipbmap,
>    170                             BMAPBLKNO << JFS_SBI(ipbmap->i_sb)->l2nbperpage,
>    171                             PSIZE, 0);
>    172          if (mp == NULL) {
>    173                  err = -EIO;
>    174                  goto err_kfree_bmp;
>    175          }
>    176
>    177          /* copy the on-disk bmap descriptor to its in-memory version. */
>    178          dbmp_le = (struct dbmap_disk *) mp->data;
>    179          bmp->db_mapsize = le64_to_cpu(dbmp_le->dn_mapsize);
>    180          bmp->db_nfree = le64_to_cpu(dbmp_le->dn_nfree);
>    181          bmp->db_l2nbperpage = le32_to_cpu(dbmp_le->dn_l2nbperpage);
>    182          bmp->db_numag = le32_to_cpu(dbmp_le->dn_numag);
>    183          if (!bmp->db_numag) {
>    184                  err = -EINVAL;
>    185                  goto err_release_metapage;
>    186          }
>    187
>    188          bmp->db_maxlevel = le32_to_cpu(dbmp_le->dn_maxlevel);
>    189          bmp->db_maxag = le32_to_cpu(dbmp_le->dn_maxag);
>    190          bmp->db_agpref = le32_to_cpu(dbmp_le->dn_agpref);
>    191          bmp->db_aglevel = le32_to_cpu(dbmp_le->dn_aglevel);
>    192          bmp->db_agheight = le32_to_cpu(dbmp_le->dn_agheight);
>    193          bmp->db_agwidth = le32_to_cpu(dbmp_le->dn_agwidth);
>    194          bmp->db_agstart = le32_to_cpu(dbmp_le->dn_agstart);
>    195          bmp->db_agl2size = le32_to_cpu(dbmp_le->dn_agl2size);
>  > 196          if (bmp->db_agl2size > MAXMAPSIZE - L2MAXAG) {
>    197                  err = -EINVAL;
>    198                  goto err_release_metapage;
>    199          }
>    200
>    201          for (i = 0; i < MAXAG; i++)
>    202                  bmp->db_agfree[i] = le64_to_cpu(dbmp_le->dn_agfree[i]);
>    203          bmp->db_agsize = le64_to_cpu(dbmp_le->dn_agsize);
>    204          bmp->db_maxfreebud = dbmp_le->dn_maxfreebud;
>    205
>    206          /* release the buffer. */
>    207          release_metapage(mp);
>    208
>    209          /* bind the bmap inode and the bmap descriptor to each other. */
>    210          bmp->db_ipbmap = ipbmap;
>    211          JFS_SBI(ipbmap->i_sb)->bmap = bmp;
>    212
>    213          memset(bmp->db_active, 0, sizeof(bmp->db_active));
>    214
>    215          /*
>    216           * allocate/initialize the bmap lock
>    217           */
>    218          BMAP_LOCK_INIT(bmp);
>    219
>    220          return (0);
>    221
>    222  err_release_metapage:
>    223          release_metapage(mp);
>    224  err_kfree_bmp:
>    225          kfree(bmp);
>    226          return err;
>    227  }
>    228
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
