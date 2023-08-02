Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02005396
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 08:44:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 71AFC6601F5E;
	Wed,  2 Aug 2023 09:44:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690965858;
	bh=nwhyDlk6TAwpAhBI3YFnIgFq7eJSx5UC/NeXeHfryAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GssfvuMohyVAsC3K3gUBIXV/rDYVKejdiVwfIKe4BYGKoMOjQc4IuSHolUc4EZJ6X
	 z7xyFKJxsH44UrdQzxLnkpo8zynVZhOzxLGH/rxhM+I1t57+ogHK+sZV4ZxBYygp3a
	 7wfp8mkoNfpQWMJ0NV1YagtKAOkrdqQBoqxddcz2ai+gN5HDeSCbSqEfY3pl9jEpM1
	 YSpsAfSU8lA+2a73zpQ2VAlwZeiohftwYsFY1miCyeIrDOWa3m9H5gnR04xfOLwjky
	 NPU/pEIOmGbxul2ja7BsAmpLV0eFWy9hDyij5qrsv8oM//txir2CIAY55Eapj+7KIz
	 1oSlEZndz5mPQ==
Date: Wed, 2 Aug 2023 10:44:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, trix@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, naresh.kamboju@linaro.org, dakr@redhat.com
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
Message-ID: <20230802104415.7fe64b67@collabora.com>
In-Reply-To: <CAKwvOdmRm=vOjNXGWeuKw-h78CXMrkcwc5vnCRVqFxMxWzhCcg@mail.gmail.com>
References: <20230731123625.3766-1-christian.koenig@amd.com>
	<CAKwvOdmRm=vOjNXGWeuKw-h78CXMrkcwc5vnCRVqFxMxWzhCcg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Aug 2023 13:35:13 -0700
Nick Desaulniers <ndesaulniers@google.com> wrote:

> On Mon, Jul 31, 2023 at 5:36=E2=80=AFAM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > GCC forbids to jump to labels in loop conditions and a new clang
> > check stumbled over this.
> >
> > So instead using a local label inside the loop condition use an
> > unique label outside of it.
> >
> > Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
> > Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1890
> > Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d=
096eb3aed7b712f5067
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > CC: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com> =20
>=20
> Works for me; thanks for the patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>=20
> I suspect it's possible to change the indirect goto into a direct goto
> with some further refactoring (macros can take block statements; if
> drm_exec_until_all_locked accepted a block statement arg then you
> could introduce a new scope, and a new local label to that scope, then
> just use direct goto),

Maybe I'm wrong, but this sounds like the version I proposed here [1].

> but this will probably apply cleaner. (oh, is
> 09593216bff1 only in next at the moment? The AuthorDate threw me.)
>=20
> There are some curious cases where __attribute__((cleanup())) doesn't
> mesh well with indirect gotos.
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D37722
>=20
> May not ever be a problem here...

[1]https://patchwork.freedesktop.org/patch/543077/
