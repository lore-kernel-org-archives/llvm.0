Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E132DA75C
	for <llvm@lists.linux.dev>; Sat,  7 Feb 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770476374; cv=pass; b=ttTBPrA6CeI77fYoUB/orOwprvuTAZ2a2Aj5/iKobfSsyhXLS3LCx0Prq36xPnRAnBEbgsa+WGZNjTq9u/oJd0/hqzGN2pENjDSm1mWQP0u5JFiDPpHpuJEQqeOVw068HVR0bA7lRR1ECpQ1XgfZM5DJQkziA3pr2raOvAa9Ixs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770476374; c=relaxed/simple;
	bh=xLy6jLoK0GEF57U8d+0He46emL5fkANRhM12V2PJ8A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDHMeuisOVsQNRIuMw8emJ9zR8YqbOFo0JlpL8bHWgCReKVGRFsMlVfEWA6sYeLYDfeOYrlVHh8poT877Ky+15fbDK58b2HThQ2JIW5s0tY56z2c+ILxLZOFQt4Ybpq9ygdZu5TlzwWIYxKPBytgDX/ftT4Zwpy80wmhkZTYgTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5Ey6xeB; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5Ey6xeB"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso517991d50.2
        for <llvm@lists.linux.dev>; Sat, 07 Feb 2026 06:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770476373; cv=none;
        d=google.com; s=arc-20240605;
        b=MEaqUIpYnELrrkpHq5WZyBtEttNxJ+gEhlmauAlbIgIXm3+N27Cu6tU3V2ix/43xpO
         L1NSlxWARLQ+ztHwT3tw5suwHKBNqirYApZ/HIMFM6bvYKiMQCE0AEKVMHaSlwwWY7V+
         mX2g+jc9pFHKFpYc7w8lcAYQ0ZpIEbEH4fzDxjhuabdRhXx3xQvCBO/VJgA3lqMZNZAV
         p3iM5TUYbPVEGAZh9/7prohq+KqVSasw9hDSisYJBfiEylCrcGFp60oMJO/lIbvV4U5/
         yR0CiImXnrYUG6G4Qbkhm6IRX5Vpl2hr/iXIoERDZw1H2aBwUrm7BjwcviUfXypeqoCY
         lglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ancP6nqboM/EpceklEywueFbS2sRwQCdM6sUwv/j4Sc=;
        fh=mvZ4ly72kLbcQwfycxy4kvp5QxMPn5Lhhm/1cRkuFbg=;
        b=R67GGY/UpyTagIYQ2T7YzVZI5A/hK51nDjF8ikk0jJiBDzcvB5D+zCLhpXnTg2q7bw
         3wnLLDWqYFxPZ/Drm1zccAQwvXKqqV/hfzfYS2qiF+q00U+Skw+lzjzcYXs3Vf0RbnMW
         Na3RQB1vknLpKcjdkB2YsYf2FTvuvk838aFXmPfaX3BNOt2mqvrVImihRxA109tKX8m7
         KVCgvltQvqxukvu/m5/y6KK6gFL4zH7vTd8Z5n3G3aJmoRPfXFbwma+WMZstT8/qEsTI
         DhxNLfzjYK+rPBLjEl2kE8rsyPYNMfXYWDUhAzM0jnF9tPrVJ+z5QowMarbxJb+XIgjO
         ymCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770476373; x=1771081173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ancP6nqboM/EpceklEywueFbS2sRwQCdM6sUwv/j4Sc=;
        b=O5Ey6xeBeAwsPEzo9ULQWms2hI/nIHadphZJ2sZ+WWKCets3g1o7HSvKt77CYLrlAM
         H9SIph4RzxyMmdlYB4gMaHlTqjXZuY0qH5d1+tmYUBJEjqb7qaiR1l7lcCnHc8wDD865
         FuGM+CWv3+1e/brMQGI/ru+hNyah1EaPgX3D1PyA3ybS7bSD4NG6DUEAeIZdmYol71E8
         ZVhNmYigwEEk5ys79VfI7VxtIgNLhCUz4vpmE28qeHjRsqwefgqb0zJMORjm4YiPTze5
         uXFJ9ZuF0rEAz7q0UfykbOLizDlCbcPHoYBQPLLZFOlYozjsRFNuoR7PG/c0CbpKwfWh
         U1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770476373; x=1771081173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ancP6nqboM/EpceklEywueFbS2sRwQCdM6sUwv/j4Sc=;
        b=anssrAGHYKeqNL1Rf22+VRSgR+Op31R3CPfedk0fOI43LxBZBiM5O9CrKj0n7BLezj
         60ie7WtGp+TvBrscEQ8y9k2dQXWPbqYuSknviGHI7V7UcM+miVVc+IKZBuRo0h7RsHw9
         TBkcua6M3EQklHMswhej3WR5QKTLs1+cQJ5Ets2WMoX8jJnBg8lwIaydQk5MT55GhCN0
         7YXPBnjyyiEZR2qH4bu7T0WlY4FY7XxwHDg1RWsyrYPyHoYmdcsK17qPfx8gr+7jkUNu
         75PNrK85V+y/h+vow6t/+B11Z/L4Yp02n9E015PB9wYRyYlKH78IxGFjPu1EOU84jkFU
         EHfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9S/CP7nWDLWUDl0H8LZ4SkyzCdOeiyF1h5qgLdM3WeLNnB6YAcolamQ5tas4d3Y0oY9YQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyuTLYD+D1MuS6r5wppeCMVFo7if4ZAyYmHinZA3xWolNllhx/V
	aWXeP+vFSr264XHGhSI2XcdPWZ0RXFzc7krwjnrVfVmjR9tHKIDZHmylUmJruzTAYrbPgU9xjwp
	bG0mw+vLkHZtSU8KW7+YAwKxdtcL66cA=
