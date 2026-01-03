Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DF381C4
	for <llvm@lists.linux.dev>; Sat,  3 Jan 2026 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767456302; cv=none; b=iXq0SS0zsKaAuoiA9bbioPb6Z+9TVJQkmnBVYEcK82ReaqvJI6Xz2T6XXxyEw3SJyFodJdVA7eWxRIjwtXVrQqkxfa1kwvqyBwENAkub5sBU4/4q2SGTL+EkfIAN6nJ9JBo7GnIRu8DwSPddpxus+ni+6oWXPBAU0C2F0J5U50A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767456302; c=relaxed/simple;
	bh=qRHbeiv/A6I0MACeJQn78sbIYRJnfphXgKW/rlUw7yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fcg5lBVqgJ3fKQChAFeQxzs2LFX9xJyXzSWtfc7pHV5m2fGztQPGRwiFfKl9haLqHSH69kN3rz1WIxiJlR0qVL5vW4LKdcSVtAkDi7AuUyw0U009mq1KvThuivnLScCdUr1ymj/Q+ldQ5pGyV0eAGqEADAPVmlK2dUMy/BjMlM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxTiuBGJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxTiuBGJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so1612635a12.1
        for <llvm@lists.linux.dev>; Sat, 03 Jan 2026 08:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767456299; x=1768061099; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFLKr5spITWdnAr0PoMW7AEp5ipESSDuj+EKefkgI38=;
        b=SxTiuBGJsWe03ZtkE2OfLC3cLk/98bDPJiQSblUSQXlnfmeVUf3X/mixzM9sKN1N0c
         JjKGqyyc1jwaDorVNaiHUuk3G3Rs33ZG6VECTQ0HpItFY3HVw9f4+rYi+Di1WxtrWFxV
         agMfY568sw5AdNP6GMZaSYvBCfNYxK9gcNTaJBaBFJVolsD0s5LtGDyAj4BfwSNv79u5
         XoZDO5topSuCe1h81Jy3LyzcEDKecbgmVFYzBxrNdiLhVYfR62qhFUUdi/te0/PwGRYj
         Y/ArJsMYhFC1KbrYsMGrU8VMUvoSvhMUdlw837OxsvlmfEbcC1xy/GVymMg9+ZxzZSMi
         dWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767456299; x=1768061099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LFLKr5spITWdnAr0PoMW7AEp5ipESSDuj+EKefkgI38=;
        b=nUAAIOc2DT28mxvpTSXgBSGeWYdASJvu0smcq7OCig7WVvqw+g8HSjvoWQB1JxKe10
         8qkt/yJQBBS8cQeSPlmopKC6mIGa53dzwgdNhAWH5nooE25e4XENhAf7Ob3xDtD2y9HC
         Fys0He2buXIqRHy1HiLjKalj9kYZQxji+jeYugQEofg60SaT3RSox97ZKNhKcYZdiFsB
         icrJYuhy+04+Nk65ptvsW5bQWybW1EegzW3dN84ee2Oq6ctyeKPTiL8jCJ1mZBwOHDaF
         4nqRAfeM97CE+uPca68gJ1MB3W29Vm2eXgAElzg0ayiUaqnlAuv55AUMYGklx370oA1N
         MKTg==
X-Forwarded-Encrypted: i=1; AJvYcCXLbyN4+StPVr5iGRpYXiybQGfkdfR10frIkSEeE4i21RhQWNv4w2oi4X6SgwMWJuiTB/J8@lists.linux.dev
X-Gm-Message-State: AOJu0Yw70OpQ8q8Wlf8i+WJ20jdu+M8Y1eHTWHNZem+mBI72TvHfWO/T
	2ZQUYfzg9oaFNQGq9B8UrTLkLRRde8RlSXhlYhWdV9cO4YoJPqVjodWJUaUf7EHKTNhWM6/md52
	FxcTLcpi8WLRxBOC2a3tFIBMW24H4MA==
X-Gm-Gg: AY/fxX56QVv60tZOlMuwRuGopgeiUcYz2uyIcL38bB04PKi0sDgGrImFIWla8MRquG8
	E9p1X3LX7yRI/TSYBtsu4RGHCMYbcje95rIVn+AEdeZf1pIV9mBkCLqG4gNzyx2dTYMvzXgOcwi
	rJzTiwUuVzrPPOWo0CrZWvfUgOYJnqIKMsuec8V5t25sztp/lQw07VpWtrcgc18pKx+tgHkb88h
	2LnZl6LWzJIISp30V8gJSYLZeRhUn2X6VHLJ4T/Z6jGDMq01QPpXuq3vcg5y1X6bnL0GT1/ZqLg
	s01IZWWdrxzq22QREYMDNoK7NPs5qjEbKHwo
