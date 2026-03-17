Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A696F3C6A2B
	for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 13:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752673; cv=pass; b=TVCBwiSJxklI1qa86hvdG58wDza8mFA0QDwHIDZpH0QaKZQnz7OZ5b37YpYXuTM3SMPZPp3oVLvRnOlhG12+APRNoAIa4Hl3jhCbYB/ykguLJLbOcFawGLb4wI9JWLjXG4qcETzGJczvJXJQPB2VR5K7rdS46Azn2n7dEzMT/CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752673; c=relaxed/simple;
	bh=HOKSjD3DqXm2Q72cQVGdFQMwGQQ1FcKjaSZW8AAyutw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlZMjok2EGID5RRaJS7RENyO3Q84+kZR6unxgFlLrTvfbaeRoUDB6IVDVy7H6kU+CamHbW4pxq2QRPmJyuZgsJQ0xYa/jw6W2s7aOsSp9SJG7fU7WB6hEWCX/K+/7sDnmN8GLubOBkZYzv3/4319Hm7DgvXaBGcq1nqe+SrnYdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GtgwNG/4; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GtgwNG/4"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6644a3029b3so6644952a12.0
        for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 06:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773752670; cv=none;
        d=google.com; s=arc-20240605;
        b=a90TaDGuXNMREKOOb08TebixyZQCI1O8RwFBXbLXuzV0Ng6bOa2ZmChMsfLMZduyFg
         sp70/XuJUVjZFFcdx3RgibTsFkJAblJ+t66arKIHrSbdwqPeKh+HbtNFWdWuBeN9hY4F
         vDWeAdlcQgSUJ2UY0lo4jIosy+n0WmtIjfGW09lPvn4AYBxV4u/YUnDdrFt/inyj9unO
         Fn6c+d0w/CVbyGdSIbmcGvQBuMPLGHxuxhWQXwwSwhytSemYqjoyF5qqORWtAaBAldlK
         8objJyQ+qu8/mBsHCzrV063C9BqoPdEH8HcMenUZzmDwYe2VhPqZzWcaZBIoTyxIxAhx
         EVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysuLlj+wUK3hDLUIv/hpeGMF0lK81wTkavGvi0NT4w8=;
        fh=m4enFtmrl3jufLBUzGQeSyiuzNKN6LL24/s/QYDfcFQ=;
        b=MJicblB58kgNlwCibaXiIl+aMdoOsCdiISEWZto10FcAVCL3NbbxBrL0v2kE59pQff
         ExmgNJx1IldtU2SCKE2EfpP/J1aan41YyDAhew5se87ZHJy5sfZmI1TzF/qQUrKscjjY
         4nsymv1yQhbjjpAUvoTarmviIQOELnGd9NnkThHsbgb28FJyh5D8/ic1zrIz8IeSTZS9
         fgelFcFTL8xBQUzM4tmnbYFsuqV+DT+V28wXAYeAvk5ME/SyUdZQ/atQETC3IHNnz7mC
         Ex+nrdG/X64j5puu//k7NdgDXKW/XYUsp/lHOtEIzhs4cGnZ2r/nWsLz/CKyweIf1lFp
         v5pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1773752670; x=1774357470; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysuLlj+wUK3hDLUIv/hpeGMF0lK81wTkavGvi0NT4w8=;
        b=GtgwNG/4peV40X0hmWoQjbTb9dbPnQFimjNQpGZLgRP/jPo6kkOvfcKu2KBnA5PmCA
         VI5q7P9ge8ElMXFxEAKfk+ug+zJP89HSjlmZb4d+qe0ZadPgYpzF+gjEIk85Eu2Ygj4I
         J9BGgx61j7KvDOV/OBtykArLZQTScwXqUmUJbnUKA2Z+ZnzTMA/I1NtJfcW6oDuAnE7r
         haSK4XRH9NBiFQ/WDBITLpCxUM5xIYhzeaMJ//9EuhUngyBxrgna/yEgoZxhsoAj8cIO
         t9AV0fdo7326OMkyHH3eQz8BluUUZ80adlp8+xUUtYYHdqw0MOA/7oALvJqE+zDr3h9x
         5aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752670; x=1774357470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysuLlj+wUK3hDLUIv/hpeGMF0lK81wTkavGvi0NT4w8=;
        b=fRQ7oPU8seN2UoAIfsYlsr+Y/fjnjXFzJd0R33/a8mxjrtRxHDKMxsnYQ2KImLU0A0
         8haLbUIkKZ931COLK6mhbh+oSsKa7NWLqJ4e8XAItdd/BeCHXukrl1utrLxWUXEsN8DN
         IqMQU204ru5EJeVaIBAMkuYrWVoGku1aE7gQaM3jTjkqYt0VNPYZvTSUuiuN1HJhv5Vi
         y2NpTT8suUXTOjPHmQisXRij0etlZgQwsQM+vGJbdvlOYOtZfI0zRvDQFF99QXJlnSYo
         uvy+S+2yIi8KummHRxlbRDcmUcbJcdW+QPHWNj9QYwbgfgR6YaPRWJreL4zdYjAhZLt+
         hFag==
