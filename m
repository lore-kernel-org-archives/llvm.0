Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D5358384
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 03:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396721; cv=none; b=IPvnUJOisUPadtKDfO5R+WgD6kARAC3rC1EV9Mq+LvsBVbTi0ZS1FET3MRjGFj8DaiVfJzmq2EH6zR+NM/BApcMgYPTAcEHZCLFohANtmzvqGV68kauAZRAN11QdKFiWf0m5FWBYU4kAsiBlqsTJAiUFrtjqeB/gvWJXVNrqgsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396721; c=relaxed/simple;
	bh=zykrxw6fN/2HUwyp2YtFod/V6eyW5Oj5SfQ3gBDouz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDgZJwCf8dZjRm8GhDvtl1ffEFigOgfUvEkZXt1Ge5f3KvaYEIyLW7RZplq3a2DDSBuaKJDtRlUoFhNbv/rXuy212P4yNHfAbvluvC8tGTpnpshXYF2duEs/FeqstBp0OMJ+QYx+gLcr0RK2ElGMXtRgP17KkEuqdRf8OdcY378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfwMpYcl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfwMpYcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B589C2BCB6
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 03:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776396721;
	bh=zykrxw6fN/2HUwyp2YtFod/V6eyW5Oj5SfQ3gBDouz0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MfwMpYclT/22bFMqc88wscZU5rKl6U0syz4deEYKeUaNreUD4h/TOjVqDy4UNxCUf
	 CfuXEUraP/UDkL3fY2JVTypSYFTyzy4WFz+Tauw4APsku/yTtZDKRGCHhjP31vQzw1
	 GPFS6y2lzzyDMulw+ESTXpBEVzuRp5W06ggBU7Qv0DW8zs4LtWGg42SirHsMmXLu8X
	 8RTVhhoqsaP2MYo+yveNeFkFaeOKSftNzI+GkwObZGW4WJd4ZI5wfdVv24jigecjlg
	 cFqEFe+PZ/N7+8T55ydLankpXYsklfkSUJrduC81uOEaD1YNqwsK/XYEUGnY4bkkAg
	 mQyLjXQqr1P/w==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso180974a12.2
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 20:32:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8AQFVAT769Uz2B0U0XoCDANjJgIs2wyFdoTi5O+i1inYU1tNYZsOG54xYIasue6bWCCgTE@lists.linux.dev
X-Gm-Message-State: AOJu0YwgsKjmTNtlHeHVLvLAFu6i2jR4l1grMGif/g1/9FfNZhBzCdom
	3g1AHqH82wobzLvqwixEknobo4wQeXEe+SX0SuvSxn9vpvjwtzv8s0cEcm5T+jKTSbfyCKUlrMI
	VMEGCsYQNhtVWs2COiFHaK6bXLAzcReA=
X-Received: by 2002:a17:906:6a10:b0:ba4:6bcb:cdf7 with SMTP id
 a640c23a62f3a-ba46bcbcf76mr11007666b.4.1776396719574; Thu, 16 Apr 2026
 20:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604170407.bqLb88Ri-lkp@intel.com>
In-Reply-To: <202604170407.bqLb88Ri-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 17 Apr 2026 12:31:47 +0900
X-Gmail-Original-Message-ID: <CAKYAXd93DEWL7Ha4fP2tKSrT0QrYGE8YLXY5VuSmJ8hsXTcbWQ@mail.gmail.com>
X-Gm-Features: AQROBzAKXY-IM-K8kDY00wVDDTz6HmSBdoM2rC9TXsSZcOf8aKaGvFqJ2tuIfu8
Message-ID: <CAKYAXd93DEWL7Ha4fP2tKSrT0QrYGE8YLXY5VuSmJ8hsXTcbWQ@mail.gmail.com>
Subject: Re: [linkinjeon-ntfs:ntfs-next 47/48] fs/ntfs/file.c:657:6: error:
 call to undeclared function 'vma_desc_test'; ISO C99 and later do not support
 implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: Mark Brown <broonie@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the noise, I will fix it.

On Fri, Apr 17, 2026 at 5:33=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.g=
it ntfs-next
> head:   75579d45c31244811d57ae99692b6c3d197560b4
> commit: 50ba0870ccdba0b8fa15f1eb0e11bfa08185c383 [47/48] ntfs: fix build =
error due to vma_desc_test() rename
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260=
417/202604170407.bqLb88Ri-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf=
1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260417/202604170407.bqLb88Ri-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604170407.bqLb88Ri-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> fs/ntfs/file.c:657:6: error: call to undeclared function 'vma_desc_tes=
t'; ISO C99 and later do not support implicit function declarations [-Wimpl=
icit-function-declaration]
>            if (vma_desc_test(desc, VMA_WRITE_BIT)) {
>                ^
>    1 error generated.
>
>
> vim +/vma_desc_test +657 fs/ntfs/file.c
>
>    645
>    646  static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
>    647  {
>    648          struct file *file =3D desc->file;
>    649          struct inode *inode =3D file_inode(file);
>    650
>    651          if (NVolShutdown(NTFS_SB(file->f_mapping->host->i_sb)))
>    652                  return -EIO;
>    653
>    654          if (NInoCompressed(NTFS_I(inode)))
>    655                  return -EOPNOTSUPP;
>    656
>  > 657          if (vma_desc_test(desc, VMA_WRITE_BIT)) {
>    658                  struct inode *inode =3D file_inode(file);
>    659                  loff_t from, to;
>    660                  int err;
>    661
>    662                  from =3D ((loff_t)desc->pgoff << PAGE_SHIFT);
>    663                  to =3D min_t(loff_t, i_size_read(inode),
>    664                             from + desc->end - desc->start);
>    665
>    666                  if (NTFS_I(inode)->initialized_size < to) {
>    667                          err =3D ntfs_extend_initialized_size(inod=
e, to, to, false);
>    668                          if (err)
>    669                                  return err;
>    670                  }
>    671          }
>    672
>    673
>    674          file_accessed(file);
>    675          desc->vm_ops =3D &ntfs_file_vm_ops;
>    676          return 0;
>    677  }
>    678
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
