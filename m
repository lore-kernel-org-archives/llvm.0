Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E6821502D;
	Fri, 11 Oct 2024 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728646161; cv=none; b=skLg9Eu5JsZ19PTLIzFlseVZrR28gmDUzA7PgFK1eZw87DV20vKI6w1TMl+NV+Di2QQg0xK03M/IQ9rJIQYl6UVb1oTo1Sn5OeqlslLzqQygBXZYg1YNCR7s5Eg7cNxl+VH1/m6nGgdmc14jhIftiQU1TLLzh6fI2K7jl5vd6ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728646161; c=relaxed/simple;
	bh=hFOpFtbUp9WAKtIyShpJkQp3M6HRkqXocbx/H3nABFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bl/2suvP0BNxmpDOMaqjZcIhPCJD4j+Fma5QgpKj9jDKO31AIzcb0ikSs7A6BglViPSCS3fKmE0jYjXbBVDRIiUn6dqC/c7I/E6uIcgq0DzRUYuohcS3zD6WWWq37cBMs1bQ83rbXt/FSnUW0xjSxSR6KzSGCYtfO1dDYaH3GLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B899h2vU; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B899h2vU"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7afc5e480dbso115340985a.3;
        Fri, 11 Oct 2024 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728646155; x=1729250955; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXu5ilO0B38r9x9LA9hO6uH7HLlyNgMrFLahqmxyYSQ=;
        b=B899h2vUgCaZrjrRatMhS9TDh3h80cIggGX3BFYDG8J9uW0GFOQ3DFr/8Vzg3nUp0P
         C+VFucZzJu7kUfoG44y6eSoqMYB9gwgGwpjm9RZS6sF9brU8r7b/Rt0FeTuQl0YQZuem
         kZGtXlNX3wb+QqGS1pIoMP9+Lg2AnxqAW++V2GAcx6Cl7MyQGSlH50GYjJAE3qxyf3IS
         p7bWOSMG9LDR8YY5DLHNhBKmOqdZNHokzTCpOWE1H9q8ki96X7nYGmascGp6VUZiKlb6
         rbquIi6WXNoQhsFLA+GJLjMqdRxIa0zROjW95UGWpoOfYzFxUrwkL3cie96ydb3ymJF+
         5KVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728646155; x=1729250955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXu5ilO0B38r9x9LA9hO6uH7HLlyNgMrFLahqmxyYSQ=;
        b=BzdUkyZ74j3A7jMy2KSG0StGQ8NGM3AYyxyQi8qwdx45p3mIQmOZxS8J5hMEAR9Uc8
         4BkkYNbX5155D5VPe+gcz7QUMys7RbJQgfhLUBeNMlGRap6S3UJ94R9O3q3EpvEhjglO
         MgmxJhfFsbxOu4qhaMx8K0SpjI9B+lL3r7tzhNZ/szSWn7ovX1SCaSuVJJoo0LiH2Fzi
         hfLGxO1aqsD3ggrwcSF7Gd8MBwi/ggqHGD3s7L4cVnmQcHxmZUeK4hciB5IhzUWV2chu
         FHtISwbZ4vuOjHhI4/V3N4t9xLkEAmqSWcE2HPPxGF/9zL5kf11bgNXPfiC7JIg2kGr3
         YAKg==
X-Forwarded-Encrypted: i=1; AJvYcCVsR9FrlzVjV5xtQu79awBTnE8amFw7dwoTy9pe9ZUvcy5aXJ5UTmHUYu09jeXAaK49sNiOGuGZEDuJia0y@lists.linux.dev
X-Gm-Message-State: AOJu0YxmA22vJ0PQSRgxHwwcRnZm7xP0KBxY30QPosMFNUNkcqF/oatS
	z40ctQSYKWmzwFsiBkTXquqVzvvbB1sUI2Ocbtf9WFU0bzPse9/8HSBqNXzYHfrRPGKjpOZ6xME
	9c4Cis2YYs0J39nAaa144xbDuxio=