X-Forwarded-Encrypted: i=1; AJvYcCXCz1Z/YY6+c56DJba7PBeJR3MLf1mMqYZ5MZh7tW1NkFT/NObQyRpSqQ5E3OBc4RTROMV7@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4IQsrMNswkn75JT3pAwRBeO36SDABofK5XIx3P2Gr1MThpn2v
	tLHJIhzQi02Ybwg6N3jVZItJqSh2b4SqKvsyoM+sM5v69oTV3aXiYQTSFbVigyBS6cbcQmtWy1D
	2+0vcyGfFfMGkrtENO9dbtscxmoEs7ORprtClCVzdqg==
X-Gm-Gg: ATEYQzypY6rEemyurB6Ykl55L4siKDkKU8Da1qurl+IEEdyx/qa0AIAlSOwBZF57PGf
	zdaMLqmQelOSzWWzO1zaLiBgMpKIL1W4GMfQPEe2c+c1C+BGp/iLk75DUp8tYjmw2jVLAIHyFHy
	pfntoahK43+9Kq6pJ9ZPt0WjEmKsRfepizPrKGf7eXDOTNV7oWZrm2hetbk8qySw8hlRBNCUcsO
	F8HhfsBz6wQunkJn9zqMMPx2XwC3LmqeJcRIHCnhVc5Tt70ZPggeO694Acmwqy9S5WHeOOR9tq8
	Zu67lDuFcmorwZOr7ant7Gw/BIZQMWdOsbG6Vw==
X-Received: by 2002:a05:6402:f01:b0:658:d1b0:9970 with SMTP id
 4fb4d7f45d1cf-663ba0ffedemr7428895a12.5.1773752669881; Tue, 17 Mar 2026
 06:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317025049.494931-6-pasha.tatashin@soleen.com> <202603171111.YBKWkKnp-lkp@intel.com>
In-Reply-To: <202603171111.YBKWkKnp-lkp@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 17 Mar 2026 09:03:52 -0400
X-Gm-Features: AaiRm53BOiJuI_VHcpORXajPgafrQwkAny2SxrdtOShKer-_ZbanQn5yTzxfajY
Message-ID: <CA+CK2bALxiExWL3LuF_+fhctKGYmdBQejjFiw09jFiV1UtPZ3A@mail.gmail.com>
Subject: Re: [PATCH 5/6] liveupdate: Make unregister functions return void
To: kernel test robot <lkp@intel.com>
Cc: rppt@kernel.org, pratyush@kernel.org, linux-kernel@vger.kernel.org, 
	dmatlack@google.com, akpm@linux-foundation.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 6:11=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Pasha,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-nonmm-unstable]
> [also build test WARNING on akpm-mm/mm-everything linus/master v7.0-rc4 n=
ext-20260316]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Pasha-Tatashin/liv=
eupdate-Protect-file-handler-list-with-rwsem/20260317-105522
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-no=
nmm-unstable
> patch link:    https://lore.kernel.org/r/20260317025049.494931-6-pasha.ta=
tashin%40soleen.com
> patch subject: [PATCH 5/6] liveupdate: Make unregister functions return v=
oid
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260317/20=
2603171111.YBKWkKnp-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260317/202603171111.YBKWkKnp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603171111.YBKWkKnp-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from kernel/kexec_core.c:18:
> >> include/linux/liveupdate.h:274:2: warning: void function 'liveupdate_u=
nregister_flb' should not return a value [-Wreturn-mismatch]
>      274 |         return -EOPNOTSUPP;
>          |         ^      ~~~~~~~~~~~
>    1 warning generated.

Ah, forgot to update these. Will send v2 soon.

Pasha

>
>
> vim +/liveupdate_unregister_flb +274 include/linux/liveupdate.h
>
> cab056f2aae725 Pasha Tatashin 2025-12-18  270
> e62bd1ab0687a1 Pasha Tatashin 2026-03-16  271  static inline void liveupd=
ate_unregister_flb(struct liveupdate_file_handler *fh,
> cab056f2aae725 Pasha Tatashin 2025-12-18  272                            =
            struct liveupdate_flb *flb)
> cab056f2aae725 Pasha Tatashin 2025-12-18  273  {
> cab056f2aae725 Pasha Tatashin 2025-12-18 @274   return -EOPNOTSUPP;
> cab056f2aae725 Pasha Tatashin 2025-12-18  275  }
> cab056f2aae725 Pasha Tatashin 2025-12-18  276
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
