Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49157359A67
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 03:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396749; cv=none; b=n7qshjExzvRxnWxnnM85tw7wGCnIO4iie3sfauIhp3vp5PNMruLNMj9zj07udfNDFzy1KuQ8v+ozeCt2lxW3GxqFV7PVWBY7UDY4UC/7zKcmttfCzDJkMSeN4cVsm4Ybpoa1D3mWMLnI39rX4seDAizLC5D0c6p5OqhUxrNBMyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396749; c=relaxed/simple;
	bh=VDRt6xwsJB1dNZFeUWyjZZwydhzzQCVDrIb8e8oYz3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qL/n+GCDt5NZta0SZcKsNv/E7oQDzLiEtDR+YVDtCBoAdQ9fFWoCTLHY/c2itb/b8SwVV1aQC+XGS+L8f570O6xzsSRZXOFWx6pqAKXNGLJ3HWe/87BZo80H7ipztHqV3xmC+wKOv7bO2IWEsRjL0leKzcmsTlBC3aiqHT4wGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cp97RVL/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cp97RVL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216C3C2BCB7
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 03:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776396748;
	bh=VDRt6xwsJB1dNZFeUWyjZZwydhzzQCVDrIb8e8oYz3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cp97RVL/1x2UAwpwPYos3hLFCP0Qag2BdipTqhqJCYO1NWCTCbOkvOdqfXgCPQfGJ
	 p+ax42dGBakW0jF/Crw1HPcCdNA7OG4othRZjCs/PLou/g7mhTNvrRxvvWRmQPCIFi
	 XjX90WxOh+d2EJNmutBlEKejF+o4hlcnwzmBO7truw4nFsdXNLDeQ/KU6hOL1V8XfE
	 cVXbHjJuOIm/qWEljVnkASt/WFq6BKb1Y31YQsBzE9Ig30paMVlqZRgnbeslztaoJ9
	 miYtHz6/ebgQOYpJQE6OGIc9tYFoA1O7ZBsZDodYX8w2wgenZf5VHUd1NwQXx2VUyq
	 EkHrZ1Vogbfjw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-671c4d08dc2so116786a12.3
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 20:32:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Ui84i6oG2eW+T6GhXPNXqE91w7J2RlzU0ZTbaNgYsE5449UziFnKIoacDAGyMEuVR/cb3@lists.linux.dev
X-Gm-Message-State: AOJu0YwFNANsrdr9ci0pIxDh+NIixPvxGF8HgDompw1RJetOvVdCJfGZ
	Iy09MnUdxgbTYv5h0aQgnpDBRVpiJ1caFoACXaC/cEb+sX1T295mCe/dZm/u6KekE5C0GxNh4PV
	sMS4eBcDQ2q9MVpY66XGHJb3ayidULxM=
X-Received: by 2002:a05:6402:4306:b0:670:a4a7:2b0e with SMTP id
 4fb4d7f45d1cf-672bfddeaf9mr504270a12.28.1776396746251; Thu, 16 Apr 2026
 20:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604170908.Ixz7gPqU-lkp@intel.com>
In-Reply-To: <202604170908.Ixz7gPqU-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 17 Apr 2026 12:32:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd94BZnCdbL8+gY0CUajfxzcHE=GuswBsL1DA5gvttFiBw@mail.gmail.com>
X-Gm-Features: AQROBzDdFpyENAFdWt7-TMU0L0FuliqSYVqrlTjjZRkH2B8rhfMIsKrYXAi_Z5c
Message-ID: <CAKYAXd94BZnCdbL8+gY0CUajfxzcHE=GuswBsL1DA5gvttFiBw@mail.gmail.com>
Subject: Re: [linux-next:master 13685/14055] fs/ntfs/mft.c:773:38: error:
 incompatible function pointer types passing 'int (struct inode *, u64, void
 *)' (aka 'int (struct inode *, unsigned long long, void *)') to parameter of
 type 'int (*)(struct inode *, unsigned long, void *)'
