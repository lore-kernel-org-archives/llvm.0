Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A681AE01F
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728923202; cv=none; b=X8mDi7YRvaekLLI/68IhUfwDtbhprEbz9rVVXR9bHe9QhyD0Tfkz0ZqJEDAtnebM0vISIaHS/UX3ymH4IqCVd9IpWsKg29ZqNvj3fhdkYRIudlOL5TqbZeIwA9FbfOy3hijmu/4QU9vD1QDLkhNDMI0sSeRnTVhZw5Xy1zDEB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728923202; c=relaxed/simple;
	bh=QvEXevIy9dd7VrawvS/ELLTEAUacoS7dBvsw2r64LGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tq9MOA7SfHkzFO5SrMrsmTQTpuxZdVd7LyJ5D3rKNZeXH1SyrjFcKbM5jX3NcWTFhAkIwVE8Uu/Fq1Qwat+owOZ9sc6U4izUjZ8yYLrV5ELWhlldfM43oipae3/gIGGFJp2UqzPy40XzR5bLwpVwRYFKDgfF1UcLUxhBQHZZLM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TJxcAWUX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TJxcAWUX"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e690479cso2049133e87.3
        for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728923199; x=1729527999; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IBErJIx/wIvP+a4LTNnwWE+t5/rP0cRqFDHeieH9Wk=;
        b=TJxcAWUXUEwYdGAzPRVjFWd5U/V3TfcLfknHuwu2Vn7BONa7kspOJB5NhLrdkbEJfh
         AysFabpPmAWfVYC3+BKggz3pFSgmB3/CWL1ECwe7BvaqX0r/Gk+tLHsDOkpzOAmdoWWU
         xRBVdtaUi+7RbaKvaiYwgvu/gLfJafObxoHtT7Ryr6rh8tB2LMMPCeI8w+EHxK3Is5gK
         pK5RTplwr0qqn4FIveWfE0Hy/wJPjzOC9Ab5EGTvDruPGtObuUahKYMUeJj4yTu4srOg
         eAAWDNbQuDjAhFoE24FVNxwZKEcVNK3yOfiYDTF5x/J3z2VvNAPgKoIfDgjgg6c71uwI
         Ip/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728923199; x=1729527999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IBErJIx/wIvP+a4LTNnwWE+t5/rP0cRqFDHeieH9Wk=;
        b=rTJLJhoL0XK4uoFS4OBYXi0kMfsM1O2UFvzREe5EEezQStQ9hvyw7Z0Tnd6HxsmCuL
         Yf3ytRdbpvSg9SARe9tIzaRbHRuKcXDEPRJrqDmZu8MjJhH1oC7JUX9vZrq24xmmp+7U
         Dju1U9lu5+ey6wuCH8oIarb6zTsUb0wUulMRUPqc5rHwDy7aA+KEopBweO8c567DMH4i
         CD4UW+rYhmNPA0liJtVr2jFGWfOuvssjGo6ezP5NKRUJ3wGxaQK/5LfxcRTVRdkCp7U4
         +Hmlr2eVFDx4lZVD5MoAweXGB2bE2+iSdZO7Zmeymcz6cGMV+WZxS6hI4+wpqgkJEvo+
         Ll7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUF9E0Xuwy8IcDRyCsI3fAzer30rBMeE6vhpHBbRd2eVTWL6pCe4O6yGnsvMPXwrq9WMYP8@lists.linux.dev
X-Gm-Message-State: AOJu0YxCW6vAj9hm0lkNiANjilSxZvz46R8gSLgMYK+yVJ1dBxumFyVJ
	niZ7pKRMytnHdWDAzqzcW8BHfj+2suPErxc/huUB1cTXWBN6zsfFPOFzs1BeH+Cj4Y83GgPS+ew
	ClmuiFsBONR8vcVAShuZMPESxh58nBHb6OdSztw==
X-Google-Smtp-Source: AGHT+IFLbBXm/lwEAcA7Adg943gvOcisiTVZDOcTviAkuAYwY1R40RFo0n5I3CCEhKa3rGaJBXZhjQajsiomZmnRgVk=
X-Received: by 2002:a05:6512:b14:b0:52e:9b2f:c313 with SMTP id
 2adb3069b0e04-539e54f8704mr3433678e87.22.1728923198611; Mon, 14 Oct 2024
 09:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410091038.SI34ZULQ-lkp@intel.com> <CAKisOQHVBRbpsDnWRa40Rga1hjW_5xuwPAshXY=6+nNb6O8OOg@mail.gmail.com>
 <20241009113029.GJ1609@suse.cz>
In-Reply-To: <20241009113029.GJ1609@suse.cz>
From: Filipe Manana <fdmanana@suse.com>
Date: Mon, 14 Oct 2024 17:26:26 +0100
Message-ID: <CAKisOQGSRdm=XurQ_Fd83c6dRsVLeg7Jbh4DRMARRHqsxHvf=w@mail.gmail.com>
Subject: Re: [linux-next:pending-fixes 207/319] fs/btrfs/qgroup.c:2014:6:
 error: use of undeclared identifier 'bytenr'
To: dsterba@suse.cz
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:30=E2=80=AFPM David Sterba <dsterba@suse.cz> wrot=
e:
>
> On Wed, Oct 09, 2024 at 11:09:13AM +0100, Filipe Manana wrote:
> > On Wed, Oct 9, 2024 at 3:55=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git pending-fixes
> > > head:   47fa0de9b07c6214b57458e965646a3e25656b69
> > > commit: 5c0ea18d992fffc948e087c0002560d747e6edd9 [207/319] btrfs: use=
 sector numbers as keys for the dirty extents xarray
> > > config: arm-randconfig-002-20241009 (https://download.01.org/0day-ci/=
archive/20241009/202410091038.SI34ZULQ-lkp@intel.com/config)
> > > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project =
8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20241009/202410091038.SI34ZULQ-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202410091038.SI34ZULQ=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> fs/btrfs/qgroup.c:2014:6: error: use of undeclared identifier 'byt=
enr'
> > >            if (bytenr >=3D MAX_LFS_FILESIZE) {
> >
> > Ah this should be record->bytenr.
> > The issue is actually fixed in a later patch of the same patchset,
> > where bytenr is a function argument.
> >
> > I can update the patch but then it will require updating the patches
> > that come next from the same patchset and rebasing the for-next
> > branch.
> > And I see it's already in the next-fixes branch.
> >
> > David, how do you prefer to proceed here? Do you want me to fix this
> > and resend the patchset?
>
> No need to resend, I'll fix it locally, the patch in next-fixes was the
> old one so I'll sync it with what's in our development for-next (and
> also check the others just in case).  I'll also check and update all the
> branches involved in the for-next pulled by linux-next.

Btw, I noticed that only the 2nd patch ("btrfs: use sector numbers as
keys for the dirty extents xarray") was updated,
so now it doesn't break 32 bits builds anymore.

However the next patch in the series ("btrfs: qgroups: remove bytenr
field from struct btrfs_qgroup_extent_record") wasn't updated,
and it now breaks 32 bits builds. At the same location, it needs to
use "bytenr" instead of "record->bytenr".

Do you want me to update the patches and send them to the list?

There's one more change that needs to be squashed (to that last patch)
that triggers a use-after-free reported by syzbot, which is:

https://lore.kernel.org/linux-btrfs/02fc507b62b19be2348fc08de8b13bd7af1a440=
e.1728922973.git.fdmanana@suse.com/

Thanks.