X-Gm-Gg: AZuq6aITZIMlTSqUewtyh7HcR0+vUHsehbbPBEMNkGdvXaUglN8+dep3CEoEnq7hKEb
	/mZrkeyfljfKH+eRdZG4sE1sBMoac3yh8/4WROF32ISXgjPk7aKktOMY073BuCmXKWZ3veW6rCI
	Srq6pU+ta4WkpepCNur7GnTlfm5KPV/K3y19HUDBp4OhWnVRAguIrVLP3Dflg53h00MmDABGusu
	tKqUPldFiqGPqSP3xtWE0b+0izUIWuwbAjWr5faoKZd5VUuZj7rReLn+fK2+1LSLMpO5mJu
X-Received: by 2002:a05:690e:4363:b0:649:e4e5:e4a8 with SMTP id
 956f58d0204a3-649f1e9177emr3651446d50.23.1770476372718; Sat, 07 Feb 2026
 06:59:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205094934.10500-1-sun.jian.kdev@gmail.com> <202602072013.jwrURE2e-lkp@intel.com>
In-Reply-To: <202602072013.jwrURE2e-lkp@intel.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Sat, 7 Feb 2026 22:59:23 +0800
X-Gm-Features: AZwV_QifH6jN-h0SadePqmXnPr9s3PXkTl1p_qoqaNJCq6u3QiDABAIW3ue_v4Q
Message-ID: <CABFUUZEDpcskKVOKkDsSUp_hk_ZemW9ghDEg_Cb2gVurypW5LQ@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: return folios from ntfs_lock_new_page()
To: kernel test robot <lkp@intel.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Thanks for your reports! v2 has been sent to fix the issue in
ni_decompress_file().
Message-ID: 20260207144552.2322468-1-sun.jian.kdev@gmail.com
Regards,
sun jian

