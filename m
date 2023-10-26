Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1D156CE;
	Thu, 26 Oct 2023 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbFoMzHL"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7789cc5c8ccso107926785a.0;
        Thu, 26 Oct 2023 13:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698351931; x=1698956731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwwdVPbm3RceMbBfT8tCSmgbB4MiJAWQJEs/zNkepU0=;
        b=NbFoMzHLD0FCD2dyqJU+emYjGunqmwEX3axk9liczZSfSLgpNGgFnNqdmUgFviJChq
         6X3j0PrEr/5wJuVrO95nLe//aXlpM892cwFSm6o/Q1cKN7kGlffQo+L6/oH5PXzxs3+5
         rkOoyHlefEPZvsMfVKdUMnIKnrhBNTEI4kWpyW9byOP0+uRWwjrwj5Lf0ZTur8A9S5lT
         T+etryPPuf3pQhHXvFmybNMbid2Fz6U/zIG5z6j9ZWHRY6FTxfmjMzP0MtIMREJMunMh
         OnJhDub6+WBWMmKUiCy9lvEurLk0ZHAmxCLac3g42ueQNNYgzWZIcciNSyYDMMYbEuwo
         emvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698351931; x=1698956731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwwdVPbm3RceMbBfT8tCSmgbB4MiJAWQJEs/zNkepU0=;
        b=gb9NPiufyEH8d4b4gkRjE5zSQO6/3JNDPHsxT6OzcSSdTyPo4o9ESekCfLa3sy6QTw
         9C3gytjgC90pkKMeGKAygPVhfS5sORU4K/q1eeAPfwMPvyW2ZYFT5oqzeq/gVpBDOcCy
         kGunP7M5IxChaJ2IGVSa9K/pVm/xJ+SFAugyh7SALnv0UZy9up0GLiAL2l7SD5kkwjE7
         leyesyYyUKs9kJwZri2k5fOfuLvsSS1M77VmsSLWVqj672YN+4MstA9q2yy/4CwB1v49
         pZlD67vsOemPqqq5FP8wG1TZqZImQ9xhzOOhTpZpeuTE2tCwgnfZGhteBksHf4lHNqkW
         Tp0Q==
X-Gm-Message-State: AOJu0Yy3IOHuyVasce8kA0rYaDVwP7XFZLaGPg21TE1ORokIoh3qj++m
	O3u8yvhq02u8CLznU+ooEJVFExhOa9Zv293Bntaq58dR/zI=
X-Google-Smtp-Source: AGHT+IElPM/DkXkc5BQ4j29FsFuPgy5EpsioROWoJjy8XLi3Kcrtp2ko7Qppbbu7Jl/NpsTgtM3I18MJCaOeosDzj24=
X-Received: by 2002:a05:620a:248b:b0:76e:f686:cad8 with SMTP id
 i11-20020a05620a248b00b0076ef686cad8mr4627941qkn.13.1698351931090; Thu, 26
 Oct 2023 13:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310262151.renqMvme-lkp@intel.com> <dd4bf45e-2ef3-4975-904d-f72c3d4af7c7@app.fastmail.com>
 <CAOQ4uxjiSrcOXXdr3Lf=01VcOoN8Z6HOvoKm+9Dm8zAeSHKgbA@mail.gmail.com>
In-Reply-To: <CAOQ4uxjiSrcOXXdr3Lf=01VcOoN8Z6HOvoKm+9Dm8zAeSHKgbA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 26 Oct 2023 23:25:19 +0300
Message-ID: <CAOQ4uxjacyBc7PEE5=yCvKqV-s0FMtyJS0PEpLMFr2WNLOdtYg@mail.gmail.com>
Subject: Re: [linux-next:master 14416/15220] fs/exportfs/expfs.c:357:5: error:
 expected identifier or '('
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jeff Layton <jlayton@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 6:15=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Thu, Oct 26, 2023 at 5:37=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
> >
> > On Thu, Oct 26, 2023, at 15:49, kernel test robot wrote:
> > > tree:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > master
> > > head:   2ef7141596eed0b4b45ef18b3626f428a6b0a822
> > > commit: dfaf653dc41557548b2e75e6cd837071f7c63289 [14416/15220]
> > > exportfs: make ->encode_fh() a mandatory method for NFS export
> > > config: hexagon-randconfig-r015-20211224
> > > (https://download.01.org/0day-ci/archive/20231026/202310262151.renqMv=
me-lkp@intel.com/config)
> > > compiler: clang version 16.0.4
> > > (https://github.com/llvm/llvm-project.git
> > > ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > reproduce (this is a W=3D1 build):
> > > (https://download.01.org/0day-ci/archive/20231026/202310262151.renqMv=
me-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > > version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202310262151.renqMvme-lkp@intel=
.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >>> fs/exportfs/expfs.c:357:5: error: expected identifier or '('
> > >    int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int
> > > *max_len,
> > >        ^
> > >    include/linux/exportfs.h:286:33: note: expanded from macro
> >
> > This bit is trivially fixed by allowing the protoype to
> > be visible for CONFIG_EXPORTFS=3Dm
> >
> > --- a/include/linux/exportfs.h
> > +++ b/include/linux/exportfs.h
> > @@ -314,7 +314,7 @@ extern struct dentry *exportfs_decode_fh(struct vfs=
mount *mnt, struct fid *fid,
> >  /*
> >   * Generic helpers for filesystems.
> >   */
> > -#ifdef CONFIG_EXPORTFS
> > +#if IS_ENABLED(CONFIG_EXPORTFS)
> >  int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_l=
en,
> >                             struct inode *parent);
> >  #else
> >
> > but then we instead get link failures when the callers are
> > built-in:
> >
> > x86_64-linux-ld: fs/ext4/super.o:(.rodata+0x11a0): undefined reference =
to `generic_encode_ino32_fh'
> > x86_64-linux-ld: fs/ext2/super.o:(.rodata+0x3a0): undefined reference t=
o `generic_encode_ino32_fh'
> > x86_64-linux-ld: fs/fat/nfs.o:(.rodata+0x120): undefined reference to `=
generic_encode_ino32_fh'
> > x86_64-linux-ld: fs/ntfs3/super.o:(.rodata+0x2a0): undefined reference =
to `generic_encode_ino32_fh'
> > x86_64-linux-ld: fs/befs/linuxvfs.o:(.rodata+0x240): undefined referenc=
e to `generic_encode_ino32_fh'
> >
> > Could this function just be move to fs/libfs.c or similar?
>
> It could, but it is quite annoying to have to build the function when no =
code
> should be calling it.
>
> IMO, it would be better to make CONFIG_EXPORTFS a bool.
> fs/exportfs/expfs.c is quite small and CONFIG_EXPORTFS=3Dm
> doesn't seem to be worthwhile.

Forget it. I missed the fact that the problem is that none of the
filesystem properly select EXPORTFS.

I will see if I want to fix that or give up and move the helper to fs/libfs=
.c.

Thanks,
Amir.
