Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793186117;
	b=ILnKHMjQYrSUEEn4Jv3o3ZzVLba8SF/iIAytaRRPsTQO6XIaD2kGPveOYy5udIrjTO0z
	 6L3hZ89tqUPl8WphZWurASrr7boSOdM4/GiWU/ceNLIoWx0Mg4BgaDIqKB/sVbZHY4Zqv
	 ckyxC5ZQbLASNwnjEeAqY9iTOrTEun9Wk78wZ7A81+V7wegIWQTjxEVcdy+Q/Emeq7BsW
	 2ot7c8ij7YBaUQKDgh56Nxv0BjfflNbG6gkAhTMpVOucCcmakTA04eA0yzKSiBNKRoH1y
	 dC8GuitMcxMNpWPjT+nWq103jbBoKaSyj0lkae8uUBmrwz9LHjZdG8JiON/zQFtD7Zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
	b=0amFwP+s3yPE+kmxXsXdcpM6WOKd9nCsK0AFa5sfmVVZ9s1tw9iGRUAr3Jpn6U9x5TI5
	 Ig+z7huuHlkSEMQrpE276wzlBOP4Bz7+4DvzqOfSq7RqQJvrRwihIEnFwEWHwD/l8Pt3c
	 iDh3Bas2kqPhmHsR7+WUyAHvLBKLbVuVCXyru7/Gui/ARxGBJswTuwk6mVvyxu2oxtUWH
	 0/EO3zPccfOQVOOSThGW/SmKK6vDG3MR6umy7zsppiv0YcfOE/Y/4iUo1RInz7f9jTdml
	 cWefuOiC9XnD8ZYc3WS8OqE2LMCA2IUpctwVHkPj/4xtthmxS3XVs6s44nU/o4Dv07A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NO/2VpQQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82DB606A31E
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 11:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D82DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NO/2VpQQ
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3ac4f373d3bso5849961fa.0
        for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 04:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793186115; cv=none;
        d=google.com; s=arc-20260327;
        b=XljoyNmpriI4OVy4IRTlzb2kp5K4HYoxAoCzD/FYUejfjwOCHP4PaecvOiUrLDbMno
         yUJD6UbvkZxQzANXRlW9P8cdhEHR+qxo9x8ceEjiDjrh4Y1D4kjjyOv5H4RsYVfOrzMQ
         y8vHg//aigZgRYE2NZAioNl6Di3MPV4TOw47wUdkRF+iE3xOGs0Gd2Wyl2dEBxyriWuP
         t1RAWbC+rM4WHBX2CuyrTN/8rIVIxembh5xIfu4bd9LRJkCPyJs5Rk6yeOSpjXoV7JK8
         Kykpxbj8JRviuX7tYYED7phDI62hBbvVxVYap+9CKs4GBn4NNZPsotf2T0gCRWb2zTgC
         KVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
        fh=Vk5/92M6D24YD0rtc27fKY6nuzPH2Y3y9z33Nmt1jvg=;
        b=a4cDh117HwMc+8g0G+EyYKDdFwOWcrYi8WwkD1HqzqP7Ju+kO0/ilgCIXSZnPm5oqv
         behI6sowOgpju4uk1K6aGM5/Hy7yurvHicgch6G8agxM60tUgSoCtAtwepdPn/sazKih
         zTPL321ftSEUtMB3/EsQo0t2+6w5CnIJ7WW2l+NKEAquXdZxgW4GG2RpopRfyeRCCyAi
         OYTHf9awHHHZTLCZzbXww20J/6/d5Uk/RyoxmdTEVjwmeu81ZmUTzFrxjdf2uEIQ+0Az
         R5UfTWEzCpwhFqz9iyAUO+KficnZD7L6/5EpelUIEBrgu71LU5TCpWQbr54/nklyraHd
         fAgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186115; x=1793790915; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
        b=NO/2VpQQDDg92e76rAHCWVk/5o70LU2sZL3ZFaikGoRA3qJyrTwyQVRHlwmcdjWTiJ
         102UGLfms3RI9gZ0g6yTjZt1YOtRSB1TDccMDPGqh2jXFFzLhln06/HC4fawwv1TCVGN
         9csKDnesCU0t13tvzxawj0dk+EuvU3ztG+N/MCqZl63/fVC5PfFUzioyfy+y3n/9kHSP
         zVwOx3lVpqDXVxpHSw0xpvXpAZb4l2uUXHbfbh/TPRSIhYIRot7hHnr2AfXBu5xazmaJ
         zTagi1hJQSnfchs4Rxm5U6TcSMwDBPabr6uayUUJqqYz9LXBpe9w5H8EB3imWm1wAd60
         /kEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186115; x=1793790915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
        b=zSul80AuvGv33tWO8a0izg8O6KB1zOisuqPLycF9tvLfutDqlBBVeRRwqXopXxkiQm
         0YggwsDApaUHj4hHJlEho9P1Pbp+TyYunVCNC9JevsFFbxKdqjYWEgbTW9zWcVon7nfK
         yWTf4EJ7HOfMNNr7rz8pakzxFdeFknkoCjuEpym3Ct2uAFWLilLd7s0A5rol14gLqRCm
         ssQK78mWhprPWWJg/q3Pev78JlM0eWe4Q9/VjOkiDdV8icxM2yORnY98IXybFXBHBxcA
         r2BimX2+tKMD3koPbhdWsnt/Gh8obg9/vsHpH3WoRl8Qr/7iq5fiKQIaDv/1L4z8jeG/
         l65A==