On Sat, Feb 7, 2026 at 8:08=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Sun,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on brauner-vfs/vfs.all]
> [also build test ERROR on linus/master v6.19-rc8]
> [cannot apply to next-20260205]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sun-Jian/fs-ntfs3-=
return-folios-from-ntfs_lock_new_page/20260205-175053
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.a=
ll
> patch link:    https://lore.kernel.org/r/20260205094934.10500-1-sun.jian.=
kdev%40gmail.com
> patch subject: [PATCH] fs/ntfs3: return folios from ntfs_lock_new_page()
> config: hexagon-randconfig-001-20260207 (https://download.01.org/0day-ci/=
archive/20260207/202602072013.jwrURE2e-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9=
b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260207/202602072013.jwrURE2e-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602072013.jwrURE2e-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> fs/ntfs3/frecord.c:2200:7: error: incompatible pointer types assigning=
 to 'struct page *' from 'struct folio *' [-Wincompatible-pointer-types]
>     2200 |                         pg =3D ntfs_lock_new_page(mapping, ind=
ex, gfp_mask);
>          |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>    1 error generated.
>
>
> vim +2200 fs/ntfs3/frecord.c
>
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2133
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2134  #ifdef CONFIG_N=
TFS3_LZX_XPRESS
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2135  /*
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2136   * ni_decompres=
s_file - Decompress LZX/Xpress compressed file.
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2137   *
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2138   * Remove ATTR_=
DATA::WofCompressedData.
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2139   * Remove ATTR_=
REPARSE.
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2140   */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2141  int ni_decompre=
ss_file(struct ntfs_inode *ni)
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2142  {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2143        struct nt=
fs_sb_info *sbi =3D ni->mi.sbi;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2144        struct in=
ode *inode =3D &ni->vfs_inode;
> 4fd6c08a16d7f1b Konstantin Komarov      2024-01-26  2145        loff_t i_=
size =3D i_size_read(inode);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2146        struct ad=
dress_space *mapping =3D inode->i_mapping;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2147        gfp_t gfp=
_mask =3D mapping_gfp_mask(mapping);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2148        struct pa=
ge **pages =3D NULL;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2149        struct AT=
TR_LIST_ENTRY *le;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2150        struct AT=
TRIB *attr;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2151        CLST vcn,=
 cend, lcn, clen, end;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2152        pgoff_t i=
ndex;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2153        u64 vbo;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2154        u8 frame_=
bits;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2155        u32 i, fr=
ame_size, pages_per_frame, bytes;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2156        struct mf=
t_inode *mi;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2157        int err;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2158
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2159        /* Cluste=
rs for decompressed data. */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2160        cend =3D =
bytes_to_cluster(sbi, i_size);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2161
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2162        if (!i_si=
ze)
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2163                g=
oto remove_wof;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2164
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2165        /* Check =
in advance. */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2166        if (cend =
> wnd_zeroes(&sbi->used.bitmap)) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2167                e=
rr =3D -ENOSPC;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2168                g=
oto out;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2169        }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2170
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2171        frame_bit=
s =3D ni_ext_compress_bits(ni);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2172        frame_siz=
e =3D 1u << frame_bits;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2173        pages_per=
_frame =3D frame_size >> PAGE_SHIFT;
> 345482bc431f649 Kari Argillander        2021-08-24  2174        pages =3D=
 kcalloc(pages_per_frame, sizeof(struct page *), GFP_NOFS);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2175        if (!page=
s) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2176                e=
rr =3D -ENOMEM;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2177                g=
oto out;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2178        }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2179
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2180        /*
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2181         * Step 1=
: Decompress data and copy to new allocated clusters.
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2182         */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2183        index =3D=
 0;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2184        for (vbo =
=3D 0; vbo < i_size; vbo +=3D bytes) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2185                b=
ool new;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2186
> f35590ee26f5722 Konstantin Komarov      2025-10-14  2187                b=
ytes =3D vbo + frame_size > i_size ? (i_size - vbo) : frame_size;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2188                e=
nd =3D bytes_to_cluster(sbi, vbo + bytes);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2189
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2190                f=
or (vcn =3D vbo >> sbi->cluster_bits; vcn < end; vcn +=3D clen) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2191                 =
       err =3D attr_data_get_block(ni, vcn, cend - vcn, &lcn,
> c380b52f6c5702c Konstantin Komarov      2022-10-07  2192                 =
                                 &clen, &new, false);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2193                 =
       if (err)
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2194                 =
               goto out;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2195                }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2196
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2197                f=
or (i =3D 0; i < pages_per_frame; i++, index++) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2198                 =
       struct page *pg;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2199
