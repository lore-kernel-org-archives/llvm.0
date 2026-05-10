Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEF136403A
	for <llvm@lists.linux.dev>; Sun, 10 May 2026 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778428042; cv=pass; b=A5BAPhek77eovBOZVh2J3o7Md7pIzOmvh5ubqWSUV0xT08tvuVT1QxUhEnOSHbxaWC2rn2nDUPj5v/on6NB7QfIZYEF+x8upjeZ6aFKsacM1nT1xS+Fwc9FnO5/jw79k94KTIDHCiLhIetY8erOvqDVlfrt0KfyAH5sD6skgD6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778428042; c=relaxed/simple;
	bh=lhY2lNgi8WlM2WwMpazzz39x0Lx/o1MnElliYXTlzBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/4LMVnhoRHd8/svJuZ1nAlH3XKbot9IyREDi6cSxEKQUZ8Qt8Pbx0Xm91ez7Qqrb1H8KI1kfyqN9CwHhoOJMbx4nU1eIXa6SgZX3EOFtXHiNykRy/ZPCNxTEtjV8u+2sJ0zh+1Tt5fm1uUV0JzEosv8kxOtweSZEO/ghc+fod0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSwninua; arc=pass smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSwninua"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-bcc859ac07fso23036466b.2
        for <llvm@lists.linux.dev>; Sun, 10 May 2026 08:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778428038; cv=none;
        d=google.com; s=arc-20240605;
        b=YAlU4SCMEn2sftOZk3f4BQxgdi25OfycIt9wYxVyxCAgf2+qN+KEsF0dVWeSbId8tM
         nQNu401Bpbvbcmv8/6IYPYZZbsRQ2lroQoIsipPudsH5PWRZq3iN4qliBqTG9/Z0OCr2
         O8ZOdKbfpVzAPL+JXAQtDYA+Yhh2Q5cyEsZBPPiHJhdSa5Em/bMN++NKGHwojbgp1qNL
         V0UBflN/e4KO0++n4h0Txv/OPu8J6mP1k9KqK2QBpQ+CLBHO3HkBYZsrC/stQDtxntym
         teONYvolff/GfILmZw95SmXm80HUMCqHGqxUJLlLpRzSq6GpNMpX7rxJ2wUCgZt+tu9K
         JlQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhEj/mUqB2u9/ae3N3PSRwZhRlcMwktJBN18e/nk1wg=;
        fh=uYMPcKHyKobjPuTBkAqwHB7H3BPPEd4XKk6MZQ1R+4g=;
        b=ZqYbPA1b2BVLXz7XL9Wb3xnoT81e9GMP8fVHUZWoSzLcU0P9cS8+AnICLK5cLlA4yH
         jmDKGc5pEyp6t/DQa4DMA+wV36DCTcu5x6duW1QUSeg63ymDJDGPz+rdS0fsMipS+8ZL
         mB7bhJR5iZwwCMbgW/xE/VPVFnxNQei2NVYsS620+KfT4McDDmcGhQcMCuLVO8pH99l6
         /djF7XLoY4vJesnp/nkmNvD4j8O4XLIJfUNpXAt0ofz8ZMeyMBS9+1KRdQQInnaOengc
         U0OzCLgIMn/ARtJcTczgV1O7HZtRVPGS9zZ4IPMvXKyJjV2WofJjJt6bVYtf8xJ0PdGg
         Gu2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778428038; x=1779032838; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhEj/mUqB2u9/ae3N3PSRwZhRlcMwktJBN18e/nk1wg=;
        b=DSwninua52EsolKgOlYy2+t6oz4YTHhkmhyG4fMjsbMK2EKEzS/y44x6oD2wS9APO7
         KAMM3tb8qQpPYQdNtlrAitA+8krG/HQ3P1Wji6HWrdqG/38E4c5JbBhbRQiv3pCOMcv+
         1/c57kdlxt98bzBHylSwjBsimozBi5LoaLimGnSbTfjOAYuLm/tvWTlYnhT2xY9s6UX2
         uwCJ5f/2TI0rIcQG1cejKMOGVOyKvSu86RD2lXDkgBZ1Np8JZLfz6t0TB+9lc0s2W5Pp
         pL2JuFWkinqwPRzC3hpgb/r2aFnqnkC5KSJUxpp/+0oy4vmdcayBYNdHw+8XD81hYjS8
         x/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778428038; x=1779032838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhEj/mUqB2u9/ae3N3PSRwZhRlcMwktJBN18e/nk1wg=;
        b=IHmJFQUPmSRYW2M/15Ktml73kJMzkydnneOISbUmUx3STCf72RkD3U8ichVLJkFvOX
         U24Idq76aRvfn2PEMhHS920lyF0WIVtIGevYIfXhHlygnxON3augGpesUS/IJnbHI4cv
         fnzwsuiCj2lqdym8dspswiMBfsK5Mtr8d3120BgovKC9O4BOLuI7BwYNWgpnRDNxMYfY
         IvDCihXIbyCqIvLuHmcY9jaMKWmXQL3quHeJXaCnMLe0ZDkAgAckEN3Wbeejva2BP5iy
         BnOZG/ycrsc0EQ0vJKZybWeyivW/SBYpT1MXdKQEvb/CpLVRloZNyYGHtnv5XoH+PxxY
         Hl7A==
