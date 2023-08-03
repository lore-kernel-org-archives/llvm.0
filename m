Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B1318B0A
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 16:38:40 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6bb29b9044dso1127339a34.1
        for <llvm@lists.linux.dev>; Thu, 03 Aug 2023 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691080720; x=1691685520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7hXTqR0jH2hsI9WNMzkw89TQE7WPo/H+95Mu1R0KQE=;
        b=TwBfw10n8Q1dq4al0QEoJQbukd0ijgBQZO/dS/h1PHcJqBpzGkA30e5IkPWZoVW9Sy
         vANVWg9vunFLYRXH5ipbbP2HZHO+WsfO22BijlHNt0bcAyA7yEJHqj7pJ/CvcgSRtOvE
         3tJR0OXjltD/my4Wag02g++tbHtJEOWfijGbow/pk5LXCJFtEgdbd5ScHetqaO4+RdYg
         GAdNB+MzTO8OeNKIgmDPgsw7Sz0EffJES7YwhWs5Emv9CxHIzH1/4K7SsfCg7T+Fn1fg
         P+RTrezTLnE6sy6VpWk6PP7VgNTzo5/06VSmaNCL5Xaw3WYsZcPdNgRKAshbiFFqfaYO
         cjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080720; x=1691685520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7hXTqR0jH2hsI9WNMzkw89TQE7WPo/H+95Mu1R0KQE=;
        b=XpjBfn3iKvLUrrTfD2j59exVdcvu1rXDZjejYveFIu0iXD50Org6nZS1eyrdXvr5js
         XVQswIEvEnSr1WD442hF0++TBnyLntcc4taNzlo4eHZsM/9cYIJ0qvupnZ8D/Lgn38au
         2qYFs5m7cNM6vYljrRn3bsaLa6qAdINk9gF4dOtAmeMURgJfaNr8xCsh/zrOfMSeR6HZ
         nyUGSJ1j8civPM+mf832jSxbr7uFSNUSZaYP9yhlDpe9WdK/bxsWG1SKtgSj4wd52Ttf
         7FDlitNBwmANqU3WLc7Q0PnJiLEH+43HFKq9/OxZV7LcjvPsGGEoGdKM2lFuuAcSqxsi
         0Xew==
X-Gm-Message-State: ABy/qLYK4L+2sNOa6YAAOGSElBZM3d4A0DxqR7WRma+ftqIRWGNwFkKj
	25AdbJjyWe3yMdRy5cCsfnfZNwW44yEuYe0olPYuaw==
X-Google-Smtp-Source: APBJJlHUyAnRAFZVPgXBElopa5dcKpbBDbuElevyl7taFoGz9yEueMUgSOJhFfonaQeDoBh7LbHScUn0uHooT0zI8vw=
X-Received: by 2002:a05:6358:998f:b0:137:7ab1:b7bc with SMTP id
 j15-20020a056358998f00b001377ab1b7bcmr8324379rwb.0.1691080719807; Thu, 03 Aug
 2023 09:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnRwmxGuEidZ=OWxSX60D6ry0Rb__DjSayga6um35Jsrg@mail.gmail.com>
 <5066885c-3ac9-adbd-6852-eba89657470c@nfschina.com>
In-Reply-To: <5066885c-3ac9-adbd-6852-eba89657470c@nfschina.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 09:38:28 -0700
Message-ID: <CAKwvOd=BJy==Ly80zLvW=RiEO=F5KeztVet7CuKT0FjvQtoSbw@mail.gmail.com>
Subject: Re: [PATCH] fs: lockd: avoid possible wrong NULL parameter
To: Su Hui <suhui@nfschina.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, chuck.lever@oracle.com, jlayton@kernel.org, 
	neilb@suse.de, kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com, 
	trond.myklebust@hammerspace.com, anna@kernel.org, nathan@kernel.org, 
	trix@redhat.com, bfields@fieldses.org, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 9:11=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> On 2023/8/3 05:40, Nick Desaulniers wrote:
>
> On Wed, Aug 2, 2023 at 3:25=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
>
> I noticed that the function in question already has a guard:
> 322   if (hostname && memchr(hostname, '/', hostname_len) !=3D NULL) {
>
> Which implies that hostname COULD be NULL.
>
> Should this perhaps simply be rewritten as:
>
> if (!hostname)
>   return NULL;
> if (memchr(...) !=3D NULL)
>   ...
>
> Rather than bury yet another guard for the same check further down in
> the function? Check once and bail early.
>
> Hi, Nick Desaulnier,
>
> This may disrupt the logic of this function. So maybe the past one is bet=
ter.
>
> 322         if (!hostname)
> 323                 return NULL;
>                     ^^^^^^^^^^^^
> If we return in this place.
>
> 324         if (memchr(hostname, '/', hostname_len) !=3D NULL) {
> 325                 if (printk_ratelimit()) {
> 326                         printk(KERN_WARNING "Invalid hostname \"%.*s\=
" "
> 327                                             "in NFS lock request\n",
> 328                                 (int)hostname_len, hostname);
> 329                 }
> 330                 return NULL;
> 331         }
> 332
> 333 retry:
> 334         spin_lock(&nsm_lock);
> 335
> 336         if (nsm_use_hostnames && hostname !=3D NULL)
> 337                 cached =3D nsm_lookup_hostname(&ln->nsm_handles,
> 338                                         hostname, hostname_len);
> 339         else
> 340                 cached =3D nsm_lookup_addr(&ln->nsm_handles, sap);
>                              ^^^^^^^^^^^^^^^
> This case will be broken when hostname is NULL.

Ah, you're right; I agree.

What are your thoughts then about moving the "is hostname NULL" check
to nsm_create_handle() then?

Perhaps nsm_create_handle() should check that immediately and return
NULL, or simply skip the memcpy if hostname is NULL?

It seems perhaps best to localize this to the callee rather than the
caller. While there is only one caller today, should another arise
someday, they may make the same mistake.

I don't feel strongly either way, and am happy to sign off on either
approach; just triple checking we've considered a few different cases.

>
> 341
> 342         if (cached !=3D NULL) {
> 343                 refcount_inc(&cached->sm_count);
> 344                 spin_unlock(&nsm_lock);
> 345                 kfree(new);
> 346                 dprintk("lockd: found nsm_handle for %s (%s), "
> 347                                 "cnt %d\n", cached->sm_name,
> 348                                 cached->sm_addrbuf,
> 349                                 refcount_read(&cached->sm_count));
> 350                 return cached;
> 351         }
>


--=20
Thanks,
~Nick Desaulniers
