Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38278ECA
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 02:42:40 +0000 (UTC)
X-UUID: b47711d323db4ee793388f215db781f7-20220701
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:c36dd587-d974-4074-9594-77900939fd47,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:27,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:27
X-CID-INFO: VERSION:1.1.7,REQID:c36dd587-d974-4074-9594-77900939fd47,OB:0,LOB:
	0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:27,FILE:0,RULE:Release_HamU,ACTI
	ON:release,TS:27
X-CID-META: VersionHash:87442a2,CLOUDID:82f14ed6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:28|100|16|19|48|101,TC:nil,Content:-5,EDM:-3,IP:n
	il,URL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: b47711d323db4ee793388f215db781f7-20220701
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 173100515; Fri, 01 Jul 2022 10:42:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 1 Jul 2022 10:42:34 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 10:42:33 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <samitolvanen@google.com>
CC: <andrealmeid@igalia.com>, <atomlin@redhat.com>,
	<christophe.leroy@csgroup.eu>, <dmitry.torokhov@gmail.com>,
	<haibo.li@mediatek.com>, <jgross@suse.com>, <keescook@chromium.org>,
	<lecopzer.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<llvm@lists.linux.dev>, <matthias.bgg@gmail.com>, <mcgrof@kernel.org>,
	<mhiramat@kernel.org>, <nathan@kernel.org>, <ndesaulniers@google.com>,
	<peterz@infradead.org>, <xiaoming.yu@mediatek.com>, <yangtiezhu@loongson.cn>
Subject: Re: [PATCH 2/2] ANDROID: cfi: free old cfi shadow asynchronously
Date: Fri, 1 Jul 2022 10:42:33 +0800
Message-ID: <20220701024233.52022-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CABCJKudz5O5_-1q1H0o2DFRcnpMQDBPv4STUVa2bOE9ePaeyDA@mail.gmail.com>
References: <CABCJKudz5O5_-1q1H0o2DFRcnpMQDBPv4STUVa2bOE9ePaeyDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N

> Hi,=0D
> =0D
> On Thu, Jun 30, 2022 at 2:47 AM Haibo Li <haibo.li@mediatek.com> wrote:=0D
> >=0D
> > Currenly, it uses synchronize_rcu() to wait old rcu reader to go away=0D
> > in update_shadow.In embedded platform like ARM CA7X, load_module=0D
> > blocks 40~50ms in update_shadow.=0D
> > When there are more than one hundred kernel modules, it blocks several=
=0D
> > seconds.=0D
> >=0D
> > To accelerate load_module,change synchronize_rcu to call_rcu.=0D
> >=0D
> > Signed-off-by: Haibo Li <haibo.li@mediatek.com>=0D
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>=0D
> =0D
> Thanks for the patch! Please drop ANDROID: from the subject line, that's =
only=0D
> used in the Android kernel trees.=0D
> =0D
   Thanks for the comment.I will change it in next patch.  =0D
> >  kernel/cfi.c | 12 ++++++++++--=0D
> >  1 file changed, 10 insertions(+), 2 deletions(-)=0D
> >=0D
> > diff --git a/kernel/cfi.c b/kernel/cfi.c index=0D
> > 456771c8e454..a4836d59ca27 100644=0D
> > --- a/kernel/cfi.c=0D
> > +++ b/kernel/cfi.c=0D
> > @@ -43,6 +43,8 @@ typedef u16 shadow_t;  struct cfi_shadow {=0D
> >         /* Page index for the beginning of the shadow */=0D
> >         unsigned long base;=0D
> > +       /* rcu to free old cfi_shadow asynchronously */=0D
> > +       struct rcu_head rcu;=0D
> >         /* An array of __cfi_check locations (as indices to the shadow)=
 */=0D
> >         shadow_t shadow[1];=0D
> >  } __packed;=0D
> > @@ -182,6 +184,13 @@ static void remove_module_from_shadow(struct=0D
> cfi_shadow *s, struct module *mod,=0D
> >         }=0D
> >  }=0D
> >=0D
> > +static void _cfi_shadow_free_rcu(struct rcu_head *rcu)=0D
> =0D
> I think this can be simply renamed to free_shadow.=0D
   Thanks for the comment.I will change it in next patch.=0D
> =0D
> > +{=0D
> > +       struct cfi_shadow *old =3D container_of(rcu, struct cfi_shadow,=
=0D
> > +rcu);=0D
> > +=0D
> > +       vfree(old);=0D
> > +}=0D
> > +=0D
> >  typedef void (*update_shadow_fn)(struct cfi_shadow *, struct module *,=
=0D
> >                         unsigned long min_addr, unsigned long=0D
> > max_addr);=0D
> >=0D
> > @@ -211,11 +220,10 @@ static void update_shadow(struct module *mod,=0D
> > unsigned long base_addr,=0D
> >=0D
> >         rcu_assign_pointer(cfi_shadow, next);=0D
> >         mutex_unlock(&shadow_update_lock);=0D
> > -       synchronize_rcu();=0D
> >=0D
> >         if (prev) {=0D
> >                 set_memory_rw((unsigned long)prev, SHADOW_PAGES);=0D
> > -               vfree(prev);=0D
> > +               call_rcu(&prev->rcu, _cfi_shadow_free_rcu);=0D
> >         }=0D
> >  }=0D
> =0D
> It's probably better to keep the pages read-only until they're actually r=
eleased.=0D
> Can you move the set_memory_rw call to the new function?=0D
> =0D
   Since call_rcu and rcu callbacks change members in &prev->rcu,the old pa=
ges need to be rw at first.=0D
 =0D
