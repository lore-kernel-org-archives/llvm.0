Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87FB18DB01
	for <llvm@lists.linux.dev>; Tue,  3 Mar 2026 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558328; cv=pass; b=syrcoY8ti02ZJnhFzFq+Z+gpf4zsApy6Q1TBS+/3a0RR1QHGbLyuCbmI6vTUeKZB2pBM0WY1/7yTchnWEnI7r1lxH9GQ/IF22jgOkSrdUj1qCXjfpe2+NouNhx+Ot4RWLOtjbNn9FVccvIUU2XU+/mx7/HCj02/cAFeXmm8fF4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558328; c=relaxed/simple;
	bh=M00ZxH9NQtIGmBwxo4PARuqjBVD/RSWQ+jaKn3U1FXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHs73HPHQpN6Z5CDeWtV9TcgHMH+2oV2Iy+3e4Re+K8yGZWwP02ZLdvOLFjnCwnxVjSoYpp/VbE0f0JHXLjogrnbzG9xJVY32STvcvwfxgqY2b8dsfX5GGL0Q4023ndcV6Gy9u5GZW6fIQsWTnFBuWTeJdS7LGTiD5Jw2QCDMJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SryUWC3+; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SryUWC3+"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb39f64348so589680385a.0
        for <llvm@lists.linux.dev>; Tue, 03 Mar 2026 09:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772558326; cv=none;
        d=google.com; s=arc-20240605;
        b=aGFWcwwEMXHhQ8QLi+TwahWaiuWw95z1pRyVsswIEiJK9sE8AsRNxrstEFutc64VGq
         B1rXCOQmuXcoUmOefOJ+AtqDBXe62mO0iBWYNly/ufNcuFlpL+al+/5dmQy8SqJ5FXYv
         h9rTqfvITHgpInS4vzoNTnj9HOpqF3jchjlDaSSmLT/AExQ1TZ4TjstR1AkMxVaJNrSm
         YSMpVspW9sxv3/ueaci9i/ykzFqyUYebGG5X2HSb/ei+8kOz6JPSzSK/FR1EutpSt7ne
         enPhYtb/e6iMmNvqH4Aq50o/BKmWu6n4+OKf6K2YI2zji0FWVNc6ZdjINSYe3BkTIo22
         R3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lI+H26YOBNt/1DoRS04AjyW78q1APVhvhlkjEdWFqfQ=;
        fh=Ej08edwIBB5jpF/BGWkVcFgD5mtqlNkMEAHpi1yreJE=;
        b=JQf0MOKpRQry4bzlc3HtYSD8phIcJ9OAcs6x9qtL3rfc5SL1xcSoPjTFLnGWvtspjs
         p178Wh5Bv57xu6ky3cZid9stPA+R/qp8v3nm5LR9C5LWqbjA96C0vLV1C0UL7cVcQcqD
         K7UNcjpPjBaGay+VbBqDBRffmDYTkr0DT/tKrbmUVZG4kOqHl2TyBqwEp/AVNjy2v519
         r2JYwDxxjUome9hlMMz2bLhYYKL8gaj6y5VV8vMZJszqEAzbysuRfu72AFGrsxoTRWt/
         fhKplG6TsNEilkpwMe2XtOSqPKOKSh25vsst9L1j/GqWuRc92mtSsAhiyusC91ef1I9H
         CGeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772558326; x=1773163126; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI+H26YOBNt/1DoRS04AjyW78q1APVhvhlkjEdWFqfQ=;
        b=SryUWC3+8fgSY9PjCC8g3GyRCwtRqzr/IEEcJhUC6hok9pbI2Lw/dEEw8mWnwL46SE
         rx4vhmZgNrcW3zEkEunmZ3Tp5KOlGhUprScmEAEjYUWWqCmtsGrLNwLLa7Xo20KjCgrb
         cy/rh5MOGBeymry7N2sXgd9ygCxkupfn0I9kjd61+BzuA9Hk/mnwyBjJUffBSd7FKsuB
         SoHwUKX4e0hshnHq4KfOXqxn/yDbtcoQn3J1clP/Q7ytYUBM1KGKlEK19JpNC4wCRlbr
         NpgeZ7hm/99+dTaHcF8dvR+hDj5YhbRVzDRiHBKXJ9Sjru6wHPYWcm4MFIWImELkGnEg
         VzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772558326; x=1773163126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lI+H26YOBNt/1DoRS04AjyW78q1APVhvhlkjEdWFqfQ=;
        b=CbEeJrgDMkukEj44Z0/Omotm5UadhTDuRRSSvKR7Ssq80fZtmpYh+9w9Goa2l3JXrN
         JEAPFZpnSjoS8JFXmW82PNxatVHm2d/D1R0rlbvRE7m7faUY+54fGzJsTBYoKHRoxR6j
         p28+hlOXm2NSae+4BgUaEEYw85LDmoJ4TR5mlYiFxphvzz2lhfUDPjKKqHVVkinhpqTm
         UHT9aF0icaMJmhZKr0gahlUFEkTiDM8sbK87L1JmRJc8d2usDO8CWQTXKuNsHHYm6wNE
         sZiU8KfovhLF8z9gtU3iKb6BNdX8nOKjasvXxB47kQi51cjJe4Kiv2c5Nef7RRxLi7Y7
         L0ag==
