Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5883D13AEF
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 21:40:30 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6bb14015560so314998a34.2
        for <llvm@lists.linux.dev>; Wed, 02 Aug 2023 14:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691012429; x=1691617229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+AS/eYgwiGocz0hRMqEzRe/0E7wSQPQ+cMSrzoRj80=;
        b=JyZOHalDcREGIRUebxJEHeiwXJ6Et6CNw5fbFraZVOMPVaIyM9nO/X3CUPvSHkxdLT
         rS71x3IqWf0P9Qm6ii3x+1j3X1l+Tc0zM4HxDnED4k5afgaXNiwFiIv4HMhoONjoeJ7q
         V0WL0O8CaEQPvfe4/zSOrT1xTYOfLK3NwMRJWCbR7VABElDKeg5p0nsPmKdl8kB6tQ/u
         RFPEb083Fh6dO/CNdzuhypFc9hQpxbBdLH3Y4c/c1XvmhYCf5+gDKniYOZWXLVeJrKxL
         6gpKDCanfUJMnaOB8QEMiuqv0s1sUGeR29ViiIvsmrXf/26fXZDDhKVyZNGegOCWbwte
         xHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691012429; x=1691617229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+AS/eYgwiGocz0hRMqEzRe/0E7wSQPQ+cMSrzoRj80=;
        b=Wv3R5tO5+rbOzkTV7o0GXQuB2OWK5Gdmrqmk75xdSxtzyE3jFipsWXIbwtWWwOiYBS
         xQI1ubVi9vBb8R/dfsIK0QRE1zxz+N+4+oDl7AHFO3MbPS//7tUUiL/mjKQoIoSX1zep
         7WO2nMaNu/WCYGsH0IvPVRoJx2NmqppDaOMFC/nEekMyZ7w8ZYS6NFoIOlLLYNVqN8JF
         iXUgzHDEEoDiT2fyYTRgQm0RVdqThKOB4GVzizVuN22eYQXWzI+b6cWn61Z8vM17OlT3
         ExidPmD9vHTdNd9KI9jBTdRjoLL15Aofh+8cci9cgG9ki0O5iz+Iq17A5x+zKNb/O8Bd
         0F8w==
X-Gm-Message-State: ABy/qLbvA3g3GsnHPKEcPmxD3yf5LkZak7fnC/Ltzgu9EJNVP8XbpSFT
	5rMBgTfVl4zybBCr80fJJ7zu4McLWe2slUBRkcih/Q==
X-Google-Smtp-Source: APBJJlFpo8nVaGFRVuT56BDjEKf8O23JElU7FcvApgZioYBFUBNDtxQczH22U7n95IT3rW7s29tffm7gNlVxtRvxtT8=
X-Received: by 2002:a05:6358:711:b0:135:85ec:a092 with SMTP id
 e17-20020a056358071100b0013585eca092mr7354336rwj.26.1691012428979; Wed, 02
 Aug 2023 14:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230802080544.3239967-1-suhui@nfschina.com> <531df8ee-ba09-49df-8201-4221df5853c6@kadam.mountain>
In-Reply-To: <531df8ee-ba09-49df-8201-4221df5853c6@kadam.mountain>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Aug 2023 14:40:18 -0700
Message-ID: <CAKwvOdnRwmxGuEidZ=OWxSX60D6ry0Rb__DjSayga6um35Jsrg@mail.gmail.com>
Subject: Re: [PATCH] fs: lockd: avoid possible wrong NULL parameter
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Su Hui <suhui@nfschina.com>, chuck.lever@oracle.com, jlayton@kernel.org, 
	neilb@suse.de, kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com, 
	trond.myklebust@hammerspace.com, anna@kernel.org, nathan@kernel.org, 
	trix@redhat.com, bfields@fieldses.org, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 3:25=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Wed, Aug 02, 2023 at 04:05:45PM +0800, Su Hui wrote:
> > clang's static analysis warning: fs/lockd/mon.c: line 293, column 2:
> > Null pointer passed as 2nd argument to memory copy function.
> >
> > Assuming 'hostname' is NULL and calling 'nsm_create_handle()', this wil=
l
> > pass NULL as 2nd argument to memory copy function 'memcpy()'. So return
> > NULL if 'hostname' is invalid.
> >
> > Fixes: 77a3ef33e2de ("NSM: More clean up of nsm_get_handle()")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >  fs/lockd/mon.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/fs/lockd/mon.c b/fs/lockd/mon.c
> > index 1d9488cf0534..eebab013e063 100644
> > --- a/fs/lockd/mon.c
> > +++ b/fs/lockd/mon.c
> > @@ -358,6 +358,9 @@ struct nsm_handle *nsm_get_handle(const struct net =
*net,
> >
> >       spin_unlock(&nsm_lock);
> >
> > +     if (!hostname)
> > +             return NULL;
> > +
> >       new =3D nsm_create_handle(sap, salen, hostname, hostname_len);
>
> It's weird that this bug is from 2008 and we haven't found it in
> testing.  Presumably if hostname is NULL then hostname_len would be zero
> and in that case, it's not actually a bug.  It's allowed in the kernel
> to memcpy zero bytes from a NULL pointer.
>
>         memcpy(dst, NULL, 0);
>
> Outside the kernel it's not allowed though.

I wonder what kind of implications that has on the compilers ability
to optimize libcalls to memcpy for targets that don't use
`-ffreestanding`. Hmm...

Though let's see what the C standard says, since that's what compilers
target, rather than consider specifics of glibc.

https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf
>> The memcpy function copies n characters from the object pointed to by s2=
 into the
>> object pointed to by s1. If copying takes place between objects that ove=
rlap, the behavior
>> is undefined.

So no mention about what assumptions can be made about source or
destination being NULL.

I noticed that the function in question already has a guard:
322   if (hostname && memchr(hostname, '/', hostname_len) !=3D NULL) {

Which implies that hostname COULD be NULL.

Should this perhaps simply be rewritten as:

if (!hostname)
  return NULL;
if (memchr(...) !=3D NULL)
  ...

Rather than bury yet another guard for the same check further down in
the function? Check once and bail early.

>
> I noticed a related bug which Smatch doesn't find, because of how Smatch
> handles the dprintk macro.
>
> fs/lockd/host.c
> truct nlm_host *nlmclnt_lookup_host(const struct sockaddr *sap,
>    217                                       const size_t salen,
>    218                                       const unsigned short protoco=
l,
>    219                                       const u32 version,
>    220                                       const char *hostname,
>    221                                       int noresvport,
>    222                                       struct net *net,
>    223                                       const struct cred *cred)
>    224  {
>    225          struct nlm_lookup_host_info ni =3D {
>    226                  .server         =3D 0,
>    227                  .sap            =3D sap,
>    228                  .salen          =3D salen,
>    229                  .protocol       =3D protocol,
>    230                  .version        =3D version,
>    231                  .hostname       =3D hostname,
>    232                  .hostname_len   =3D strlen(hostname),
>                                                  ^^^^^^^^
> Dereferenced
>
>    233                  .noresvport     =3D noresvport,
>    234                  .net            =3D net,
>    235                  .cred           =3D cred,
>    236          };
>    237          struct hlist_head *chain;
>    238          struct nlm_host *host;
>    239          struct nsm_handle *nsm =3D NULL;
>    240          struct lockd_net *ln =3D net_generic(net, lockd_net_id);
>    241
>    242          dprintk("lockd: %s(host=3D'%s', vers=3D%u, proto=3D%s)\n"=
, __func__,
>    243                          (hostname ? hostname : "<none>"), version=
,
>                                  ^^^^^^^^
> Checked too late.
>
>    244                          (protocol =3D=3D IPPROTO_UDP ? "udp" : "t=
cp"));
>    245
>
> regards,
> dan carpenter



--=20
Thanks,
~Nick Desaulniers