X-Forwarded-Encrypted: i=1; AFNElJ+xcB0G9g4o1o4AtbFYZMF4+4zeGJLUQ3YqdmyiBGHh7K+qJ8qDmnvBJ4GjoQ4ENnPtZxz1@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0u3GQwa1OZ7bNCKz/ez94l3KB3Z3Uq3vqVadPIPbF5tonaxhI
	Zm0gRk97lVjyevQ17ZjzEJhw0LZez9Tj6uY/RFqIptpjUcyDKrV1MPEiQwRPmvGqWVx5uRSCAj2
	1sDktheaV6HnhO2Xi1XYpcwwrp19WSXw=
X-Gm-Gg: Acq92OGwSjcrUir3gKKDSB+Ha1tpCuI7YC/l42W79uLh2m1b1dCAJ7CAgaQCsqk9ls/
	QFX1UFw9QIvlO8kCVNtGUKzMaK4iNqeSI6OZope2/ygVnUHWenUmA3M7RQUg7zaxqq3SXFLdVDb
	QVvkYavyjfo8ueWHrb1dvUfnG1hK/YR65j3Pnbe/2/Xx7N4v/K8zZp63HiUi+yRf87ZCbYERYVG
	sag9dO2uPJXiSJxtS5GfdV5j89zObbHCT1WczaC6kqr7y4nCFMKoz8RAuPFaP+wgTquq6jM/Ky2
	wW7e94pyACWZEgaIUtY9zeTP3UxsENA1HwHbsZpIKOEf
X-Received: by 2002:a17:906:2898:b0:bcd:3d3f:175f with SMTP id
 a640c23a62f3a-bcd3d3f1dd9mr58009966b.7.1778428038260; Sun, 10 May 2026
 08:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505192549.74382-1-lucasp.linux@gmail.com> <202605101615.XGX7gOua-lkp@intel.com>
In-Reply-To: <202605101615.XGX7gOua-lkp@intel.com>
From: Lucas <lucasp.linux@gmail.com>
Date: Sun, 10 May 2026 17:47:04 +0200
X-Gm-Features: AVHnY4I5BJ3WUNxvWShvJiYRdsMV2EajZNf_laz8BJg49nA64GiTUogqPkpeJLg
Message-ID: <CAKYXYMRRoMJk2Ztr7R5r-yTmpY-aXcMmJ7FgMPYOF+ozQg7Uwg@mail.gmail.com>
Subject: Re: [PATCH] llc: fix coding style and memory barrier documentation
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I would like to withdraw this patch from further consideration.

Due to personal reasons, I need to step away and focus my attention
elsewhere for the time being. I won't be able to follow up on any
reviews or necessary changes at this stage.
I am very sorry for any inconvenience this may cause to the
maintainers and the community.

Best regards,
Lucas