X-Google-Smtp-Source: AGHT+IGIdZ9RneDbVf+jvFQoSDMu1X5ANp9aP2HxFsf3df9fY8O9MOS8o00aehWhn73S9SiDDTUUvLrfF3qHUiYn/zY=
X-Received: by 2002:a05:620a:25b:b0:7b1:1d74:6b7d with SMTP id
 af79cd13be357-7b11d746d3emr79677285a.53.1728646155120; Fri, 11 Oct 2024
 04:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008152118.453724-2-amir73il@gmail.com> <202410111804.pPMW9rqn-lkp@intel.com>
In-Reply-To: <202410111804.pPMW9rqn-lkp@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 11 Oct 2024 13:29:03 +0200
Message-ID: <CAOQ4uxivE3P8aZw=tTP=wkaUWmOHdTOY7q2_CHNP+fT9di-NbQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] fs: prepare for "explicit connectable" file handles
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 1:04=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Amir,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on brauner-vfs/vfs.all]
> [also build test ERROR on linus/master v6.12-rc2 next-20241011]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Goldstein/fs-=
prepare-for-explicit-connectable-file-handles/20241008-232246
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.a=
ll
> patch link:    https://lore.kernel.org/r/20241008152118.453724-2-amir73il=
%40gmail.com
> patch subject: [PATCH v3 1/3] fs: prepare for "explicit connectable" file=
 handles
> config: s390-allnoconfig (https://download.01.org/0day-ci/archive/2024101=
1/202410111804.pPMW9rqn-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7=
0e0a7e7e6a8541bcc46908c592eed561850e416)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241011/202410111804.pPMW9rqn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410111804.pPMW9rqn-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from fs/exportfs/expfs.c:15:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:181:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
>    In file included from include/linux/mm.h:2213:
>    include/linux/vmstat.h:518:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
> >> fs/exportfs/expfs.c:447:10: error: incompatible integer to pointer con=
version returning 'int' from a function with result type 'struct dentry *' =
[-Wint-conversion]
>      447 |                 return -EINVAL;
>          |                        ^~~~~~~
>    1 warning and 1 error generated.
>
>

This braino was already fixed in v4.

Sorry for the noise.

Thanks,
Amir.

