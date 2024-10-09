Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CAE18EFEB
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468570; cv=none; b=jayqW409df3CdHJvzuj/Rzg988726AWKxTwzDdL/VqFwR7ls9BHcZcZVrvgbnCB1BfTupQg9yCaD14fLWvEYknn4w5jYHkW0ciAoA+8y58MgeS7H2Xej53RXvJMyzxeh2g5P7A/9r2O66BlbKUaxLujubXEp1YQkVg4CbPnF5Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468570; c=relaxed/simple;
	bh=Yfb4Jj4d9DKxDIfB/e69j839hlEqbcwzQIsu8yjAq2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJa/n2J2YimqYrNPnAWSVZw/sMU4xkuZAd6J42kKdh6pXGhYDiwE9KQEWAZcaVRPHFXLLADz1AQTpNVVfNnIs2ZEP2YGeyqd+N4oP+F1XUT6Wr9Y126TFDKLyCdWQlJnCouXwG8B2oeI+6O3XpDc1nLcaec3UFgDMqwvqi2d7YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XNFXhXKM; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XNFXhXKM"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5399675e14cso7736075e87.3
        for <llvm@lists.linux.dev>; Wed, 09 Oct 2024 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728468565; x=1729073365; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JCN+MqNwKB+xq7DJqcu2c22e3shYGFUi85UwCEHpck=;
        b=XNFXhXKMsYGjDzDvkiR3a0g8nuogyHI94d1upCkESsH8OyqopBwbA9eiqvGvBODPoh
         aQ1t946ZSzRDUThqCigkvj2/iE43Jay1XUL9UqdXX+eJhFdkM4/A2q+2yJl2POus4H6y
         WuKqWutfBYMZknexjuMF5g90yChSCokYW696KqHLIXnyqII0eAcQlXVvUCHq12ECtLpB
         M2D5IR1u+wWvhEyDZwUV0kaYuiws/dleOk+OH9r0jmlsPIwTqnXJPYLys5OTl7byEKqa
         tZAvJ5aZdJMTtGX531hFKtsaMNY+awCGvZGZsTFFYrST4IJ3ugaE0vlQa5bEOiW+j+nO
         aaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728468565; x=1729073365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JCN+MqNwKB+xq7DJqcu2c22e3shYGFUi85UwCEHpck=;
        b=rMnyJdBOdke5pDFoi0jFUVhk6asleF3KJrIV85CNNsQO6nVhkFJBL0yIAkKuf0XBYw
         xz/yb/IzWQTqXaWrBuIMqa1M06UV8gPKyIdAUgPYobs3Xcni4CTzzQfbuEjKTR4pjCdC
         jxZURC4U7BkQpg9QcPftVbpFk9I1brUDv8EMvs1Vmh6HhfMkU+N8nsTRRU2fDMp4seE0
         9C/Dtdht3YmPHHEXh5ML9XBbNy+GJcuSKtyQowArb7VYV+5JPWIfU8jckA5h7XuFB6bZ
         ioHHzstZAXLFif8VqwbXj2jMwPPaXvNZX52VTIQR4gwdKOMW2cLKdABYJEwXzVhYQi1S
         7j+A==
X-Gm-Message-State: AOJu0Yy2iRbtovjkceJQjdNlfHWfoIwzpR+INp+n5dT6zngbWnuVf1M0
	yltqv1bQ+wmFCj08oDbPZbngumrTVT5WB2BQtPnaW7odzKEmYR/7lJbFt8fcAUfTbZk+j8Nm2kw
	NPk/In2xGKZELkBKY8gGw/axf4jbHgpDGzLjY3g==
X-Google-Smtp-Source: AGHT+IFTR4aAdG0xRnbrM1o9GBPsFiAJ6nHLa2xX7thhMATNrBF1ULIeimPZZaeqCiGE8ZQokCDJj12FbT6MOOZiYvk=
X-Received: by 2002:a05:6512:110e:b0:536:a275:9d61 with SMTP id
 2adb3069b0e04-539c48c3883mr1055475e87.21.1728468564615; Wed, 09 Oct 2024
 03:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410091038.SI34ZULQ-lkp@intel.com>
In-Reply-To: <202410091038.SI34ZULQ-lkp@intel.com>
From: Filipe Manana <fdmanana@suse.com>
Date: Wed, 9 Oct 2024 11:09:13 +0100
Message-ID: <CAKisOQHVBRbpsDnWRa40Rga1hjW_5xuwPAshXY=6+nNb6O8OOg@mail.gmail.com>
Subject: Re: [linux-next:pending-fixes 207/319] fs/btrfs/qgroup.c:2014:6:
 error: use of undeclared identifier 'bytenr'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 3:55=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it pending-fixes