On Sun, May 10, 2026 at 11:01=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Lucas,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
> [also build test ERROR on net/main linus/master horms-ipvs/master v7.1-rc=
2 next-20260508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Poupeau/llc-=
fix-coding-style-and-memory-barrier-documentation/20260510-102311
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20260505192549.74382-1-lucasp.li=
nux%40gmail.com
> patch subject: [PATCH] llc: fix coding style and memory barrier documenta=
tion
> config: riscv-randconfig-002-20260510 (https://download.01.org/0day-ci/ar=
chive/20260510/202605101615.XGX7gOua-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5=
bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260510/202605101615.XGX7gOua-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605101615.XGX7gOua-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> net/llc/llc_input.c:181:3: error: call to undeclared function 'dprintk=
'; ISO C99 and later do not support implicit function declarations [-Wimpli=
cit-function-declaration]
>      181 |                 dprintk("%s: PACKET_OTHERHOST\n", __func__);
>          |                 ^
>    net/llc/llc_input.c:194:3: error: call to undeclared function 'dprintk=
'; ISO C99 and later do not support implicit function declarations [-Wimpli=
cit-function-declaration]
>      194 |                 dprintk("%s: llc_sap_find(%02X) failed!\n", __=
func__,
>          |                 ^
>    2 errors generated.
>
>
> vim +/dprintk +181 net/llc/llc_input.c
>
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  151
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  152  /**
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  153   *     llc_rcv -=
 802.2 entry point from net lower layers
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  154   *     @skb: rec=
eived pdu
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  155   *     @dev: dev=
ice that receive pdu
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  156   *     @pt: pack=
et type
> 74c950c966c180 Andrew Lunn              2020-07-13  157   *     @orig_dev=
: the original receive net device
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  158   *
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  159   *     When the =
system receives a 802.2 frame this function is called. It
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  160   *     checks SA=
P and connection of received pdu and passes frame to
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  161   *     llc_{stat=
ion,sap,conn}_rcv for sending to proper state machine. If
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  162   *     the frame=
 is related to a busy connection (a connection is sending
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  163   *     data now)=
, it queues this frame in the connection's backlog.
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  164   */
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  165  int llc_rcv(stru=
ct sk_buff *skb, struct net_device *dev,
> f2ccd8fa06c8e3 David S. Miller          2005-08-09  166             struc=
t packet_type *pt, struct net_device *orig_dev)
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  167  {
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  168         struct ll=
c_sap *sap;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  169         struct ll=
c_pdu_sn *pdu;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  170         int dest;
> 846d7f9be89210 Lucas Poupeau            2026-05-05  171         int (*rcv=
)(struct sk_buff *skb, struct net_device *dev,
> 846d7f9be89210 Lucas Poupeau            2026-05-05  172                  =
  struct packet_type *pt, struct net_device *orig_dev);
> aadf31de16a7b2 Ben Hutchings            2012-08-13  173         void (*st=
a_handler)(struct sk_buff *skb);
> aadf31de16a7b2 Ben Hutchings            2012-08-13  174         void (*sa=
p_handler)(struct llc_sap *sap, struct sk_buff *skb);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  175
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  176         /*
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  177          * When t=
he interface is in promisc. mode, drop all the crap that it
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  178          * receiv=
es, do not try to analyse it.
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  179          */
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  180         if (unlik=
ely(skb->pkt_type =3D=3D PACKET_OTHERHOST)) {
> 0dc47877a3de00 Harvey Harrison          2008-03-05 @181                 d=
printk("%s: PACKET_OTHERHOST\n", __func__);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  182                 g=
oto drop;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  183         }
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  184         skb =3D s=
kb_share_check(skb, GFP_ATOMIC);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  185         if (unlik=
ely(!skb))
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  186                 g=
oto out;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  187         if (unlik=
ely(!llc_fixup_skb(skb)))
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  188                 g=
oto drop;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  189         pdu =3D l=
lc_pdu_sn_hdr(skb);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  190         if (unlik=
ely(!pdu->dsap)) /* NULL DSAP, refer to station */
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  191                go=
to handle_station;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  192         sap =3D l=
lc_sap_find(pdu->dsap);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  193         if (unlik=
ely(!sap)) {/* unknown SAP */
> 0dc47877a3de00 Harvey Harrison          2008-03-05  194                 d=
printk("%s: llc_sap_find(%02X) failed!\n", __func__,
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  195                  =
       pdu->dsap);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  196                 g=
oto drop;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  197         }
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  198         /*
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  199          * First =
the upper layer protocols that don't need the full
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  200          * LLC fu=
nctionality
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  201          */
> 23dbe7912dad6b Stephen Hemminger        2006-05-25  202         rcv =3D r=
cu_dereference(sap->rcv_func);
> 696ea472e19c6d Changli Gao              2011-02-22  203         dest =3D =
llc_pdu_type(skb);
> 6aa7de059173a9 Mark Rutland             2017-10-23  204         sap_handl=
er =3D dest ? READ_ONCE(llc_type_handlers[dest - 1]) : NULL;
> aadf31de16a7b2 Ben Hutchings            2012-08-13  205         if (unlik=
ely(!sap_handler)) {
> 696ea472e19c6d Changli Gao              2011-02-22  206                 i=
f (rcv)
> 696ea472e19c6d Changli Gao              2011-02-22  207                  =
       rcv(skb, dev, pt, orig_dev);
> 696ea472e19c6d Changli Gao              2011-02-22  208                 e=
lse
> 696ea472e19c6d Changli Gao              2011-02-22  209                  =
       kfree_skb(skb);
> 696ea472e19c6d Changli Gao              2011-02-22  210         } else {
> 23dbe7912dad6b Stephen Hemminger        2006-05-25  211                 i=
f (rcv) {
> 8f182b494f8779 Stephen Hemminger        2006-05-25  212                  =
       struct sk_buff *cskb =3D skb_clone(skb, GFP_ATOMIC);
> 846d7f9be89210 Lucas Poupeau            2026-05-05  213
> 8f182b494f8779 Stephen Hemminger        2006-05-25  214                  =
       if (cskb)
> 8f182b494f8779 Stephen Hemminger        2006-05-25  215                  =
               rcv(cskb, dev, pt, orig_dev);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  216                 }
> aadf31de16a7b2 Ben Hutchings            2012-08-13  217                 s=
ap_handler(sap, skb);
> 696ea472e19c6d Changli Gao              2011-02-22  218         }
> 6e2144b76840be Arnaldo Carvalho de Melo 2005-09-22  219         llc_sap_p=
ut(sap);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  220  out:
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  221         return 0;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  222  drop:
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  223         kfree_skb=
(skb);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  224         goto out;
> 846d7f9be89210 Lucas Poupeau            2026-05-05  225
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  226  handle_station:
> 6aa7de059173a9 Mark Rutland             2017-10-23  227         sta_handl=
er =3D READ_ONCE(llc_station_handler);
> aadf31de16a7b2 Ben Hutchings            2012-08-13  228         if (!sta_=
handler)
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  229                 g=
oto drop;
> aadf31de16a7b2 Ben Hutchings            2012-08-13  230         sta_handl=
er(skb);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  231         goto out;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  232  }
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  233
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