X-Gm-Message-State: AOJu0YwMqRWrBxYbNVKiJlfJ+aMgr7WaKNIVkhaDz1TvlbEkiPVhcv7W
	XNHWKqnQsfyr5AkY3zICS93tEj33ep+fqNEUaPdB+HGjT+VKSwlHVgkw4T5rzqAP42doaE18eKj
	47E3mB1IERxlX2OiU+I+sb0I5wtrukh3HzAtNJDs=
X-Gm-Gg: ATEYQzwVp9HrnDXcS6YkKt0BT5Cd/7avrE4icBajhjQxBf7Bry+ccnmNVDfPsfeV6uW
	QXQ8IKndYLN/Hzg/tpeo+t4PGpc0zpce0yfPFIQtvpY5OewxijTkQnOOb8UNkQ0WTw2LYkbbXcS
	juLUn4kih45RL1Y/fiW/eVosiG4sJJFeA5H5EeWj5LYcNzk0GugAbtlq2HFeKQ9ZvumphqZwaiG
	3R6QDtPMl1pnUktwvfx21ltFz1G2FJT6m8dUZfnhBJxEAGl4ahxjpIgFqMkc863P7OgoqKwxPDl
	AIXGlg==
X-Received: by 2002:a05:622a:1110:b0:501:459b:6138 with SMTP id
 d75a77b69052e-507529fcb92mr234290491cf.65.1772558325772; Tue, 03 Mar 2026
 09:18:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603031522.e4lroM3J-lkp@intel.com>
In-Reply-To: <202603031522.e4lroM3J-lkp@intel.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 3 Mar 2026 09:18:34 -0800
X-Gm-Features: AaiRm50-wckwwg-JvR3pctqSxXCAiq-ktkV4OkwZcSewRXuIOGxjrtAF36tEfhY
Message-ID: <CAJnrk1Zj=U7DkaQRRfbqqAUQ3+3R2hS6agtj5iOLKO5+ucBRmg@mail.gmail.com>
Subject: Re: [mszeredi-fuse:for-next 9/12] fs/fuse/dev.c:1818:43: warning:
 variable 'folio_offset' is uninitialized when used here
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	fuse-devel@lists.sourceforge.net, Miklos Szeredi <mszeredi@redhat.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 6:36=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git=
 for-next