X-Forwarded-Encrypted: i=1; AKwUvBxIousChRg+K/+gbv1U0b3fAD7Wk0cBctW14aN+7goRzSNdXubYdBhGr3T7XROSIQKWH5UZ@lists.linux.dev
X-Gm-Message-State: AFq9FYJEqPYb88PuZdzqO8tYUfgdx0g6ozVhAu/Ww8gbNf7a0u9wgKE6
	bS7A0o//yIQn8ecJPQ/xXWWiXpzL01ymRJUCmwr9ML4PW43MK0s2xPirLH75//WbZ4NX18MQ5bt
	O0OZaoVk8Lj7nQ8EI3gbJ05sMcj+U1Fg=
X-Gm-Gg: AYBFou2xvAMFgap+5Bjx2D+p8d9J6wvrwggVABiB/GM+6j6sxknjIaCJDxjnSPon3T0
	GzJC391nf0L8fLwEgdpnNRllaUPFuXYd86QceCWgYY5je/C/hTUZnDUskZBetpplPVai9dKwfUS
	ruJmOFik67U217g0FUbZ/H1cyHtQ2uOhmYvpE9H276c+9n2sbL0LHLl4y2S/4RNCcvuY8SD2FCb
	Lwgr55ifjmjeVVEZVoCDUd8Fw8y7GLiYYAlrG5OdJ6bP861OJ6FdbeJjwXNLnPyIHjW0qxEeVnU
	kGs7TBSHYvOuLr0d2DSkpccYksslVUQU1okBSZLLcBcemwGl331Sa4NZRA8+k+aVuzqvkiEmbEP
	ANI5EwjMC8YznS1Ah518+Z5tjdqnaHnasxbrsWQ==
X-Received: by 2002:a05:6512:401a:b0:5be:50d7:60f with SMTP id
 2adb3069b0e04-5bfcad45638mr900808e87.27.1793186114373; Wed, 28 Oct 2026
 04:15:14 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027104713.328028-2-bsdhenrymartin@gmail.com> <202610281752.nKGCORKp-lkp@intel.com>
In-Reply-To: <202610281752.nKGCORKp-lkp@intel.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Wed, 28 Oct 2026 19:15:02 +0800
X-Gm-Features: AclHuK-ZGaxYqXYmXJ3b4_5omqV-rK1XApFuPnTHkxfYrM3u6ZjLmyd_d7Xp8AU
Message-ID: <CAEnQdOq52vUT2gw9SeD=Lo0sf9Oesqs=dLCV1yYK2zrfyW6MHQ@mail.gmail.com>
Subject: Re: [PATCH net v4 2/2] vxlan: reject VNI add when the default fdb
 entry is nexthop-backed
To: kernel test robot <lkp@intel.com>
Cc: Ido Schimmel <idosch@nvidia.com>, Ilya Maximets <i.maximets@ovn.org>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Petr Machata <petrm@nvidia.com>, 
	Ferruh Yigit <ferruh.yigit@amd.com>, Antoine Tenart <atenart@redhat.com>, 
	Seungwon Bae <qotmddnjs@gmail.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Build failure confirmed: vxlan->cfg became an RCU-managed pointer in
