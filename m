Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50088A92F
	for <llvm@lists.linux.dev>; Fri,  4 Aug 2023 10:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72970C433C9;
	Fri,  4 Aug 2023 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691144085;
	bh=5AbSMMDb611We4H8Uqf50UdR5/vu5K+47HcJ7iRObW4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pF7bqoESmf4ecbWV81PJn8imMt4V+BWKXh8PJTBVpPQYPDJivBcY0d/8XXPTW4bSs
	 ZpNzwdHq0W0/EHFRqrRYE7U4WVxCfdWYv931rVIIpzDRbEg6BzvHnTIHFm80hVRhvf
	 h28iNhNnyR/Bb8qX6wUoyZyjXK7ZaGRx/lCpzGHsSbLhZz/U1i/be7Zr397zFjeiIw
	 f5kxIpC5ZDdvpZc8kr38S6zONMPTBt998z/PEM5axUQoHZMbz4pbQVUO+iphrr8Jc4
	 GO6uqR02C1utDNxNThyTIgQdJWuYcpJH2maYVAhXOmoTy8cmI9Qq91cdezNhzYpGBy
	 LNaKeq4QBN8Rw==
Message-ID: <85f0d8cb35c8e8c64810f448bae27292703d66ed.camel@kernel.org>
Subject: Re: [PATCH v2] fs: lockd: avoid possible wrong NULL parameter
From: Jeff Layton <jlayton@kernel.org>
To: Su Hui <suhui@nfschina.com>, trond.myklebust@hammerspace.com, 
 anna@kernel.org, chuck.lever@oracle.com, neilb@suse.de, kolga@netapp.com, 
 Dai.Ngo@oracle.com, tom@talpey.com, nathan@kernel.org,
 ndesaulniers@google.com,  trix@redhat.com
Cc: bfields@fieldses.org, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Date: Fri, 04 Aug 2023 06:14:43 -0400
In-Reply-To: <20230804012656.4091877-1-suhui@nfschina.com>
References: <20230804012656.4091877-1-suhui@nfschina.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-08-04 at 09:26 +0800, Su Hui wrote:
> clang's static analysis warning: fs/lockd/mon.c: line 293, column 2:
> Null pointer passed as 2nd argument to memory copy function.
>=20
> Assuming 'hostname' is NULL and calling 'nsm_create_handle()', this will
> pass NULL as 2nd argument to memory copy function 'memcpy()'. So return
> NULL if 'hostname' is invalid.
>=20
> Fixes: 77a3ef33e2de ("NSM: More clean up of nsm_get_handle()")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2:
>  - move NULL check to the callee "nsm_create_handle()"
>  fs/lockd/mon.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/fs/lockd/mon.c b/fs/lockd/mon.c
> index 1d9488cf0534..87a0f207df0b 100644
> --- a/fs/lockd/mon.c
> +++ b/fs/lockd/mon.c
> @@ -276,6 +276,9 @@ static struct nsm_handle *nsm_create_handle(const str=
uct sockaddr *sap,
>  {
>  	struct nsm_handle *new;
> =20
> +	if (!hostname)
> +		return NULL;
> +
>  	new =3D kzalloc(sizeof(*new) + hostname_len + 1, GFP_KERNEL);
>  	if (unlikely(new =3D=3D NULL))
>  		return NULL;

Reviewed-by: Jeff Layton <jlayton@kernel.org>
