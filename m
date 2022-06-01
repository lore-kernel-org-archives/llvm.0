Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB713205
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 19:57:33 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id n10so5922312ejk.5
        for <llvm@lists.linux.dev>; Wed, 01 Jun 2022 12:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kfsG9LUOEPEKQ9LxxRuVY9iWrZQoJ7F8ml1zzQN1q0o=;
        b=TV/JmovXx25zTSTxidCJIrIjB3J+6yovker1IPrJ45jkhZb0ZPkm/US+DsSNJ9OLQ1
         x9L8kANnTgqmES1a/+y8c49aceJjSpf1T9prbrqFPMJlTUFuXUwDqMs92xFUAt4FrVD+
         9hgDSm9pt07EkY8X3V+0TC+8MhEs0SQWTKG6PRjJAR+FQ+Q1k0ex0nEYGl4Z+flyzzAR
         fG2wOLBo96n4dJdULvBRi3nzPk/HFjNfGIwMSGRrC1vdl/HKdin9jvMq+WCJpZkYD9oI
         7UmQ3hh1HniIvM1moToPZwbhaEH9cZYx8rvVEIC7b5TmCRQ3Zqe12CpmtbL0Fyx0lVqy
         9h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kfsG9LUOEPEKQ9LxxRuVY9iWrZQoJ7F8ml1zzQN1q0o=;
        b=XOj0VcAhXyIWPBZ7WBx/jgqy0Jx2PXcufSuPhx2LjCcHUT63pRh0wD28gjef0B1dZg
         6xWA3j94ErwBIoTtRAoYTCaKnsH96hD6DxyuxRMNnhlvXAgmSVAL4AxiXkX3DUxxB7mz
         RDSAEFDvHBrKcRI+qrnTKCTnlYm2VH7Wsya7efkoKRz7UfA810m4HwijjJsE0Ezitacv
         wJn849jCiEBh36hjSlemkOldUNOYG0Z9tYWp6LA4akLz8NQAbN23V6qgzF/lV9MX+Qji
         D9vrohP+M9gEALB6SSM3b+M7qnzcB8HfMIMig065wxHMs3kVBaD+bDG5dckdxmnbIJeT
         ED6w==
X-Gm-Message-State: AOAM531NnevkpDkRUUgC359VTpTxEzcK/imlc1XUTVnsK3urdEKyvBAq
	c+h4R5pPh6Ec9O/41Qh53yQ=
X-Google-Smtp-Source: ABdhPJx8MtWjiK3wPxQOfSWBDFZSlPWAUYVHkks7Qq/MkfVuM0OyvqCuGvG//AVEkW+7IRAj5J57ig==
X-Received: by 2002:a17:907:9809:b0:6f5:1be8:5b13 with SMTP id ji9-20020a170907980900b006f51be85b13mr1069498ejc.412.1654113452261;
        Wed, 01 Jun 2022 12:57:32 -0700 (PDT)
Received: from opensuse.localnet (host-79-55-12-155.retail.telecomitalia.it. [79.55.12.155])
        by smtp.gmail.com with ESMTPSA id rl7-20020a170907216700b006f3ef214e27sm1042428ejb.141.2022.06.01.12.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:57:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Chris Mason <chris.mason@fusionio.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Ira Weiny <ira.weiny@intel.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 3/3] btrfs: Replace kmap() with kmap_local_page() in zlib.c
Date: Wed, 01 Jun 2022 21:57:28 +0200
Message-ID: <3146770.aV6nBDHxoP@opensuse>
In-Reply-To: <202206010437.EX5Nj7cu-lkp@intel.com>
References: <20220531145335.13954-4-fmdefrancesco@gmail.com> <202206010437.EX5Nj7cu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On marted=C3=AC 31 maggio 2022 22:35:30 CEST kernel test robot wrote:
> Hi "Fabio,
>=20
> Thank you for the patch! Perhaps something to improve:
>=20

[snip]

> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> fs/btrfs/zlib.c:125:6: warning: variable 'data_in' is used=20
uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (out_page =3D=3D NULL) {
>                ^~~~~~~~~~~~~~~~
>    fs/btrfs/zlib.c:270:6: note: uninitialized use occurs here
>            if (data_in) {
>                ^~~~~~~
>    fs/btrfs/zlib.c:125:2: note: remove the 'if' if its condition is=20
always false
>            if (out_page =3D=3D NULL) {
>            ^~~~~~~~~~~~~~~~~~~~~~~
>    fs/btrfs/zlib.c:115:6: warning: variable 'data_in' is used=20
uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace-
>level)) {
>               =20
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/zlib.h:148:25: note: expanded from macro 'Z_OK'
>    #define Z_OK            0
>                            ^
>    fs/btrfs/zlib.c:270:6: note: uninitialized use occurs here
>            if (data_in) {
>                ^~~~~~~
>    fs/btrfs/zlib.c:115:2: note: remove the 'if' if its condition is=20
always false
>            if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace-
>level)) {
>           =20
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    fs/btrfs/zlib.c:100:15: note: initialize the variable 'data_in' to=20
silence this warning
>            char *data_in;
>                         ^
>                          =3D NULL
> >> fs/btrfs/zlib.c:125:6: warning: variable 'cpage_out' is used=20
uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (out_page =3D=3D NULL) {
>                ^~~~~~~~~~~~~~~~
>    fs/btrfs/zlib.c:267:6: note: uninitialized use occurs here
>            if (cpage_out)
>                ^~~~~~~~~
>    fs/btrfs/zlib.c:125:2: note: remove the 'if' if its condition is=20
always false
>            if (out_page =3D=3D NULL) {
>            ^~~~~~~~~~~~~~~~~~~~~~~
>    fs/btrfs/zlib.c:115:6: warning: variable 'cpage_out' is used=20
uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace-
>level)) {
>               =20
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/zlib.h:148:25: note: expanded from macro 'Z_OK'
>    #define Z_OK            0
>                            ^
>    fs/btrfs/zlib.c:267:6: note: uninitialized use occurs here
>            if (cpage_out)
>                ^~~~~~~~~
>    fs/btrfs/zlib.c:115:2: note: remove the 'if' if its condition is=20
always false
>            if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace-
>level)) {
>           =20
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    fs/btrfs/zlib.c:101:17: note: initialize the variable 'cpage_out' to=20
silence this warning
>            char *cpage_out;
>                           ^
>                            =3D NULL
>    4 warnings generated.

I'll initialize these variables in v2.

Thanks,

=46abio