> 68f6bd128e75a03 Matthew Wilcox (Oracle  2025-07-18 @2200)                =
       pg =3D ntfs_lock_new_page(mapping, index, gfp_mask);
> 68f6bd128e75a03 Matthew Wilcox (Oracle  2025-07-18  2201)                =
       if (IS_ERR(pg)) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2202                 =
               while (i--) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2203                 =
                       unlock_page(pages[i]);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2204                 =
                       put_page(pages[i]);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2205                 =
               }
> 68f6bd128e75a03 Matthew Wilcox (Oracle  2025-07-18  2206)                =
               err =3D PTR_ERR(pg);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2207                 =
               goto out;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2208                 =
       }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2209                 =
       pages[i] =3D pg;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2210                }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2211
> f35590ee26f5722 Konstantin Komarov      2025-10-14  2212                e=
rr =3D ni_read_frame(ni, vbo, pages, pages_per_frame, 1);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2213
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2214                f=
or (i =3D 0; i < pages_per_frame; i++) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2215                 =
       unlock_page(pages[i]);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2216                 =
       put_page(pages[i]);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2217                }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2218
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2219                i=
f (err)
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2220                 =
       goto out;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2221
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2222                c=
ond_resched();
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2223        }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2224
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2225  remove_wof:
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2226        /*
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2227         * Step 2=
: Deallocate attributes ATTR_DATA::WofCompressedData
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2228         * and AT=
TR_REPARSE.
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2229         */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2230        attr =3D =
NULL;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2231        le =3D NU=
LL;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2232        while ((a=
ttr =3D ni_enum_attr_ex(ni, attr, &le, NULL))) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2233                C=
LST svcn, evcn;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2234                u=
32 asize, roff;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2235
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2236                i=
f (attr->type =3D=3D ATTR_REPARSE) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2237                 =
       struct MFT_REF ref;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2238
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2239                 =
       mi_get_ref(&ni->mi, &ref);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2240                 =
       ntfs_remove_reparse(sbi, 0, &ref);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2241                }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2242
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2243                i=
f (!attr->non_res)
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2244                 =
       continue;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2245
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2246                i=
f (attr->type !=3D ATTR_REPARSE &&
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2247                 =
   (attr->type !=3D ATTR_DATA ||
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2248                 =
    attr->name_len !=3D ARRAY_SIZE(WOF_NAME) ||
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2249                 =
    memcmp(attr_name(attr), WOF_NAME, sizeof(WOF_NAME))))
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2250                 =
       continue;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2251
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2252                s=
vcn =3D le64_to_cpu(attr->nres.svcn);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2253                e=
vcn =3D le64_to_cpu(attr->nres.evcn);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2254
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2255                i=
f (evcn + 1 <=3D svcn)
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2256                 =
       continue;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2257
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2258                a=
size =3D le32_to_cpu(attr->size);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2259                r=
off =3D le16_to_cpu(attr->nres.run_off);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2260
> 6db620863f8528e Edward Lo               2022-08-06  2261                i=
f (roff > asize) {
> 6db620863f8528e Edward Lo               2022-08-06  2262                 =
       err =3D -EINVAL;
> 6db620863f8528e Edward Lo               2022-08-06  2263                 =
       goto out;
> 6db620863f8528e Edward Lo               2022-08-06  2264                }
> 6db620863f8528e Edward Lo               2022-08-06  2265
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2266                /=
*run=3D=3D1  Means unpack and deallocate. */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2267                r=
un_unpack_ex(RUN_DEALLOCATE, sbi, ni->mi.rno, svcn, evcn, svcn,
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2268                 =
             Add2Ptr(attr, roff), asize - roff);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2269        }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2270
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2271        /*
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2272         * Step 3=
: Remove attribute ATTR_DATA::WofCompressedData.
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2273         */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2274        err =3D n=
i_remove_attr(ni, ATTR_DATA, WOF_NAME, ARRAY_SIZE(WOF_NAME),
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2275                 =
            false, NULL);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2276        if (err)
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2277                g=
oto out;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2278
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2279        /*
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2280         * Step 4=
: Remove ATTR_REPARSE.
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2281         */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2282        err =3D n=
i_remove_attr(ni, ATTR_REPARSE, NULL, 0, false, NULL);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2283        if (err)
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2284                g=
oto out;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2285
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2286        /*
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2287         * Step 5=
: Remove sparse flag from data attribute.
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2288         */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2289        attr =3D =
ni_find_attr(ni, NULL, NULL, ATTR_DATA, NULL, 0, NULL, &mi);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2290        if (!attr=
) {
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2291                e=
rr =3D -EINVAL;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2292                g=
oto out;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2293        }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2294
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2295        if (attr-=
>non_res && is_attr_sparsed(attr)) {
> d3624466b56dd5b Konstantin Komarov      2021-08-31  2296                /=
* Sparsed attribute header is 8 bytes bigger than normal. */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2297                s=
truct MFT_REC *rec =3D mi->mrec;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2298                u=
32 used =3D le32_to_cpu(rec->used);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2299                u=
32 asize =3D le32_to_cpu(attr->size);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2300                u=
16 roff =3D le16_to_cpu(attr->nres.run_off);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2301                c=
har *rbuf =3D Add2Ptr(attr, roff);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2302
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2303                m=
emmove(rbuf - 8, rbuf, used - PtrOffset(rec, rbuf));
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2304                a=
ttr->size =3D cpu_to_le32(asize - 8);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2305                a=
ttr->flags &=3D ~ATTR_FLAG_SPARSED;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2306                a=
ttr->nres.run_off =3D cpu_to_le16(roff - 8);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2307                a=
ttr->nres.c_unit =3D 0;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2308                r=
ec->used =3D cpu_to_le32(used - 8);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2309                m=
i->dirty =3D true;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2310                n=
i->std_fa &=3D ~(FILE_ATTRIBUTE_SPARSE_FILE |
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2311                 =
               FILE_ATTRIBUTE_REPARSE_POINT);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2312
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2313                m=
ark_inode_dirty(inode);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2314        }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2315
> e8b8e97f91b80f0 Kari Argillander        2021-08-03  2316        /* Clear =
cached flag. */
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2317        ni->ni_fl=
ags &=3D ~NI_FLAG_COMPRESSED_MASK;
> c091354d6bf60ec Matthew Wilcox (Oracle  2024-04-22  2318)       if (ni->f=
ile.offs_folio) {
> c091354d6bf60ec Matthew Wilcox (Oracle  2024-04-22  2319)               f=
olio_put(ni->file.offs_folio);
> c091354d6bf60ec Matthew Wilcox (Oracle  2024-04-22  2320)               n=
i->file.offs_folio =3D NULL;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2321        }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2322        mapping->=
a_ops =3D &ntfs_aops;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2323
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2324  out:
> 195c52bdd5d5ecf Kari Argillander        2021-08-24  2325        kfree(pag=
es);
> c12df45ee690112 Konstantin Komarov      2022-07-13  2326        if (err)
> c12df45ee690112 Konstantin Komarov      2022-07-13  2327                _=
ntfs_bad_inode(inode);
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2328
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2329        return er=
r;
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2330  }
> 4342306f0f0d5ff Konstantin Komarov      2021-08-13  2331
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