X-Google-Smtp-Source: AGHT+IH4x1nhpw0xpZLa5d8lfcMRteEnYH5oS+qlteZuWyB6bCwtlDmvUEYjc2hO8vNFFTMEM/Iol8GNJL2/0R3hzzM=
X-Received: by 2002:a05:6402:2706:b0:64b:5851:5e7b with SMTP id
 4fb4d7f45d1cf-64fd4a43a4dmr2736375a12.14.1767456298512; Sat, 03 Jan 2026
 08:04:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260102232934.1560-6-rick.macklem@gmail.com> <202601031506.MX594pma-lkp@intel.com>
In-Reply-To: <202601031506.MX594pma-lkp@intel.com>
From: Rick Macklem <rick.macklem@gmail.com>
Date: Sat, 3 Jan 2026 08:04:46 -0800
X-Gm-Features: AQt7F2ocQPosiLJho2njFNk1mj6fnJMMVq9pBA9JF7oTe097MVdvaQQLXJx9yoY
Message-ID: <CAM5tNy7QUweys+yXO=KZ5TFLDVnBr-Jsd2zrmCL0H7EdJU72PQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] Make nfs4_server_supports_acls() global
To: kernel test robot <lkp@intel.com>
Cc: linux-nfs@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Rick Macklem <rmacklem@uoguelph.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The reason this happens is that this patch series requires
the 0001 patch from the server series.

Should I repost with that patch including in this set as well?

rick

On Sat, Jan 3, 2026 at 6:37=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on trondmy-nfs/linux-next]
> [also build test ERROR on linus/master v6.16-rc1 next-20251219]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/rick-macklem-gmail=
-com/Add-entries-to-the-predefined-client-operations-enum/20260103-073239
> base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
> patch link:    https://lore.kernel.org/r/20260102232934.1560-6-rick.mackl=
em%40gmail.com
> patch subject: [PATCH v1 5/7] Make nfs4_server_supports_acls() global
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260103/20=
2601031506.MX594pma-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260103/202601031506.MX594pma-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601031506.MX594pma-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> fs/nfs/nfs4proc.c:6083:36: error: use of undeclared identifier 'FATTR4=
_WORD2_POSIX_DEFAULT_ACL'
>     6083 |                 return server->attr_bitmask[2] & FATTR4_WORD2_=
POSIX_DEFAULT_ACL;
>          |                                                  ^
> >> fs/nfs/nfs4proc.c:6085:36: error: use of undeclared identifier 'FATTR4=
_WORD2_POSIX_ACCESS_ACL'
>     6085 |                 return server->attr_bitmask[2] & FATTR4_WORD2_=
POSIX_ACCESS_ACL;
>          |                                                  ^
>    fs/nfs/nfs4proc.c:9630:12: warning: variable 'ptr' set but not used [-=
Wunused-but-set-variable]
>     9630 |         unsigned *ptr;
>          |                   ^
>    1 warning and 2 errors generated.
>
>
> vim +/FATTR4_WORD2_POSIX_DEFAULT_ACL +6083 fs/nfs/nfs4proc.c
>
>   6071
>   6072  bool nfs4_server_supports_acls(const struct nfs_server *server,
>   6073                                        enum nfs4_acl_type type)
>   6074  {
>   6075          switch (type) {
>   6076          default:
>   6077                  return server->attr_bitmask[0] & FATTR4_WORD0_ACL=
;
>   6078          case NFS4ACL_DACL:
>   6079                  return server->attr_bitmask[1] & FATTR4_WORD1_DAC=
L;
>   6080          case NFS4ACL_SACL:
>   6081                  return server->attr_bitmask[1] & FATTR4_WORD1_SAC=
L;
>   6082          case NFS4ACL_POSIXDEFAULT:
> > 6083                  return server->attr_bitmask[2] & FATTR4_WORD2_POS=
IX_DEFAULT_ACL;
>   6084          case NFS4ACL_POSIXACCESS:
> > 6085                  return server->attr_bitmask[2] & FATTR4_WORD2_POS=
IX_ACCESS_ACL;
>   6086          }
>   6087  }
>   6088
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
