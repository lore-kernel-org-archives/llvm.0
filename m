Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A33F9E3;
	Thu, 26 Oct 2023 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbrp1API"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-66cfd35f595so6766846d6.2;
        Thu, 26 Oct 2023 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698333371; x=1698938171; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zp6Op1tcsAosSng3lLBJsAdC4W7ZlECaDqYtzxj3jC8=;
        b=Hbrp1API6YE650uPfs6I7qayXrHnleUTBUYMKgPuppCfPVwXd51P4AoCZ8OfptsfP6
         8Qj+jtnViLwqNPc9UtuKWxSs1PxuknZ3JpZ2+KhDpPq4Fol+LVTZAGUijvbeQL557AX0
         B2T4HMQ4J/lw8pASnUo2E/v6D5jQMkpoX1lfiG/QSiGCWw3vFLnWJEj/Oc8uWnTqqeHq
         fy/7qpNOw1c1QRU8CpL1stlwqds7aklKgf4ORfzCffb7y6yskoQZore1S05cdo8iS9ub
         FXkUwupEllhHHOL51VOlySVF4SY1IgA1jagt/EuCQF6V3joxyBPmpARPmxWoeoZ5ejOc
         g6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698333371; x=1698938171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zp6Op1tcsAosSng3lLBJsAdC4W7ZlECaDqYtzxj3jC8=;
        b=tjBQNmKRNJ0pyCFswl6UOksLfqNEEIKVQEklZFoyIfGX3EMcYVT8XHQiuyx7JwW9RA
         isyeOLVhf/UTmiMasaZY+ajosIX4XKRPm0gjyaH56XFwpwAW/+6OMLEIVWH+yT3h+aN2
         qJMQNlW+hSCU3Qlul5tMAo2IyTZ3jB6ylEv/a/6lPzfskUWjJfRbTxizahWn+TVzhAlm
         hYDoPhzJBUWy+yrdmy4KbGYDKesggdRSmgUbF05iYYH8FngzX5tDsqcA3tp2wLhb5Xpl
         SGSioPoGerJJ9mQtk59DgOi2+WZVmLSVaVaI1VEpYFeA2SjsB5HtFbszEXkX4qxYKIvZ
         noeA==
X-Gm-Message-State: AOJu0YwJe1Sq/HhwtQMPuypAAR/iazdEZ/Op73n7mVN4vzpyaaIEw4Mx
	drZ0B7Vjgb+vC6fTilFwFrWI5WyefV+ciNDbxuE=
X-Google-Smtp-Source: AGHT+IEh7js9d0mPHr5HEC4BMkpZzYH8Eh7/+8jmxzrtOu4b69T8ispDC+qHp2OlNoPOsXUBu5eX1nH9QEK8EWivD5I=
X-Received: by 2002:ad4:4ee1:0:b0:656:1ed6:fff3 with SMTP id
 dv1-20020ad44ee1000000b006561ed6fff3mr22386198qvb.56.1698333370992; Thu, 26
 Oct 2023 08:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310262151.renqMvme-lkp@intel.com> <dd4bf45e-2ef3-4975-904d-f72c3d4af7c7@app.fastmail.com>
In-Reply-To: <dd4bf45e-2ef3-4975-904d-f72c3d4af7c7@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 26 Oct 2023 18:15:59 +0300
Message-ID: <CAOQ4uxjiSrcOXXdr3Lf=01VcOoN8Z6HOvoKm+9Dm8zAeSHKgbA@mail.gmail.com>
Subject: Re: [linux-next:master 14416/15220] fs/exportfs/expfs.c:357:5: error:
 expected identifier or '('
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 5:37=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Thu, Oct 26, 2023, at 15:49, kernel test robot wrote:
> > tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > master
> > head:   2ef7141596eed0b4b45ef18b3626f428a6b0a822
> > commit: dfaf653dc41557548b2e75e6cd837071f7c63289 [14416/15220]
> > exportfs: make ->encode_fh() a mandatory method for NFS export
> > config: hexagon-randconfig-r015-20211224
> > (https://download.01.org/0day-ci/archive/20231026/202310262151.renqMvme=
-lkp@intel.com/config)
> > compiler: clang version 16.0.4
> > (https://github.com/llvm/llvm-project.git
> > ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce (this is a W=3D1 build):
> > (https://download.01.org/0day-ci/archive/20231026/202310262151.renqMvme=
-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202310262151.renqMvme-lkp@intel.c=
om/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> fs/exportfs/expfs.c:357:5: error: expected identifier or '('
> >    int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int
> > *max_len,
> >        ^
> >    include/linux/exportfs.h:286:33: note: expanded from macro
>
> This bit is trivially fixed by allowing the protoype to
> be visible for CONFIG_EXPORTFS=3Dm
>
> --- a/include/linux/exportfs.h
> +++ b/include/linux/exportfs.h
> @@ -314,7 +314,7 @@ extern struct dentry *exportfs_decode_fh(struct vfsmo=
unt *mnt, struct fid *fid,
>  /*
>   * Generic helpers for filesystems.
>   */
> -#ifdef CONFIG_EXPORTFS
> +#if IS_ENABLED(CONFIG_EXPORTFS)
>  int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_len=
,
>                             struct inode *parent);
>  #else
>
> but then we instead get link failures when the callers are
> built-in:
>
> x86_64-linux-ld: fs/ext4/super.o:(.rodata+0x11a0): undefined reference to=
 `generic_encode_ino32_fh'
> x86_64-linux-ld: fs/ext2/super.o:(.rodata+0x3a0): undefined reference to =
`generic_encode_ino32_fh'
> x86_64-linux-ld: fs/fat/nfs.o:(.rodata+0x120): undefined reference to `ge=
neric_encode_ino32_fh'
> x86_64-linux-ld: fs/ntfs3/super.o:(.rodata+0x2a0): undefined reference to=
 `generic_encode_ino32_fh'
> x86_64-linux-ld: fs/befs/linuxvfs.o:(.rodata+0x240): undefined reference =
to `generic_encode_ino32_fh'
>
> Could this function just be move to fs/libfs.c or similar?

It could, but it is quite annoying to have to build the function when no co=
de
should be calling it.

IMO, it would be better to make CONFIG_EXPORTFS a bool.
fs/exportfs/expfs.c is quite small and CONFIG_EXPORTFS=3Dm
doesn't seem to be worthwhile.

Thanks,
Amir.
