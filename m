Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05756749C;
	Mon, 13 Jan 2025 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736728140; cv=none; b=WZmTvaf6yRsXA1XMZlLSFlY/2yG0kM+OTxPAk6Siyx4UnSwDwHaax2xSQshRol4rxbSxAErDec6J9zAf9V90pt/YpeAek9SUbCN5C5bBv6R0boTH/0Cpz7EJauAaPLipGHzPB7GWZmgOuRSDnpJ5iHas6ddMQLuqSA1YfR09kqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736728140; c=relaxed/simple;
	bh=zUSPp3Hj/TjNZyXxqb8EAXhc1jPbu3S7uH04LyhF3Cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmY3mtjHp4fdAujDHm/x+xI89XrsMnt1ZRmYy44GRdMnwqooeHiy2WOg7OJ7mJzQE517/gp+911M6x0zh/eCrXpv1R+HsL6CSvtkLjYPae+liEXRBUvT8/Pyb+3Po8/GtN/PWpveFKC1kCoAQRacwhsFB/C6H+LBT5TZ7p03dZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/d02ZZi; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/d02ZZi"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a9caa3726fso12275525ab.1;
        Sun, 12 Jan 2025 16:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736728138; x=1737332938; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1xOA/SQ8iALm8MjEJqxz2Y25Nhzv2dANUJoHZQZb/w=;
        b=c/d02ZZicFoHU0Ps4RkBaVDfNFBbdPd9k+MVNrRmp1ir11WOkFLvafup488QKNbE3Q
         opnMgGixj/BBKGifxvi6ZCI8nAwBjrmMYe5+25WLr2G7gORBfXKFWO4erOBpQ+cKPCG7
         XbJNeEpx6nYxbE7Hzilv62qaBIAeVyT9Ar93Uuol1E49yZamd+jQBUDIQ6TeE7rneisY
         RXqQg30Emiek8OYOxcJsmHzLs+L9PWgISyGi0PaICBuHWmUWx4xV5hhz9LHk9kwCEIU0
         AZZE95A4JGC8JrIOtL2ro6GYTIawP8X2pBdfs4e8l7VrS8OuCMgQM4IBi+8njOfeShr3
         lPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736728138; x=1737332938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1xOA/SQ8iALm8MjEJqxz2Y25Nhzv2dANUJoHZQZb/w=;
        b=lAq9eTm2Ygu44UC9S3tD4NfyH9JupS+8YrjZ5htAvrUctNpNZhM5QqXEFLYO0+/RDp
         +6casIH+5RvGPVjEpUeTPDLik9Eo1nzDvgmRNGBVmcbbhNLQcttBQFi7iRmO4ZNXELAM
         dmgX1npBOYMhBMFvM2fU7BpIofI+ruRuA3WNFhbkFpruMtNapJMshSlg6xeOE+c5tJ+x
         NFYbP2z+35wOvB7d/CuqXyrzMsdvKoDHCBn56GVlJ7BEfWUU2E2Ym6n+lCRFb0HdYMgd
         MmlX0sZZQV/yRH9o0oGn+Vzi6sJgvVUh61ZszkUrMN8SeOo51b9pIRwmRKTa8CeislMg
         1cGg==
X-Forwarded-Encrypted: i=1; AJvYcCUWHlOwEuPjGzf7+RvECwA/yS5KkgNgDSzfvUsXg4oqVk3QdSQWp3+/uPnanRChtXmRzxBp@lists.linux.dev, AJvYcCUvvFKr/sffoPd272C9+DN+oa58RbGrr6FUCT8TuFk9wFcsSfWwULHQiRAi7aEd5ituJz1YCpUyAHvVbiRcFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEOhKDp2aWY95hY4FLcBsmbkpp2M0j0NtT3p7bCq+UfRL2WgOx
	/nkf6Ii8eObGhGdDnG71TJ55BOrAZhpwuG8N+/wlh6ip8TKhJspZvtj95GuHlysaT/0MZHOxOyO
	ZgHnULZ9CgDuvGa6mwMGmKm1WILk=
X-Gm-Gg: ASbGncv1yXKEfUod4m2HKUtAoMKtWm4nLpTUt3vIbPWabpH/J1Ubg2A5X+3RAGQSFCl
	8K5dBciNlzTe8p9UIMU/QbBN0u4DpkC8GQpi/Zg==