To: kernel test robot <lkp@intel.com>
Cc: Mark Brown <broonie@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the noise, I will fix it.

On Fri, Apr 17, 2026 at 10:43=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   452c3b1ea875276105ac90ba474f72b4cd9b77a2
> commit: 75579d45c31244811d57ae99692b6c3d197560b4 [13685/14055] ntfs: fix =
build error due to inode lookup API change to u64
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260=
417/202604170908.Ixz7gPqU-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf=
1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260417/202604170908.Ixz7gPqU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604170908.Ixz7gPqU-lkp=
@intel.com/
>
> Note: the linux-next/master HEAD 452c3b1ea875276105ac90ba474f72b4cd9b77a2=
 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
> >> fs/ntfs/mft.c:773:38: error: incompatible function pointer types passi=
ng 'int (struct inode *, u64, void *)' (aka 'int (struct inode *, unsigned =
long long, void *)') to parameter of type 'int (*)(struct inode *, unsigned=
 long, void *)' [-Wincompatible-function-pointer-types]
>                    vi =3D find_inode_nowait(sb, mft_no, ntfs_test_inode_w=
b, &na);
>                                                       ^~~~~~~~~~~~~~~~~~
>    include/linux/fs.h:2957:18: note: passing argument to parameter 'match=
' here
>                                           int (*match)(struct inode *,
>                                                 ^
>    fs/ntfs/mft.c:836:38: error: incompatible function pointer types passi=
ng 'int (struct inode *, u64, void *)' (aka 'int (struct inode *, unsigned =
long long, void *)') to parameter of type 'int (*)(struct inode *, unsigned=
 long, void *)' [-Wincompatible-function-pointer-types]
>                    vi =3D find_inode_nowait(sb, mft_no, ntfs_test_inode_w=
b, &na);
>                                                       ^~~~~~~~~~~~~~~~~~
>    include/linux/fs.h:2957:18: note: passing argument to parameter 'match=
' here
>                                           int (*match)(struct inode *,
>                                                 ^
>    2 errors generated.
>
>
> vim +773 fs/ntfs/mft.c
>
> 115380f9a2f967 Namjae Jeon 2026-02-13  667
> 115380f9a2f967 Namjae Jeon 2026-02-13  668  /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  669   * ntfs_may_write_mft_record =
- check if an mft record may be written out
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  670   * @vol:    [IN]  ntfs volume=
 on which the mft record to check resides
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  671   * @mft_no: [IN]  mft record =
number of the mft record to check
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  672   * @m:              [IN]  map=
ped mft record to check
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  673   * @locked_ni:      [OUT] cal=
ler has to unlock this ntfs inode if one is returned
> 115380f9a2f967 Namjae Jeon 2026-02-13  674   * @ref_vi: [OUT] caller has =
to drop this vfs inode if one is returned
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  675   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  676   * Check if the mapped (base =
or extent) mft record @m with mft record number
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  677   * @mft_no belonging to the n=
tfs volume @vol may be written out.  If necessary
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  678   * and possible the ntfs inod=
e of the mft record is locked and the base vfs
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  679   * inode is pinned.  The lock=
ed ntfs inode is then returned in @locked_ni.  The
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  680   * caller is responsible for =
unlocking the ntfs inode and unpinning the base
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  681   * vfs inode.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  682   *
> 115380f9a2f967 Namjae Jeon 2026-02-13  683   * To avoid deadlock when the=
 caller holds a folio lock, if the function
> 115380f9a2f967 Namjae Jeon 2026-02-13  684   * returns @ref_vi it defers =
dropping the vfs inode reference by returning
> 115380f9a2f967 Namjae Jeon 2026-02-13  685   * it in @ref_vi instead of c=
alling iput() directly.  The caller must call
> 115380f9a2f967 Namjae Jeon 2026-02-13  686   * iput() on @ref_vi after re=
leasing the folio lock.
> 115380f9a2f967 Namjae Jeon 2026-02-13  687   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  688   * Return 'true' if the mft r=
ecord may be written out and 'false' if not.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  689   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  690   * The caller has locked the =
page and cleared the uptodate flag on it which
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  691   * means that we can safely w=
rite out any dirty mft records that do not have
> 115380f9a2f967 Namjae Jeon 2026-02-13  692   * their inodes in icache as =
determined by find_inode_nowait().
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  693   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  694   * Here is a description of t=
he tests we perform:
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  695   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  696   * If the inode is found in i=
cache we know the mft record must be a base mft
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  697   * record.  If it is dirty, w=
e do not write it and return 'false' as the vfs
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  698   * inode write paths will res=
ult in the access times being updated which would
> 115380f9a2f967 Namjae Jeon 2026-02-13  699   * cause the base mft record =
to be redirtied and written out again.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  700   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  701   * If the inode is in icache =
and not dirty, we attempt to lock the mft record
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  702   * and if we find the lock wa=
s already taken, it is not safe to write the mft
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  703   * record and we return 'fals=
e'.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  704   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  705   * If we manage to obtain the=
 lock we have exclusive access to the mft record,
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  706   * which also allows us safe =
writeout of the mft record.  We then set
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  707   * @locked_ni to the locked n=
tfs inode and return 'true'.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  708   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  709   * Note we cannot just lock t=
he mft record and sleep while waiting for the lock
> 115380f9a2f967 Namjae Jeon 2026-02-13  710   * because this would deadloc=
k due to lock reversal.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  711   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  712   * If the inode is not in ica=
che we need to perform further checks.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  713   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  714   * If the mft record is not a=
 FILE record or it is a base mft record, we can
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  715   * safely write it and return=
 'true'.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  716   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  717   * We now know the mft record=
 is an extent mft record.  We check if the inode
> 115380f9a2f967 Namjae Jeon 2026-02-13  718   * corresponding to its base =
mft record is in icache. If it is not, we cannot
> 115380f9a2f967 Namjae Jeon 2026-02-13  719   * safely determine the state=
 of the extent inode, so we return 'false'.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  720   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  721   * We now have the base inode=
 for the extent mft record.  We check if it has an
> 115380f9a2f967 Namjae Jeon 2026-02-13  722   * ntfs inode for the extent =
mft record attached. If not, it is safe to write
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  723   * the extent mft record and =
we return 'true'.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  724   *
> 115380f9a2f967 Namjae Jeon 2026-02-13  725   * If the extent inode is att=
ached, we check if it is dirty. If so, we return
> 115380f9a2f967 Namjae Jeon 2026-02-13  726   * 'false' (letting the stand=
ard write_inode path handle it).
> 115380f9a2f967 Namjae Jeon 2026-02-13  727   *
> 115380f9a2f967 Namjae Jeon 2026-02-13  728   * If it is not dirty, we att=
empt to lock the extent mft record. If the lock
> 115380f9a2f967 Namjae Jeon 2026-02-13  729   * was already taken, it is n=
ot safe to write and we return 'false'.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  730   *
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  731   * If we manage to obtain the=
 lock we have exclusive access to the extent mft
> 115380f9a2f967 Namjae Jeon 2026-02-13  732   * record. We set @locked_ni =
to the now locked ntfs inode and return 'true'.
> 115380f9a2f967 Namjae Jeon 2026-02-13  733   */
> d9038d99fb5c62 Namjae Jeon 2026-03-05  734  static bool ntfs_may_write_mf=
t_record(struct ntfs_volume *vol, const u64 mft_no,
> 115380f9a2f967 Namjae Jeon 2026-02-13  735              const struct mft_=
record *m, struct ntfs_inode **locked_ni,
> 115380f9a2f967 Namjae Jeon 2026-02-13  736              struct inode **re=
f_vi)
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  737  {
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  738      struct super_block *sb =
=3D vol->sb;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  739      struct inode *mft_vi =3D =
vol->mft_ino;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  740      struct inode *vi;
> 115380f9a2f967 Namjae Jeon 2026-02-13  741      struct ntfs_inode *ni, *e=
ni, **extent_nis;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  742      int i;
> 115380f9a2f967 Namjae Jeon 2026-02-13  743      struct ntfs_attr na =3D {=
0};
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  744
> d9038d99fb5c62 Namjae Jeon 2026-03-05  745      ntfs_debug("Entering for =
inode 0x%llx.", mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  746      /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  747       * Normally we do not ret=
urn a locked inode so set @locked_ni to NULL.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  748       */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  749      *locked_ni =3D NULL;
> 115380f9a2f967 Namjae Jeon 2026-02-13  750      *ref_vi =3D NULL;
> 115380f9a2f967 Namjae Jeon 2026-02-13  751
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  752      /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  753       * Check if the inode cor=
responding to this mft record is in the VFS
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  754       * inode cache and obtain=
 a reference to it if it is.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  755       */
> d9038d99fb5c62 Namjae Jeon 2026-03-05  756      ntfs_debug("Looking for i=
node 0x%llx in icache.", mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  757      na.mft_no =3D mft_no;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  758      na.type =3D AT_UNUSED;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  759      /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  760       * Optimize inode 0, i.e.=
 $MFT itself, since we have it in memory and
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  761       * we get here for it rat=
her often.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  762       */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  763      if (!mft_no) {
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  764              /* Balance the be=
low iput(). */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  765              vi =3D igrab(mft_=
vi);
> 115380f9a2f967 Namjae Jeon 2026-02-13  766              WARN_ON(vi !=3D m=
ft_vi);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  767      } else {
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  768              /*
> 115380f9a2f967 Namjae Jeon 2026-02-13  769               * Have to use fi=
nd_inode_nowait() since ilookup5_nowait()
> 115380f9a2f967 Namjae Jeon 2026-02-13  770               * waits for inod=
e with I_FREEING, which causes ntfs to deadlock
> 115380f9a2f967 Namjae Jeon 2026-02-13  771               * when inodes ar=
e unlinked concurrently
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  772               */
> 115380f9a2f967 Namjae Jeon 2026-02-13 @773              vi =3D find_inode=
_nowait(sb, mft_no, ntfs_test_inode_wb, &na);
> 115380f9a2f967 Namjae Jeon 2026-02-13  774              if (na.state =3D=
=3D NI_BeingDeleted || na.state =3D=3D NI_BeingCreated)
> 115380f9a2f967 Namjae Jeon 2026-02-13  775                      return fa=
lse;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  776      }
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  777      if (vi) {
> d9038d99fb5c62 Namjae Jeon 2026-03-05  778              ntfs_debug("Base =
inode 0x%llx is in icache.", mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  779              /* The inode is i=
n icache. */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  780              ni =3D NTFS_I(vi)=
;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  781              /* Take a referen=
ce to the ntfs inode. */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  782              atomic_inc(&ni->c=
ount);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  783              /* If the inode i=
s dirty, do not write this record. */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  784              if (NInoDirty(ni)=
) {
> d9038d99fb5c62 Namjae Jeon 2026-03-05  785                      ntfs_debu=
g("Inode 0x%llx is dirty, do not write it.",
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  786                               =
       mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  787                      atomic_de=
c(&ni->count);
> 115380f9a2f967 Namjae Jeon 2026-02-13  788                      *ref_vi =
=3D vi;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  789                      return fa=
lse;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  790              }
> d9038d99fb5c62 Namjae Jeon 2026-03-05  791              ntfs_debug("Inode=
 0x%llx is not dirty.", mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  792              /* The inode is n=
ot dirty, try to take the mft record lock. */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  793              if (unlikely(!mut=
ex_trylock(&ni->mrec_lock))) {
> d9038d99fb5c62 Namjae Jeon 2026-03-05  794                      ntfs_debu=
g("Mft record 0x%llx is already locked, do not write it.", mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  795                      atomic_de=
c(&ni->count);
> 115380f9a2f967 Namjae Jeon 2026-02-13  796                      *ref_vi =
=3D vi;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  797                      return fa=
lse;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  798              }
> d9038d99fb5c62 Namjae Jeon 2026-03-05  799              ntfs_debug("Manag=
ed to lock mft record 0x%llx, write it.",
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  800                              m=
ft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  801              /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  802               * The write has =
to occur while we hold the mft record lock so
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  803               * return the loc=
ked ntfs inode.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  804               */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  805              *locked_ni =3D ni=
;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  806              return true;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  807      }
> d9038d99fb5c62 Namjae Jeon 2026-03-05  808      ntfs_debug("Inode 0x%llx =
is not in icache.", mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  809      /* The inode is not in ic=
ache. */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  810      /* Write the record if it=
 is not a mft record (type "FILE"). */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  811      if (!ntfs_is_mft_record(m=
->magic)) {
> d9038d99fb5c62 Namjae Jeon 2026-03-05  812              ntfs_debug("Mft r=
ecord 0x%llx is not a FILE record, write it.",
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  813                              m=
ft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  814              return true;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  815      }
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  816      /* Write the mft record i=
f it is a base inode. */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  817      if (!m->base_mft_record) =
{
> d9038d99fb5c62 Namjae Jeon 2026-03-05  818              ntfs_debug("Mft r=
ecord 0x%llx is a base record, write it.",
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  819                              m=
ft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  820              return true;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  821      }
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  822      /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  823       * This is an extent mft =
record.  Check if the inode corresponding to
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  824       * its base mft record is=
 in icache and obtain a reference to it if it
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  825       * is.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  826       */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  827      na.mft_no =3D MREF_LE(m->=
base_mft_record);
> 115380f9a2f967 Namjae Jeon 2026-02-13  828      na.state =3D 0;
> d9038d99fb5c62 Namjae Jeon 2026-03-05  829      ntfs_debug("Mft record 0x=
%llx is an extent record.  Looking for base inode 0x%llx in icache.",
> 115380f9a2f967 Namjae Jeon 2026-02-13  830                      mft_no, n=
a.mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  831      if (!na.mft_no) {
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  832              /* Balance the be=
low iput(). */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  833              vi =3D igrab(mft_=
vi);
> 115380f9a2f967 Namjae Jeon 2026-02-13  834              WARN_ON(vi !=3D m=
ft_vi);
> 115380f9a2f967 Namjae Jeon 2026-02-13  835      } else {
> 115380f9a2f967 Namjae Jeon 2026-02-13  836              vi =3D find_inode=
_nowait(sb, mft_no, ntfs_test_inode_wb, &na);
> 115380f9a2f967 Namjae Jeon 2026-02-13  837              if (na.state =3D=
=3D NI_BeingDeleted || na.state =3D=3D NI_BeingCreated)
> 115380f9a2f967 Namjae Jeon 2026-02-13  838                      return fa=
lse;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  839      }
> 115380f9a2f967 Namjae Jeon 2026-02-13  840
> 115380f9a2f967 Namjae Jeon 2026-02-13  841      if (!vi)
> 115380f9a2f967 Namjae Jeon 2026-02-13  842              return false;
> d9038d99fb5c62 Namjae Jeon 2026-03-05  843      ntfs_debug("Base inode 0x=
%llx is in icache.", na.mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  844      /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  845       * The base inode is in i=
cache.  Check if it has the extent inode
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  846       * corresponding to this =
extent mft record attached.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  847       */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  848      ni =3D NTFS_I(vi);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  849      mutex_lock(&ni->extent_lo=
ck);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  850      if (ni->nr_extents <=3D 0=
) {
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  851              /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  852               * The base inode=
 has no attached extent inodes, write this
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  853               * extent mft rec=
ord.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  854               */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  855              mutex_unlock(&ni-=
>extent_lock);
> 115380f9a2f967 Namjae Jeon 2026-02-13  856              *ref_vi =3D vi;
> d9038d99fb5c62 Namjae Jeon 2026-03-05  857              ntfs_debug("Base =
inode 0x%llx has no attached extent inodes, write the extent record.",
> 115380f9a2f967 Namjae Jeon 2026-02-13  858                              n=
a.mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  859              return true;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  860      }
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  861      /* Iterate over the attac=
hed extent inodes. */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  862      extent_nis =3D ni->ext.ex=
tent_ntfs_inos;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  863      for (eni =3D NULL, i =3D =
0; i < ni->nr_extents; ++i) {
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  864              if (mft_no =3D=3D=
 extent_nis[i]->mft_no) {
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  865                      /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  866                       * Found =
the extent inode corresponding to this extent
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  867                       * mft re=
cord.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  868                       */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  869                      eni =3D e=
xtent_nis[i];
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  870                      break;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  871              }
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  872      }
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  873      /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  874       * If the extent inode wa=
s not attached to the base inode, write this
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  875       * extent mft record.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  876       */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  877      if (!eni) {
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  878              mutex_unlock(&ni-=
>extent_lock);
> 115380f9a2f967 Namjae Jeon 2026-02-13  879              *ref_vi =3D vi;
> d9038d99fb5c62 Namjae Jeon 2026-03-05  880              ntfs_debug("Exten=
t inode 0x%llx is not attached to its base inode 0x%llx, write the extent r=
ecord.",
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  881                              m=
ft_no, na.mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  882              return true;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  883      }
> d9038d99fb5c62 Namjae Jeon 2026-03-05  884      ntfs_debug("Extent inode =
0x%llx is attached to its base inode 0x%llx.",
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  885                      mft_no, n=
a.mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  886      /* Take a reference to th=
e extent ntfs inode. */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  887      atomic_inc(&eni->count);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  888      mutex_unlock(&ni->extent_=
lock);
> 115380f9a2f967 Namjae Jeon 2026-02-13  889
> 115380f9a2f967 Namjae Jeon 2026-02-13  890      /* if extent inode is dir=
ty, write_inode will write it */
> 115380f9a2f967 Namjae Jeon 2026-02-13  891      if (NInoDirty(eni)) {
> 115380f9a2f967 Namjae Jeon 2026-02-13  892              atomic_dec(&eni->=
count);
> 115380f9a2f967 Namjae Jeon 2026-02-13  893              *ref_vi =3D vi;
> 115380f9a2f967 Namjae Jeon 2026-02-13  894              return false;
> 115380f9a2f967 Namjae Jeon 2026-02-13  895      }
> 115380f9a2f967 Namjae Jeon 2026-02-13  896
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  897      /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  898       * Found the extent inode=
 coresponding to this extent mft record.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  899       * Try to take the mft re=
cord lock.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  900       */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  901      if (unlikely(!mutex_trylo=
ck(&eni->mrec_lock))) {
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  902              atomic_dec(&eni->=
count);
> 115380f9a2f967 Namjae Jeon 2026-02-13  903              *ref_vi =3D vi;
> d9038d99fb5c62 Namjae Jeon 2026-03-05  904              ntfs_debug("Exten=
t mft record 0x%llx is already locked, do not write it.",
> 115380f9a2f967 Namjae Jeon 2026-02-13  905                              m=
ft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  906              return false;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  907      }
> d9038d99fb5c62 Namjae Jeon 2026-03-05  908      ntfs_debug("Managed to lo=
ck extent mft record 0x%llx, write it.",
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  909                      mft_no);
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  910      /*
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  911       * The write has to occur=
 while we hold the mft record lock so return
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  912       * the locked extent ntfs=
 inode.
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  913       */
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  914      *locked_ni =3D eni;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  915      return true;
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  916  }
> 1e9ea7e04472d4 Namjae Jeon 2025-12-30  917
>
> :::::: The code at line 773 was first introduced by commit
> :::::: 115380f9a2f9675c7924563cbba70d40cae8fb81 ntfs: update mft operatio=
ns
>
> :::::: TO: Namjae Jeon <linkinjeon@kernel.org>
> :::::: CC: Namjae Jeon <linkinjeon@kernel.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