> head:   16c09ed4c4502027cdd1c9d285cc02657e9e2b72
> commit: db64b9107f146940606d512f1d6214323b905565 [9/12] fuse: simplify lo=
gic in fuse_notify_store() and fuse_retrieve()
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260303/20=
2603031522.e4lroM3J-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260303/202603031522.e4lroM3J-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603031522.e4lroM3J-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> fs/fuse/dev.c:1818:43: warning: variable 'folio_offset' is uninitializ=
ed when used here [-Wuninitialized]
>     1818 |                 nr_bytes =3D min(num, folio_size(folio) - foli=
o_offset);
>          |                                                         ^~~~~~=
~~~~~~
>    include/linux/minmax.h:105:41: note: expanded from macro 'min'
>      105 | #define min(x, y)       __careful_cmp(min, x, y)
>          |                                               ^
>    include/linux/minmax.h:98:28: note: expanded from macro '__careful_cmp=
'
>       98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE=
_ID(y_))
>          |                                   ^
>    include/linux/minmax.h:92:28: note: expanded from macro '__careful_cmp=
_once'
>       92 |         auto ux =3D (x); auto uy =3D (y);                   \
>          |                                   ^
>    fs/fuse/dev.c:1809:28: note: initialize the variable 'folio_offset' to=
 silence this warning