current net/main, so .cfg.remote_ip no longer compiles.

v5 uses the function-local cfg pointer (&cfg->remote_ip) instead.
[1/2] unchanged, both dry-run applied on net/main, checkpatch clean.

Regards,
Henry

kernel test robot <lkp@intel.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8828=E6=97=
=A5=E5=91=A8=E4=B8=89 17:38=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Henry,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Henry-Martin/vxlan=
-reject-VNI-add-when-the-default-fdb-entry-is-nexthop-backed/20261027-18471=
3
> base:   net/main
> patch link:    https://lore.kernel.org/r/20261027104713.328028-2-bsdhenry=
martin%40gmail.com
> patch subject: [PATCH net v4 2/2] vxlan: reject VNI add when the default =
fdb entry is nexthop-backed
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20261028=
/202610281752.nKGCORKp-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1=
da436a23e613c425fc9b868fc8deb979ede47a4)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261028/202610281752.nKGCORKp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610281752.nKGCORKp-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/net/vxlan/vxlan_vnifilter.c:846:33: error: member reference ty=
pe 'struct vxlan_config *' is a pointer; did you mean to use '->'?
>      846 |             !vxlan_addr_any(&vxlan->cfg.remote_ip)) {
>          |                              ~~~~~~~~~~^
>          |                                        ->
>    1 error generated.
>
>
> vim +846 drivers/net/vxlan/vxlan_vnifilter.c
>
>    819
>    820  static int vxlan_vni_add(struct vxlan_dev *vxlan,
>    821                           struct vxlan_vni_group *vg,
>    822                           u32 vni, union vxlan_addr *group,
>    823                           struct netlink_ext_ack *extack)
>    824  {
>    825          const struct vxlan_config *cfg =3D rtnl_dereference(vxlan=
->cfg);
>    826          struct vxlan_vni_node *vninode;
>    827          __be32 v =3D cpu_to_be32(vni);
>    828          bool changed =3D false;
>    829          int err =3D 0;
>    830
>    831          if (vxlan_vnifilter_lookup(vxlan, v))
>    832                  return vxlan_vni_update(vxlan, vg, v, group, &cha=
nged, extack);
>    833
>    834          err =3D vxlan_vni_in_use(vxlan->net, vxlan, cfg, v);
>    835          if (err) {
>    836                  NL_SET_ERR_MSG(extack, "VNI in use");
>    837                  return err;
>    838          }
>    839
>    840          /* A default fdb entry that is backed by a nexthop group =
can
>    841           * never take a remote; reject before the VNI is installe=
d,
>    842           * otherwise a failure in vxlan_vni_update_group() would =
leave
>    843           * the VNI half-installed.
>    844           */
>    845          if ((group && !vxlan_addr_any(group)) ||
>  > 846              !vxlan_addr_any(&vxlan->cfg.remote_ip)) {
>    847                  if (vxlan_fdb_entry_nh_backed(vxlan, all_zeros_ma=
c, v)) {
>    848                          NL_SET_ERR_MSG(extack,
>    849                                         "Cannot add a remote to a =
nexthop fdb entry");
>    850                          return -EOPNOTSUPP;
>    851                  }
>    852          }
>    853
>    854          vninode =3D vxlan_vni_alloc(vxlan, v);
>    855          if (!vninode)
>    856                  return -ENOMEM;
>    857
>    858          err =3D rhashtable_lookup_insert_fast(&vg->vni_hash,
>    859                                              &vninode->vnode,
>    860                                              vxlan_vni_rht_params)=
;
>    861          if (err) {
>    862                  vxlan_vni_free(vninode);
>    863                  return err;
>    864          }
>    865
>    866          __vxlan_vni_add_list(vxlan, vg, vninode);
>    867
>    868          if (vxlan->dev->flags & IFF_UP)
>    869                  vxlan_vs_add_del_vninode(vxlan, vninode, false);
>    870
>    871          err =3D vxlan_vni_update_group(vxlan, vninode, group, tru=
e, &changed,
>    872                                       extack);
>    873
>    874          vxlan_vnifilter_notify(vxlan, vninode, RTM_NEWTUNNEL);
>    875
>    876          return err;
>    877  }
>    878
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
