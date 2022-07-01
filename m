Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEDE10E9
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 02:10:52 +0000 (UTC)
X-UUID: 3344d0ebb64e47489c52e1d8195ecf08-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:ace3f042-19d7-4a88-87e3-11a9f9a03709,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:81004ed6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: 3344d0ebb64e47489c52e1d8195ecf08-20220701
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1722577886; Fri, 01 Jul 2022 10:10:44 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 10:10:43 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 10:10:42 +0800
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
Subject: Re: [PATCH 1/2] ANDROID: cfi: enable sanitize for cfi.c
Date: Fri, 1 Jul 2022 10:10:42 +0800
Message-ID: <20220701021042.48037-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CABCJKucgdTqDFyTumSCBHiyRVWgvJEhR2Fn=MxyMpTjWtvCV=Q@mail.gmail.com>
References: <CABCJKucgdTqDFyTumSCBHiyRVWgvJEhR2Fn=MxyMpTjWtvCV=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N

> On Thu, Jun 30, 2022 at 2:47 AM Haibo Li <haibo.li@mediatek.com> wrote:=0D
> >=0D
> > currenly,cfi.c is excluded from cfi sanitize because of cfi handler.=0D
> > The side effect is that we can not transfer function pointer to other=0D
> > files which enable cfi sanitize.=0D
> >=0D
> > Enable cfi sanitize for cfi.c and bypass cfi check for=0D
> > __cfi_slowpath_diag=0D
> >=0D
> > Signed-off-by: Haibo Li <haibo.li@mediatek.com>=0D
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>=0D
> > ---=0D
> >  kernel/Makefile | 3 ---=0D
> >  kernel/cfi.c    | 8 +++++++-=0D
> >  2 files changed, 7 insertions(+), 4 deletions(-)=0D
> >=0D
> > diff --git a/kernel/Makefile b/kernel/Makefile index=0D
> > a7e1f49ab2b3..a997bef1a200 100644=0D
> > --- a/kernel/Makefile=0D
> > +++ b/kernel/Makefile=0D
> > @@ -40,9 +40,6 @@ KCSAN_SANITIZE_kcov.o :=3D n=0D
> UBSAN_SANITIZE_kcov.o :=3D=0D
> > n  CFLAGS_kcov.o :=3D $(call cc-option, -fno-conserve-stack)=0D
> > -fno-stack-protector=0D
> >=0D
> > -# Don't instrument error handlers=0D
> > -CFLAGS_REMOVE_cfi.o :=3D $(CC_FLAGS_CFI)=0D
> > -=0D
> >  obj-y +=3D sched/=0D
> >  obj-y +=3D locking/=0D
> >  obj-y +=3D power/=0D
> > diff --git a/kernel/cfi.c b/kernel/cfi.c index=0D
> > 08102d19ec15..456771c8e454 100644=0D
> > --- a/kernel/cfi.c=0D
> > +++ b/kernel/cfi.c=0D
> > @@ -311,7 +311,7 @@ static inline cfi_check_fn find_check_fn(unsigned=0D
> long ptr)=0D
> >         return fn;=0D
> >  }=0D
> >=0D
> > -void __cfi_slowpath_diag(uint64_t id, void *ptr, void *diag)=0D
> > +static inline void __nocfi _run_cfi_check(u64 id, void *ptr, void=0D
> > +*diag)=0D
> >  {=0D
> >         cfi_check_fn fn =3D find_check_fn((unsigned long)ptr);=0D
> >=0D
> > @@ -320,6 +320,12 @@ void __cfi_slowpath_diag(uint64_t id, void *ptr,=0D
> void *diag)=0D
> >         else /* Don't allow unchecked modules */=0D
> >                 handle_cfi_failure(ptr);  }=0D
> > +=0D
> > +void __cfi_slowpath_diag(u64 id, void *ptr, void *diag) {=0D
> > +       /*run cfi check without cfi sanitize to avoid calling cfi handl=
er=0D
> recursively*/=0D
> > +       _run_cfi_check(id, ptr, diag); }=0D
> >  EXPORT_SYMBOL(__cfi_slowpath_diag);=0D
> =0D
> You can just add __nocfi to __cfi_slowpath_diag, right? There's no need f=
or the=0D
> separate function.=0D
=0D
    You are right.Now there is no requirement for constant crc of __cfi_slo=
wpath_diag.=0D
I will change it later.=0D
	=0D