>     1809 |                 unsigned int folio_offset;
>          |                                          ^
>          |                                           =3D 0
>    1 warning generated.
>
>
> vim +/folio_offset +1818 fs/fuse/dev.c
>
> 3b463ae0c6264f John Muir      2009-05-31  1761
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1762  static int fuse_notify_st=
ore(struct fuse_conn *fc, unsigned int size,
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1763                           =
    struct fuse_copy_state *cs)
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1764  {
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1765          struct fuse_notif=
y_store_out outarg;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1766          struct inode *ino=
de;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1767          struct address_sp=
ace *mapping;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1768          u64 nodeid;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1769          int err;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1770          unsigned int num;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1771          loff_t file_size;
> db64b9107f1469 Joanne Koong   2026-01-20  1772          loff_t pos;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1773          loff_t end;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1774
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1775          if (size < sizeof=
(outarg))
> 60e1579a0dcf2c Miklos Szeredi 2025-09-01  1776                  return -E=
INVAL;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1777
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1778          err =3D fuse_copy=
_one(cs, &outarg, sizeof(outarg));
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1779          if (err)
> 60e1579a0dcf2c Miklos Szeredi 2025-09-01  1780                  return er=
r;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1781
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1782          if (size - sizeof=
(outarg) !=3D outarg.size)
> 60e1579a0dcf2c Miklos Szeredi 2025-09-01  1783                  return -E=
INVAL;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1784
> 65161470f95bb5 Joanne Koong   2026-01-20  1785          if (outarg.offset=
 >=3D MAX_LFS_FILESIZE)
> 65161470f95bb5 Joanne Koong   2026-01-20  1786                  return -E=
INVAL;
> 65161470f95bb5 Joanne Koong   2026-01-20  1787
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1788          nodeid =3D outarg=
.nodeid;
> db64b9107f1469 Joanne Koong   2026-01-20  1789          pos =3D outarg.of=
fset;
> db64b9107f1469 Joanne Koong   2026-01-20  1790          num =3D min(outar=
g.size, MAX_LFS_FILESIZE - pos);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1791
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1792          down_read(&fc->ki=
llsb);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1793
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1794          err =3D -ENOENT;
> fcee216beb9c15 Max Reitz      2020-05-06  1795          inode =3D fuse_il=
ookup(fc, nodeid,  NULL);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1796          if (!inode)
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1797                  goto out_=
up_killsb;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1798
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1799          mapping =3D inode=
->i_mapping;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1800          file_size =3D i_s=
ize_read(inode);
> db64b9107f1469 Joanne Koong   2026-01-20  1801          end =3D pos + num=
;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1802          if (end > file_si=
ze) {
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1803                  file_size=
 =3D end;
> 65161470f95bb5 Joanne Koong   2026-01-20  1804                  fuse_writ=
e_update_attr(inode, file_size, num);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1805          }
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1806
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1807          while (num) {
> 8807f117be9d15 Josef Bacik    2024-09-30  1808                  struct fo=
lio *folio;
> c91440c89fbd9d Joanne Koong   2025-05-12  1809                  unsigned =
int folio_offset;
> c91440c89fbd9d Joanne Koong   2025-05-12  1810                  unsigned =
int nr_bytes;
> db64b9107f1469 Joanne Koong   2026-01-20  1811                  pgoff_t i=
ndex =3D pos >> PAGE_SHIFT;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1812
> 8807f117be9d15 Josef Bacik    2024-09-30  1813                  folio =3D=
 filemap_grab_folio(mapping, index);
> 8807f117be9d15 Josef Bacik    2024-09-30  1814                  err =3D P=
TR_ERR(folio);
> 8807f117be9d15 Josef Bacik    2024-09-30  1815                  if (IS_ER=
R(folio))
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1816                          g=
oto out_iput;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1817
> 0f5bb0cfb0b40a David Laight   2025-11-19 @1818                  nr_bytes =
=3D min(num, folio_size(folio) - folio_offset);
> db64b9107f1469 Joanne Koong   2026-01-20  1819                  folio_off=
set =3D offset_in_folio(folio, pos);
> c91440c89fbd9d Joanne Koong   2025-05-12  1820
> c91440c89fbd9d Joanne Koong   2025-05-12  1821                  err =3D f=
use_copy_folio(cs, &folio, folio_offset, nr_bytes, 0);
> db64b9107f1469 Joanne Koong   2026-01-20  1822                  if (!foli=
o_test_uptodate(folio) && !err && folio_offset =3D=3D 0 &&
> c91440c89fbd9d Joanne Koong   2025-05-12  1823                      (nr_b=
ytes =3D=3D folio_size(folio) || file_size =3D=3D end)) {
> c91440c89fbd9d Joanne Koong   2025-05-12  1824                          f=
olio_zero_segment(folio, nr_bytes, folio_size(folio));
> 8807f117be9d15 Josef Bacik    2024-09-30  1825                          f=
olio_mark_uptodate(folio);
> 3c0da3d163eb32 Jann Horn      2024-08-06  1826                  }
> 8807f117be9d15 Josef Bacik    2024-09-30  1827                  folio_unl=
ock(folio);
> 8807f117be9d15 Josef Bacik    2024-09-30  1828                  folio_put=
(folio);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1829
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1830                  if (err)
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1831                          g=
oto out_iput;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1832
> db64b9107f1469 Joanne Koong   2026-01-20  1833                  pos +=3D =
nr_bytes;
> c91440c89fbd9d Joanne Koong   2025-05-12  1834                  num -=3D =
nr_bytes;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1835          }
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1836
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1837          err =3D 0;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1838
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1839  out_iput:
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1840          iput(inode);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1841  out_up_killsb:
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1842          up_read(&fc->kill=
sb);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1843          return err;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1844  }
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1845
>
> :::::: The code at line 1818 was first introduced by commit
> :::::: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 fs: use min() or umin() i=
nstead of min_t()
>
> :::::: TO: David Laight <david.laight.linux@gmail.com>
> :::::: CC: Christian Brauner <brauner@kernel.org>
>

It looks like there was a merge conflict between David's commit and
the fuse_notify_store() cleanup commit [1], where the line orders

> 0f5bb0cfb0b40a David Laight   2025-11-19 @1818                  nr_bytes =
=3D min(num, folio_size(folio) - folio_offset);
> db64b9107f1469 Joanne Koong   2026-01-20  1819                  folio_off=
set =3D offset_in_folio(folio, pos);

got switched around. These two lines should be swapped.

Are you able to fix this up locally Miklos or do you prefer that a
fixup patch be sent for this?

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260120224449.1847176-3-joannelk=
oong@gmail.com/

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