> vim +447 fs/exportfs/expfs.c
>
>    434
>    435  struct dentry *
>    436  exportfs_decode_fh_raw(struct vfsmount *mnt, struct fid *fid, int=
 fh_len,
>    437                         int fileid_type, unsigned int flags,
>    438                         int (*acceptable)(void *, struct dentry *)=
,
>    439                         void *context)
>    440  {
>    441          const struct export_operations *nop =3D mnt->mnt_sb->s_ex=
port_op;
>    442          struct dentry *result, *alias;
>    443          char nbuf[NAME_MAX+1];
>    444          int err;
>    445
>    446          if (WARN_ON_ONCE(FILEID_USER_FLAGS(fileid_type)))
>  > 447                  return -EINVAL;
>    448
>    449          /*
>    450           * Try to get any dentry for the given file handle from t=
he filesystem.
>    451           */
>    452          if (!exportfs_can_decode_fh(nop))
>    453                  return ERR_PTR(-ESTALE);
>    454          result =3D nop->fh_to_dentry(mnt->mnt_sb, fid, fh_len, fi=
leid_type);
>    455          if (IS_ERR_OR_NULL(result))
>    456                  return result;
>    457
>    458          if ((flags & EXPORT_FH_DIR_ONLY) && !d_is_dir(result)) {
>    459                  err =3D -ENOTDIR;
>    460                  goto err_result;
>    461          }
>    462
>    463          /*
>    464           * If no acceptance criteria was specified by caller, a d=
isconnected
>    465           * dentry is also accepatable. Callers may use this mode =
to query if
>    466           * file handle is stale or to get a reference to an inode=
 without
>    467           * risking the high overhead caused by directory reconnec=
t.
>    468           */
>    469          if (!acceptable)
>    470                  return result;
>    471
>    472          if (d_is_dir(result)) {
>    473                  /*
>    474                   * This request is for a directory.
>    475                   *
>    476                   * On the positive side there is only one dentry =
for each
>    477                   * directory inode.  On the negative side this im=
plies that we
>    478                   * to ensure our dentry is connected all the way =
up to the
>    479                   * filesystem root.
>    480                   */
>    481                  if (result->d_flags & DCACHE_DISCONNECTED) {
>    482                          err =3D reconnect_path(mnt, result, nbuf)=
;
>    483                          if (err)
>    484                                  goto err_result;
>    485                  }
>    486
>    487                  if (!acceptable(context, result)) {
>    488                          err =3D -EACCES;
>    489                          goto err_result;
>    490                  }
>    491
>    492                  return result;
>    493          } else {
>    494                  /*
>    495                   * It's not a directory.  Life is a little more c=
omplicated.
>    496                   */
>    497                  struct dentry *target_dir, *nresult;
>    498
>    499                  /*
>    500                   * See if either the dentry we just got from the =
filesystem
>    501                   * or any alias for it is acceptable.  This is al=
ways true
>    502                   * if this filesystem is exported without the sub=
treecheck
>    503                   * option.  If the filesystem is exported with th=
e subtree
>    504                   * check option there's a fair chance we need to =
look at
>    505                   * the parent directory in the file handle and ma=
ke sure
>    506                   * it's connected to the filesystem root.
>    507                   */
>    508                  alias =3D find_acceptable_alias(result, acceptabl=
e, context);
>    509                  if (alias)
>    510                          return alias;
>    511
>    512                  /*
>    513                   * Try to extract a dentry for the parent directo=
ry from the
>    514                   * file handle.  If this fails we'll have to give=
 up.
>    515                   */
>    516                  err =3D -ESTALE;
>    517                  if (!nop->fh_to_parent)
>    518                          goto err_result;
>    519
>    520                  target_dir =3D nop->fh_to_parent(mnt->mnt_sb, fid=
,
>    521                                  fh_len, fileid_type);
>    522                  if (!target_dir)
>    523                          goto err_result;
>    524                  err =3D PTR_ERR(target_dir);
>    525                  if (IS_ERR(target_dir))
>    526                          goto err_result;
>    527
>    528                  /*
>    529                   * And as usual we need to make sure the parent d=
irectory is
>    530                   * connected to the filesystem root.  The VFS rea=
lly doesn't
>    531                   * like disconnected directories..
>    532                   */
>    533                  err =3D reconnect_path(mnt, target_dir, nbuf);
>    534                  if (err) {
>    535                          dput(target_dir);
>    536                          goto err_result;
>    537                  }
>    538
>    539                  /*
>    540                   * Now that we've got both a well-connected paren=
t and a
>    541                   * dentry for the inode we're after, make sure th=
at our
>    542                   * inode is actually connected to the parent.
>    543                   */
>    544                  err =3D exportfs_get_name(mnt, target_dir, nbuf, =
result);
>    545                  if (err) {
>    546                          dput(target_dir);
>    547                          goto err_result;
>    548                  }
>    549
>    550                  inode_lock(target_dir->d_inode);
>    551                  nresult =3D lookup_one(mnt_idmap(mnt), nbuf,
>    552                                       target_dir, strlen(nbuf));
>    553                  if (!IS_ERR(nresult)) {
>    554                          if (unlikely(nresult->d_inode !=3D result=
->d_inode)) {
>    555                                  dput(nresult);
>    556                                  nresult =3D ERR_PTR(-ESTALE);
>    557                          }
>    558                  }
>    559                  inode_unlock(target_dir->d_inode);
>    560                  /*
>    561                   * At this point we are done with the parent, but=
 it's pinned
>    562                   * by the child dentry anyway.
>    563                   */
>    564                  dput(target_dir);
>    565
>    566                  if (IS_ERR(nresult)) {
>    567                          err =3D PTR_ERR(nresult);
>    568                          goto err_result;
>    569                  }
>    570                  dput(result);
>    571                  result =3D nresult;
>    572
>    573                  /*
>    574                   * And finally make sure the dentry is actually a=
cceptable
>    575                   * to NFSD.
>    576                   */
>    577                  alias =3D find_acceptable_alias(result, acceptabl=
e, context);
>    578                  if (!alias) {
>    579                          err =3D -EACCES;
>    580                          goto err_result;
>    581                  }
>    582
>    583                  return alias;
>    584          }
>    585
>    586   err_result:
>    587          dput(result);
>    588          return ERR_PTR(err);
>    589  }
>    590  EXPORT_SYMBOL_GPL(exportfs_decode_fh_raw);
>    591
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