> head:   47fa0de9b07c6214b57458e965646a3e25656b69
> commit: 5c0ea18d992fffc948e087c0002560d747e6edd9 [207/319] btrfs: use sec=
tor numbers as keys for the dirty extents xarray
> config: arm-randconfig-002-20241009 (https://download.01.org/0day-ci/arch=
ive/20241009/202410091038.SI34ZULQ-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfd=
cc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241009/202410091038.SI34ZULQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410091038.SI34ZULQ-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> fs/btrfs/qgroup.c:2014:6: error: use of undeclared identifier 'bytenr'
>            if (bytenr >=3D MAX_LFS_FILESIZE) {

Ah this should be record->bytenr.
The issue is actually fixed in a later patch of the same patchset,
where bytenr is a function argument.

I can update the patch but then it will require updating the patches
that come next from the same patchset and rebasing the for-next
branch.
And I see it's already in the next-fixes branch.

David, how do you prefer to proceed here? Do you want me to fix this
and resend the patchset?

Thanks.


>                ^
>    fs/btrfs/qgroup.c:2017:9: error: use of undeclared identifier 'bytenr'
>                                 bytenr);
>                                 ^
>    2 errors generated.
>
>
> vim +/bytenr +2014 fs/btrfs/qgroup.c
>
>   1991
>   1992  /*
>   1993   * Inform qgroup to trace one dirty extent, its info is recorded =
in @record.
>   1994   * So qgroup can account it at transaction committing time.
>   1995   *
>   1996   * No lock version, caller must acquire delayed ref lock and allo=
cated memory,
>   1997   * then call btrfs_qgroup_trace_extent_post() after exiting lock =
context.
>   1998   *
>   1999   * Return 0 for success insert
>   2000   * Return >0 for existing record, caller can free @record safely.
>   2001   * Return <0 for insertion failure, caller can free @record safel=
y.
>   2002   */
>   2003  int btrfs_qgroup_trace_extent_nolock(struct btrfs_fs_info *fs_inf=
o,
>   2004                                  struct btrfs_delayed_ref_root *de=
layed_refs,
>   2005                                  struct btrfs_qgroup_extent_record=
 *record)
>   2006  {
>   2007          struct btrfs_qgroup_extent_record *existing, *ret;
>   2008          const unsigned long index =3D (record->bytenr >> fs_info-=
>sectorsize_bits);
>   2009
>   2010          if (!btrfs_qgroup_full_accounting(fs_info))
>   2011                  return 1;
>   2012
>   2013  #if BITS_PER_LONG =3D=3D 32
> > 2014          if (bytenr >=3D MAX_LFS_FILESIZE) {
>   2015                  btrfs_err_rl(fs_info,
>   2016  "qgroup record for extent at %llu is beyond 32bit page cache and =
xarray index limit",
>   2017                               bytenr);
>   2018                  btrfs_err_32bit_limit(fs_info);
>   2019                  return -EOVERFLOW;
>   2020          }
>   2021  #endif
>   2022
>   2023          lockdep_assert_held(&delayed_refs->lock);
>   2024          trace_btrfs_qgroup_trace_extent(fs_info, record);
>   2025
>   2026          xa_lock(&delayed_refs->dirty_extents);
>   2027          existing =3D xa_load(&delayed_refs->dirty_extents, index)=
;
>   2028          if (existing) {
>   2029                  if (record->data_rsv && !existing->data_rsv) {
>   2030                          existing->data_rsv =3D record->data_rsv;
>   2031                          existing->data_rsv_refroot =3D record->da=
ta_rsv_refroot;
>   2032                  }
>   2033                  xa_unlock(&delayed_refs->dirty_extents);
>   2034                  return 1;
>   2035          }
>   2036
>   2037          ret =3D __xa_store(&delayed_refs->dirty_extents, index, r=
ecord, GFP_ATOMIC);
>   2038          xa_unlock(&delayed_refs->dirty_extents);
>   2039          if (xa_is_err(ret)) {
>   2040                  qgroup_mark_inconsistent(fs_info);
>   2041                  return xa_err(ret);
>   2042          }
>   2043
>   2044          return 0;
>   2045  }
>   2046
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