X-Google-Smtp-Source: AGHT+IEBNwkThVQXNyg9t9dnefMlcVeyifbI2RGhIl71J54yeFuYTxlozCIKeOOetDZW2NlY+QchIanD/FJsU4Ujs84=
X-Received: by 2002:a05:6e02:1605:b0:3ce:3395:f7b1 with SMTP id
 e9e14a558f8ab-3ce475fbc60mr98031725ab.9.1736728138047; Sun, 12 Jan 2025
 16:28:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250112113748.73504-6-kerneljasonxing@gmail.com> <202501122251.7G2Wsbzx-lkp@intel.com>
In-Reply-To: <202501122251.7G2Wsbzx-lkp@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 13 Jan 2025 08:28:21 +0800
X-Gm-Features: AbW1kvYvkS3KXWZNdtH7afWFQTdG2PQEkkdIbiXvr1BeLeScoU4dex_Q61iCRjk
Message-ID: <CAL+tcoDJfy+SjVKF==fKLVVdr8qE0mJ2WWzGozN4f=OLX6ip1A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 05/15] net-timestamp: add strict check in some
 BPF calls
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, dsahern@kernel.org, willemdebruijn.kernel@gmail.com, 
	willemb@google.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, horms@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 10:39=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Jason,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-tim=
estamp-add-support-for-bpf_setsockopt/20250112-194115
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250112113748.73504-6-kerneljas=
onxing%40gmail.com
> patch subject: [PATCH net-next v5 05/15] net-timestamp: add strict check =
in some BPF calls
> config: i386-buildonly-randconfig-006-20250112 (https://download.01.org/0=
day-ci/archive/20250112/202501122251.7G2Wsbzx-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250112/202501122251.7G2Wsbzx-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501122251.7G2Wsbzx-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:4863:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     4863 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:4891:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     4891 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:5063:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     5063 |         .arg4_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:5077:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     5077 |         .arg4_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:5126:45: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     5126 |         .arg1_type      =3D ARG_PTR_TO_BTF_ID_SOCK_COMMON | PT=
R_MAYBE_NULL,
>          |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~=
~~~~~~~~~~
>    net/core/filter.c:5592:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     5592 |         .arg4_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:5626:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     5626 |         .arg4_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:5660:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     5660 |         .arg4_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:5703:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     5703 |         .arg4_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:5880:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     5880 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:6417:46: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6417 |         .arg3_type      =3D ARG_PTR_TO_FIXED_SIZE_MEM | MEM_WR=
ITE | MEM_ALIGNED,
>          |                           ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~=
~
>    net/core/filter.c:6429:46: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6429 |         .arg3_type      =3D ARG_PTR_TO_FIXED_SIZE_MEM | MEM_WR=
ITE | MEM_ALIGNED,
>          |                           ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~=
~
>    net/core/filter.c:6515:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6515 |         .arg3_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:6525:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6525 |         .arg3_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:6569:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6569 |         .arg3_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:6658:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6658 |         .arg3_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:6902:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6902 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:6921:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6921 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:6940:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6940 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:6964:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6964 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:6988:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     6988 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7012:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7012 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7029:45: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7029 |         .arg1_type      =3D ARG_PTR_TO_BTF_ID_SOCK_COMMON | OB=
J_RELEASE,
>          |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~=
~~~~~~~
>    net/core/filter.c:7050:35: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7050 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7074:35: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7074 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7098:35: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7098 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7118:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7118 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7137:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7137 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7156:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7156 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7474:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7474 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7476:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7476 |         .arg4_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7543:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7543 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    net/core/filter.c:7545:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7545 |         .arg4_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
> >> net/core/filter.c:7631:19: warning: result of comparison of constant '=
SK_BPF_CB_FLAGS' (1009) with expression of type 'u8' (aka 'unsigned char') =
is always true [-Wtautological-constant-out-of-range-compare]
>     7631 |         if (bpf_sock->op !=3D SK_BPF_CB_FLAGS)
>          |             ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>    net/core/filter.c:7777:30: warning: bitwise operation between differen=
t enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-=
enum-conversion]
>     7777 |         .arg2_type      =3D ARG_PTR_TO_MEM | MEM_RDONLY,
>          |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>    41 warnings generated.
>
>
> vim +7631 net/core/filter.c
>
>   7622
>   7623  BPF_CALL_4(bpf_sock_ops_load_hdr_opt, struct bpf_sock_ops_kern *,=
 bpf_sock,
>   7624             void *, search_res, u32, len, u64, flags)
>   7625  {
>   7626          bool eol, load_syn =3D flags & BPF_LOAD_HDR_OPT_TCP_SYN;
>   7627          const u8 *op, *opend, *magic, *search =3D search_res;
>   7628          u8 search_kind, search_len, copy_len, magic_len;
>   7629          int ret;
>   7630
> > 7631          if (bpf_sock->op !=3D SK_BPF_CB_FLAGS)

Oops, I realized that SK_BPF_CB_FLAGS cannot be used by "op". I'll
aggregate all the callbacks used by timestamping and use to test them
here like the following patch to avoid calling these helpers in the
context of timestamping callback.

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 87420c0f2235..9e6a782b4042 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -7022,6 +7022,10 @@ enum {
                                         * by the kernel or the
                                         * earlier bpf-progs.
                                         */
+#define BPF_SOCK_OPTS_TS               (BPF_SOCK_OPS_TS_SCHED_OPT_CB | \
+                                        BPF_SOCK_OPS_TS_SW_OPT_CB | \
+                                        BPF_SOCK_OPS_TS_ACK_OPT_CB | \
+                                        BPF_SOCK_OPS_TS_TCP_SND_CB)
        BPF_SOCK_OPS_TS_SCHED_OPT_CB,   /* Called when skb is passing throu=
gh
                                         * dev layer when SO_TIMESTAMPING
                                         * feature is on. It indicates the
diff --git a/net/core/filter.c b/net/core/filter.c
index 517f09aabc92..1fcd88b558f4 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -7628,7 +7628,7 @@ BPF_CALL_4(bpf_sock_ops_load_hdr_opt, struct
bpf_sock_ops_kern *, bpf_sock,
        u8 search_kind, search_len, copy_len, magic_len;
        int ret;

-       if (bpf_sock->op !=3D SK_BPF_CB_FLAGS)
+       if (bpf_sock->op !=3D BPF_SOCK_OPTS_TS)
                return -EINVAL;

        /* 2 byte is the minimal option len except TCPOPT_NOP and

Thanks,
Jason

>   7632                  return -EINVAL;
>   7633
>   7634          /* 2 byte is the minimal option len except TCPOPT_NOP and
>   7635           * TCPOPT_EOL which are useless for the bpf prog to learn
>   7636           * and this helper disallow loading them also.
>   7637           */
>   7638          if (len < 2 || flags & ~BPF_LOAD_HDR_OPT_TCP_SYN)
>   7639                  return -EINVAL;
>   7640
>   7641          search_kind =3D search[0];
>   7642          search_len =3D search[1];
>   7643
>   7644          if (search_len > len || search_kind =3D=3D TCPOPT_NOP ||
>   7645              search_kind =3D=3D TCPOPT_EOL)
>   7646                  return -EINVAL;
>   7647
>   7648          if (search_kind =3D=3D TCPOPT_EXP || search_kind =3D=3D 2=
53) {
>   7649                  /* 16 or 32 bit magic.  +2 for kind and kind leng=
th */
>   7650                  if (search_len !=3D 4 && search_len !=3D 6)
>   7651                          return -EINVAL;
>   7652                  magic =3D &search[2];
>   7653                  magic_len =3D search_len - 2;
>   7654          } else {
>   7655                  if (search_len)
>   7656                          return -EINVAL;
>   7657                  magic =3D NULL;
>   7658                  magic_len =3D 0;
>   7659          }
>   7660
>   7661          if (load_syn) {
>   7662                  ret =3D bpf_sock_ops_get_syn(bpf_sock, TCP_BPF_SY=
N, &op);
>   7663                  if (ret < 0)
>   7664                          return ret;
>   7665
>   7666                  opend =3D op + ret;
>   7667                  op +=3D sizeof(struct tcphdr);
>   7668          } else {
>   7669                  if (!bpf_sock->skb ||
>   7670                      bpf_sock->op =3D=3D BPF_SOCK_OPS_HDR_OPT_LEN_=
CB)
>   7671                          /* This bpf_sock->op cannot call this hel=
per */
>   7672                          return -EPERM;
>   7673
>   7674                  opend =3D bpf_sock->skb_data_end;
>   7675                  op =3D bpf_sock->skb->data + sizeof(struct tcphdr=
);
>   7676          }
>   7677
>   7678          op =3D bpf_search_tcp_opt(op, opend, search_kind, magic, =
magic_len,
>   7679                                  &eol);
>   7680          if (IS_ERR(op))
>   7681                  return PTR_ERR(op);
>   7682
>   7683          copy_len =3D op[1];
>   7684          ret =3D copy_len;
>   7685          if (copy_len > len) {
>   7686                  ret =3D -ENOSPC;
>   7687                  copy_len =3D len;
>   7688          }
>   7689
>   7690          memcpy(search_res, op, copy_len);
>   7691          return ret;
>   7692  }
>   7693
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
